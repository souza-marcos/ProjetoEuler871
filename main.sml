(*
    f(x, n) = x^3 + x + 1 mod n 
    Utilizando LargeInt para evitar Overflow
*)
fun f (x, n) = 
    let 
        val x_large = LargeInt.fromInt x
        val n_large = LargeInt.fromInt n
        val res = LargeInt.mod (LargeInt.+ (LargeInt.+ (LargeInt.* (LargeInt.* (x_large, x_large), x_large), 
                x_large), LargeInt.fromInt 1), n_large)
    in
        LargeInt.toInt res
    end;

(* Imagem da função para cada vértice, para qual vértice cada vértice aponta *)
fun build_graph_out n = Array.tabulate (n, fn i => f (i, n))

(* Cada pos do array tem a lista de vértice que apontam para aquele vértice *)
fun build_graph_in n = 
    let
        val res = Array.tabulate (n, fn _ => [])
        val out = build_graph_out n
        fun update_res x =
            let
                val image = Array.sub (out, x)
                val new_adj = x :: Array.sub (res, image)
            in
                Array.update (res, image, new_adj)
            end
    in
        List.app update_res (List.tabulate (n, fn x => x));
        res
    end


fun get_max_matching n =
    let
        val graph_out = build_graph_out n
        val graph_in = build_graph_in n

        (* Quantidade de pares ao remover folhas, percorrendo o grafo com uma dfs *)
        (* Tem efeito colateral nos array usados. Ao final, vis contém true nos vértices que foram visitados a partir das folhas *)
        (* Ou seja, ao final sabemos quais vertices participam de algum ciclo *)
        fun remove_leaves [] vis cnt = cnt
          | remove_leaves (v :: rest) vis cnt =
                if Array.sub (vis, v) then (remove_leaves rest vis cnt) (* Já visitado *)
                else
                    let
                        val _ = Array.update (vis, v, true) (* vis[v] = true *)
                        val u = Array.sub (graph_out, v)    (* u = g[v]      *)
                    in
                        if Array.sub (vis, u) then (remove_leaves rest vis cnt)
                        else
                            let
                                val _ = Array.update (vis, u, true) 
                                val w = Array.sub (graph_out, u) (* w = g[g[v]] *)
                                val cnt' = cnt + 1 (* Arco (u, v) *)

                                (* Retirando u da lista de adjacencia de w *)
                                val new_adj = List.filter (fn x => x <> u) (Array.sub (graph_in, w))
                                val _ = Array.update (graph_in, w, new_adj) 

                                (* Adiciona w na lista de computacao caso ele nao tenha sido visitado e seja uma folha apos a remoção dos vértices u, v*)
                                val next = if new_adj = nil andalso not (Array.sub (vis, w))  
                                    then w :: rest 
                                    else rest
                            in
                                remove_leaves next vis cnt'
                            end
                    end

        (* Contando vértices de um ciclo *)
        fun cnt_cycle u vis =
            let
                fun visit u acc =
                    if Array.sub (vis, u) then acc
                    else
                        let
                            val _ = Array.update (vis, u, true)
                            val next = Array.sub (graph_out, u)
                        in
                            visit next (acc + 1)
                        end
            in
                visit u 0
            end

        (* Conta arcos que estão no emparelhamento máximo que estão nos ciclos finais *)
        fun cnt_all_pairs_cycles vis =
            let
                fun loop i cnt =
                    if i = n then cnt
                    else if Array.sub (vis, i) then loop (i + 1) cnt
                    else
                        let
                            val cycle_len = cnt_cycle i vis
                            val cnt' = cnt + (cycle_len div 2)
                        in
                            loop (i + 1) cnt'
                        end
            in
                loop 0 0
            end

        val to_compute = List.filter (fn i => List.null (Array.sub (graph_in, i))) (List.tabulate (n, fn x => x))
        val vis = Array.tabulate (n, fn _ => false)
        val cnt = remove_leaves to_compute vis 0
    in
        (cnt_all_pairs_cycles vis) + cnt
    end

fun compute_sum begin endrange to_print =
    let 
        fun loop i acc = 
            if i > endrange then acc
            else 
                let
                    val val_i = get_max_matching i
                    
                in
                    if to_print then 
                        (print (Int.toString i ^ " " ^ Int.toString val_i ^ "\n"); 
                         loop (i + 1) (acc + val_i))
                    else loop (i + 1) (acc + val_i)
                end
    in
        loop begin 0
    end;

fun main () =
    let
        val begin    = 100001
        val endrange = 100100 
        val res = compute_sum begin endrange true
    in
        print ("Soma: " ^ Int.toString res ^ "\n")
    end;

fun get_just_sol () =
    let 
        val begin    = 100001
        val endrange = 100100
    in
        compute_sum begin endrange false
    end;

(* val sol = get_just_sol () *)
val execute = main()