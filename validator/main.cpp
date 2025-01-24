#include <lemon/list_graph.h>
#include <lemon/matching.h>
#include <iostream>
#include <fstream>

typedef long long ll;

using namespace lemon;
using std::vector, std::cout, std::cin, std::endl;

vector<int> genGraph(int n){
    vector<int> graph;
    for(int i = 0; i < n; i ++){
        ll val = (1LL* i * i * i + i + 1);
        graph.push_back(val % n);
    }
    return graph;
}

int getMatchingSize(vector<int> graph){
    ListGraph g;
    vector<ListGraph::Node> nodes;
    for(int i = 0; i < graph.size(); i ++) nodes.push_back(g.addNode());
    for(int i = 0; i < graph.size(); i ++) g.addEdge(nodes[i], nodes[graph[i]]);
    
    MaxMatching<ListGraph> matching(g);
    matching.run();
    return matching.matchingSize();
}

int main() {

    ll summation = 0;
    for(int i = 1e5 + 1; i <= 1e5 + 100; i ++){
        vector<int> graph = genGraph(i);
        int matchingSize = getMatchingSize(graph);
        cout << i << " " << matchingSize << endl;
        summation += matchingSize;
    }

    cout << "Soma: " << summation << endl;
    return 0;
}
