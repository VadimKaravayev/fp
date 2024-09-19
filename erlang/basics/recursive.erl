-module(recursive).

-export([
  fac/1, 
  len/1, 
  tail_fac/1, 
  tail_len/1,
  duplicate/2,
  tail_duplicate/2,
  tail_reverse/1,
  tail_sublist/2
]).

fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N - 1).

% a base case
% a function that calls itself
% a value to try the function on 

len([]) -> 0;
len([_|T]) -> 1 + len(T).

% Tail recursion eliminates stacking of operations

tail_fac(N) -> tail_fac(N, 1).
tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N - 1, N * Acc).

% Different arity means different function

tail_len(List) -> tail_len(List, 0).
tail_len([], Acc) -> Acc;
tail_len([_|Tail], Acc) -> tail_len(Tail, Acc + 1).

duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 -> [Term | duplicate(N - 1, Term)].

tail_duplicate(N, Term) -> 
  tail_duplicate(N, Term, []).
tail_duplicate(0, _, List) -> 
  List;
tail_duplicate(N, Term, List) when N > 0 -> 
  tail_duplicate(N - 1, Term, [Term | List]).

tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).

tail_sublist(L, N) -> tail_sublist(L, N, []).
tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 -> 
  tail_sublist(T, N - 1, [H | SubList]).
