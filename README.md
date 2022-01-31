![github-cover](https://user-images.githubusercontent.com/2206700/136808110-7caa2d2c-44c0-4d8e-a272-fd01b990c6ba.png)

## TO-DO (Sorted by priority):
- Add interactable environment objects
- Fix limited bullets
- Single player mode (if possible add AI to Second player)
- enable/disable fast run optimize
- Add behaviors to enemies 

## FIXED:
- Velocity used to apply direction FIXED [ Range weapons now apply knockback to player ]

## ENVIRONMENT OBJECTS (All are considered as Area2Ds, except Wall):
- Wall (Stops entities and bullets)
- Accelerator (Increases velocity, bullet speed; decreases shot delay)
- Decelerator (Decreases velocity, bullet speed; increases shot delay)
- Safe Zone (Decreases attack damage, all hurt damage is ignored; player does not collect score points from killed enemies)
- Rage Area (Increase attack damage, bullet amount; decrease shot delay, hurt damage; player score points from killed enemies is boosted; the effect lasts for 8 secounds, requires recharge for 60 seconds)
- Heal Area (Increases health; attack damage is ignored; player score points are dampened)
- Damage Area (Decreases health; Increases attack damage, hurt damage, player score points are boosted)
- Pusher (Pushes all entities who stand on it into a certain direction)
- Equipment booster (Decrease shot delay, spread; increase bullet speed, bullet amount)
- Equipment dampener (Increase shot delay, spread; Decrease bullet speed, bullet amount)

## GENERAL ENEMY Behaviour:
- There is a slight chance that an enemy will cause an explosion caused by a weapon:
  - Any gun
  - Axe
- Enemies caught in explosion will receive damage and have a higher chance to explode too
- Players caught in explosion will also receive damage

### Gunner Behaviour:
- If the player has a gun, increase the engage range radius, 
- The closer the player is, the lower the spread angle, increase amount, lower shot delay
- If the player is attacking (pressing attack button), lower the shot delay for 2 seconds

### Ball Behaviour:
- If the player has a gun, reduce cooldown duration
- The closer the player is, the faster the ball will roll (add acceleration/decelleration)
