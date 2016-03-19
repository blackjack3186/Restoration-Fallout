/obj/effects/bonus
	name = "pickup"
	desc = "pick me up"
	icon = 'icons/effects/effects.dmi'
	icon_state = "electricity2"
	density = 0
	var/triggered
	var/duration = 0

/obj/effects/bonus/New()
	..()
	animate(src, pixel_y = 4, time = 20, loop = -1)

/obj/effects/bonus/proc/trigger(mob/victim)
	if(triggered)
		return
	triggered = 1
	invisibility = 101
	effect(victim)
	qdel(src)

/obj/effects/bonus/Crossed(AM as mob|obj)
	if(isanimal(AM))
		var/mob/living/simple_animal/SA = AM
		if(!SA.flying)
			trigger(SA)
	else
		trigger(AM)


/obj/effects/bonus/proc/effect(mob/living/carbon/victim)

/obj/effects/bonus/bloodbath
	name = "Red Orb"
	desc = "You feel angry just looking at it."
	duration = 1200 //2min
	color = "red"

/obj/effects/bonus/bloodbath/effect(mob/living/carbon/victim)
	if(!victim.client || !istype(victim))
		return
	victim << "<span class='reallybig redtext'>KILL EM ALL</span>"
	var/old_color = victim.client.color
	var/red_splash = list(1,0,0,0.8,0.2,0, 0.8,0,0.2,0.1,0,0)
	var/pure_red = list(0,0,0,0,0,0,0,0,0,1,0,0)

	spawn(0)
		new /obj/effect/hallucination/delusion(victim.loc,victim,force_kind="demon",duration=duration,skip_nearby=0)

	var/obj/item/weapon/twohanded/required/chainsaw/chainsaw = new(victim.loc)
	chainsaw.flags |= NODROP
	victim.drop_r_hand()
	victim.drop_l_hand()
	victim.put_in_hands(chainsaw)

	victim.reagents.add_reagent("adminordrazine",25)

	victim.client.color = pure_red
	animate(victim.client,color = red_splash, time = 10, easing = SINE_EASING|EASE_OUT)
	sleep(10)
	animate(victim.client,color = old_color, time = duration)//, easing = SINE_EASING|EASE_OUT)
	sleep(duration)
	victim << "<span class='notice'>You feel calm again.<span>"
	qdel(chainsaw)
	qdel(src)

/obj/effects/bonus/healing
	name = "Blue Orb"
	desc = "You feel better just looking at it."
	color = "blue"

/obj/effects/bonus/healing/effect(mob/living/carbon/victim)
	if(!victim.client || !istype(victim))
		return
	victim << "<span class='notice'>You feel great!</span>"
	victim.revive(full_heal = 1, admin_revive = 1)

/obj/effects/bonus/speed
	name = "Yellow Orb"
	desc = "You feel faster just looking at it."
	color = "yellow"
	duration = 300

/obj/effects/bonus/speed/effect(mob/living/carbon/victim)
	if(!victim.client || !istype(victim))
		return
	victim << "<span class='notice'>You feel fast!</span>"
	victim.status_flags |= GOTTAGOREALLYFAST
	sleep(duration)
	victim.status_flags &= ~GOTTAGOREALLYFAST
	victim << "<span class='notice'>You slow down.</span>"