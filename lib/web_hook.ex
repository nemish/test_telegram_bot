defmodule TestTelegramBot.WebHook do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  @token "your_token_goes_here"

  post "/:token" do
    # Verify if the token in the URL matches your bot token for security
    if token == @token do
      # Parse incoming update (message)
      {:ok, body, _conn} = Plug.Conn.read_body(conn)
      update = Jason.decode!(body)
      IO.puts("body: #{inspect(update)}")

      # Process the update
      # ... (your logic here)

      send_resp(conn, 200, "OK")
    else
      send_resp(conn, 401, "Unauthorized")
    end
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
