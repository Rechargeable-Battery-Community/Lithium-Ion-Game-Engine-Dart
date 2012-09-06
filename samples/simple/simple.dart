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

#import('../../lib/lithium.dart');
#import('../../external/Spectre/lib/spectre.dart');
#import('../../external/Spectre/lib/spectre_scene.dart');
#import('../../external/Spectre/external/DartVectorMath/lib/vector_math_html.dart');
#import('dart:html');

class SimpleGameView extends GameView
{
  List<GameEntity> _entities;
  TransformGraph _transformGraph;
  
  SimpleGameView()
    : super()
    , _entities = new List<GameEntity>()
    , _transformGraph = new TransformGraph(16);
  
  void initialize()
  {
    _addCube(new vec3());
    _addCube(new vec3(-5.0, 0.0, 0.0));
    _addCube(new vec3( 5.0, 0.0, 0.0));
    
    _transformGraph.updateGraph();
  }
  
  void update()
  {
    _transformGraph.updateWorldMatrices();
  }
  
  void _addCube(vec3 position)
  {
    GameEntity entity = new GameEntity();
    Transform transform = new Transform(_transformGraph);
    transform.position = position;
    
    _entities.add(entity);
  }
}

void goFullscreen(_)
{
  GameWindow gameWindow = Game.instance.gameWindow;
  
  gameWindow.isFullscreen = true;
  //gameWindow.isMouseVisible = false;
}

void main()
{
  initializeLithiumIonEngine();
  
  SimpleGameView gameView = new SimpleGameView();
  Game.instance.gameView = gameView;
  gameView.initialize();
    
  ButtonElement button = document.query('#fullscreen');
  button.on.click.add(goFullscreen);
}
