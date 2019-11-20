depth_first_search(A, B, P, D) :- dfs_search(A,B,[A],P,0,D).

dfs_search(Meta, Meta, _, [Meta], D, D).

dfs_search(Source, Meta, Visited, [Source|Path], Distance, D)
    :- next_node(Source, Next, Visited, Weight),
	   ND is Distance + Weight, 			%new distance
	   reverse(Visited, R), write(R), nl, 		% display
	   dfs_search(Next, Meta, [Next|Visited], Path, ND, D), !.

dfs(A,B) :- dfs_search(A,B,[A],P,0,D),
            writeln(P),
            writeln(D),
            fail.
