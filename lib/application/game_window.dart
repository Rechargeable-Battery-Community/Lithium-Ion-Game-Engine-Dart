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
  Cursor _cursor;
  int _previousWidth;
  int _previousHeight;
  
  GameWindow(String id, int width, int height)
  {
    _canvas = document.query(id);
    
    assert(_canvas != null);
    
    _canvas.width = width;
    _canvas.height = height;
    
    // Set the cursor to the default
    cursor = Cursor.auto;
    
    // Create hooks for inputs
    Mouse._onInitialize(_canvas);
  }
  
  bool get isFullscreen() => _canvas == document.webkitFullscreenElement;
  set isFullscreen(bool value)
  {
    bool isElementFullscreen = isFullscreen;
    
    if (value != isElementFullscreen)
    {
      if (value)
      {
        _previousWidth = _canvas.width;
        _previousHeight = _canvas.height;
        
        _canvas.on.fullscreenChange.add(_onFullscreenChange);
        _canvas.on.fullscreenError.add(_onFullscreenError);
        
        _canvas.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
      }
      else
      {
        document.webkitCancelFullScreen();
      }
    }
  }
  
  bool get isMouseVisible() => _canvas != document.webkitPointerLockElement;
  set isMouseVisible(bool value)
  {
    bool isElementPointerLocked = isMouseVisible;
    
    if (value != isElementPointerLocked)
    {
      if (value)
        document.webkitExitPointerLock();
      else
        _canvas.webkitRequestPointerLock();
    }
  }
  
  Cursor get cursor() => _cursor;
  set cursor(Cursor value)
  {
    _cursor = value;
    
    String source = value.source;
    
    // Check to see if the source contains a period
    // Assume its a custom cursor if this is the case
    if (source.lastIndexOf('.') != -1)
      _canvas.style.cursor = 'url(${source}), auto';
    else
      _canvas.style.cursor = '${source} auto';
  }
  
  /**
   * Performs tasks associated with disposing of unmanaged resources.
   */
  void dispose()
  {
    if (_canvas != null)
    {
      // Remove hooks for inputs
      Mouse._onTerminate(_canvas);
    }
  }
  
  void _resize(int width, int height)
  {
    _canvas.width = width;
    _canvas.height = height;
    
    // Notify the game that the canvas is resized
  }
  
  void _removeFullscreenEvents()
  {
    _canvas.on.fullscreenChange.remove(_onFullscreenChange);
    _canvas.on.fullscreenError.remove(_onFullscreenError);
  }
  
  void _onFullscreenChange(_)
  {
    if (isFullscreen)
    {
      Screen screen = window.screen;
      
      _resize(screen.width, screen.height);
    }
    else
    {
      _resize(_previousWidth, _previousHeight);
      
      _removeFullscreenEvents();
    }
  }
  
  void _onFullscreenError(_)
  {
    _removeFullscreenEvents();
  }
}
