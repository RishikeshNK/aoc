let input =
  {|MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX|}
;;

let%expect_test "Day 4 - Part 1" =
  Printf.sprintf "%s" @@ Days.Day04.part1 input |> print_endline;
  [%expect {| 18 |}]
;;

let%expect_test "Day 4 - Part 2" =
  Printf.sprintf "%s" @@ Days.Day04.part2 input |> print_endline;
  [%expect {| 9 |}]
;;
