# 버전 1.16.x에서 돌아갑니다.(파티클, 몇몇 엔티티 수정시 1.13.x까지는 구동 가능)
# 사용전 README.md를 읽고 오세요

# R(Repeatable)은 반복형 커맨드블럭, C(Chaining)은 연쇄형 커맨드블럭을 의미합니다
# c(Condition)는 조건형, !c(Not Condition)는 무조건형을 의미합니다.

# 포탈건 지급

# R !C
replaceitem entity @a[tag=PORTALGUN_TOGGLE] hotbar.0 minecraft:crossbow{Tags:["PORTALGUN"], display:{Name:'[{"text":"★ ","bold":true,"color":"yellow"},{"text":"P","color":"#ffcc33"},{"text":"o","color":"#3366ff"},{"text":"r","color":"#ffcc33"},{"text":"t","color":"#3366ff"},{"text":"a","color":"#ffcc33"},{"text":"l ","color":"#3366ff"},{"text":"Gun ","color":"black"},{"text":"★"}]'}, Charged:1b,ChargedProjectiles:[{id:"minecraft:spectral_arrow",Count:1b}], HideFlags:96} 1


# 포탈 삭제템 지급

# R !c
replaceitem entity @a[tag=PORTALGUN_TOGGLE] hotbar.2 minecraft:barrier{Tags:["PORTALGUN_CLEAR_ITEM"], display:{Name:'[{"text": "DELETE ALL PORTALS", "bold":true, "color":"red"}]'}, HideFlags:96} 1
# C c
execute as @a[nbt={Inventory:[{id:"minecraft:barrier",Count:1b,Slot:-106b, tag:{Tags:["PORTALGUN_CLEAR_ITEM"]}}]}] run tag @s add PORTALGUN_DELETE_ALL
# C c
replaceitem entity @a[tag=PORTALGUN_DELETE_ALL] weapon.offhand air
# C c
kill @e[type=minecraft:armor_stand, tag=PG_BULLET]
# C c
tag @a[tag=PORTALGUN_DELETE_ALL] remove PORTALGUN_DELETE_ALL


# 포탈 1, 2 전환

# R !c
replaceitem entity @a[tag=PORTALGUN_MODE1] hotbar.1 minecraft:orange_stained_glass_pane{Tags:["MODE1"],display:{Name:'[{"text":"PORTAL 1 MODE","bold": true,"color": "#ffcc33"}]'}}
# C c
execute as @a[nbt={Inventory:[{id:"minecraft:crossbow",Count:1b,Slot:-106b, tag:{Tags:["PORTALGUN"]}}]}] run tag @s add PORTALGUN_SET_TO_M2
# C c
tag @a[tag=PORTALGUN_SET_TO_M2] add PORTALGUN_MODE2
# C c
tag @a[tag=PORTALGUN_SET_TO_M2] remove PORTALGUN_MODE1
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_M2] weapon.offhand air
# C c
tag @a[tag=PORTALGUN_SET_TO_M2] remove PORTALGUN_SET_TO_M2

# R !c
replaceitem entity @a[tag=PORTALGUN_MODE2] hotbar.1 minecraft:blue_stained_glass_pane{Tags:["MODE2"],display:{Name:'[{"text":"PORTAL 2 MODE","bold": true,"color": "#3366ff"}]'}}
# C c
execute as @a[nbt={Inventory:[{id:"minecraft:crossbow",Count:1b,Slot:-106b, tag:{Tags:["PORTALGUN"]}}]}] run tag @s add PORTALGUN_SET_TO_M1
# C c
tag @a[tag=PORTALGUN_SET_TO_M1] remove PORTALGUN_MODE2
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_M1] weapon.offhand air
# C c
tag @a[tag=PORTALGUN_SET_TO_M1] remove PORTALGUN_SET_TO_M1


# 포탈건 ON, OFF 전환

# R !c
replaceitem entity @a[tag=!PORTALGUN_TOGGLE] hotbar.8 minecraft:red_stained_glass_pane{Tags:["PORTALGUN_TOGGLER"],display:{Name:'[{"text": "Portal Gun: ", "bold":true, "color":"black"}, {"text": "OFF", "bold":true, "color":"red"}]'}, HideFlag:96}
# C c
execute as @a[nbt={Inventory:[{id:"minecraft:red_stained_glass_pane",Count:1b,Slot:-106b, tag:{Tags:["PORTALGUN_TOGGLER"]}}]}] run tag @s add PORTALGUN_SET_TO_ON
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_ON] hotbar.8 minecraft:lime_stained_glass_pane{Tags:["PORTALGUN_DETOGGLER"],display:{Name:'[{"text": "Portal Gun: ", "bold":true, "color":"black"}, {"text": "ON", "bold":true, "color":"#4aff33"}]'}, HideFlag:96}
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_ON] weapon.offhand air
# C c
tag @a[tag=PORTALGUN_SET_TO_ON] add PORTALGUN_TOGGLE
# C c
tag @a[tag=PORTALGUN_SET_TO_ON] remove PORTALGUN_SET_TO_ON

# R !c
replaceitem entity @a[tag=PORTALGUN_TOGGLE] hotbar.8 minecraft:lime_stained_glass_pane{Tags:["PORTALGUN_DETOGGLER"],display:{Name:'[{"text": "Portal Gun: ", "bold":true, "color":"black"}, {"text": "ON", "bold":true, "color":"#4aff33"}]'}, HideFlag:96}
# C c
execute as @a[tag=PORTALGUN_TOGGLE, tag=!PORTALGUN_MODE1, tag=!PORTALGUN_MODE2] run tag @s add PORTALGUN_MODE1
# C c
execute as @a[nbt={Inventory:[{id:"minecraft:lime_stained_glass_pane",Count:1b,Slot:-106b, tag:{Tags:["PORTALGUN_DETOGGLER"]}}]}] run tag @s add PORTALGUN_SET_TO_OFF
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_OFF] hotbar.8 minecraft:red_stained_glass_pane{Tags:["PORTALGUN_TOGGLER"],display:{Name:'[{"text": "Portal Gun: ", "bold":true, "color":"black"}, {"text": "OFF", "bold":true, "color":"red"}]'}, HideFlag:96}
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_OFF] weapon.offhand air
# C c
tag @a[tag=PORTALGUN_SET_TO_OFF] remove PORTALGUN_TOGGLE
# C c
tag @a[tag=PORTALGUN_SET_TO_OFF] remove PORTALGUN_MODE1
# C !c
tag @a[tag=PORTALGUN_SET_TO_OFF] remove PORTALGUN_MODE2
# C !c
replaceitem entity @a[tag=PORTALGUN_SET_TO_OFF] hotbar.0 air
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_OFF] hotbar.1 air
# C c
replaceitem entity @a[tag=PORTALGUN_SET_TO_OFF] hotbar.2 air
# C c
tag @a[tag=PORTALGUN_SET_TO_OFF] remove PORTALGUN_SET_TO_OFF


# 분광화살에 태그 붙이기

# R !c
execute at @a[tag=PORTALGUN_TOGGLE, tag=PORTALGUN_MODE1] run data merge entity @e[type=minecraft:spectral_arrow, sort=nearest, limit=1, nbt={inGround:0b}] {Tags:["BULLET1"]}

# R !c
execute at @a[tag=PORTALGUN_TOGGLE, tag=PORTALGUN_MODE2] run data merge entity @e[type=minecraft:spectral_arrow, sort=nearest, limit=1, nbt={inGround:0b}] {Tags:["BULLET2"]}


# 분광화살 꽂힌 지점에 포탈(갑옷거치대) 생성 + 이전꺼 삭제

# R !c
execute at @e[type=minecraft:spectral_arrow, tag=BULLET1, nbt={inGround:0b}, limit=1] run kill @e[type=minecraft:armor_stand, limit=1, sort=furthest, tag=BULLET1_SPOT]
# C !c
execute at @e[type=minecraft:spectral_arrow, tag=BULLET1, nbt={inGround:1b}, limit=1] run summon minecraft:armor_stand ~ ~0.3 ~ {ArmorItems:[{},{},{},{id:"minecraft:gold_block",Count:1}],CustomNameVisible:1b, CustomName: '[{"text": "-->> PORTAL <<--","bold": true,"color": "#ffcc33"}]', Invisible:1b, NoGravity:1b, Tags:["PG_BULLET","BULLET1_SPOT"]}
# C c
execute as @e[type=minecraft:spectral_arrow, tag=BULLET1, nbt={inGround:1b}, limit=1, sort=nearest] run kill @s

# R !c
execute at @e[type=minecraft:spectral_arrow, tag=BULLET2, nbt={inGround:0b}, limit=1] run kill @e[type=minecraft:armor_stand, limit=1, sort=furthest, tag=BULLET2_SPOT]
# C !c
execute at @e[type=minecraft:spectral_arrow, tag=BULLET2, nbt={inGround:1b}, limit=1] run summon minecraft:armor_stand ~ ~0.3 ~ {ArmorItems:[{},{},{},{id:"minecraft:lapis_block",Count:1}],CustomNameVisible:1b, CustomName: '[{"text": "-->> PORTAL <<--","bold": true,"color": "#3366ff"}]', Invisible:1b, NoGravity:1b, Tags:["PG_BULLET","BULLET2_SPOT"]}
# C c
execute as @e[type=minecraft:spectral_arrow, tag=BULLET2, nbt={inGround:1b}, limit=1, sort=nearest] run kill @s


# 포탈에 있는 엔티티 텔레포트

# R !c
execute at @e[type=minecraft:armor_stand, tag=BULLET1_SPOT, limit=1] run tag @e[type=!minecraft:armor_stand, limit=1, distance=..0.8, sort=nearest] add TRAVELER1
# C c
execute at @e[type=minecraft:armor_stand, tag=BULLET2_SPOT, limit=1, sort=furthest] run tp @e[tag=TRAVELER1, limit=1, sort=furthest] ~ ~2 ~
# C c
tag @a[tag=TRAVELER1] remove TRAVELER1

# R !c
execute at @e[type=minecraft:armor_stand, tag=BULLET2_SPOT, limit=1] run tag @e[type=!minecraft:armor_stand, limit=1, distance=..0.8, sort=nearest] add TRAVELER2 
# C c
execute at @e[type=minecraft:armor_stand, tag=BULLET1_SPOT, limit=1, sort=furthest] run tp @e[tag=TRAVELER2, limit=1, sort=furthest] ~ ~2 ~
# C c
tag @a[tag=TRAVELER2] remove TRAVELER2


# 포탈에 이펙트 적용

# R !c
execute at @e[type=minecraft:armor_stand, tag=PG_BULLET] run particle minecraft:enchant ~ ~ ~ 0.5 1 0.5 0 3
# R !c
execute at @e[type=minecraft:armor_stand, tag=BULLET2_SPOT] run particle minecraft:nautilus ~ ~ ~ 1 1.5 1 0 3
# R !c
execute at @e[type=minecraft:armor_stand, tag=BULLET1_SPOT] run particle minecraft:lava ~ ~ ~ 0.5 1 0.5 0 1
