-module(kata).
-export([is_leap_year/1, bouncing_ball/3]).

is_leap_year(Year) -> 
  (Year rem 4 == 0) andalso 
  ((Year rem 100 /= 0) orelse (Year rem 400 == 0)).

-spec bouncing_ball(float(), float(), float()) -> integer.
bouncing_ball(H, Bounce, Window)  when H > 0, Bounce > 0, Bounce < 1, Window < H -> 
  bouncing_ball(H, Bounce, Window, 0);
bouncing_ball(_,_,_) ->
  -1.

bouncing_ball(H, Bounce, Window, Count) when H > Window -> 
  bouncing_ball(H * Bounce, Bounce, Window, Count + 2);

bouncing_ball(_, _, _, Count) ->
  Count - 1.




% is_leap_year(Year) ->
%   (Year rem 4 == 0) and ((Year rem 400 == 0) or (Year rem 100 /= 0)).

% is_divisible_by(X, Y) -> X rem Y == 0.

% is_leap_year(Year) -> 
%   is_divisible_by(Year, 4) and 
%   (not is_divisible_by(Year, 100) or is_divisible_by(Year, 400)).