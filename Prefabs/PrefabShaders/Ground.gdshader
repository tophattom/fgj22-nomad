shader_type spatial;

uniform float height_scale = 0.5;
uniform float smoothness = 2.0;
uniform sampler2D noise;
uniform sampler2D normalmap;

varying vec2 tex_position;

void vertex() {
  tex_position = VERTEX.xz / smoothness;
  float height = texture(noise, tex_position).r;
  VERTEX.y += height * height_scale;
}

void fragment() {
  NORMALMAP = texture(normalmap, tex_position).xyz;
}