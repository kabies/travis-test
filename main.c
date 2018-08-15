#include <SDL.h>
#include <GL/GLEW.h>

int main()
{
  printf("hello\n");

  if( SDL_Init(SDL_INIT_VIDEO) != 0 ){
      SDL_Log("SDL_Init fail.");
      return;
  }
  SDL_SetHint(SDL_HINT_RENDER_DRIVER,"opengl");

  SDL_Window *window = SDL_CreateWindow("title", 0, 0, 320, 240, SDL_WINDOW_OPENGL);
  SDL_GL_CreateContext(window);

  if( glewInit() == GLEW_OK ){
    SDL_Log("glewInit ok\n");
  }else{
    SDL_Log("glewInit faild\n");
  }

  SDL_Log("OpenGL Version: %s\n", glGetString(GL_VERSION));
  SDL_Log("OpenGL Renderer: %s\n", glGetString(GL_RENDERER));
  SDL_Log("GLSL Version: %s\n", glGetString(GL_SHADING_LANGUAGE_VERSION));


  // https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_instanced_arrays.txt
  if(GLEW_ARB_instanced_arrays) SDL_Log("ARB_instanced_arrays ok\n");

  // https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_draw_instanced.txt
  if(GLEW_ARB_draw_instanced) SDL_Log("ARB_draw_instanced ok\n");

  // https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_vertex_array_object.txt
  if(GLEW_ARB_vertex_array_object) SDL_Log("ARB_vertex_array_object ok\n");

  return 0;
}
