structure(
  list(
    url = "http://httpbin.not/html",
    status_code = 200L,
    headers = structure(
      list(
        connection = "keep-alive",
        server = "meinheld/0.6.1",
        date = "Sat, 27 May 2017 20:08:33 GMT",
        `content-type` = "text/html; charset=utf-8",
        `content-length` = "3741",
        `access-control-allow-origin` = "*",
        `access-control-allow-credentials` = "true",
        `x-powered-by` = "Flask",
        `x-processed-time` = "0.000486850738525",
        via = "1.1 vegur"
      ),
      class = c("insensitive", "list")
    ),
    all_headers = list(
      structure(
        list(
          status = 200L,
          version = "HTTP/1.1",
          headers = structure(
            list(
              connection = "keep-alive",
              server = "meinheld/0.6.1",
              date = "Sat, 27 May 2017 20:08:33 GMT",
              `content-type` = "text/html; charset=utf-8",
              `content-length` = "3741",
              `access-control-allow-origin` = "*",
              `access-control-allow-credentials` = "true",
              `x-powered-by` = "Flask",
              `x-processed-time` = "0.000486850738525",
              via = "1.1 vegur"
            ),
            .Names = c(
              "connection",
              "server",
              "date",
              "content-type",
              "content-length",
              "access-control-allow-origin",
              "access-control-allow-credentials",
              "x-powered-by",
              "x-processed-time",
              "via"
            ),
            class = c("insensitive", "list")
          )
        ),
        .Names = c(
          "status",
          "version",
          "headers"
        )
      )
    ),
    content = charToRaw(
      "<!DOCTYPE html>
<html>
  <head>
    </head>
      <body>
        <h1>Herman Melville - Moby-Dick</h1>
            <div>
                <p>Availing himself of the mild, summer-cool weather that now reigned in these latitudes, and in preparation for the peculiarly active pursuits shortly to be anticipated, Perth, the begrimed, blistered old blacksmith, had not removed his portable forge to the hold again, after concluding his contributory work for Ahab's leg, but still retained it on deck, fast lashed to ringbolts by the foremast; being now almost incessantly invoked by the headsmen, and harpooneers, and bowsmen to do some little job for them; altering, or repairing, or new shaping their various weapons and boat furniture. Often he would be surrounded by an eager circle, all waiting to be served; holding boat-spades, pike-heads, harpoons, and lances, and jealously watching his every sooty movement, as he toiled. Nevertheless, this old man's was a patient hammer wielded by a patient arm. No murmur, no impatience, no petulance did come from him. Silent, slow, and solemn; bowing over still further his chronically broken back, he toiled away, as if toil were life itself, and the heavy beating of his hammer the heavy beating of his heart. And so it was.—Most miserable! A peculiar walk in this old man, a certain slight but painful appearing yawing in his gait, had at an early period of the voyage excited the curiosity of the mariners. And to the importunity of their persisted questionings he had finally given in; and so it came to pass that every one now knew the shameful story of his wretched fate. Belated, and not innocently, one bitter winter's midnight, on the road running between two country towns, the blacksmith half-stupidly felt the deadly numbness stealing over him, and sought refuge in a leaning, dilapidated barn. The issue was, the loss of the extremities of both feet. Out of this revelation, part by part, at last came out the four acts of the gladness, and the one long, and as yet uncatastrophied fifth act of the grief of his life's drama. He was an old man, who, at the age of nearly sixty, had postponedly encountered that thing in sorrow's technicals called ruin. He had been an artisan of famed excellence, and with plenty to do; owned a house and garden; embraced a youthful, daughter-like, loving wife, and three blithe, ruddy children; every Sunday went to a cheerful-looking church, planted in a grove. But one night, under cover of darkness, and further concealed in a most cunning disguisement, a desperate burglar slid into his happy home, and robbed them all of everything. And darker yet to tell, the blacksmith himself did ignorantly conduct this burglar into his family's heart. It was the Bottle Conjuror! Upon the opening of that fatal cork, forth flew the fiend, and shrivelled up his home. Now, for prudent, most wise, and economic reasons, the blacksmith's shop was in the basement of his dwelling, but with a separate entrance to it; so that always had the young and loving healthy wife listened with no unhappy nervousness, but with vigorous pleasure, to the stout ringing of her young-armed old husband's hammer; whose reverberations, muffled by passing through the floors and walls, came up to her, not unsweetly, in her nursery; and so, to stout Labor's iron lullaby, the blacksmith's infants were rocked to slumber. Oh, woe on woe! Oh, Death, why canst thou not sometimes be timely? Hadst thou taken this old blacksmith to thyself ere his full ruin came upon him, then had the young widow had a delicious grief, and her orphans a truly venerable, legendary sire to dream of in their after years; and all of them a care-killing competency.
                </p>
          </div>
  </body>
</html>"
    ),
    date = structure(1495915713, class = c("POSIXct", "POSIXt"), tzone = "GMT"),
    times = structure(
      c(0, 0.018544, 0.100954, 0.101057, 0.186309, 0.186663),
      .Names = c(
        "redirect",
        "namelookup",
        "connect",
        "pretransfer",
        "starttransfer",
        "total"
      )
    ),
    request = structure(
      list(
        method = "GET",
        url = "http://httpbin.not/html",
        headers = structure(
          "application/json, text/xml, application/xml, */*",
          .Names = "Accept"
        ),
        fields = NULL,
        options = structure(list(
          useragent = "libcurl/7.51.0 r-curl/2.3 httr/1.2.1",
          httpget = TRUE
        )),
        auth_token = NULL,
        output = structure(list(), class = c("write_memory", "write_function"))
      ),
      class = "request"
    )
  ),
  class = "response"
)
