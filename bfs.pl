connected(X,Y,P) :- capitais(X,Y,P).

connected(X,Y,P) :- capitais(Y,X,P).

next_node(Current, Next, Visited, Weight) :- connected(Current, Next, Weight),
	                                    \+member(Next, Visited).


breadth_first_search(Source,Meta,Path,Distance) :- bfs_search(Meta,[n(Source,[],0)],[],Path,Distance).

bfs_search(Meta, [n(Meta, Path, D)|_] ,_, PathReversed, D) 
    :- reverse(PathReversed, Path).

bfs_search(Meta, [n(Source,CI,Total)|RCI], Visited, Path, Distance)
    :- findall(n(I1,[[Source,I1]|CI],A),
	  (connected(Source, I1, Di) , \+member(I1,Visited), A is Di+Total),Cs),
	  append(RCI, Cs, NewPath), 
	  bfs_search(Meta, NewPath, [Source|Visited], Path, Distance).
