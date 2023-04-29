defmodule GameWeb.MyComponents do
  use Phoenix.Component
  alias Phoenix.LiveView.JS
  import GameWeb.Gettext

  @doc """
  Do a thing. My thing

  ## Examples

      <.my_grid id="playfield">
        This is a grid.
      </.my_grid>



  """
  attr :type, :string, default: nil
  attr :class, :string, default: "text-black hover:bg-blue-800 rounded p-3"
  attr :rest, :global, include: ~w(disabled form name value)
  slot :inner_block, required: true
  def button(assigns) do
    ~H"""
    <button
      type={@type}
      class={@class}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  attr :title,:string, required: true
  attr :rest, :global, include: ~w(form)
  slot :inner_block, required: true
  def container(assigns) do
    ~H"""
    <div class="flex flex-col gap-3 p-3">
      <h1> <%= @title %> </h1>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end


end
