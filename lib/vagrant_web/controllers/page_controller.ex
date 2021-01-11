defmodule VagrantWeb.PageController do
  use VagrantWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def query(conn, _params) do
    json = "{ \"query\": \"query {  user(login: \\\"playfulpachyderm\\\") {    id    name    url    watching(last:100) {      nodes {        description        url        name      }    }  }}\"}"
    endpoint = "https://api.github.com/graphql"
    headers = [{"Authorization", "bearer 31993e31a5fca5705cc9546cc29b9e496b3f79fc"}, {"Content-Type", "application/json"}]

    {result, response} = HTTPoison.post(endpoint, json, headers)
    {result, data} = Poison.decode(response.body)

    repos = data["data"]["user"]["watching"]["nodes"]


    render(conn, "query_result.html", repos: repos)
  end
end
