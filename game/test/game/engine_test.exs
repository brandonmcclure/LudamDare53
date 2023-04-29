defmodule Game.EngineTest do
  use Game.DataCase

  alias Game.Engine

  describe "boards" do
    alias Game.Engine.Board

    import Game.EngineFixtures

    @invalid_attrs %{name: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Engine.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Engine.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Board{} = board} = Engine.create_board(valid_attrs)
      assert board.name == "some name"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Engine.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Board{} = board} = Engine.update_board(board, update_attrs)
      assert board.name == "some updated name"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Engine.update_board(board, @invalid_attrs)
      assert board == Engine.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Engine.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Engine.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Engine.change_board(board)
    end
  end
end
