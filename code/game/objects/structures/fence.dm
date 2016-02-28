/obj/structure/fence/fencecentral
	name = "Fence"
	desc = "A fence" //todo - get desc from fallout
	icon = 'icons/obj/fence.dmi'
	icon_state = "central"
	density = 1
	anchored = 1

/obj/structure/fence/fencecentral/New()
	layer = 4.1

/obj/structure/fence/fencecentral/CanPass(atom/movable/mover, turf/target, height=0)
	if (!density)
		return 1
	if (dir!=SOUTH)
		return 0
	if(istype(mover) && mover.checkpass(PASSGRILLE))
		return 1
	if(get_dir(loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencecentral/CheckExit(atom/movable/O as mob|obj, target)
	if (!density)
		return 1
	if (dir!=SOUTH)
		return 0
	if(istype(O) && O.checkpass(PASSGRILLE))
		return 1
	if(get_dir(O.loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencecentral/CanAStarPass(ID, to_dir)
	if(!density)
		return 1
	if (dir!=SOUTH)
		return 0
	if(to_dir == SOUTH)
		return 0

	return 1


/obj/structure/fence/fencecentral/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/wirecutters))
		if(do_after(user,20, target = src))
			user.visible_message("<span class='notice'>[user] cuts a hole in the fence.</span>", \
								 "<span class='notice'>You cut a hole in the fence.</span>")
			density = 0
			icon_state = "cut"


/obj/structure/fence/fencecorner
	name = "Fence"
	desc = "A fence"
	icon = 'icons/obj/fence.dmi'
	icon_state = "corner"
	density = 1
	anchored = 1

/obj/structure/fence/fencecorner/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/wirecutters))
		user << "<span class='warning'><br>It's not the best place to cut the fence.</br> Lets find some better options.</span>"

/obj/structure/fence/fenceintersectmiddle
	name = "Fence"
	desc = "A fence"
	icon = 'icons/obj/fence.dmi'
	icon_state = "intersect_middle"
	density = 1
	anchored = 1

/obj/structure/fence/fenceintersectmiddle/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/wirecutters))
		user << "<span class='warning'><br>It's not the best place to cut the fence.</br> Lets find some better options.</span>"

/obj/structure/fence/fenceintersectbottom
	name = "Fence"
	desc = "A fence"
	icon = 'icons/obj/fence.dmi'
	icon_state = "intersect_bottom"
	density = 1
	anchored = 1

/obj/structure/fence/fenceintersectbottom/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/wirecutters))
		user << "<span class='warning'><br>It's not the best place to cut the fence.</br> Lets find some better options.</span>"

/obj/structure/fence/fencecornerintersect
	name = "Fence"
	desc = "A fence"
	icon = 'icons/obj/fence.dmi'
	icon_state = "intersect_cornercorner"
	density = 1
	anchored = 1

/obj/structure/fence/fencecornerintersect/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/wirecutters))
		user << "<span class='warning'><br>It's not the best place to cut the fence.</br> Lets find some better options.</span>"

/obj/structure/fence/fencedoor
	name = "Fence door"
	desc = "A fence door"
	icon = 'icons/obj/fence.dmi'
	icon_state = "door_front_closed"
	density = 1
	anchored = 1

/obj/structure/fence/fencedoor/New()
	layer = 4.1

/obj/structure/fence/fencedoor/attackby(obj/item/weapon/I, mob/living/user, params)
	if (density)
		icon_state = "door_front_open"
	else
		icon_state = "door_front_closed"
	density = !density

/obj/structure/fence/fencedoor/attack_hand(mob/user)
	if (density)
		icon_state = "door_front_open"
	else
		icon_state = "door_front_closed"
	density = !density

/obj/structure/fence/fencedoor/attack_tk(mob/user)
	if (density)
		icon_state = "door_front_open"
	else
		icon_state = "door_front_closed"
	density = !density

/obj/structure/fence/fencedoor/CanPass(atom/movable/mover, turf/target, height=0)
	if (!density)
		return 1
	if(istype(mover) && mover.checkpass(PASSGRILLE))
		return 1
	if(get_dir(loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencedoor/CheckExit(atom/movable/O as mob|obj, target)
	if (!density)
		return 1
	if(istype(O) && O.checkpass(PASSGRILLE))
		return 1
	if(get_dir(O.loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencedoor/CanAStarPass(ID, to_dir)
	if(!density)
		return 1
	if(to_dir == SOUTH)
		return 0

	return 1

/obj/structure/fence/fencedoorside
	name = "Fence door"
	desc = "A fence door"
	icon = 'icons/obj/fence.dmi'
	icon_state = "door_side_closed"
	density = 1
	anchored = 1

/obj/structure/fence/fencedoorside/attackby(obj/item/weapon/I, mob/living/user, params)
	if (density)
		icon_state = "door_side_open"
	else
		icon_state = "door_side_closed"
	density = !density

/obj/structure/fence/fencedoorside/attack_hand(mob/user)
	if (density)
		icon_state = "door_side_open"
	else
		icon_state = "door_side_closed"
	density = !density

/obj/structure/fence/fencedoorside/attack_tk(mob/user)
	if (density)
		icon_state = "door_side_open"
	else
		icon_state = "door_side_closed"
	density = !density

/obj/structure/fence/fencedoorside/CanPass(atom/movable/mover, turf/target, height=0)
	return !density

/obj/structure/fence/fencedoorside/CheckExit(atom/movable/O as mob|obj, target)
	return !density

/obj/structure/fence/fencedoorside/CanAStarPass(ID, to_dir)
	return !density