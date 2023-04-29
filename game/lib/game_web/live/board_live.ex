defmodule GameWeb.BoardLive do
  use GameWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    dbg("Mounting new socket")

    {:ok,
     socket
     |> assign(:score, 0)
     |> assign(:page_title, "Listing Boards")
    }
  end
  def incScore(score) do
    score+1
  end
  @impl true
  def handle_event("delivery", _params, socket) do
    dbg("handle delivery")

    new_socket = socket
      |> assign(:score, incScore(socket.assigns.score))

    {:noreply, new_socket}
  end

end
