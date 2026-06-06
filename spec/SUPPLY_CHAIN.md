# Supply-Chain Pins

> Tracks the pinned digests of base Docker images that
> `openclaw-elixir-base` builds against. The pin is to a
> content-addressable digest, not a floating tag, so the build is
> reproducible and immune to upstream image re-pushes or silent rebuilds.

## Current Pins

| Component | Version label | Digest | Source |
|---|---|---|---|
| `elixir:1.18-alpine` | Elixir 1.18 (alpine) | `sha256:b85cfdf95ae690ba1c194a8286ee280c0ebaddba824e827dfc1721e1ab318744` | `docker pull elixir:1.18-alpine` + `docker images --digests elixir:1.18-alpine` |

> The version label is human-readable; the digest is the integrity guarantee.
> The digest in the `Dockerfile` and the value recorded here must always match.

## Where the Pins Live in the Code

| File | Line(s) | What it pins |
|---|---|---|
| `Dockerfile` | line 2 `FROM` (builder) | `elixir:1.18-alpine` digest |

## Bump Procedure

For each pin: `docker pull` + `docker images --digests` to discover the new digest, update the `FROM` line in the `Dockerfile`, update the **Current Pins** table, add a row to the **History** table. PR title: `chore(supply-chain): bump <image>:<tag> digest`.

## Pre-Merge Checklist

- [ ] `docker build -t elixir-base:pin-test .` succeeds locally.
- [ ] `spec/SUPPLY_CHAIN.md` is updated and committed in the **same** PR.

## Out of Scope (for this file)

- `openclaw-shared-base` SHA pin: not consumed by this repo's Dockerfiles (the
  Elixir base library, not an agent). The Wave 2 `openclaw-shared-base`
  v0.2.0/v0.2.1 fleet-wide pin wave is tracked in
  `r3dlex/openclaw-gitrepo-agent/spec/SUPPLY_CHAIN.md`.

## History

| Date | Component | Old pin | New pin | PR |
|---|---|---|---|---|
| 2026-06-06 | `elixir:1.18-alpine` | floating tag | `sha256:b85cfdf95ae690ba1c194a8286ee280c0ebaddba824e827dfc1721e1ab318744` | (initial pin PR) |

## Cross-Repo Coordination

> The authoritative cross-repo pin table for the Openclaw fleet
> lives in `r3dlex/openclaw-gitrepo-agent/spec/SUPPLY_CHAIN.md` (the
> "Cross-Repo Coordination" section). This file mirrors that table —
> do not edit the rows here directly; bump the table in gitrepo and
> follow up with a mirroring commit in this repo.
