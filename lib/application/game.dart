/**
 * Lithium-Ion Game Engine
 *
 * ---------------------------------------------------------------------
 *
 * Copyright (c) 2012, Don Olmstead
 * 
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 *   1. The origin of this software must not be misrepresented; you must not
 *   claim that you wrote the original software. If you use this software
 *   in a product, an acknowledgment in the product documentation would be
 *   appreciated but is not required.
 *
 *   2. Altered source versions must be plainly marked as such, and must not be
 *   misrepresented as being the original software.
 *
 *   3. This notice may not be removed or altered from any source
 *   distribution.
 */

class Game
{
  static Game instance;
  
  /// The [GameWindow] associated with the [Game].
  GameWindow _gameWindow;

  Game();
  
  void update(int time)
  {
    
  }
  
  void resize(int width, int height)
  {
    print('resize: ${width}x${height}');
  }
  
  GameWindow get gameWindow() => _gameWindow;
  
  //---------------------------------------------------------------------
  // Static methods
  //---------------------------------------------------------------------

  static void _onInitialize()
  {
    // Load the game settings
    GameSettings settings = new GameSettings('#settings');
    
    // Create the game instance
    instance = new Game();
    instance._gameWindow = new GameWindow('#game', settings.width, settings.height);
  }
  
  static void _onUpdate(int time)
  {
    instance.update(time);
  }
  
  static void _onResize(int width, int height)
  {
    instance.resize(width, height);
  }
}
