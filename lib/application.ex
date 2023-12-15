defmodule TestTelegramBot.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: TestTelegramBot.WebHook, options: [port: 4000]}
    ]

    opts = [strategy: :one_for_one, name: TestTelegramBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
