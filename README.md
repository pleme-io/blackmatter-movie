# blackmatter-movie

AI video production MCP infrastructure for Claude Code. Provides MCP servers
for image generation, video generation, voice synthesis, and video editing —
orchestrated conversationally through Claude.

## What This Does

Declares MCP servers for 12 AI production services and deploys them via
[blackmatter-anvil](https://github.com/pleme-io/blackmatter-anvil) to the
`claude-movie` context. Claude can then orchestrate the entire video production
pipeline: script writing, voice recording, character generation, animation,
and compositing.

## Prerequisites

- [nix](https://nixos.org/) with flakes enabled
- [home-manager](https://github.com/nix-community/home-manager)
- [blackmatter-anvil](https://github.com/pleme-io/blackmatter-anvil) configured
- API keys for desired services (see below)

## Quick Start

Add to your flake inputs:

```nix
blackmatter-movie = {
  url = "github:pleme-io/blackmatter-movie";
  inputs.nixpkgs.follows = "nixpkgs";
  inputs.substrate.follows = "substrate";
};
```

Add to home-manager shared modules:

```nix
inputs.blackmatter-movie.homeManagerModules.default
```

Enable in your home-manager config:

```nix
blackmatter.components.movie = {
  enable = true;
  skills.enable = true;
};
```

## API Keys Required

| Service | Where to Get | Tier 1? |
|---------|-------------|---------|
| ElevenLabs | [elevenlabs.io/app](https://elevenlabs.io/app) | Yes |
| Runway | [runwayml.com](https://runwayml.com) | Yes |
| Stability AI | [platform.stability.ai](https://platform.stability.ai) | Yes |
| DaVinci Resolve | Free download — no key needed | Yes |
| Kling AI | [klingai.com](https://klingai.com) | No |
| Minimax | [minimaxi.com](https://minimaxi.com) | No |
| Luma | [lumalabs.ai](https://lumalabs.ai) | No |
| Leonardo | [leonardo.ai](https://leonardo.ai) | No |

Store API keys as SOPS secrets under `movie/<service>/api-key` in your
nix repo's `secrets.yaml`. They deploy to `~/.config/movie/<service>/api-key`.

## License

MIT
