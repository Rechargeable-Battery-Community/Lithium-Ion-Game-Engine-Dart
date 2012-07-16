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

/**
 * The system window associated with a Game.
 */
class GameWindow implements IDisposable
{
  CanvasElement _canvas;
  
  GameWindow(String id)
  {
    _canvas = document.query(id);
    
    if (_canvas != null)
    {
      // Create hooks for mouse events
      Mouse._onInitialize();
      
      _canvas.on.mouseMove.add(Mouse._onMouseMove);
      _canvas.on.mouseDown.add(Mouse._onMouseDown);
      _canvas.on.mouseUp.add(Mouse._onMouseUp);
      _canvas.on.mouseWheel.add(Mouse._onMouseWheel);
      
      // Create hooks for keyboard events
    }
  }
  
  /**
   * Performs tasks associated with disposing of unmanaged resources.
   */
  void dispose()
  {
    if (_canvas != null)
    {
      // Remove hooks for mouse event
      _canvas.on.mouseMove.remove(Mouse._onMouseMove);
      _canvas.on.mouseDown.remove(Mouse._onMouseDown);
      _canvas.on.mouseUp.remove(Mouse._onMouseUp);
      _canvas.on.mouseWheel.remove(Mouse._onMouseWheel);
      
      Mouse._onTerminate();
      
      // Remove hooks for keyboard events
    }
  }
}
