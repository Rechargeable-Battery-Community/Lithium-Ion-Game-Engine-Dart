/**
 * \file entity.dart
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

class GameEntity
{
  /// The [Component]s associated with the entity.
  List<Component> _components;
  /// The [Transform] associated with the entity.
  Transform _transform;
  /// The [Visual] associated with the entity.
  Visual _visual;
  
  /**
   * Creates an instance of the [GameEntity] class.
   */
  GameEntity()
    : _components = new List<Component>()
    , _transform = null
    , _visual = null;

  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------
  
  Transform get transform => _transform;
  
  Visual get visual => _visual;
  
  //---------------------------------------------------------------------
  // Component methods
  //---------------------------------------------------------------------  
  
  /**
   * Adds a [Component] to the [GameEntiy].
   */
  void addComponent(Component component)
  {
    assert(component != null);
    assert(component.entity == null);

    component._setEntity(this);

    _components.add(component);

    // Provide accessors for specific
    // Component types
    if (component is Transform)
      _transform = component;
    else if (component is Visual)
      _visual = component;
  }

  /**
   * Removes a [Component] from the [GameEntity].
   */
  void removeComponent(Component component)
  {
    assert(component != null);
    
    int index = _components.indexOf(component);

    if (index != -1)
    {
      assert(component.entity == this);
      component._setEntity(null);

      _components.removeRange(index, 1);

      if (component is Transform)
        _transform = null;
      else if (component is Visual)
        _visual = null;
    }
  }
}
