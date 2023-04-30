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
  attr :grid_x,:integer, default: 6
  attr :grid_y,:integer, default: 6
  attr :rest, :global, include: ~w(form)
  slot :inner_block, required: true
  def grid(assigns) do

    ~H"""
    <div style={"display:grid;  grid-gap:10px;  grid-template-columns:repeat("<>(@grid_x |> Integer.to_string())<>", [col] auto);  grid-template-rows:repeat("<>(@grid_y|> Integer.to_string())<>", [row] auto);  background-color:#fff;  color:#444;>"}>
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={1} cell_type={"start"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={4} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={5} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={1} grid_y={6} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={4} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={5} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={2} grid_y={6} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={4} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={5} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={3} grid_y={6} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={4} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={4} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={4} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={4} grid_y={4} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={4} grid_y={5} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={4} grid_y={6} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={5} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={5} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={5} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={5} grid_y={4} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={5} grid_y={5} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={5} grid_y={6} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={6} grid_y={1} cell_type={"border"} />
      <GameWeb.MyGrid.grid_cell grid_x={6} grid_y={2} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={6} grid_y={3} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={6} grid_y={4} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={6} grid_y={5} cell_type={"road"} />
      <GameWeb.MyGrid.grid_cell grid_x={6} grid_y={6} cell_type={"end"} />
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
      {"end"} -> "images/end.png"
    end

    assigns = assign(assigns, imgURL: imgURL)

    click_event="UNDEFINED"
    click_event = case {assigns.cell_type} do
      {"road"} -> "road_rotate"
      {"start"} -> "delivery"
      {"border"} -> "nothing"
      {"end"} -> "end_click"
    end
    assigns = assign(assigns, click_event: click_event)

    css_class="text-black hover:bg-blue-800 rounded p-3"
    css_class = case {assigns.cell_type} do
      {"road"} -> "text-black"
      {"start"} -> "text-black hover:bg-green-800"
      {"border"} -> "text-black"
      {"end"} -> "text-black hover:bg-red-800"
    end
    assigns = assign(assigns, css_class: css_class)

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
    <GameWeb.MyComponents.button class={assigns.css_class} phx-click={assigns.click_event}><img id="image" src={assigns.imgURL} width="50" height="50" /></GameWeb.MyComponents.button>
    </div>
    """
  end

end
