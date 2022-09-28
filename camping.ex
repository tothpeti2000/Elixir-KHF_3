defmodule Khf3 do
  @moduledoc """
  Kemping helyessége
  Camping correctness

  @author "Egyetemi Hallgató <egy.hallg@dp.vik.bme.hu>"
  @date   "2022-10-04"
  ...
  """

  # Number of rows (1 - n)
  @type row :: integer
  # Number of columns (1 - m)
  @type col :: integer
  # Coordinates of a field
  @type field :: {row, col}

  # Number of tents per row
  @type tents_count_rows :: [integer]
  # Number of tents per column
  @type tents_count_cols :: [integer]

  # Coordinates of the fields which have a tree on them
  @type trees :: [field]
  # Tuple describing the puzzle
  @type puzzle_desc :: {tents_count_rows, tents_count_cols, trees}

  # Direction of tent positions: north, east, south, west
  @type dir :: :n | :e | :s | :w
  # List of tent position directions relative to the trees
  @type tent_dirs :: [dir]

  # a fák száma a kempingben
  @type cnt_tree :: integer
  # az elemek száma a sátorpozíciók irányának listájában
  @type cnt_tent :: integer
  # a sátrak száma rossz a felsorolt sorokban
  @type err_rows :: %{err_rows: [integer]}
  # a sátrak száma rossz a felsorolt oszlopokban
  @type err_cols :: %{err_cols: [integer]}
  # a felsorolt koordinátájú sátrak másikat érintenek
  @type err_touch :: %{err_touch: [field]}
  # hibaleíró hármas
  @type errs_desc :: {err_rows, err_cols, err_touch}

  @spec check_sol(pd :: puzzle_desc, ds :: tent_dirs) :: ed :: errs_desc
  # Az {rs, cs, ts} = pd feladványleíró és a ds sátorirány-lista
  # alapján elvégzett ellenőrzés eredménye a cd hibaleíró, ahol
  #   rs a sátrak soronként elvárt számának a listája,
  #   cs a sátrak oszloponként elvárt számának a listája,
  #   ts a fákat tartalmazó parcellák koordinátájának a listája
  # Az {e_rows, e_cols, e_touch} = ed hármas elemei olyan
  # kulcs-érték párok, melyekben a kulcs a hiba jellegére utal, az
  # érték pedig a hibahelyeket felsoroló lista (üres, ha nincs hiba)
  def check_sol({tents_count_rows, tents_count_cols, tree_fields}, directions) do
    n = length(tents_count_rows)
    m = length(tents_count_cols)
    tent_fields = get_tent_fields(tree_fields, directions)

    # tents_count_rows = [1, 1, 0, 3, 0]
    # tents_count_cols = [1, 0, 2, 0, 2]
    # tree_fields = [{1, 2}, {3, 3}, {3, 5}, {5, 1}, {5, 5}]
    # tent_fields = [{1, 3}, {4, 3}, {2, 5}, {4, 1}, {4, 5}]

    for i <- 0..length(tents_count_rows) - 1, do: get_row_errors(i + 1, Enum.at(tents_count_rows, i), tent_fields)
  end

  @spec get_tent_position(tree_field :: field, direction :: dir) :: tent_position :: field
  # Returns data about a tent based on the position of its corresponding tree and the given direction
  defp get_tent_position({i, j}, :n), do: {i - 1, j}
  defp get_tent_position({i, j}, :e), do: {i, j + 1}
  defp get_tent_position({i, j}, :s), do: {i + 1, j}
  defp get_tent_position({i, j}, :w), do: {i, j - 1}

  @spec get_tent_fields(tree_fields :: [field], directions :: [dir]) :: [field]
  # Returns data about all tents based on all trees and the given directions
  defp get_tent_fields(_, []), do: []

  defp get_tent_fields(tree_fields, directions) do
    for i <- 0..(length(tree_fields) - 1),
        do: get_tent_position(Enum.at(tree_fields, i), Enum.at(directions, i))
  end

  @spec get_row_errors(row:: Integer, expected_tent_count :: Integer, tent_fields :: [field]) :: errors :: err_rows
  defp get_row_errors(row, expected_tent_count, tent_fields) do

  end
end
