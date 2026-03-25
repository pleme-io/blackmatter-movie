---
name: movie-production
description: AI video production pipeline — tool selection, cost awareness, character consistency, multi-step workflow orchestration
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
metadata:
  version: "1.0.0"
  last_verified: "2026-03-25"
  domain_keywords:
    - video production
    - animation
    - voice synthesis
    - image generation
    - character consistency
    - compositing
    - children's content
---

# AI Video Production Pipeline

Orchestrate AI-powered video production using multiple MCP services.
This skill teaches you the production workflow, tool selection, cost
awareness, and character consistency strategies.

## Available MCP Tools by Category

### Voice & Audio
| Tool | MCP Server | Best For | Cost Model |
|------|------------|----------|------------|
| ElevenLabs | `elevenlabs` | Voice synthesis, cloning, narration | Per character |
| Suno | (web only) | Music, background scores | Monthly sub |

### Image Generation (Character Stills)
| Tool | MCP Server | Best For | Cost Model |
|------|------------|----------|------------|
| Stability AI | `stability-ai` | SDXL/SD3, fine control, img2img | Per generation |
| Leonardo AI | `leonardo` | Stylized art, character design | Credits/month |
| Ideogram | `ideogram` | Text-in-image, typography | Credits/month |
| Neolemon | `neolemon` | Consistent characters across scenes | Per generation |
| ComfyUI | `comfyui` | Custom workflows, local GPU | Free (GPU cost) |

### Video Generation (Animation)
| Tool | MCP Server | Best For | Cost Model |
|------|------------|----------|------------|
| Runway | `runway` | Gen-3 Alpha, image-to-video | Credits/month |
| Luma | `luma` | Dream Machine, smooth motion | Credits/month |
| Kling AI | `kling-ai` | Long-form, character motion | Credits/month |
| Minimax | `minimax` | Video + music combined | Credits/month |

### Editing & Compositing
| Tool | MCP Server | Best For | Cost Model |
|------|------------|----------|------------|
| DaVinci Resolve | `davinci-resolve` | Timeline editing, color, export | Free |

## Five-Phase Production Pipeline

### Phase 1: Pre-Production (Script & Planning)
1. Write the script with narration text, scene descriptions, timing
2. Design character sheets (descriptions for consistent generation)
3. Plan scene breakdown: which shots, which tools, estimated costs
4. Create a storyboard document

**Output:** Script document, character descriptions, shot list

### Phase 2: Voice Recording
1. Use ElevenLabs to generate narration for each scene
2. Clone or select voices matching character personalities
3. Export individual audio clips per scene/line
4. Time the narration to establish scene durations

**Key workflow:**
```
Script text → ElevenLabs voice synthesis → .mp3 per scene
```

**Tips:**
- Generate multiple takes and pick the best
- Use voice settings: stability ~0.5, similarity ~0.75 for natural delivery
- For children's content: slightly higher pitch, slower pace, clear enunciation

### Phase 3: Character & Scene Generation
1. Generate character reference images using Stability AI or Leonardo
2. For consistent characters across scenes: use Neolemon or image-to-image
3. Generate background environments separately
4. Create scene compositions (character + background)

**Character consistency strategy:**
```
Character description → Neolemon/Stability AI → reference image
Reference image + scene prompt → image-to-image → scene still
```

**CRITICAL: Use image-to-video, NOT text-to-video for animation.**
Text-to-video cannot maintain character consistency. Always start from
a generated still image, then animate it.

### Phase 4: Animation
1. Take scene still images from Phase 3
2. Feed each into Runway (image-to-video) for 4-10 second clips
3. For longer scenes, chain multiple generations
4. Alternative: use Kling AI for more complex motion

**Key workflow:**
```
Scene still → Runway image-to-video → 4-10s animated clip
Multiple clips → chain for longer scenes
```

**Tips:**
- Runway Gen-3 Alpha: best quality for short clips (4s default, 10s extended)
- Kling: better for longer sequences with more motion
- Luma: good for camera movement and smooth transitions
- Keep motion prompts simple: "gentle movement", "slow pan", "character waves"

### Phase 5: Compositing & Export
1. Import all clips into DaVinci Resolve timeline
2. Sync with narration audio from Phase 2
3. Add transitions, text overlays, music
4. Color grade for consistency across scenes
5. Export final video

**Key workflow:**
```
Animated clips + narration audio + music → DaVinci Resolve → final video
```

## Cost-Aware Production

### Budget Tiers

| Tier | Monthly Cost | Strategy |
|------|-------------|----------|
| Minimal | $60-80 | ElevenLabs Creator + Runway Pro + Stability AI API |
| Recommended | $150-200 | Add Luma + Leonardo + Kling for variety |
| Premium | $300-500 | All services, maximum generation volume |

### Cost Optimization Tips
- Generate character references ONCE, reuse via image-to-image
- Batch voice generation (fewer API calls)
- Use ComfyUI for iterative experimentation (free with local GPU)
- Runway: 4s clips are cheaper than 10s — chain if needed
- Stability AI API is pay-per-use — good for controlled volume

## Inclusion Theme (ABC Video Project)

When generating diverse characters for the ABC video:
- Each letter features a character representing a different background
- Explicitly describe skin tones, hair textures, clothing styles in prompts
- Use character descriptions like: "a girl with dark brown skin and natural
  curly hair wearing a colorful hijab" — be specific and celebratory
- Avoid stereotypes — characters should be individuals, not archetypes
- Mix abilities: include characters with visible disabilities naturally
- Include family structures: single parents, grandparents, same-sex parents

## Tool Selection Decision Tree

```
Need voice/narration?
  → ElevenLabs

Need a character still (first time)?
  → Stability AI (precise control) or Leonardo (stylized)

Need same character in new pose/scene?
  → Neolemon (consistent character) or image-to-image with reference

Need to animate a still image?
  → Runway (short, high quality)
  → Kling (longer, more motion)
  → Luma (camera movement)

Need text/typography in image?
  → Ideogram

Need background music?
  → Suno (web UI) or Minimax

Need to edit/composite final video?
  → DaVinci Resolve
```

## Common Pitfalls

1. **Text-to-video for characters** — Never. Always image-to-video for consistency.
2. **Skipping reference images** — Create character sheets first, saves credits later.
3. **Over-generating** — Plan shots carefully, each generation costs money.
4. **Ignoring audio timing** — Record narration first, it sets the pace for everything.
5. **Long video clips** — AI video gen works best at 4-10 seconds. Chain clips.
