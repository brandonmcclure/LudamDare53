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
  attr :grid_x,:integer, default: 4
  attr :grid_y,:integer, default: 4
  attr :rest, :global, include: ~w(form)
  slot :inner_block, required: true
  def grid(assigns) do

    ~H"""
    <div style={"display:grid;  grid-gap:10px;  grid-template-columns:repeat("<>(@grid_x |> Integer.to_string())<>", [col] auto);  grid-template-rows:repeat("<>(@grid_y|> Integer.to_string())<>", [row] auto);  background-color:#fff;  color:#444;>"}>
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={1} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={2} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={1} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={2} />
    </div>
    """
  end
  attr :grid_x,:integer, required: true
  attr :grid_y,:integer, required: true
  attr :rest, :global, include: ~w(form)
  def grid_cell(assigns) do

    style = ~s("grid-column:#{@grid_x}; grid-row:#{@grid_y}")
    assigns = assign(assigns, style: style)
    ~H"""
    <div style={@style};>
    <GameWeb.MyComponents.button phx-click="delivery"><img id="image" src="images/truck.png" /></GameWeb.MyComponents.button>
    </div>
    """
  end

end
