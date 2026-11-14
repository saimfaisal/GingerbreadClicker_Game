# Gingerbread Clicker - Unity starter project

A playable, single-scene Christmas cookie clicker starter made for Unity 6.5 (6000.5.9f1). The screen is assembled by code at runtime, so the scene has no manually wired UI references to break.

## Open and play

1. Install/open **Unity Hub** and choose **Add > Add project from disk**.
2. Select this `GingerbreadClicker` folder (the folder containing `Assets`, `Packages`, and `ProjectSettings`). Let Unity import the project and resolve Input System/UI packages. TextMeshPro essential font resources are included.
3. Open `Assets/Scenes/GameScene.unity` and press **Play**. The scene is also included in Build Settings.
4. Click/tap the large cookie. Buy helpers in **Bakery**; use **UPGRADES** and **MORE** to switch panels. Golden cookies appear periodically.

If the scene is missing, use **Gingerbread Clicker > Create Game Scene** from the Unity menu.

## What's implemented

- Responsive Canvas UI that stacks the play area above the shop in portrait mode and places them side by side in landscape mode. Includes cookie counter, CPS, click power, eight scalable buildings, and scrollable bakery/upgrades.
- Click rewards, purchase checks, production, unique upgrades, golden cookie rewards, 10 achievements, statistics, settings panel, reset/save buttons, and autosave every 30 seconds / on app pause, focus loss, and quit.
- Save data uses Unity `PlayerPrefs` JSON and includes offline elapsed time display. Buildings/upgrades/achievement state restore when reopening.
- The gingerbread character and snow are drawn from Unity UI shapes, with text-only shop labels, so the game does not depend on emoji fonts or external art.

## Project structure

- `Assets/Scripts/GingerbreadGame.cs` - gameplay, UI, economy, events, and save/load.
- `Assets/Editor/GingerbreadSceneBuilder.cs` - creates the starter scene and Build Settings entry.
- `Assets/Scenes/GameScene.unity` - playable entry scene.

## Controls and customization

- Mouse click or touchscreen tap the central cookie.
- Building starting costs, CPS, upgrade prices, and economy values are in `SetupEconomy()` near the top of `GingerbreadGame.cs`.
- The UI and panel actions are in `BuildUI()` / `SetTab()`.
- The gingerbread button artwork is drawn from UI shapes. To replace it with your own art, assign a sprite to the button in the scene or code. For audio, add audio clips and connect them to the `AudioSource`; the project currently has no sound files, and volume sliders/music are not implemented.

## Build for Windows

1. Open **File > Build Profiles** (or **Build Settings** in older Unity versions).
2. Confirm `Assets/Scenes/GameScene.unity` appears in Scenes In Build.
3. Select **Windows**, choose the target architecture, then **Build**.

## Build for Android

1. In Unity Hub, install the Unity editor's **Android Build Support**, including SDK/NDK tools and OpenJDK.
2. In Unity, open **File > Build Profiles**, add/select **Android**, and switch platform.
3. Set a unique package identifier in **Project Settings > Player > Android** (for example `com.yourname.gingerbreadclicker`).
4. Connect a device with USB debugging enabled or choose **Build** to create an APK.

## Current scope

This is a complete playable starter slice with the core incremental loop and saved progression. It uses placeholder UI artwork and has no included music, SFX, particle system, main menu, or slider-based audio controls. Those require additional authored assets and polish; the project does not claim those pieces are present.
