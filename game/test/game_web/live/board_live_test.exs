defmodule GameWeb.BoardLiveTest do
  use GameWeb.ConnCase

  import Phoenix.LiveViewTest
  import Game.EngineFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_board(_) do
    board = board_fixture()
    %{board: board}
  end

  describe "Index" do
    setup [:create_board]
  end

  describe "Show" do
    setup [:create_board]
  end
end
