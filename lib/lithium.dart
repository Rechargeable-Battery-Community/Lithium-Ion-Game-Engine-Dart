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

#library('lithium');

#import('dart:html');
#import('dart:json');
#import('../external/Spectre/lib/spectre.dart');
#import('../external/Spectre/lib/spectre_scene.dart');
#import('../external/Spectre/external/DartVectorMath/lib/vector_math_html.dart');

//---------------------------------------------------------------------
// Foundation library
//---------------------------------------------------------------------

#source('foundation/iclonable.dart');
#source('foundation/idisposable.dart');
#source('foundation/player_index.dart');
#source('foundation/service_locator.dart');

//---------------------------------------------------------------------
// Application library
//---------------------------------------------------------------------

#source('application/game.dart');
#source('application/game_settings.dart');
#source('application/game_view.dart');
#source('application/game_window.dart');

#source('input/button_state.dart');
#source('input/cursor.dart');
#source('input/game_pad.dart');
#source('input/game_pad_state.dart');
#source('input/keyboard.dart');
#source('input/keyboard_state.dart');
#source('input/keys.dart');
#source('input/key_state.dart');
#source('input/mouse.dart');
#source('input/mouse_buttons.dart');
#source('input/mouse_state.dart');

//---------------------------------------------------------------------
// Scene library
//---------------------------------------------------------------------

#source('scene/box_visual.dart');
#source('scene/component.dart');
#source('scene/entity.dart');
#source('scene/transform.dart');
#source('scene/visual.dart');

//---------------------------------------------------------------------
// Library initialization
//---------------------------------------------------------------------

void initializeLithiumIonEngine()
{
  Game._onInitialize();
}
