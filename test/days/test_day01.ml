let input = {|3   4
4   3
2   5
1   3
3   9
3   3|}

let%expect_test "Day 1 - Part 1" =
  Printf.sprintf "%s" @@ Days.Day01.part1 input |> print_endline;
  [%expect {| 11 |}]
;;

let%expect_test "Day 1 - Part 2" =
  Printf.sprintf "%s" @@ Days.Day01.part2 input |> print_endline;
  [%expect {| 31 |}]
;;
