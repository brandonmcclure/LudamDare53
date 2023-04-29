defmodule TestCounterWeb.CounterLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    dbg("Mounting new socket")

    {:ok,
     socket
     |> assign(:count, 0)
    }
  end
  def render(assigns) do
    ~L"""
      <h1>Count: <%= @count || 'NULLY' %></h1>
      <button>+</button>
      <button>-</button>
    """
  end
end
