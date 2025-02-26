#version 120
varying vec2 texcoord;
uniform sampler2D tex;


// Shader settings values (if you know a better way to add a slider that goes from 1 to 128 please fix the mess in the screen grid size)
#define BLOCKS_PER_ROW 64 // [64 32 16 8 4 2 1] Blocks per row
#define SCREEN_GRID_SIZE 64 // [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128] SCREEN GRID SIZE


void main() {

    // Calculate the block's position in the texture atlas
    vec2 tileOffset = floor(texcoord * BLOCKS_PER_ROW) / BLOCKS_PER_ROW;

    // Create a screen-locked UV coordinate
    vec2 screenUV = vec2(mod(gl_FragCoord.x, SCREEN_GRID_SIZE), SCREEN_GRID_SIZE - mod(gl_FragCoord.y, SCREEN_GRID_SIZE)) / SCREEN_GRID_SIZE;

    // Map the screen UV to the block's texture space
    vec2 finalUV = tileOffset + screenUV * (1.0 / BLOCKS_PER_ROW);

    // Sample the texture
    vec4 blockTextureColor = texture2D(tex, finalUV);

    // Output the final color :D
    gl_FragColor = blockTextureColor;

}
