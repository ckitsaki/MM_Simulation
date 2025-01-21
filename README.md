# MM Simulation Repository

## Workflow 
1. Prepare the geometry file (`strips_flat.geo`) using Gmsh.
2. Run in the command line ```gmsh strips_flat.geo -3 -order 2``` to generate the finite element mesh (`strips_flat.msh`) from the `.geo` file.
3. Run in the command line ```ElmerGrid 14 2 strips_flat.msh -autoclean``` to convert the Gmsh generated mesh file into Elmer compatible format. The output consists of four Elmer mesh files, i.e. mesh.header, mesh.nodes, mesh.elements, mesh.boundary. These files are placed in the `strips_flat` folder and are ready for use in ElmerSolver.
4. Run in the command line ```ElmerSolver strips_flat.sif``` to solve the electric field configuration based on the mesh and boundary conditions defined in the `strips_flat.sif` file.

## File Description
`strips_flat.geo`: geometric representation of a Micromegas detector with readout strips created using Gmsh.

`strips_flat.msh`: finite element meshing generated from the strips_flat.geo file using Gmsh. 

`strips_flat.sif`: Elmer configuration file specifying the boundary conditions, material properties, and solver settings for electric field simulation.

`gas` folder: simulation setup using garfield++ framework to model the detector gas mixture.
