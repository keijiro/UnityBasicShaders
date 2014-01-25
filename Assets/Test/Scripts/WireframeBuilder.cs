using UnityEngine;
using System.Collections;

public class WireframeBuilder : MonoBehaviour
{
    public bool makeSecondMesh = true;

    void Awake ()
    {
        var meshFilter = GetComponent<MeshFilter> ();
        var sourceMesh = meshFilter.mesh;

        var sourceTriangles = sourceMesh.triangles;
        var newTriangles = new int[sourceTriangles.Length * 2];

        for (var i = 0; i < sourceTriangles.Length; i += 3)
        {
            newTriangles [2 * i + 0] = sourceTriangles [i + 0];
            newTriangles [2 * i + 1] = sourceTriangles [i + 1];
            newTriangles [2 * i + 2] = sourceTriangles [i + 1];
            newTriangles [2 * i + 3] = sourceTriangles [i + 2];
            newTriangles [2 * i + 4] = sourceTriangles [i + 2];
            newTriangles [2 * i + 5] = sourceTriangles [i + 0];
        }

        if (makeSecondMesh)
        {
            sourceMesh.subMeshCount = 2;
            sourceMesh.SetIndices (newTriangles, MeshTopology.Lines, 1);
        }
        else
        {
            sourceMesh.SetIndices (newTriangles, MeshTopology.Lines, 0);
        }
    }
}
