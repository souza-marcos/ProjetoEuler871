datatype 'a graph = Graph of ('a * 'a) list;

fun neighbors (Graph edges) node = 
    List.map #2 (List.filter (fn (src, _) => src = node) edges);

fun dfs vis v (Graph edges) = 
    if List.exists (fn x => x = v) vis 
        then vis
    else
        let
            val newvis = v :: vis
            val nexts = neighbors (Graph edges) v 
        in
            List.foldl 
                (fn (u, acc) => dfs acc u (Graph edges))
                newvis nexts
        end;

val g = Graph [
    (0, 1),
    (0, 2),
    (1, 2),
    (1, 3),
    (5, 6),
    (4, 6)
    ];
val vis_nodes = dfs [] 0 g;
print (foldr (fn (x, acc) => Int.toString(x) ^ " " ^ acc) "" vis_nodes ^ "\n");



fun create_graph n = 
    let 
        fun 