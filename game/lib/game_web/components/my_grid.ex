defmodule GameWeb.MyGrid do
  use Phoenix.Component
  alias Phoenix.LiveView.JS
  import GameWeb.Gettext

  import GameWeb.MyComponents
  @doc """
  Do a thing. My thing

  ## Examples

      <.my_grid id="playfield">
        This is a grid.
      </.my_grid>



  """
  attr :title,:string, required: true
  attr :rest, :global, include: ~w(form)
  slot :inner_block, required: true
  def grid(assigns) do
    ~H"""
    <div style = "display: grid;  grid-gap: 10px;  grid-template-columns: repeat(2, [col] auto);  grid-template-rows: repeat(2, [row] auto);  background-color: #fff;  color: #444;";>

    <div style ="grid-column:1; grid-row:1";>
    <GameWeb.MyComponents.button phx-click="delivery">Click here to deliver thing</GameWeb.MyComponents.button>
    </div>
    <div style ="grid-column:1; grid-row:2";>
    <GameWeb.MyComponents.button phx-click="delivery">Click here to deliver thing</GameWeb.MyComponents.button>
    </div>
    <div style ="grid-column:2; grid-row:1";>
    <GameWeb.MyComponents.button phx-click="delivery">Click here to deliver thing</GameWeb.MyComponents.button>
    </div>
    <div style ="grid-column:2; grid-row:2";>
    <GameWeb.MyComponents.button phx-click="delivery">Click here to deliver thing</GameWeb.MyComponents.button>
    </div>
    </div>
      <%= render_slot(@inner_block) %>
    """
  end


end
