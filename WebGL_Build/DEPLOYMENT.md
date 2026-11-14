# Gingerbread Clicker WebGL

## Local test

From the Unity project folder, run:

```powershell
py -m http.server 8000 --directory WebGL_Build
```

Open `http://localhost:8000` in Chrome or Edge. Stop the server with `Ctrl+C`.
Do not open `index.html` directly with `file://`.

## Netlify

1. Sign in at Netlify and choose **Add new site → Deploy manually**.
2. Drag the contents of the `WebGL_Build` folder into the deploy drop area. The uploaded folder must have `index.html` at its root.
3. Netlify reads the included `netlify.toml`. It sets the WebAssembly, JavaScript, and data MIME types. Brotli files use Unity's decompression fallback, so the server must not add a `Content-Encoding: br` header.
4. Open the generated Netlify URL and verify the game loads. You can rename the site from **Site configuration → General → Site details**.

For Git-based deployments, commit the contents of `WebGL_Build` into the published directory and set that directory as Netlify's publish directory.

## itch.io

Upload `GingerbreadClicker_WebGL_itch.zip` as a new project or edit an existing project. Set **Kind of project** to **HTML**, upload the ZIP, and enable **This file will be played in the browser**. Set the viewport dimensions to 960 × 600 (the Unity build's initial size), then save and view the page. The ZIP has `index.html` at its root; do not ZIP the outer `WebGL_Build` folder itself.

## Build notes

- Unity: 6000.5.9f1; target: WebGL; graphics API: WebGL 2/GLES3.
- Brotli compression with decompression fallback enabled. WebGL threads are disabled.
- Initial WebGL memory setting: 256 MB. Memory growth remains enabled.
- Save data uses Unity `PlayerPrefs`, which maps to browser storage. It is scoped to the browser/site and may be cleared by the player or browser.
- This game currently has no audio assets; the AudioSource is silent. There are no file-based saves or native plugins in the inspected project.
