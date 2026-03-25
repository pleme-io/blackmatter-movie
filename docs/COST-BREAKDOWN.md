# Cost Breakdown — AI Video Production Services

Monthly costs for the video production pipeline. Prices as of March 2026.

## Per-Service Pricing

| Service | Plan | Monthly Cost | What You Get | Phase |
|---------|------|-------------|-------------|-------|
| ElevenLabs | Creator | $22 | 100K characters, 30 voice clones, API access | 1 |
| Runway | Pro | $28 | 625 credits (~2500s Gen-3 Alpha video) | 1 |
| Stability AI | API | ~$5-10 | Pay-per-use (~$0.03/image SDXL, ~$0.065/image SD3) | 1 |
| DaVinci Resolve | Free | $0 | Full editing suite (free tier sufficient) | 1 |
| Suno AI | Pro | $10 | 500 songs/month (web only — no API) | Manual |
| Luma | Plus | $30 | 400 generations/month Dream Machine | 2 |
| Leonardo AI | Artisan | $24 | 8500 tokens/month, all models | 2 |
| Kling AI | Standard | $10 | 660 credits/month, 5s/10s video | 2 |
| ComfyUI | Free + GPU | ~$10-60 | Free software, GPU compute cost varies | 2 |
| Minimax | Standard | $10 | Video + music generation | 2 |
| Neolemon | Creator | $29 | Consistent character generation (via Segmind) | 3 |
| Ideogram | Plus | $15 | 2000 generations/month, text-in-image | 3 |

## Budget Tiers

### Bare Minimum ($60-80/month)
For a single short video project with careful credit management.

| Service | Cost | Purpose |
|---------|------|---------|
| ElevenLabs Creator | $22 | Narration |
| Runway Pro | $28 | Animation (image-to-video) |
| Stability AI API | ~$10 | Character stills |
| **Total** | **~$60** | |

### Recommended ($150-200/month)
Full pipeline with service variety for quality optimization.

| Service | Cost | Purpose |
|---------|------|---------|
| ElevenLabs Creator | $22 | Narration |
| Runway Pro | $28 | Primary animation |
| Stability AI API | ~$10 | Stills, img2img |
| Luma Plus | $30 | Alternative animation |
| Leonardo Artisan | $24 | Stylized characters |
| Kling Standard | $10 | Long-form animation |
| Suno Pro | $10 | Background music |
| Neolemon Creator | $29 | Character consistency |
| **Total** | **~$163** | |

### Premium ($300-500/month)
Maximum generation volume, all services active, fast iteration.

All recommended services plus:
- Higher tiers on ElevenLabs ($99 Scale) and Runway ($76 Unlimited)
- Ideogram Plus ($15) for text-in-image
- ComfyUI with cloud GPU (~$60) for custom workflows
- Minimax Standard ($10) for combined video+music

## Cost Per Production Unit

Approximate costs for a single 30-second animated scene:

| Step | Service | Est. Cost |
|------|---------|----------|
| Narration (100 words) | ElevenLabs | ~$0.05 |
| Character still (5 attempts) | Stability AI | ~$0.15 |
| Background still (3 attempts) | Stability AI | ~$0.09 |
| Animation (3x 10s clips) | Runway | ~$3.00 |
| Compositing | DaVinci Resolve | $0.00 |
| **Total per scene** | | **~$3.30** |

For a 26-letter ABC video (~26 scenes): approximately **$85-100** in generation
costs on top of monthly subscriptions.

## Cost Optimization Strategies

1. **Generate character references once** — reuse via image-to-image for each scene
2. **Batch voice generation** — record all narration in one session (fewer API calls)
3. **Use ComfyUI for experimentation** — iterate locally before using paid APIs
4. **Runway 4s clips** — cheaper than 10s, chain multiple for longer scenes
5. **Stability AI API** — pay-per-use is cheaper than monthly plans for low volume
6. **Suno web UI** — music is the least iterative step, no need for API automation
