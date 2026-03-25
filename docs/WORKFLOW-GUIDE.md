# Workflow Guide — AI Video Production Pipeline

Five-phase production pipeline for AI-generated animated video content.

## Overview

```
Phase 1: Pre-Production    → Script, storyboard, character descriptions
Phase 2: Voice Recording   → ElevenLabs narration per scene
Phase 3: Character Gen     → Stability AI / Leonardo / Neolemon stills
Phase 4: Animation         → Runway / Kling / Luma image-to-video
Phase 5: Compositing       → DaVinci Resolve timeline assembly
```

## Phase 1: Pre-Production

### Inputs
- Story concept, theme, target audience

### Steps
1. **Write script** — narration text, scene descriptions, timing notes
2. **Character design** — detailed text descriptions for each character
   - Physical appearance (skin tone, hair, clothing, accessories)
   - Personality traits (affects voice selection and movement style)
   - Art style direction (cartoon, realistic, watercolor, etc.)
3. **Scene breakdown** — shot list with:
   - Scene number, duration (based on narration length)
   - Camera angle / framing
   - Character actions
   - Background description
4. **Budget estimation** — map scenes to services, estimate credit usage

### Outputs
- Script document (markdown)
- Character sheet (descriptions + reference keywords)
- Shot list (scenes × tools × estimated cost)

## Phase 2: Voice Recording

### Tool: ElevenLabs MCP

### Steps
1. Select or clone voices for each character/narrator
2. Generate narration clips per scene
3. Adjust voice settings:
   - **Stability:** 0.4-0.6 (natural variation)
   - **Similarity:** 0.7-0.8 (consistent but not robotic)
   - **Style:** 0.3-0.5 (for children's content)
4. Generate multiple takes, select best
5. Export individual clips (one per scene)

### Tips
- Record narration FIRST — it establishes timing for everything else
- For children's content: slightly slower pace, clear enunciation
- Label files consistently: `scene-01-narration.mp3`
- Note the duration of each clip — this determines scene length

### Outputs
- Audio files per scene
- Duration sheet (scene → seconds)

## Phase 3: Character & Scene Generation

### Tools: Stability AI, Leonardo, Neolemon, ComfyUI

### Character Consistency Strategy

**The critical rule: generate a reference image first, then use image-to-image
for every subsequent scene featuring that character.**

```
1. Character description → text-to-image → reference image
2. Reference image + scene prompt → image-to-image → scene still
3. Repeat step 2 for every scene with that character
```

### Steps
1. **Generate character references** (one per character)
   - Use detailed prompts with art style, colors, features
   - Generate 5-10 variations, pick the best
   - Save as canonical reference
2. **Generate backgrounds** (one per scene/location)
   - Consistent art style across all backgrounds
   - Include style keywords from character generation
3. **Compose scene stills** (character in scene)
   - Use image-to-image with character reference
   - Add scene-specific elements (props, other characters)
   - Ensure framing matches the planned camera angle

### Tool Selection
- **Stability AI:** Best for precise control, img2img, consistent style
- **Leonardo:** Best for stylized art, anime/cartoon aesthetics
- **Neolemon:** Best for maintaining character identity across poses
- **ComfyUI:** Best for custom workflows, local iteration

### Outputs
- Character reference images
- Scene still images (one per shot)

## Phase 4: Animation

### Tools: Runway, Kling AI, Luma

### The Golden Rule

**Always use image-to-video, NEVER text-to-video.**

Text-to-video cannot maintain character consistency across frames.
Always start from a generated still image (Phase 3) and animate it.

### Steps
1. Take each scene still from Phase 3
2. Feed into Runway image-to-video with motion prompt
3. Generate 4-10 second clips per scene
4. For longer scenes, chain multiple clips
5. Review and regenerate failed clips

### Motion Prompts
Keep motion descriptions simple and physical:
- "character slowly waves hand and smiles"
- "gentle camera pan from left to right"
- "character turns head to look at viewer"
- "leaves gently blowing in the wind"

Avoid complex or abstract motion prompts — they produce unpredictable results.

### Tool Selection
- **Runway Gen-3 Alpha:** Highest quality, 4s default / 10s extended
- **Kling AI:** Better for longer sequences, more complex motion
- **Luma Dream Machine:** Best for smooth camera movements, cinematic feel

### Outputs
- Animated clips per scene (MP4)

## Phase 5: Compositing

### Tool: DaVinci Resolve MCP

### Steps
1. Create project with correct resolution/framerate (1080p/30fps or 4K)
2. Import all animated clips and narration audio
3. Arrange on timeline:
   - Video track: animated clips in scene order
   - Audio track 1: narration aligned to video
   - Audio track 2: background music (from Suno)
   - Audio track 3: sound effects (optional)
4. Add transitions between scenes (cross-dissolve, fade)
5. Add text overlays (letters, words for ABC video)
6. Color grade for consistency across all scenes
7. Audio mix: narration prominent, music at -12dB to -18dB
8. Export: H.264/H.265, 1080p minimum

### Outputs
- Final video file (MP4)

## Project File Structure

```
project/
├── script/
│   ├── script.md           # Full script with narration text
│   ├── characters.md       # Character descriptions
│   └── shot-list.md        # Scene × tool × cost breakdown
├── audio/
│   ├── narration/
│   │   ├── scene-01.mp3
│   │   └── ...
│   └── music/
│       └── background.mp3
├── images/
│   ├── characters/          # Reference images
│   │   ├── char-01-ref.png
│   │   └── ...
│   ├── backgrounds/         # Background images
│   └── scenes/              # Composed scene stills
│       ├── scene-01.png
│       └── ...
├── video/
│   ├── clips/               # Animated clips
│   │   ├── scene-01.mp4
│   │   └── ...
│   └── final/
│       └── output.mp4
└── resolve/                  # DaVinci Resolve project files
```
