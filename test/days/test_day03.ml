let input1 = {|xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))|}

let input2 =
  {|xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))}

let%expect_test "Day 3 - Part 1" =
  Printf.sprintf "%s" @@ Days.Day03.part1 input |> print_endline;
  [%expect {| 161 |}
;;

let%expect_test "Day 3 - Part 2" =
  Printf.sprintf "%s" @@ Days.Day03.part2 input2 |> print_endline;
  [%expect {| 48 |}]
;;
