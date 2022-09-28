p0 = {pd0, ts0} =
  { {[-1, 0, 0, -3, 0], [0, 0, -2, 0, 0], []}, [] }
p1 = {pd1, ts1} =
  { {[1, 0, 0, 3, 0], [0, 0, 2, 0, 0], []}, [] }
p2 = {pd2, ts2} =
  { {[1, 1, 0, 3, 0], [1, 0, 2, 0, 2], [{1, 2}, {3, 3}, {3, 5}, {5, 1}, {5, 5}]}, [:e,:s,:n,:n,:n] }
p3 = {pd3, ts3} =
  { {[1, 1, 0, 3, 0], [1, 0, 2, 0, 2], [{1, 2}, {3, 3}, {3, 5}, {5, 1}, {5, 5}]}, [:e,:e,:n,:n,:n] }
p4 = {pd4, ts4} =
  { {[1, 0, 2, 2, 0], [1, 0, 0, 2, 1], [{1, 2}, {3, 3}, {3, 5}, {5, 1}, {5, 5}]}, [:e,:e,:n,:n,:n] }
p5 = {pd5, ts5} =
  { {[1, 1, -1, 3, 0], [1, 0, -2, 0, 2], [{1, 2}, {3, 3}, {3, 5}, {5, 1}, {5, 5}]}, [:e,:s,:n,:n,:w] }


#    0 0 -2 0 0
# -1 - -  - - -
#  0 - -  - - -
#  0 - -  - - -
# -3 - -  - - -
#  0 - -  - - -
IO.puts "--- p0"
pd0 |> IO.inspect
ts0 |> IO.inspect
Khf2.to_external pd0, ts0, "x.txt"; (File.read! "x.txt") |> IO.write
(Khf3.check_sol pd0, ts0) |> IO.inspect
# {%{err_rows: []}, %{err_cols: []}, %{err_touch: []}}


#   0 0 2 0 0
# 1 - - - - -
# 0 - - - - -
# 0 - - - - -
# 3 - - - - -
# 0 - - - - -
IO.puts "--- p1"
pd1 |> IO.inspect
ts1 |> IO.inspect
Khf2.to_external pd1, ts1, "x.txt"; (File.read! "x.txt") |> IO.write
(Khf3.check_sol pd1, ts1) |> IO.inspect
# {%{err_rows: [1,4]}, %{err_cols: [3]}, %{err_touch: []}}


#   1 0 2 0 2
# 1 - * E - -
# 1 - - - - N
# 0 - - * - *
# 3 N - S - N
# 0 * - - - *
IO.puts "--- p2"
pd2 |> IO.inspect
ts2 |> IO.inspect
Khf2.to_external pd2, ts2, "x.txt"; (File.read! "x.txt") |> IO.write
(Khf3.check_sol pd2, ts2) |> IO.inspect
# {%{err_rows: []}, %{err_cols: []}, %{err_touch: []}}


#   1 0 2 0 2
# 1 - * E - -
# 1 - - - - N
# 0 - - * E *
# 3 N - - - N
# 0 * - - - *
IO.puts "--- p3"
pd3 |> IO.inspect
ts3 |> IO.inspect
Khf2.to_external pd3, ts3, "x.txt"; (File.read! "x.txt") |> IO.write
(Khf3.check_sol pd3, ts3) |> IO.inspect
# {%{err_rows: [3,4]}, %{err_cols: [3,4]}, %{err_touch: [{2, 5}, {3, 4}, {4, 5}]}}


#   1 0 0 2 1
# 1 - * E - -
# 0 - - - - N
# 2 - - * E *
# 2 N - - - N
# 0 * - - - *
IO.puts "--- p4"
pd4 |> IO.inspect
ts4 |> IO.inspect
Khf2.to_external pd4, ts4, "x.txt"; (File.read! "x.txt") |> IO.write
(Khf3.check_sol pd4, ts4) |> IO.inspect
# {%{err_rows: [2,3]}, %{err_cols: [3,4,5]}, %{err_touch: [{2, 5}, {3, 4}, {4, 5}]}}


#    1 0 -2 0 2
#  1 - *  E - -
#  1 - -  - - N
# -1 - -  * - *
#  3 N -  S - -
#  0 * -  - W *
IO.puts "--- p5"
pd5 |> IO.inspect
ts5 |> IO.inspect
Khf2.to_external pd5, ts5, "x.txt"; (File.read! "x.txt") |> IO.write
(Khf3.check_sol pd5, ts5) |> IO.inspect
IO.puts "---"
# {%{err_rows: [4, 5]}, %{err_cols: [4, 5]}, %{err_touch: [{4, 3}, {5, 4}]}}
