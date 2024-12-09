## Clumsy Copter

### Setup

- Download Godot 4.3: https://godotengine.org/download/archive/4.3-stable/
- Navigate to "project.godot" inside the repository to open the editor

### Nodes

#### WorldEnvironment
- : Base node containing all other nodes
  - Contains scripts for handling universal inputs

#### Terrain
- : Instance of Terrain Scene
  - Contains a StaticBody2d Collider

#### Player
- : Abstract Node containing all player components
  - Contains scripts for handling player inputs and physics
  - Contians Camera2d node representing main view during gameplay
    - Camera2d node contains abstract 2d node to hold UI elements


### Export Instructions

- I've pre exported the website folder in the web folder of the repository.

#### IF THERE IS NO WEB FOLDER ALREADY

- Switch the editor from the Forward + renderer to Compatibility at the top right

- At the top editor menu, navigate to Editor -> Manage Export Templates
- Download template from best available mirror

- Navigate to Project -> Export
- Add an HTML5 export template
- Choose an export folder and select "Export All"