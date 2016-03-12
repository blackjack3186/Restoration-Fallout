/obj/effect/decal/point
	name = "arrow"
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "arrow"
	layer = 16
	mouse_opacity = 0

/obj/effect/decal/monorail
 name = "wall"
 desc = "All in all you're just another brick in The Wall."
 icon = 'icons/misc/monorail.dmi'
 icon_state = "2"
 layer = 5
 anchored = 1

// Used for spray that you spray at walls, tables, hydrovats etc
/obj/effect/decal/spraystill
	density = 0
	layer = 50

//Used by spraybottles.
/obj/effect/decal/chempuff
	name = "chemicals"
	icon = 'icons/obj/chempuff.dmi'
	pass_flags = PASSTABLE | PASSGRILLE
	layer = 5