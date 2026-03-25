# blackmatter-movie

AI video production MCP infrastructure. Declares MCP servers for image generation,
video generation, voice synthesis, and video editing tools — all scoped to the
`claude-movie` context via anvil.

## Architecture

Type B blackmatter module: multi-service with skills, scoped MCP servers,
per-service enable toggles, and credential management.

```
blackmatter-movie (HM module)
  │
  ├── anvil.mcp.servers.elevenlabs     → uvx elevenlabs-mcp
  ├── anvil.mcp.servers.runway         → npx @runwayml/runway-api-mcp-server
  ├── anvil.mcp.servers.davinci-resolve → uvx davinci-resolve-mcp
  ├── anvil.mcp.servers.stability-ai   → npx mcp-server-stability-ai
  ├── anvil.mcp.servers.comfyui        → uvx comfyui-mcp-server
  ├── anvil.mcp.servers.kling-ai       → npx mcp-kling
  ├── anvil.mcp.servers.minimax        → uvx minimax-mcp-tools
  ├── anvil.mcp.servers.luma           → npx luma-mcp (Phase 2: mcp-forge)
  ├── anvil.mcp.servers.leonardo       → npx leonardo-mcp (Phase 2: mcp-forge)
  ├── anvil.mcp.servers.ideogram       → ideogram-mcp (Phase 3: thin wrapper)
  └── anvil.mcp.servers.neolemon       → neolemon-mcp (Phase 3: thin wrapper)
```

All servers use `scopes = ["movie"]` — they only appear in `claude-movie`.

## HM Module Options

```nix
blackmatter.components.movie = {
  enable = true;
  skills.enable = true;

  # Tier 1 (enabled by default)
  services.elevenlabs.enable = true;
  services.runway.enable = true;
  services.davinciResolve.enable = true;
  services.stabilityAi.enable = true;

  # Tier 2 (disabled by default — enable when ready)
  services.comfyui.enable = false;
  services.klingAi.enable = false;
  services.minimax.enable = false;
  services.luma.enable = false;
  services.leonardo.enable = false;

  # Tier 3 (disabled by default — needs custom MCP servers)
  services.ideogram.enable = false;
  services.neolemon.enable = false;
  services.suno.enable = false;  # No API — use web UI
};
```

## Credential Paths

All credentials under `~/.config/movie/<service>/api-key`:

| Service | Env Var | SOPS Key |
|---------|---------|----------|
| ElevenLabs | `ELEVENLABS_API_KEY` | `movie/elevenlabs/api-key` |
| Runway | `RUNWAYML_API_SECRET` | `movie/runway/api-key` |
| Stability AI | `STABILITY_API_KEY` | `movie/stability-ai/api-key` |
| Kling AI | `KLING_API_KEY` | `movie/kling/api-key` |
| Minimax | `MINIMAX_API_KEY` | `movie/minimax/api-key` |
| Luma | `LUMA_API_KEY` | `movie/luma/api-key` |
| Leonardo | `LEONARDO_API_KEY` | `movie/leonardo/api-key` |
| Ideogram | `IDEOGRAM_API_KEY` | `movie/ideogram/api-key` |
| Neolemon | `SEGMIND_API_KEY` | `movie/neolemon/api-key` |
| DaVinci Resolve | (none — local) | (none) |
| ComfyUI | `COMFYUI_URL` (static) | (none) |

## Phase Roadmap

### Phase 1 (Current): npx/uvx quickstart
- Tier 1 servers via community MCP packages (npx/uvx)
- Skills for production workflow
- claude-movie context wrapper

### Phase 2: mcp-forge servers + Tier 2
- Generate luma-mcp and leonardo-mcp via mcp-forge from OpenAPI specs
- Add ComfyUI, Kling AI, Minimax community servers
- Downgrade Luma OpenAPI spec 3.1.0 → 3.0.3

### Phase 3: Thin wrappers + polish
- Ideogram MCP wrapper (6 REST endpoints → kaname scaffold)
- Neolemon MCP wrapper (single Segmind endpoint)
- Skip Suno (no official API — use web UI for music)

## Cost Summary

| Tier | Monthly Cost | Services |
|------|-------------|----------|
| Minimal | $60-80 | ElevenLabs + Runway + Stability AI |
| Recommended | $150-200 | + Luma + Leonardo + Kling |
| Premium | $300-500 | All services at max tier |

See `docs/COST-BREAKDOWN.md` for detailed per-service pricing.

## Directory Structure

```
blackmatter-movie/
├── CLAUDE.md              # This file
├── README.md              # Public-facing docs
├── flake.nix              # HM module export + substrate skill helpers
├── module/
│   └── default.nix        # HM module: options, anvil registration, skills
├── skills/
│   └── movie-production/
│       └── SKILL.md       # Production pipeline skill for Claude
└── docs/
    ├── COST-BREAKDOWN.md  # Per-service pricing tiers
    ├── WORKFLOW-GUIDE.md  # Five-phase production pipeline
    └── SERVICE-MATRIX.md  # Feature comparison matrix
```
