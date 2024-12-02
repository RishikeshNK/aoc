let input = {|7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9|}

let%expect_test "Day 2 - Part 1" =
  Printf.sprintf "%s" @@ Days.Day02.part1 input |> print_endline;
  [%expect {| 2 |}]
;;

let%expect_test "Day 2 - Part 2" =
  Printf.sprintf "%s" @@ Days.Day02.part2 input |> print_endline;
  [%expect {| 4 |}]
;;
