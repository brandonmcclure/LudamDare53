defmodule GameWeb.MyGrid do
  use Phoenix.Component
  attr(:grid_x, :integer, required: true)
  attr(:grid_y, :integer, required: true)
  attr(:cell_type, :string, required: true)
  attr(:status, :integer, required: true)
  attr(:rest, :global, include: ~w(form))

  def grid_cell(assigns) do
    # dbg(assigns.status)
    imgURL =
      case {assigns.cell_type} do
        {"road"} ->
          case {assigns.status} do
            {1} -> "images/roadDL.png"
            {2} -> "images/roadLU.png"
            {3} -> "images/roadUR.png"
            {4} -> "images/roadRD.png"
            {5} -> "images/roadUD.png"
            {6} -> "images/roadLR.png"
            {_} -> "images/roadUD.png"
          end

        {"start"} ->
          "images/truck.png"

        {"border"} ->
          "images/border.png"

        {"end"} ->
          "images/end.png"
      end

    assigns = assign(assigns, imgURL: imgURL)

    click_event =
      case {assigns.cell_type} do
        {"road"} -> "road_rotate"
        {"start"} -> "delivery"
        {"border"} -> "nothing"
        {"end"} -> "nothing"
      end

    assigns = assign(assigns, click_event: click_event)

    css_class =
      case {assigns.cell_type} do
        {"road"} -> "text-black"
        {"start"} -> "text-black hover:bg-green-800 rounded p-3"
        {"border"} -> "text-black"
        {"end"} -> "text-black hover:bg-red-800"
      end

    assigns = assign(assigns, css_class: css_class)

    # dbg(assigns.cell_type)
    # dbg(assigns.imgURL)
    # dbg(assigns.cell_type == "end")
    # dbg(assigns)
    style = ~s("grid-column:#{assigns.grid_x}; grid-row:#{assigns.grid_y}")
    assigns = assign(assigns, style: style)
    imgSrc = ~s("#{assigns.imgURL}")
    assigns = assign(assigns, imgSrc: imgSrc)

    ~H"""
    <div style={@style};>
    <GameWeb.MyComponents.button class={assigns.css_class} phx-click={assigns.click_event} phx-value-targetx={assigns.grid_x} phx-value-targety={assigns.grid_y}><img id="image" src={assigns.imgURL} width="50" height="50" /></GameWeb.MyComponents.button>
    </div>
    """
  end
end
