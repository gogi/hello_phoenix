defmodule HelloPhoenix.RoomChannel do
  use Phoenix.Channel

  def join("room:chat", _message, socket) do
    {:ok, socket}
  end

  def join(_channel, _message, _socket) do
    {:error, %{reason: "No channel found"}}
  end
end
