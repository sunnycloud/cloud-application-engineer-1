function Graph() {
    this.g = {};
}

Graph.prototype.add_edge = function(from, to) {
    if (!this.g[from]) { this.g[from] = []; }
      if (!this.g[to])   { this.g[to] = []; }
    
    if (this.g[from].indexOf(to) == -1) {
        this.g[from].push(to);
    }
};

Graph.prototype.bfs = function(from, maxdepth) {
    return this._bfs_impl([from], 1, maxdepth, {}, [{ node : from, depth : 0}]);
};

Graph.prototype._bfs_impl = function(from, depth, maxdepth, visited, accum) {
    console.log("from: " + from + ", maxdepth: " + maxdepth);

    if (maxdepth == 0 || from.length < 1) { return accum; }
    
    var current = from.pop();
    var neighbors = this.g[current];

    for (var i = 0; i < neighbors.length; i++) {
        var next = neighbors[i];
        accum.push({ node : next, depth : depth });
        
        console.log("see: " + next);

        if (!visited[next]) {
            from.push(next);
        }
    }
    visited[current] = 1;
    
    return this._bfs_impl(from, depth + 1, maxdepth - 1, visited, accum);
};


var g = new Graph();

g.add_edge(1, 2);
g.add_edge(2, 3);
g.add_edge(2, 5);
g.add_edge(3, 4);
g.add_edge(3, 6);
g.add_edge(4, 7);
g.add_edge(7, 1);

console.log(g.bfs(1, 4));

