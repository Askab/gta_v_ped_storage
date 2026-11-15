# Cara Ward – FiveM ped

A custom ped of Cara Ward for FiveM. It replaces the base-game model `u_f_y_hotposh_01`.

The package holds two heights, each built for both game generations. That makes four ready-to-use FiveM resources.

| Folder | Height | Game build | Stream folder |
|---|---|---|---|
| `default_height/cara_ward_gen8` | ~186 cm (190 cm incl. hair) | Gen 8 – GTA V Legacy | `stream/` |
| `default_height/cara_ward_gen9` | ~186 cm (190 cm incl. hair) | Gen 9 – GTA V Enhanced | `stream_enhanced/` |
| `173cm/cara_ward_gen8` | 173 cm (177 cm incl. hair) | Gen 8 – GTA V Legacy | `stream/` |
| `173cm/cara_ward_gen9` | 173 cm (177 cm incl. hair) | Gen 9 – GTA V Enhanced | `stream_enhanced/` |

Height is measured from the floor to the top of the head. The 173 cm version is the same model scaled uniformly (×0.930): mesh, skeleton and facial bones together.

## Installation

1. Pick **one** of the four resources:
   - Choose by height.
   - Choose by game build: **Gen 8** for a standard/Legacy FiveM server, **Gen 9** for a GTA V Enhanced server.
2. Copy that folder into your server's `resources` folder. You can rename it, e.g. to `cara_ward`.
3. Add it to `server.cfg`:
   ```
   ensure cara_ward_gen9
   ```
   Use the folder name you copied.
4. Restart the server, or run `refresh` and `ensure <name>` in the server console.
5. Join the server and type **`/cara_ward`** in chat (F8 console also works) to switch into the model.

## Important

- **Run only one resource at a time.** All four versions replace the same model (`u_f_y_hotposh_01`), so running two of them at once makes them conflict.
- **Match the edition to your server.** Gen 9 files don't load on a Legacy server, and Gen 8 files don't load on an Enhanced server.
- **Replaced NPC:** any NPC that would normally spawn as `u_f_y_hotposh_01` will also appear as Cara Ward.
- **Stale look after an update:** if the old look still shows, clear the FiveM cache (`FiveM Application Data\data\cache`) and reconnect.

## Contents of each resource

```
cara_ward_genX/
├─ fxmanifest.lua       resource manifest
├─ client.lua           /cara_ward command (loads and applies the model)
└─ stream/ or stream_enhanced/
   ├─ u_f_y_hotposh_01.ydd   model (head, top, legs)
   ├─ u_f_y_hotposh_01.yft   skeleton
   ├─ u_f_y_hotposh_01.ytd   textures
   └─ u_f_y_hotposh_01.ymt   ped component metadata
```

## Notes

- Rigged to the standard GTA V ped skeleton, so all normal animations work.
- The hips sit about 4 cm (default) / 3.7 cm (173 cm) above the root bone. When seated (vehicles, chairs) she may float that much. Standing animations are not affected.
- Built with Blender 5.2, Muto Ped Rig and Sollumz.
