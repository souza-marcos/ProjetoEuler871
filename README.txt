Aluno: Marcos Daniel Souza Netto
Matrícula: 2022069492
-> Optei pelo problema (2949602202 mod 898 + 1) => 871

Solução do Problema 871 - Drifting Subsets

Podemos modelar o problema como um grafo direcionado, onde cada vértice i aponta para o vértice f(i) = (i^3 + i + 1) mod n.
Dessa forma como queremos encontrar o maior subset D de [n-1] tal que |D união f(D)| = 2|D| e cada número aponta para exatamente um número, 
todo número presente em D deve apontar para alguém fora de D. Após fazer a modelagem para grafos, vemos que isso induz um emparelhamento máximo.

Poderíamos então utilizar o algoritmo de Blosson, que realiza emparelhamento em grafos arbitrários. 
Porém como o grafo modelado é um grafo funcional, uma estratégia gulosa de adicionar as arestas ao emparelhamento começando pelas folhas e 
iterativamente removendo estes vértices do grafo é suficiente para encontrar o emparelhamento máximo.

Um fato interessante que para testar se minha implementação gulosa estava certa, optei por implementar em c++ utilizando a lib lemon,
um programa que pega o emparelhamento nesse grafo (pela biblioteca). Porém imaginei que demoraria muito uma vez que o Blosson é O(n^3) e 
o numero de vertices iam até 10^5, mas rodou até que rápido. O programa demorou cerca de 15 segundos para rodar a instancia do problema.
Fato curioso, aparentemente a função (f(x)) não gera nenhum caso perto do pior caso para o algoritmo, pelo menos na faixa de valores da instância.

Sobre o algoritmo implementado, utilizando a estratégia gulosa:
    - Construímos o grafo a partir da função f(x) e de n
    - Iterativamente, removemos as folhas do grafo e adionamos o arco que ela incide ao emparelhamento caso a cabeça do arco não tenha sido visitada.
        - Nesse processo, podemos quebrar eventuais ciclo que agora se transformam em caminhos e podemos aplicar o guloso acima novamente.
        - Ao final do processo, restam apenas ciclos no grafo.
    - Por fim, para cada ciclo presente, adicionamos piso(n/2) arestas ao emparelhamento, sendo n o numero de vértices daquele ciclo.
    - Retorna qtd de arestas da primeita parte + qtd de arestas dos ciclos.

    Dessa forma, o algoritmo é O(n).

Sobre as implementações, python + SML
    - A implementação em python é direta do algoritmo acima.
    - A implementação em SML, infelizmente não consegui jeito mais fácil de fazer a dfs no grafo, então tive que usar Arrays e usar de efeitos colaterais.

Sobre a execução:
    - Em python, basta rodar `python3 main.py`. O programa deve imprimir o resultado para cada i (1e5 + 1 a 1e5 + 100) e ao final imprimir a soma, que é a resposta.
    - Em SML é análogo, basta rodar `sml main.sml`.

O código também está em meu github: https://github.com/souza-marcos/ProjetoEuler871