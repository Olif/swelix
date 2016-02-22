defmodule Swish do
  use HTTPoison.Base

  def process_url(url) do
    "https://mss.swicpc.bankgirot.se/swish-cpcapi/api/v1/" <> url
  end

  def process_response_body(body) do
    body 
    |> Poison.decode!
  end

  def make_request do
    HTTPoison.get "https://mss.swicpc.bankgirot.se", [], [
      hackney: [
        ssl_options: [
          cacertfile: "./testcerts/swish_ca.pem",
          certfile: "./testcerts/swish.cert.pem",
          keyfile: "./testcerts/swish.key.pem"
        ]
      ]
    ]
  end
end
