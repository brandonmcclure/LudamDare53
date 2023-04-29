defmodule GameWeb.BoardLive do
  use GameWeb, :live_view

  alias Game.Engine
  alias Game.Engine.{Board}

  @impl true
  def mount(_params, _session, socket) do
    dbg("Mounting new socket")

    {:ok, socket
      |> assign(:score, 0)
      |> assign(:page_title, "Listing Boards")
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, socket}
  end


  @impl true
  def handle_event("delivery", _params, socket) do
    dbg("here")
    new_socket =
      Ecto.Changeset.change(socket.assigns.score, %{
        score: socket.assigns.score + 1
      })


    {:noreply,
        new_socket
    }
  end
end
