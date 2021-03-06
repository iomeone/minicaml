(* Example from Appel's "Modern Compiler Implementation in ML", translated
   to Caml. *)


(** Main **)
let n = 8
let row = [0] ** n
let row = [0] ** n
let col = [0] ** n
let diag1 = [0] ** (n+n-1)
let diag2 = [0] ** (n+n-1)

let printboard () =
  for i = 0 to n-1 do
    for j = 0 to n-1 do
      print_string (if col.(i) = j then " O" else " .")
    done;
    print_string "\n"
  done;
  print_string "\n"

let rec search c =
  if c = n
  then printboard ()
  else for r = 0 to n-1  do
         if (row.(r) = 0 && diag1.(r+c) = 0 && diag2.(r+7-c) = 0)
         then (row.(r) <- 1;
               diag1.(r+c) <- 1;
               diag2.(r+7-c) <- 1;
               col.(c) <- r;
               search (c+1);
               row.(r) <- 0;
               diag1.(r+c) <- 0;
               diag2.(r+7-c) <- 0)
       done

let _ = search 0


