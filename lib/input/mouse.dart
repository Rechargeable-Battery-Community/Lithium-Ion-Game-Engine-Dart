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
 * Allows retrieval of position and button clicks from a mouse.
 */
class Mouse
{
  /// The current state of the [Mouse].
  static MouseState _mouseState;
  
  /**
   * The current state of the [Mouse].
   * 
   * Returns a new instance of the [MouseState]. Use
   * [getMouseState] if creating garbage is a concern.
   */
  static MouseState get mouseState() => _mouseState.clone();
  
  /**
   * Gets the current state of the [Mouse].
   * 
   * Copies the values into [mouseState].
   */
  static void getMouseState(MouseState mouseState)
  {
    _mouseState.cloneTo(mouseState);
  }
  
  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------
  
  static void _onInitialize()
  {
    _mouseState = new MouseState();
  }
  
  static void _onTerminate()
  {
    _mouseState = null;
  }

  /**
   * Callback for when the mouse cursor is moved.
   */
  static void _onMouseMove(MouseEvent event)
  {
    _mouseState._setMousePosition(event.clientX, event.clientY);
  }

  /**
   * Callback for when a mouse button is pressed.
   */
  static void _onMouseDown(MouseEvent event)
  {
    _mouseState._setMouseButtonState(event.button, ButtonState.Pressed);
  }  
  
  /**
   * Callback for when a mouse button is released.
   */
  static void _onMouseUp(MouseEvent event)
  {    
    _mouseState._setMouseButtonState(event.button, ButtonState.Released);
  }
  
  /**
   * Callback for when the mouse wheel is moved.
   */
  static void _onMouseWheel(WheelEvent event)
  {
    _mouseState._addToScrollWheelValue(event.wheelDeltaY);
  }
}
