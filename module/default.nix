# blackmatter-movie — AI video production MCP infrastructure
#
# Registers MCP servers for AI video production tools with anvil.
# Each service can be independently toggled. All servers use scope "movie"
# so they only appear in the claude-movie context.
#
# Tier 1 (Phase 1): elevenlabs, runway, davinci-resolve, stability-ai
# Tier 2 (Phase 2): comfyui, kling-ai, minimax, luma, leonardo
# Tier 3 (Phase 3): ideogram, neolemon, suno
{ skillHelpers }:
{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.components.movie;
  homeDir = config.home.homeDirectory;

  skills = skillHelpers.mkSkills {
    skillsDir = ../skills;
    extraSkills = cfg.skills.extraSkills;
  };
in {
  options.blackmatter.components.movie = {
    enable = mkEnableOption "AI video production MCP infrastructure";

    skills = skillHelpers.mkSkillOptions;

    services = {
      # ── Tier 1 (enabled by default) ──────────────────────────────
      elevenlabs.enable = mkOption {
        type = types.bool;
        default = true;
        description = "ElevenLabs voice synthesis MCP server.";
      };
      runway.enable = mkOption {
        type = types.bool;
        default = true;
        description = "Runway Gen-3 Alpha video generation MCP server.";
      };
      davinciResolve.enable = mkOption {
        type = types.bool;
        default = true;
        description = "DaVinci Resolve editing MCP server (local, no API key).";
      };
      stabilityAi.enable = mkOption {
        type = types.bool;
        default = true;
        description = "Stability AI image generation MCP server.";
      };

      # ── Tier 2 (disabled by default — Phase 2) ──────────────────
      comfyui.enable = mkOption {
        type = types.bool;
        default = false;
        description = "ComfyUI local workflow-based image generation MCP server.";
      };
      klingAi.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Kling AI video generation MCP server.";
      };
      minimax.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Minimax video and music generation MCP server.";
      };
      luma.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Luma Dream Machine video generation MCP server.";
      };
      leonardo.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Leonardo AI image generation MCP server.";
      };

      # ── Tier 3 (disabled by default — Phase 3) ──────────────────
      ideogram.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Ideogram text-in-image generation MCP server.";
      };
      neolemon.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Neolemon consistent character generation MCP server (via Segmind).";
      };
      suno.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Suno AI music generation (unofficial — use web UI instead).";
      };
    };
  };

  config = mkIf cfg.enable (mkMerge [
    # ── Skills deployment ────────────────────────────────────────
    (mkIf (cfg.skills.enable && skills.files != {}) {
      home.file = skills.homeFiles;
    })

    # ── Tier 1: ElevenLabs ───────────────────────────────────────
    (mkIf cfg.services.elevenlabs.enable {
      blackmatter.components.anvil.mcp.servers.elevenlabs = {
        command = "uvx";
        args = [ "elevenlabs-mcp" ];
        envFiles.ELEVENLABS_API_KEY = "${homeDir}/.config/movie/elevenlabs/api-key";
        description = "ElevenLabs voice synthesis and cloning";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 1: Runway ───────────────────────────────────────────
    (mkIf cfg.services.runway.enable {
      blackmatter.components.anvil.mcp.servers.runway = {
        command = "npx";
        args = [ "-y" "@addition-works/runway-mcp-server" ];
        envFiles.RUNWAYML_API_SECRET = "${homeDir}/.config/movie/runway/api-key";
        description = "Runway Gen-3 Alpha video generation";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 1: DaVinci Resolve ──────────────────────────────────
    (mkIf cfg.services.davinciResolve.enable {
      blackmatter.components.anvil.mcp.servers.davinci-resolve = {
        command = "uvx";
        args = [ "davinci-resolve-mcp" ];
        description = "DaVinci Resolve video editing and compositing";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 1: Stability AI ────────────────────────────────────
    (mkIf cfg.services.stabilityAi.enable {
      blackmatter.components.anvil.mcp.servers.stability-ai = {
        command = "npx";
        args = [ "-y" "mcp-server-stability-ai" ];
        envFiles.STABILITY_AI_API_KEY = "${homeDir}/.config/movie/stability-ai/api-key";
        description = "Stability AI image generation (SDXL, SD3)";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 2: ComfyUI ─────────────────────────────────────────
    (mkIf cfg.services.comfyui.enable {
      blackmatter.components.anvil.mcp.servers.comfyui = {
        command = "uvx";
        args = [ "comfyui-mcp-server" ];
        env.COMFYUI_URL = "http://localhost:8188";
        description = "ComfyUI local workflow-based image generation";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 2: Kling AI ────────────────────────────────────────
    (mkIf cfg.services.klingAi.enable {
      blackmatter.components.anvil.mcp.servers.kling-ai = {
        command = "npx";
        args = [ "-y" "mcp-kling" ];
        envFiles.KLING_API_KEY = "${homeDir}/.config/movie/kling/api-key";
        description = "Kling AI video generation";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 2: Minimax ─────────────────────────────────────────
    (mkIf cfg.services.minimax.enable {
      blackmatter.components.anvil.mcp.servers.minimax = {
        command = "uvx";
        args = [ "minimax-mcp-tools" ];
        envFiles.MINIMAX_API_KEY = "${homeDir}/.config/movie/minimax/api-key";
        description = "Minimax video and music generation";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 2: Luma ────────────────────────────────────────────
    (mkIf cfg.services.luma.enable {
      blackmatter.components.anvil.mcp.servers.luma = {
        command = "npx";
        args = [ "-y" "luma-mcp" ];
        envFiles.LUMA_API_KEY = "${homeDir}/.config/movie/luma/api-key";
        description = "Luma Dream Machine video generation";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 2: Leonardo ────────────────────────────────────────
    (mkIf cfg.services.leonardo.enable {
      blackmatter.components.anvil.mcp.servers.leonardo = {
        command = "npx";
        args = [ "-y" "leonardo-mcp" ];
        envFiles.LEONARDO_API_KEY = "${homeDir}/.config/movie/leonardo/api-key";
        description = "Leonardo AI image generation";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 3: Ideogram ────────────────────────────────────────
    (mkIf cfg.services.ideogram.enable {
      blackmatter.components.anvil.mcp.servers.ideogram = {
        command = "ideogram-mcp";
        envFiles.IDEOGRAM_API_KEY = "${homeDir}/.config/movie/ideogram/api-key";
        description = "Ideogram text-in-image generation";
        scopes = [ "movie" ];
      };
    })

    # ── Tier 3: Neolemon ────────────────────────────────────────
    (mkIf cfg.services.neolemon.enable {
      blackmatter.components.anvil.mcp.servers.neolemon = {
        command = "neolemon-mcp";
        envFiles.SEGMIND_API_KEY = "${homeDir}/.config/movie/neolemon/api-key";
        description = "Neolemon consistent character generation (via Segmind)";
        scopes = [ "movie" ];
      };
    })
  ]);
}
