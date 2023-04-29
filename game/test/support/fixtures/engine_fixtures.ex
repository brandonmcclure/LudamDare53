defmodule Game.EngineFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Game.Engine` context.
  """

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Game.Engine.create_board()

    board
  end
end
