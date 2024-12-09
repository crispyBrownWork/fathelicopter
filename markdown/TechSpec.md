# Clumsy Copter MVP.md

## Game Overview

Clumsy Copter is a 2D physics-based game where the player controls a helicopter-like character. The objective is to navigate the character through a series of obstacles while maintaining its balance and stability.

## Game Mechanics

### WorldEnvironment

- This node serves as the main game environment and handles scene management.
- It includes a `reload_scene()` function that allows the player to reset the current scene by pressing the "reset" action.

### Player

- This is the core game object representing the helicopter-like character.
- It is implemented as a `RigidBody2D` node, allowing for realistic physics-based movement and interactions.
- The player can apply torque impulses to rotate the character left or right using the left and right arrow keys.
- The player can apply an upward force to the character using the up arrow key, simulating the "flapping" of the helicopter's rotor blades.
- The player's character has a limited rotation range, enforced by the `max_rotation_degrees` parameter.
- The character's movement is affected by linear and angular drag, which are controlled by the `linear_drag` and `angular_drag` parameters.
- The character emits a "collision_occurred" signal when it collides with other objects, passing the impact force and collision point as arguments.

### Terrain

- The terrain is represented by the `StaticBody2D` node, which provides a static, non-moving surface for the player to interact with.
- The terrain may include various obstacles, such as gaps, platforms, and other environmental elements that the player must navigate around.

### Collision Detection and Handling

- The game utilizes 2D collision detection and resolution, handled by the built-in Godot physics engine.
- The `CollisionShape2D` and `CollisionPolygon2D` nodes are used to define the collision boundaries of the terrain and other game objects.
- The `CollisionShape2D` attached to the `Player` node handles the player's collision detection and response.
- When the player collides with an object, the `on_body_entered()` function in the `Player` script is called, emitting the "collision_occurred" signal.