defmodule GameWeb.MyGrid do
  use Phoenix.Component
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
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={1} cell_type={"start"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={4} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={4} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={4} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={4} grid_y={4} cell_type={"end"} />
    </div>
    """
  end
  attr :grid_x,:integer, required: true
  attr :grid_y,:integer, required: true
  attr :cell_type, :string, required: true
  attr :rest, :global, include: ~w(form)
  def grid_cell(assigns) do
    imgURL="images/roadLR.png"


    imgURL = case {assigns.cell_type} do
      {"road"} -> "images/roadDL.png"
      {"start"} -> "images/truck.png"
      {"border"} -> "images/border.png"
      {"end"} -> "images/truck.png"
    end

    assigns = assign(assigns, imgURL: imgURL)
    dbg(assigns.cell_type)
    dbg(assigns.imgURL)
    dbg(assigns.cell_type == "end")
    # dbg(assigns)
    style = ~s("grid-column:#{assigns.grid_x}; grid-row:#{assigns.grid_y}")
    assigns = assign(assigns, style: style)
    imgSrc = ~s("#{assigns.imgURL}")
    assigns = assign(assigns, imgSrc: imgSrc)
    ~H"""
    <div style={@style};>
    <GameWeb.MyComponents.button phx-click="delivery"><img id="image" src={assigns.imgURL} /></GameWeb.MyComponents.button>
    </div>
    """
  end

end
