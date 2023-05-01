defmodule GameWeb.BoardLive do
  use GameWeb, :live_view

  def astar(grid) do
    # Pathfinding.find_path(grid, 0, 0, 4, 4)
    dbg('doing astar')

    for mapInstance <- grid do
    end
  end

  @impl true
  def mount(_params, _session, socket) do
    dbg("Mounting new socket")
    :timer.send_interval(1000, self(), :tick)

    # starting_board = [
    #   [%{"x" => 1, "y" => 1, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 1, "y" => 2, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 1, "y" => 3, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 1, "y" => 4, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 1, "y" => 5, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 1, "y" => 6, "cell_type" => "start", "status" => 1, "walkable" => 0}],
    #   [%{"x" => 2, "y" => 1, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 2, "y" => 2, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 1, "y" => 3, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 2, "y" => 4, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 2, "y" => 5, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 2, "y" => 6, "cell_type" => "start", "status" => 2, "walkable" => 0}],
    #   [%{"x" => 3, "y" => 1, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 3, "y" => 2, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 3, "y" => 3, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 3, "y" => 4, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 3, "y" => 5, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 3, "y" => 6, "cell_type" => "start", "status" => 1, "walkable" => 0}],
    #   [%{"x" => 4, "y" => 1, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 4, "y" => 2, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 4, "y" => 3, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 4, "y" => 4, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 4, "y" => 5, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 4, "y" => 6, "cell_type" => "start", "status" => 1, "walkable" => 0}],
    #   [%{"x" => 5, "y" => 1, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 5, "y" => 2, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 5, "y" => 3, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 5, "y" => 4, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 5, "y" => 5, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 5, "y" => 6, "cell_type" => "start", "status" => 1, "walkable" => 0}],
    #   [%{"x" => 6, "y" => 1, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 6, "y" => 2, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 6, "y" => 3, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 6, "y" => 4, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 6, "y" => 5, "cell_type" => "start", "status" => 1, "walkable" => 0},%{"x" => 6, "y" => 6, "cell_type" => "start", "status" => 1, "walkable" => 0}],

    # ]
    starting_board = [
      %{"x" => 1, "y" => 1, "cell_type" => "start", "status" => 1, "walkable" => 0},
      %{"x" => 1, "y" => 2, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 1, "y" => 3, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 1, "y" => 4, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 1, "y" => 5, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 1, "y" => 6, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 2, "y" => 1, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 2, "y" => 2, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 2, "y" => 3, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 2, "y" => 4, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 2, "y" => 5, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 2, "y" => 6, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 3, "y" => 1, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 3, "y" => 2, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 3, "y" => 3, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 3, "y" => 4, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 3, "y" => 5, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 3, "y" => 6, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 4, "y" => 1, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 4, "y" => 2, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 4, "y" => 3, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 4, "y" => 4, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 4, "y" => 5, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 4, "y" => 6, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 5, "y" => 1, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 5, "y" => 2, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 5, "y" => 3, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 5, "y" => 4, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 5, "y" => 5, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 5, "y" => 6, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 6, "y" => 1, "cell_type" => "border", "status" => 1, "walkable" => 0},
      %{"x" => 6, "y" => 2, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 6, "y" => 3, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 6, "y" => 4, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 6, "y" => 5, "cell_type" => "road", "status" => 1, "walkable" => 0},
      %{"x" => 6, "y" => 6, "cell_type" => "end", "status" => 1, "walkable" => 0}
    ]

    # Enum.each(starting_board, fn %{k => v} ->
    #   IO.puts("#{k} --> #{v}")
    # end)

    {:ok,
     socket
     |> assign(:score, 0)
     |> assign(:page_title, "Delivery - Map 1")
     |> assign(:seconds_left, 30)
     |> assign(:is_walkable, astar(starting_board))
     |> assign(:board_status, starting_board)}
  end

  def incScore(score) do
    score + 1
  end

  @impl true
  def handle_event("nothing", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("delivery", _params, socket) do
    # dbg("handle delivery")

    new_socket =
      socket
      |> assign(:score, incScore(socket.assigns.score))

    {:noreply, new_socket}
  end

  def rotate_tile(status) do
    dbg('rotate_tile')
    maxInt = 6
    newStatus = status
    dbg(newStatus)

    newStatus =
      case status do
        _ when status < maxInt -> status + 1
        _ when status == maxInt -> 1
      end

    dbg(newStatus)
    dbg(maxInt)
    newStatus
  end

  @impl true
  def handle_event("road_rotate", params, socket) do
    new_socket = socket
    # dbg(params)
    # dbg(new_socket)
    newBS = new_socket.assigns.board_status
    # dbg(newBS)
    # Wow, this is not good elixir. I need to learn alot more about the Enum functions
    oldInstance =
      for mapInstance <- newBS do
        if mapInstance["x"] == String.to_integer(params["targetx"]) do
          if(mapInstance["y"] == String.to_integer(params["targety"])) do
            _something = mapInstance
            mapInstance
          end
        end
      end
      |> Enum.filter(& &1)
      |> Enum.at(0)

    thisInstance =
      for mapInstance <- newBS do
        if mapInstance["x"] == String.to_integer(params["targetx"]) do
          if(mapInstance["y"] == String.to_integer(params["targety"])) do
            oldInstance = mapInstance

            mapInstance
            |> put_in(["status"], rotate_tile(oldInstance["status"]))
          end
        end
      end
      |> Enum.filter(& &1)
      |> Enum.at(0)

    # dbg(oldInstance)
    # dbg(thisInstance)

    newnewBS =
      newBS
      |> Enum.map(fn
        x ->
          # dbg(x)
          # dbg(oldInstance)

          if x == oldInstance do
            # dbg('we got a match')
            thisInstance
          else
            # dbg('no match')
            x
          end
      end)

    # dbg(newnewBS)

    {:noreply,
     new_socket
     |> assign(:board_status, newnewBS)
     |> assign(:is_walkable, astar(newnewBS))}
  end

  @impl true
  def handle_info(:tick, %{assigns: %{seconds_left: 0}} = socket) do
    {:noreply, socket |> assign(:seconds_left, 0)}
  end

  @impl true
  def handle_info(:tick, %{assigns: %{seconds_left: seconds}} = socket) do
    {:noreply,
     socket
     |> assign(:seconds_left, seconds - 1)}
  end

  # def add_employee(employee_type, socket) do
  #   cost = employees[String.to_atom(employee_type)]["cost"]

  #   if socket.assigns.game.currency >= cost do
  #     new_employee =
  #       Map.put(
  #         socket.assigns.game.employee_state,
  #         employee_type,
  #         employees[String.to_atom(employee_type)]
  #       )

  #     new_currency = socket.assigns.game.currency - cost
  #     {new_employee, new_currency}
  #   else
  #     {socket.assigns.game.employee_state, socket.assigns.game.currency}
  #   end
  # end
end
