//kinda spaghetti code but this way it's fully modular
//this is so synths and IPC's can only have their limbs repaired by welder if they're under X dmg
/obj/item/weldingtool/attack(mob/living/carbon/human/H, mob/user)
	if(!istype(H))
		return ..()

	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(affecting && affecting.status == BODYPART_ROBOTIC && user.a_intent != INTENT_HARM && affecting.synthetic && affecting.brute_dam > 20)
		to_chat(user, "<span class='warning'>[H]'s [affecting.name] is too damaged!</span>")
		return
	else
		return ..()