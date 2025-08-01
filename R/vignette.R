#' Set mocking/capturing state for a vignette
#'
#' Use `start_vignette()` to either use previously recorded responses, if they
#' exist, or capture real responses for future use.
#'
#' In a vignette or other R Markdown or Sweave document, place
#' `start_vignette()` in an R code block at the beginning,
#' before the first API request is made, and put
#' `end_vignette()` in a R code chunk at the end. You may
#' want to make those R code chunks have `echo=FALSE` in order to hide the fact
#' that you're calling them.
#'
#' As in [with_mock_dir()], the behavior changes based on the existence of the `dir` directory. The
#' first time you build the vignette, the directory won't exist yet, so it will
#' make real requests and record them inside of `dir`. On subsequent runs, the
#' mocks will be used. To record fresh responses from the server, delete the
#' `dir` directory, and the responses will be recorded again the next time the
#' vignette runs.
#'
#' If you have additional setup code that you'd like available across all of
#' your package's vignettes, put it in `inst/httptest2/start-vignette.R` in your
#' package, and it will be called in `start_vignette()` before the mock/record
#' context is set. Similarly, teardown code can go in
#' `inst/httptest2/end-vignette.R`, evaluated in `end_vignette()` after mocking
#' is stopped.
#'
#' @param dir Root file path for the mocks for this vignette. A good idea is
#' to use the file name of the vignette itself.
#' @param ... Optional arguments passed to `start_capturing()`
#' @return Nothing; called for its side effect of starting/ending
#' response recording or mocking.
#' @export
#' @seealso [start_capturing()] for how requests are recorded; [use_mock_api()]
#' for how previously recorded requests are loaded; [change_state()] for how to
#' handle recorded requests when the server state is changing;
#' `vignette("vignettes", package = "httptest2")` for an overview of all
start_vignette <- function(dir, ...) {
  # Cache the original .mockPaths so we can restore it on exit
  # And don't print messages in a vignette
  options(
    httptest2.mock.paths.old = getOption("httptest2.mock.paths"),
    httptest2.verbose.old = getOption("httptest2.verbose"),
    httptest2.verbose = FALSE
  )
  # This actually sources the files, if they exist
  find_package_functions(get_attached_packages(), "start-vignette.R")

  # Set the starting mockPath
  if (dir.exists("vignettes")) {
    # We're in the package root directory, probably running interactively
    # but we need to make sure we record/load relative to the vignette dir
    dir <- file.path("vignettes", dir)
  }
  .mockPaths(file.path(dir, "0"))
  if (dir.exists(dir)) {
    # We already have recorded, so use the fixtures
    use_mock_api()
  } else {
    # Record!
    start_capturing(...)
  }
}

#' Handle a change of server state
#'
#' In a vignette, put a call to `change_state()` before any code block that
#' makes a change on
#' the server, or rather, before any code block that might repeat the same
#' request previously done and expect a different result.
#'
#' `change_state()` works by layering a new directory on top of the existing
#' [.mockPaths()], so fixtures are recorded/loaded there, masking rather than
#' overwriting previously recorded responses for the same request. In
#' vignettes, these mock layers are subdirectories with integer names.
#'
#' @return Invisibly, the return of `.mockPaths()` with the new path added.
#' @seealso [start_vignette()];
#' `vignette("vignettes", package = "httptest2")` for an overview of all
#' @export
change_state <- function() {
  current_path <- .mockPaths()[1]
  path_segments <- unlist(strsplit(current_path, .Platform$file.sep))
  current_number <- suppressWarnings(
    as.numeric(path_segments[length(path_segments)])
  )
  if (is.na(current_number)) {
    # This path doesn't come from start_vignette/change_state
    stop(current_path, " is not valid for change_state()")
  }
  path_segments[length(path_segments)] <- current_number + 1
  new_path <- do.call(file.path, as.list(path_segments))
  .mockPaths(new_path)
}

#' @rdname start_vignette
#' @export
end_vignette <- function() {
  stop_capturing()
  stop_mocking()
  # TODO: compress recorded mocks (in case change_state() was called but
  # state didn't actually change) if we were recording

  # This actually sources the files, if they exist
  find_package_functions(get_attached_packages(), "end-vignette.R")

  # Restore original settings
  options(
    httptest2.mock.paths = getOption("httptest2.mock.paths.old"),
    httptest2.mock.paths.old = NULL,
    httptest2.verbose = getOption("httptest2.verbose.old")
  )
}
