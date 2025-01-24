from functools import reduce

# Tentando fazer um guloso que pega as folhas e iterativamente remove aqueles arcos
def get_max_matching(n : int) -> int:
    graph = [set() for i in range(n)]
    for i in range(n):
        image = (i**3 + i + 1)% n
        if image != i: # Removendo self loops
            graph[i].add(image)
            graph[image].add(i)  
    
    # Removendo gulosamente as folhas
    to_compute = [i for i in range(n) if len(graph[i]) == 1]
    vis = [False] * n
    
    if len(to_compute) == 0: print("No leafs")
    
    # print(to_compute)
    
    cnt = 0
    while len(to_compute) > 0:
        v = to_compute.pop()
        if vis[v] == True or len(graph[v]) == 0: 
            vis[v] = True
            continue
        
        vis[v] = True
        u = graph[v].pop()
        graph[u].remove(v)
        
        if vis[u] == True: 
            continue
        
        cnt += 1
        # print("Edge: ", v, u) # Edges in the matching
        vis[u] = True
        
        for w in graph[u]:
            graph[w].remove(u)
            if len(graph[w]) == 1 and vis[w] == False:
                to_compute.append(w)
        
    
    # Agora remover os ciclos
    for i in range(n):
        if vis[i] == False:
            # print("Cycle: ", i)
            cnt_cycle = 1
            u = i
            while vis[u] == False:
                vis[u] = True
                v = graph[u].pop()
                graph[v].remove(u)
                vis[v] = True
                cycle.add(v)
                if v == i: break
                u = v
            # print(cycle)
            cnt += len(cycle) // 2

    
    
    # print(len(remaining) // 2, cnt)
    return len(remaining), cnt

def main():
    
    summation = 0
    for i in range(10**5 + 1, 10**5 + 101):
        rem, val = get_max_matching(i)
        print(i, rem, val)
        summation += val
    print("Soma:",summation)

if __name__ == '__main__': main()    