from functools import reduce

# Tentando fazer um guloso que pega as folhas e iterativamente remove aqueles arcos
def get_max_matching(n : int) -> int:
    graph_out = [-1] * n
    graph_in = [set() for i in range(n)]
    
    for i in range(n):
        image = (i**3 + i + 1)% n
        if image != i: # Removendo self loops
            graph_out[i] = image
            graph_in[image].add(i)  
    
    # Removendo gulosamente as folhas
    to_compute = [i for i in range(n) if len(graph_in[i]) == 0]
    vis = [False] * n
    
    if len(to_compute) == 0: print("No leafs")
    
    print(to_compute)
    
    cnt = 0
    while len(to_compute) > 0:
        v = to_compute.pop()
        if vis[v] == True: 
            continue
        vis[v] = True
        u = graph_out[v]
        if vis[u] == True: 
            continue
        
        cnt += 1
        # print("Edge: ", v, u) # Edges in the matching
        vis[u] = True
        w = graph_out[u]
        
        if(u in graph_in[w]):
            graph_in[w].remove(u)
        
        if len(graph_in[w]) == 0 and vis[w] == False:
            to_compute.append(w)
    
    
    # print(vis)
    
    # Agora remover os ciclos
    remaining = [i for i in range(n) if vis[i] == False]
    cnt += len(remaining) // 2
    
    # print(len(remaining) // 2, cnt)
    return cnt

def main():
    
    summation = 0
    for i in range(10**5 + 1, 10**5 + 101):
        print(i, val := get_max_matching(i))
        summation += val
    print("Soma:", summation) 

if __name__ == '__main__': main()    