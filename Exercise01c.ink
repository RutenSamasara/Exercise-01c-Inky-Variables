/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR coins_count = 0
VAR treasure_found = 0


-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. 
*[Charlie]
  ~ pet_name = "Charlie"
  -> cave_mouth
*[Susan]
 ~pet_name ="Susan" 
  ->cave_mouth
 *[Spot]
  ~pet_name ="Spot"
  ->cave_mouth
 
   == cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches} torches


+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the conis in room. 
*[take the coins] -> conis_pickup
+[Go Back] -> cave_mouth

== conis_pickup ==
~coins_count = coins_count + 1
You pick up some coins
+[Go Back] -> cave_mouth

== west_tunnel ==
You are in the west
{pet_name == "Spot" : Scout would love it here in the west}
+ [Left Path] -> treasure_room
+ [Right Path] -> Forest
+ [Go Back] -> cave_mouth
-> END
== treasure_room ==
A big golden box 
* {torches > 0} [Open the box] -> box_open

== box_open ==
~ treasure_found = treasure_found + 25
treasure found: {treasure_found}
+[Go Back]-> cave_mouth

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== Forest ==
You found a torest and east the apple from a big tree
~health = health +1
Health: {health}
[Go Back] -> west_tunnel
-> END
