# GTA V Ped Storage

A collection of custom character peds for **GTA V / FiveM**, based on characters from films and TV series.

Each character is generated with **Meshy AI**, then cleaned up, rigged and exported in **Blender**. The Blender work is driven by **Claude (Opus 5.5)** through a Blender MCP server.

> Fan-made, non-commercial project. All characters belong to their respective rights holders.

---

## Peds

| Series | Character | Heights | Builds | Replaces / model | Chat command | Status |
|---|---|---|---|---|---|---|
| A Good Girl's Guide to Murder | [Cara Ward](PEDs/Good%20Girl's%20Guide%20to%20Murder/Cara_Ward/) | default, 173 cm | Gen 8, Gen 9 | `u_f_y_hotposh_01` | `/cara_ward` | ✅ Ready |
| A Good Girl's Guide to Murder | [Pippa Fitz-Amobi](PEDs/Good%20Girl's%20Guide%20to%20Murder/Pippa_Fitz_Amobi/) | default | Gen 9 | `ig_tanisha` | – | 🚧 Raw stream files only (no resource yet) |
| Uptown Girls | [Ray Schleine](PEDs/Uptown%20Girls/Ray%20Schleine/) | default, 132 cm | Gen 9 | `u_f_y_comjane` | `/mprped` | ✅ Ready |
| Uptown Girls | Molly Gunn | – | – | – | – | 🚧 In progress (not uploaded yet) |
| Wednesday (Netflix) | [Wednesday Addams](PEDs/Wednesday%20Netflix%20Series/Wednesday%20Addams/) | default, 155 cm | Gen 8, Gen 9 | `u_f_y_poppymich` | `/wednesday_addams` | ✅ Ready |
| Wednesday (Netflix) | [Enid Sinclair](PEDs/Wednesday%20Netflix%20Series/Enid%20Sinclair/) | default, 160 cm | Gen 8, Gen 9 | `a_f_y_hipster_01` | `/enid` | ✅ Ready |
| Wednesday (Netflix) | [Goody Addams](PEDs/Wednesday%20Netflix%20Series/Goody%20Addams/) | default, 155 cm | Gen 9 | `goody_addams` (add-on) | `/goody_addams` | ✅ Ready |

**Builds:**
- **Gen 8** = GTA V Legacy (a standard FiveM server).
- **Gen 9** = GTA V Enhanced.

**Replace vs. add-on:**
- Most peds **replace** a base-game model. Any NPC that would normally spawn as that model will also look like the custom character.
- Goody Addams is an **add-on** ped. It registers its own model through `peds.meta` and does not replace anything.

Some characters have their own README in their folder with more detail and screenshots (for example, [Cara Ward](PEDs/Good%20Girl's%20Guide%20to%20Murder/Cara_Ward/README.md), [Wednesday Addams](PEDs/Wednesday%20Netflix%20Series/Wednesday%20Addams/README.md), [Enid Sinclair](PEDs/Wednesday%20Netflix%20Series/Enid%20Sinclair/README.md) and [Goody Addams](PEDs/Wednesday%20Netflix%20Series/Goody%20Addams/README.md)).

| Wednesday Addams | Enid Sinclair | Goody Addams |
|---|---|---|
| ![Wednesday Addams in game](PEDs/Wednesday%20Netflix%20Series/Wednesday%20Addams/Screenshots/K%C3%A9perny%C5%91k%C3%A9p%202026-11-19%20142858.png) | ![Enid Sinclair in game](PEDs/Wednesday%20Netflix%20Series/Enid%20Sinclair/Screenshots/20261115215847_1.jpg) | ![Goody Addams in game](PEDs/Wednesday%20Netflix%20Series/Goody%20Addams/Screenshots/20261115222308_1.jpg) |

---

## Repository layout

```
PEDs/
└─ <Series>/
   └─ <Character>/
      ├─ Blender/                    .blend source files (files over 50 MB are not uploaded)
      ├─ Screenshots/                in-game screenshots (optional)
      ├─ default_height/
      │  ├─ gen8_legacy/             FiveM resource for GTA V Legacy
      │  └─ gen9_enhanced/           FiveM resource for GTA V Enhanced
      ├─ <height>cm/                 same model, scaled to a specific height
      │  └─ gen8_legacy/ | gen9_enhanced/
      └─ README.md                   character-specific notes (optional)
```

Each FiveM resource folder contains:

```
<resource>/
├─ fxmanifest.lua        resource manifest
├─ client.lua            chat command that loads and applies the model
├─ peds.meta             (add-on peds only) registers the new model
└─ stream/ or stream_enhanced/
   ├─ <model>.ydd        drawables (head, upper body, lower body)
   ├─ <model>.yft        skeleton / fragment
   ├─ <model>.ytd        textures
   └─ <model>.ymt        ped component metadata
```

---

## Installation (FiveM)

1. **Pick one resource folder** for the character, for example `PEDs/Wednesday Netflix Series/Enid Sinclair/160cm/gen9_enhanced`.
   - Choose the height you want.
   - Choose the build that matches your server: `gen8_legacy` for Legacy, `gen9_enhanced` for Enhanced.
2. **Copy the folder** into your server's `resources/` directory and give it a simple name without spaces, for example `enid_160`.
3. **Add it to `server.cfg`:**
   ```cfg
   ensure enid_160
   ```
4. **Restart the server**, or run `refresh` and then `ensure enid_160` in the server console.
5. **Join the server** and type the character's chat command (see the table above), for example `/enid`. The F8 console also works.

### Things to know

- **Run only one version of a character at a time.** Every height and build of a character replaces the same model, so two running at once will conflict.
- **Match the build to your server.** Gen 9 files don't load on a Legacy server, and Gen 8 files don't load on an Enhanced server.
- **Seeing the old look after an update?** Clear the FiveM cache (`FiveM Application Data\data\cache`) and reconnect.

---

## How these peds are made

```
 Meshy AI  ──►  Blender 5.2  ──►  Sollumz export  ──►  FiveM resource
 (3D model      (cleanup, rig,     (.ydd .yft          (fxmanifest +
  generation)    weights, UVs,      .ytd .ymt)          client.lua)
                 textures, scale)
                    ▲
                    │ Blender MCP
                 Claude (Opus 5.5)
```

1. **Generate:** create the character mesh and textures with [Meshy AI](https://www.meshy.ai/).
2. **Import and clean up in Blender:** fix the mesh, materials and UVs, and split the model into GTA ped components (head, upper body, lower body).
3. **Rig:** fit the model to the standard GTA V ped skeleton with **Muto Ped Rig**, so all normal game animations work.
4. **Scale (optional):** make height variants by scaling the mesh, skeleton and facial bones together, uniformly.
5. **Export:** use [Sollumz](https://github.com/Sollumz/Sollumz) to export the GTA V asset files for Gen 8 and/or Gen 9.
6. **Package:** wrap the files in a FiveM resource with a chat command to switch into the model.

Most of the Blender steps are done by **Claude Opus 5.5** through a **Blender MCP** server. Claude inspects the scene, edits meshes, bones and weights, checks the rig, and runs the exports.

### Tools

| Tool | Purpose |
|---|---|
| [Meshy AI](https://www.meshy.ai/) | AI 3D model generation |
| [Blender 5.2](https://www.blender.org/) | Modeling, rigging, texturing |
| Blender MCP | Lets Claude control Blender |
| [Claude](https://claude.ai/) (Pro, Opus 5.5) | AI assistant doing the Blender work |
| Muto Ped Rig | GTA V ped skeleton / rigging |
| [Sollumz](https://github.com/Sollumz/Sollumz) | GTA V asset import/export for Blender |

---

## Known limitations

- Hips can sit a few centimetres above the root bone on some peds, so the character may float slightly when seated (in vehicles or on chairs). Standing animations are not affected.
- Some peds exist only for one build (Gen 8 or Gen 9) so far.
- Characters marked 🚧 are works in progress.

---

## Disclaimer

This is a non-commercial fan project. Characters, names and likenesses belong to their respective creators and studios. GTA V is a trademark of Rockstar Games / Take-Two Interactive. This project is not affiliated with or endorsed by any of them.
