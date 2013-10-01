uniform mat4 u_Projection;
uniform mat4 u_View;
uniform mat4 u_World;

attribute vec4 a_Position;
attribute vec3 a_Normal;
attribute vec3 a_Tangent;
attribute vec3 a_Bitangent;
attribute vec2 a_TexCoord;

varying vec3 v_ViewPos;
varying vec3 v_Normal;
varying vec3 v_TangentWorldSpace;
varying vec2 v_TexCoord;

varying mat4 v_View;

void main(void) {
    mat3 world3 = mat3(u_World);
    vec4 world_pos = u_World * a_Position;

    v_ViewPos = vec3(u_View * world_pos);
    v_TexCoord = a_TexCoord;
    v_Normal = mat3(u_View) * world3 * a_Normal;
    v_TangentWorldSpace = mat3(u_View) * world3 * a_Tangent;

    gl_Position = u_Projection * u_View * world_pos;

    v_View = u_View;
}
