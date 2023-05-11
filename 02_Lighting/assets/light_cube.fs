#version 430 core
out vec4 FragColor;

in vec4 lightCubeColor;

void main()
{
    FragColor = lightCubeColor;
}