(* Infelizmente implementar a solução em SML tava muito trabalhosa então tive que implementar de forma mais imperativa, tanto que usei mutabilidade nesse código*)
(* De certa maneira foi apenas uma tradução para SML do código escrito em python *)
fun get_max_matching n =
    let
        val graph_out = Array.tabulate (n, fn _ => ~1)
        val graph_in = Array.tabulate (n, fn _ => ref [])

        val _ = Array.tabulate (n, fn i =>
            let
                val image = LargeInt.toInt (LargeInt.mod (LargeInt.+ (LargeInt.+ (LargeInt.* (LargeInt.* (LargeInt.fromInt i, LargeInt.fromInt i), LargeInt.fromInt i), LargeInt.fromInt i), LargeInt.fromInt 1), LargeInt.fromInt n))
                val _ = Array.update (graph_out, i, image)
                val current_list = !(Array.sub (graph_in, image))
                val _ = Array.update (graph_in, image, ref (i :: current_list))
            in
                ()
            end)

        fun remove_leaves ([], vis, cnt) = cnt
          | remove_leaves (v::rest, vis, cnt) = 
                if Array.sub (vis, v) then
                    remove_leaves (rest, vis, cnt)
                else
                    let
                        val _ = Array.update (vis, v, true)
                        val u = Array.sub (graph_out, v)
                    in
                        if Array.sub (vis, u) then
                            remove_leaves (rest, vis, cnt)
                        else
                            let
                                val _ = Array.update (vis, u, true)
                                val w = Array.sub (graph_out, u)
                                val cnt' = cnt + 1
                                val current_w_list = !(Array.sub (graph_in, w))
                                val _ = Array.update (graph_in, w, ref (List.filter (fn x => x <> u) current_w_list))
                                val to_compute' = if List.null (!(Array.sub (graph_in, w))) andalso not (Array.sub (vis, w)) then
                                                    w :: rest
                                                else
                                                    rest
                            in
                                remove_leaves (to_compute', vis, cnt')
                            end
                    end

        fun traverse u vis graph_out =
            let
                fun visit u (cycle_len, vis) =
                    if Array.sub (vis, u) then
                        (cycle_len, vis)
                    else
                        let
                            val _ = Array.update (vis, u, true)
                            val next = Array.sub (graph_out, u)
                        in
                            visit next (cycle_len + 1, vis)
                        end
            in
                visit u (0, vis)
            end

        fun remove_cycles vis graph_out cnt =
            let
                fun helper i cnt_acc =
                    if i = Array.length vis then cnt_acc
                    else if Array.sub (vis, i) then
                        helper (i + 1) cnt_acc
                    else
                        let
                            val (cycle_len, vis') = traverse i vis graph_out
                            val cnt_new = cnt_acc + (cycle_len div 2)
                        in
                            helper (i + 1) cnt_new
                        end
            in
                helper 0 cnt
            end

        val to_compute = List.filter (fn i => List.null (!(Array.sub (graph_in, i)))) (List.tabulate (n, fn x => x))
        val vis = Array.array (n, false)
        val cnt = remove_leaves (to_compute, vis, 0)
    in
        remove_cycles vis graph_out cnt
    end

fun main () =
    let
        fun test () =
            let
                val n = 100001
                val graph_out = Array.tabulate (n, fn i => LargeInt.toInt (LargeInt.mod (LargeInt.+ (LargeInt.+ (LargeInt.* (LargeInt.* (LargeInt.fromInt i, LargeInt.fromInt i), LargeInt.fromInt i), LargeInt.fromInt i), LargeInt.fromInt 1), LargeInt.fromInt n)))
            in
                print ("Sample graph_out: " ^ String.concatWith ", " (List.map Int.toString (List.take (Array.toList graph_out, 10))) ^ "\n")
            end

        fun summation () =
            let
                fun compute_sum (i, acc) =
                    if i > 100100 then
                        acc
                    else
                        let
                            val val_i = get_max_matching i
                            val _ = print (Int.toString i ^ " " ^ Int.toString val_i ^ "\n")
                        in
                            compute_sum (i + 1, acc + val_i)
                        end
            in
                compute_sum (100001, 0)
            end

        val _ = test ()
        val sum = summation ()
    in
        print ("Sum: " ^ Int.toString sum ^ "\n")
    end

val _ = main ()
