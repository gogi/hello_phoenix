defmodule HelloPhoenix.RoomChannel do
  use Phoenix.Channel

  def join("room:chat", _message, socket) do
    {:ok, socket}
  end

  def join(_channel, _message, _socket) do
    {:error, %{reason: "No channel found"}}
  end

  def handle_in("new_message", body, socket) do
    broadcast!(socket, "new_message", body)
    {:noreply, socket}
  end

  def handle_in("typing", _body, socket) do
    broadcast!(socket, "typing", %{})
    {:noreply, socket}
  end

  def handle_in("not_typing", _body, socket) do
    broadcast!(socket, "not_typing", %{})
    {:noreply, socket}
  end
end
