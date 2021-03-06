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

class Transform
{
  TransformGraph _transformGraph;
  int _transformNode;
  mat4 _tempMatrix;
  
  Transform(TransformGraph transformGraph)
  {
    _transformGraph = transformGraph;    
    _transformNode = _transformGraph.createNode();
    _tempMatrix = new mat4();
  }
  
  set position(vec3 value)
  {
    _transformGraph.getWorldMatrix(_transformNode, _tempMatrix);
    _tempMatrix.setTranslation(value);
    _transformGraph.setLocalMatrix(_transformNode, _tempMatrix);
  }
}
