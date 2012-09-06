/**
 * \file components.dart
 *
 * \section COPYRIGHT
 *
 * Copyright (c) 2012 Don Olmstead
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
 * 
 */
class Component
{
  /// The [GameEntity] the [Component] is associated to.
  GameEntity _entity;
  
  /**
   * Creates an instance of the [Component] class.
   */
  Component()
    : _entity = null;
  
  /**
   * The [GameEntity] associated with this [Component].
   */
  GameEntity get entity => _entity;
  
  /**
   * Sets the [GameEntity] associated with this [Component].
   *
   * A [Component] can only be associated with a single
   * [GameEntity].
   */
  void _setEntity(GameEntity value)
  {
    _entity = value;
  }
}
