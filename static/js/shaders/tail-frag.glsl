uniform vec3 diffuse;
uniform float opacity;

{{{chunks.color_pars_fragment}}}
{{{chunks.map_pars_fragment}}}
{{{chunks.alphamap_pars_fragment}}}
{{{chunks.lightmap_pars_fragment}}}
{{{chunks.envmap_pars_fragment}}}
{{{chunks.fog_pars_fragment}}}
{{{chunks.shadowmap_pars_fragment}}}
{{{chunks.specularmap_pars_fragment}}}
{{{chunks.logdepthbuf_pars_fragment}}}

void main() {
  gl_FragColor = vec4(diffuse, opacity);

  {{{chunks.logdepthbuf_fragment}}}
  {{{chunks.map_fragment}}}
  {{{chunks.alphamap_fragment}}}
  {{{chunks.alphatest_fragment}}}
  {{{chunks.specularmap_fragment}}}
  {{{chunks.lightmap_fragment}}}
  {{{chunks.color_fragment}}}

  vec2 uv = vUv;
  float color = (sin(uv.y * 1000.0) - sin((1.0 - uv.x) * 3.0 + 1.2)) * uv.y;

  gl_FragColor = vec4(vec3(color), color * opacity);

  {{{chunks.envmap_fragment}}}
  {{{chunks.shadowmap_fragment}}}

  {{{chunks.linear_to_gamma_fragment}}}

  {{{chunks.fog_fragment}}}
}