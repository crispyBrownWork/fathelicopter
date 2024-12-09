# Clumsy Copter Technical Specification

## Game Architecture

### Scenes

#### WorldEnvironment (extends Node2D)
The `WorldEnvironment` scene serves as the main game environment and handles scene management.

**Properties:**
- N/A

**Methods:**
- `_ready()`:
  - This method is called when the node enters the scene tree for the first time. Currently, it is empty.
- `_process(delta)`:
  - This method is called every frame, and it calls the `reload_scene()` function.
- `reload_scene()`:
  - This function checks if the "reset" action is pressed, and if so, it reloads the current scene.

#### Player (extends RigidBody2D)
The `Player` scene represents the helicopter-like character that the user controls.

**Properties:**
- `torque_strength`: The strength of the rotational force applied to the helicopter.
- `return_torque`: The torque strength used to return the helicopter to an upright position.
- `max_rotation_degrees`: The maximum rotation limit for the helicopter.
- `force_strength`: The strength of the upward force applied to the helicopter.
- `linear_drag`: The linear drag coefficient for the helicopter.
- `angular_drag`: The angular drag coefficient for the helicopter.

**Methods:**
- `_physics_process(delta)`:
  - This method is called every physics frame, and it handles the helicopter's physics-based behavior, including applying drag, handling torque input, returning to an upright position, and applying upward force.
- `apply_drag()`:
  - This function applies linear and angular drag to the helicopter's velocity and angular velocity, respectively.
- `handle_torque(delta)`:
  - This function handles the helicopter's rotation based on user input from the left and right arrow keys.
- `return_to_upright(delta)`:
  - This function applies a torque to the helicopter to return it to an upright position if it has rotated too far.
- `handle_force(delta)`:
  - This function applies an upward force to the helicopter when the user presses the up arrow key.
- `_on_body_entered(body, collision)`:
  - This function is called when the helicopter collides with another body. It calculates the impact force of the collision and emits a "collision_occurred" signal.
- `calculate_impact_force(body)`:
  - This function calculates the impact force of a collision based on the relative velocity between the helicopter and the other body.

### User Interface (UI)

The current implementation does not include a dedicated user interface. The game's status, such as fuel, health, and ammunition, are not yet displayed to the player.

## Technical Features Implemented

1. **Player Helicopter Control**:
   - The player can control the helicopter's rotation using the left and right arrow keys.
   - The player can apply an upward force to the helicopter using the up arrow key, which depletes the fuel gauge.
   - The helicopter's movement and rotation are simulated using Godot's built-in physics engine, providing a physics-based flight experience.

2. **Collision Detection and Handling**:
   - The game monitors the helicopter's collisions with other objects in the scene.
   - When a collision occurs, the impact force is calculated and used to reduce the helicopter's health.
   - The "collision_occurred" signal is emitted when a collision happens, allowing other game systems to respond to the event.

3. **Scene Management**:
   - The `WorldEnvironment` scene manages the overall game state and provides the ability to reload the current scene.
   - The "reset" action can be used to trigger a scene reload, allowing the player to restart the game.

## Technical Features Remaining to be Implemented

1. **Fuel and Health Systems**:
   - Implement a fuel gauge that decreases as the player applies thrust to the helicopter.
   - Implement a health system that decreases when the helicopter collides with objects at high speed or takes damage from enemy fire.
   - Introduce pickup items that can replenish the helicopter's fuel and health.

2. **Weapons and Ammunition**:
   - Implement a weapon system that allows the player to fire projectiles from the helicopter's turret.
   - Manage an ammunition gauge that decreases when the player fires the weapon.
   - Introduce pickup items that can replenish the helicopter's ammunition.

3. **Enemy Entities**:
   - Implement enemy units, such as anti-aircraft guns, that can fire projectiles at the player's helicopter.
   - Develop enemy AI behaviors that make them increasingly challenging as the player progresses through the levels.

4. **Level Progression**:
   - Implement a level manager that can generate progressively more difficult levels, increasing the complexity of obstacles and enemy placement.
   - As the player reaches the right side of the screen, transition to the next level with increased difficulty.

5. **Leaderboard and Scoring**:
   - Implement a leaderboard system that stores and displays the highest scores achieved by players.
   - Track the player's score based on factors such as level progression, enemy kills, and survival time.
   - Provide the ability for players to submit their scores to the global leaderboard.

6. **User Interface (UI)**:
   - Develop a heads-up display (HUD) that shows the player's fuel, health, ammunition, and score.
   - Implement UI elements for the main menu, game over screen, and leaderboard display.

By implementing these additional features, the Clumsy Copter game will provide a more comprehensive and engaging experience for players, including resource management, enemy encounters, level progression, scoring, and a robust user interface.