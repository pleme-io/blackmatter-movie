# Service Matrix — AI Video Production Tools

Feature comparison across all supported production services.

## Image Generation

| Feature | Stability AI | Leonardo AI | Ideogram | Neolemon | ComfyUI |
|---------|-------------|-------------|----------|----------|---------|
| **MCP Server** | `stability-ai` | `leonardo` | `ideogram` | `neolemon` | `comfyui` |
| **Phase** | 1 | 2 | 3 | 3 | 2 |
| **Text-to-Image** | Excellent | Excellent | Excellent | Good | Excellent |
| **Image-to-Image** | Excellent | Good | Good | N/A | Excellent |
| **Character Consistency** | Medium | Medium | Low | Excellent | High (workflows) |
| **Text in Image** | Poor | Medium | Excellent | Poor | Medium |
| **Art Style Range** | Wide | Wide (stylized) | Medium | Focused | Unlimited |
| **API Quality** | Excellent | Good | Good | Limited | Local |
| **Cost Model** | Per-generation | Credits/month | Credits/month | Per-generation | Free (GPU) |
| **Best For** | Precise control | Stylized art | Typography | Same character | Custom workflows |

### Recommended Combinations
- **Character creation:** Stability AI (initial reference) + Neolemon (consistency)
- **Scene composition:** Stability AI img2img (character + background)
- **Title cards:** Ideogram (text-in-image)
- **Experimentation:** ComfyUI (iterate locally before paid APIs)

## Video Generation

| Feature | Runway | Kling AI | Luma | Minimax |
|---------|--------|----------|------|---------|
| **MCP Server** | `runway` | `kling-ai` | `luma` | `minimax` |
| **Phase** | 1 | 2 | 2 | 2 |
| **Image-to-Video** | Excellent | Good | Good | Medium |
| **Text-to-Video** | Good | Good | Good | Medium |
| **Max Duration** | 10s (Gen-3) | 10s | 5s | 6s |
| **Motion Quality** | Excellent | Good | Excellent | Medium |
| **Character Fidelity** | High | Medium | Medium | Low |
| **Camera Control** | Good | Medium | Excellent | Low |
| **Resolution** | 1080p | 1080p | 1080p | 720p |
| **Cost Model** | Credits/month | Credits/month | Credits/month | Credits/month |
| **Best For** | Primary animation | Long sequences | Camera motion | Video + music |

### Recommended Usage
- **Primary pipeline:** Runway Gen-3 Alpha (highest quality image-to-video)
- **Complex motion:** Kling AI (better for character movement)
- **Cinematic shots:** Luma (smooth camera movements)
- **Combined output:** Minimax (video + music in one generation)

## Voice & Audio

| Feature | ElevenLabs | Suno |
|---------|------------|------|
| **MCP Server** | `elevenlabs` | (web only) |
| **Phase** | 1 | Manual |
| **Voice Synthesis** | Excellent | N/A |
| **Voice Cloning** | Excellent | N/A |
| **Music Generation** | N/A | Excellent |
| **API Available** | Yes | No (web UI) |
| **Children's Content** | Excellent | Good |
| **Cost Model** | Per-character | Monthly sub |
| **Best For** | Narration, dialogue | Background music |

## Editing & Compositing

| Feature | DaVinci Resolve |
|---------|----------------|
| **MCP Server** | `davinci-resolve` |
| **Phase** | 1 |
| **Timeline Editing** | Excellent |
| **Color Grading** | Excellent |
| **Audio Mixing** | Excellent |
| **Text Overlays** | Excellent |
| **Export Formats** | All major |
| **Cost** | Free |
| **Best For** | Final assembly |

## Quality Ratings (1-5)

| Service | Output Quality | Consistency | Ease of Use | API Maturity |
|---------|---------------|-------------|-------------|--------------|
| ElevenLabs | 5 | 5 | 5 | 5 |
| Runway | 5 | 4 | 4 | 4 |
| Stability AI | 4 | 4 | 5 | 5 |
| Leonardo AI | 4 | 3 | 4 | 3 |
| Kling AI | 4 | 3 | 3 | 3 |
| Luma | 4 | 3 | 4 | 3 |
| Neolemon | 4 | 5 | 3 | 2 |
| Ideogram | 4 | 3 | 4 | 3 |
| ComfyUI | 5 | 5 | 2 | N/A (local) |
| Minimax | 3 | 2 | 3 | 3 |
| DaVinci Resolve | 5 | 5 | 3 | 3 |
| Suno | 4 | 3 | 5 | 1 (none) |
