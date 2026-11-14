using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.SceneManagement;

public static class GingerbreadSceneBuilder
{
    [MenuItem("Gingerbread Clicker/Create Game Scene")]
    public static void CreateScene()
    {
        var scene = EditorSceneManager.NewScene(NewSceneSetup.EmptyScene, NewSceneMode.Single);
        var game = new GameObject("Gingerbread Game");
        game.AddComponent<GingerbreadGame>();
        var cameraObject = new GameObject("Main Camera", typeof(Camera), typeof(AudioListener));
        var camera = cameraObject.GetComponent<Camera>();
        camera.clearFlags = CameraClearFlags.SolidColor;
        camera.backgroundColor = new Color(.84f, .93f, .94f);
        camera.orthographic = true;
        cameraObject.tag = "MainCamera";
        EditorSceneManager.SaveScene(scene, "Assets/Scenes/GameScene.unity");
        var buildScenes = new System.Collections.Generic.List<EditorBuildSettingsScene>(EditorBuildSettings.scenes);
        if (!buildScenes.Exists(s => s.path == "Assets/Scenes/GameScene.unity"))
            buildScenes.Add(new EditorBuildSettingsScene("Assets/Scenes/GameScene.unity", true));
        EditorBuildSettings.scenes = buildScenes.ToArray();
        AssetDatabase.SaveAssets();
        Debug.Log("Gingerbread Clicker scene created and added to Build Settings.");
    }
}
