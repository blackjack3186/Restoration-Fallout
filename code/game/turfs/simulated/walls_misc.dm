/turf/simulated/wall/cult
	name = "wall"
	desc = "The patterns engraved on the wall seem to shift as you try to focus on them. You feel sick."
	icon = 'icons/turf/walls/cult_wall.dmi'
	icon_state = "cult"
	walltype = "cult"
	builtin_sheet = null
	canSmoothWith = null

/turf/simulated/wall/cult/New()
	PoolOrNew(/obj/effect/overlay/temp/cult/turf, src)
	..()

/turf/simulated/wall/cult/break_wall()
	new /obj/effect/decal/cleanable/blood(src)
	return (new /obj/structure/cultgirder(src))

/turf/simulated/wall/cult/devastate_wall()
	new /obj/effect/decal/cleanable/blood(src)
	new /obj/effect/decal/remains/human(src)

/turf/simulated/wall/cult/narsie_act()
	return

/turf/simulated/wall/vault
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"

/turf/simulated/wall/ice
	icon = 'icons/turf/walls/icedmetal_wall.dmi'
	icon_state = "iced"
	desc = "A wall covered in a thick sheet of ice."
	walltype = "iced"
	canSmoothWith = null
	hardness = 35
	slicing_duration = 150 //welding through the ice+metal

/turf/simulated/wall/rust
	name = "rusted wall"
	desc = "A rusted metal wall."
	icon = 'icons/turf/walls/rusty_wall.dmi'
	icon_state = "arust"
	walltype = "arust"
	hardness = 45

/turf/simulated/wall/r_wall/rust
	name = "rusted reinforced wall"
	desc = "A huge chunk of rusted reinforced metal."
	icon = 'icons/turf/walls/rusty_reinforced_wall.dmi'
	icon_state = "rrust"
	walltype = "rrust"
	hardness = 15

/turf/simulated/wall/shuttle
	name = "wall"
	icon = 'icons/turf/shuttle.dmi'
	icon_state = "wall"
	walltype = "shuttle"
	smooth = SMOOTH_FALSE

/turf/simulated/wall/shuttle/smooth
	name = "wall"
	icon = 'icons/turf/walls/shuttle_wall.dmi'
	icon_state = "shuttle"
	walltype = "shuttle"
	smooth = SMOOTH_MORE|SMOOTH_DIAGONAL
	canSmoothWith = list(/turf/simulated/wall/shuttle/smooth, /obj/structure/window/shuttle, /obj/structure/shuttle/engine)

/turf/simulated/wall/shuttle/smooth/nodiagonal
	smooth = SMOOTH_MORE
	icon_state = "shuttle_nd"

/turf/simulated/wall/shuttle/smooth/overplating
	icon_state = "overplating"
	fixed_underlay = list("icon"='icons/turf/floors.dmi', "icon_state"="plating")

/turf/simulated/wall/shuttle/smooth/overblue
	icon_state = "overblue"
	fixed_underlay = list("icon"='icons/turf/floors.dmi', "icon_state"="shuttlefloor")

/turf/simulated/wall/shuttle/smooth/overwhite
	icon_state = "overwhite"
	fixed_underlay = list("icon"='icons/turf/floors.dmi', "icon_state"="shuttlefloor3")

/turf/simulated/wall/shuttle/smooth/overred
	icon_state = "overred"
	fixed_underlay = list("icon"='icons/turf/floors.dmi', "icon_state"="shuttlefloor4")

/turf/simulated/wall/shuttle/smooth/overpurple
	icon_state = "overpurple"
	fixed_underlay = list("icon"='icons/turf/floors.dmi', "icon_state"="shuttlefloor5")

/turf/simulated/wall/shuttle/smooth/overyellow
	icon_state = "overyellow"
	fixed_underlay = list("icon"='icons/turf/floors.dmi', "icon_state"="shuttlefloor2")

/turf/simulated/wall/smooth
	name = "smooth wall"
	icon = 'icons/turf/smooth_wall.dmi'
	icon_state = "smooth"
	walltype = "shuttle"
	smooth = SMOOTH_TRUE|SMOOTH_DIAGONAL
	canSmoothWith = null

//sub-type to be used for interior shuttle walls
//won't get an underlay of the destination turf on shuttle move
/turf/simulated/wall/shuttle/interior/copyTurf(turf/T)
	if(T.type != type)
		T.ChangeTurf(type)
		if(underlays.len)
			T.underlays = underlays
	if(T.icon_state != icon_state)
		T.icon_state = icon_state
	if(T.icon != icon)
		T.icon = icon
	if(T.color != color)
		T.color = color
	if(T.dir != dir)
		T.dir = dir
	T.transform = transform
	return T

/turf/simulated/wall/shuttle/copyTurf(turf/T)
	. = ..()
	T.transform = transform


//why don't shuttle walls habe smoothwall? now i gotta do rotation the dirty way
/turf/simulated/wall/shuttle/shuttleRotate(rotation)
	var/matrix/M = transform
	M.Turn(rotation)
	transform = M

/turf/simulated/wall/invisible
	icon = 'icons/misc/invisible.dmi'