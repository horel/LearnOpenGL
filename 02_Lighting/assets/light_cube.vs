#version 430 core
layout (location = 0) in vec3 aPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform vec4 light_cube_color;
out vec4 lightCubeColor;

void main()
{
	lightCubeColor = light_cube_color;
	gl_Position = projection * view * model * vec4(aPos, 1.0);
}