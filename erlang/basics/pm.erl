-module(pm).

-export([greet/2, same/2, oh_god/1, help_me/1, insert/2, beach/1, beachV2/1]).

greet(male, Name) ->
  io:format("Hello, Mr. ~s!~n", [Name]);
greet(female, Name) -> 
  io:format("Hello, ms. ~s!~n", [Name]);
greet(_, Name) ->
  io:format("Hi, ~s!~n", [Name]).

same(X,X) -> true;
same(_,_) -> false.

oh_god(N) ->
  if N =:= 2 -> might_succeed;
    true -> always_does
  end.

help_me(Animal) -> 
  Talk = if Animal == cow -> "moo";
            Animal == cat -> "meow";
            Animal == dog -> "bark";
            true -> "jlkjlkjl"
          end,
  {Animal, "says " ++ Talk ++ "!"}.

insert(X, []) -> 
  [X];
insert(X, Set) ->
  case lists:member(X, Set) of
    true -> Set;
    false -> [X | Set]
  end.

beach(Temperature) -> 
  case Temperature of 
    {celsius, N} when N >= 20, N =< 45 -> 
      'favorable';
    {kelvin, N} when N >= 293, N =< 318 -> 
      'scientifically favorable';
    {fahrenheit, N} when N >= 68, N =< 113 -> 
      'favorable in the US';
    _ -> 
      'avoid beach'
  end.

beachV2({celsius, N}) when N >= 20, N =< 45 -> 'favorable';
beachV2({kelvin, N}) when N >= 293, N =< 318 -> 'scientifically favorable';
beachV2({fahrenheit, N}) when N >= 68, N =< 113 -> 'favorable in the US';
beachV2(_) -> 'avoid beach'.

