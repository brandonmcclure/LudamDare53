defmodule GameWeb.BoardLive do
  use GameWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    dbg("Mounting new socket")

    {:ok,
     socket
     |> assign(:score, 0)
     |> assign(:page_title, "Delivery - Map 1")
     |> assign(:board_status, [
      %{"x" => 1, "y" => 1, "cell_type" => "start", "status" => 1 },
      %{"x" => 1, "y" => 2, "cell_type" => "road", "status" => 1 },
      %{"x" => 1, "y" => 3, "cell_type" => "road", "status" => 1 },
      %{"x" => 1, "y" => 4, "cell_type" => "road", "status" => 1 },
      %{"x" => 1, "y" => 5, "cell_type" => "road", "status" => 1 },
      %{"x" => 1, "y" => 6, "cell_type" => "border", "status" => 1 },
      %{"x" => 2, "y" => 1, "cell_type" => "border", "status" => 1 },
      %{"x" => 2, "y" => 2, "cell_type" => "road", "status" => 1 },
      %{"x" => 2, "y" => 3, "cell_type" => "road", "status" => 1 },
      %{"x" => 2, "y" => 4, "cell_type" => "road", "status" => 1 },
      %{"x" => 2, "y" => 5, "cell_type" => "road", "status" => 1 },
      %{"x" => 2, "y" => 6, "cell_type" => "border", "status" => 1 },
      %{"x" => 3, "y" => 1, "cell_type" => "border", "status" => 1 },
      %{"x" => 3, "y" => 2, "cell_type" => "road", "status" => 1 },
      %{"x" => 3, "y" => 3, "cell_type" => "road", "status" => 1 },
      %{"x" => 3, "y" => 4, "cell_type" => "road", "status" => 1 },
      %{"x" => 3, "y" => 5, "cell_type" => "road", "status" => 1 },
      %{"x" => 3, "y" => 6, "cell_type" => "border", "status" => 1 },
      %{"x" => 4, "y" => 1, "cell_type" => "border", "status" => 1 },
      %{"x" => 4, "y" => 2, "cell_type" => "road", "status" => 1 },
      %{"x" => 4, "y" => 3, "cell_type" => "road", "status" => 1 },
      %{"x" => 4, "y" => 4, "cell_type" => "road", "status" => 1 },
      %{"x" => 4, "y" => 5, "cell_type" => "road", "status" => 1 },
      %{"x" => 4, "y" => 6, "cell_type" => "border", "status" => 1 },
      %{"x" => 5, "y" => 1, "cell_type" => "border", "status" => 1 },
      %{"x" => 5, "y" => 2, "cell_type" => "road", "status" => 1 },
      %{"x" => 5, "y" => 3, "cell_type" => "road", "status" => 1 },
      %{"x" => 5, "y" => 4, "cell_type" => "road", "status" => 1 },
      %{"x" => 5, "y" => 5, "cell_type" => "road", "status" => 1 },
      %{"x" => 5, "y" => 6, "cell_type" => "border", "status" => 1 },
      %{"x" => 6, "y" => 1, "cell_type" => "border", "status" => 1 },
      %{"x" => 6, "y" => 2, "cell_type" => "road", "status" => 1 },
      %{"x" => 6, "y" => 3, "cell_type" => "road", "status" => 1 },
      %{"x" => 6, "y" => 4, "cell_type" => "road", "status" => 1 },
      %{"x" => 6, "y" => 5, "cell_type" => "road", "status" => 1 },
      %{"x" => 6, "y" => 6, "cell_type" => "end", "status" => 1 }

     ]
      )
    }
  end
  def incScore(score) do
    score+1
  end
  @impl true
  def handle_event("delivery", _params, socket) do
    # dbg("handle delivery")

    new_socket = socket
      |> assign(:score, incScore(socket.assigns.score))

    {:noreply, new_socket}
  end
  @impl true
  def handle_event("road_rotate", _params, socket) do

    new_socket = socket

    {:noreply, new_socket}
  end

end
