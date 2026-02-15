---
title: I built a production ops dashboard for a one-person company
date: 2026-02-15
tags: devops, tooling, ai, cloudflare, sentry, railway
description: When you're the only engineer, you can't afford to check three dashboards every morning. So I built a single CLI command that checks everything for me.
---

## Working Title
`pic ops status` — An Ops Dashboard for One

## Hook (1-2 paragraphs)
I run a one-person software company. I have a Hono API on Railway, a Lit frontend behind Cloudflare, error tracking in Sentry, and a Supabase database. That's four dashboards to check when something breaks. At 3 AM, when my phone buzzes with a Sentry alert, I don't want to log into three different web UIs to figure out what happened.

So I built a CLI that gives me the full picture in one command. Then I taught my AI agent how to use it. Now when I say "how's production?", the agent checks Sentry for errors, Railway for service health, and Cloudflare for CDN performance — and tells me what actually needs my attention.

## Key Beats
1. **The problem: dashboard fatigue for solo devs** — Big companies have on-call rotations and Datadog. I have a MacBook and too many browser tabs. The cost of context-switching between Sentry, Railway, and Cloudflare isn't the time — it's the cognitive overhead of correlating information across them. Is this 522 error in Cloudflare related to that Railway redeploy? Is the Sentry alert from production or dev?

2. **One command to rule them all** — Show `pic ops status` output. Sentry errors, Railway service health, Cloudflare cache rates and request counts — all in one terminal output. The key design choice: production-first. Dev issues are dimmed or hidden. When I'm triaging at 6 AM, I don't need noise from my localhost experiments.

3. **The AI as the on-call engineer** — The real payoff isn't the CLI — it's that the AI agent can call these tools. I registered `ops_status`, `sentry_triage`, `railway_logs`, and `cloudflare_review` as tools the LLM can invoke. So instead of me reading logs, I say "check the specs logs for errors" and it actually does it. Show the real interaction where the agent found the `idx_page_tags_unique` error, traced it through Sentry, and I fixed it in the same conversation.

4. **The Cloudflare surprise** — I expected my CDN review to find a misconfiguration. Instead it found that my cache hit rate was 2% — which sounds terrible until you realize why. Low-traffic sites have cold caches at every Cloudflare PoP worldwide. The real finding was that my precon frontend wasn't even going through Cloudflare at all (DNS-only mode). One toggle fixed it. Show the before/after of `pic ops cf review`.

5. **Multi-account support was the real yak shave** — My personal site and my business are on different Cloudflare accounts. This forced a better design: per-project secrets in macOS Keychain, with automatic resolution based on which directory you're in. `cd ~/Biz/untitled1` uses the business token. `cd ~/Code/homepage` uses the personal one. Same command, different context.

## The Money Quote
```
  🔭 Ops Status
  ══════════════════════════════════════════════════════════════════════
  ✓ Sentry: All clear — no unresolved issues
  ✓ Railway: precon — 2 services up (specs, lit-web)
  ✓ Cloudflare: elcsc.com — 821 reqs yesterday, 0% cached
  - Supabase: (coming soon)
```
Three services. One command. Zero browser tabs.

## Closing Angle
You don't need a $500/month observability platform when you're a team of one. A few hundred lines of TypeScript, some REST API calls, and a macOS Keychain is enough to build something that actually fits how solo devs work. The trick isn't monitoring everything — it's having an opinionated view of what matters. Production errors first. Performance regressions second. Everything else can wait until after coffee.

## Artifacts to Include
- `pic ops status` output (the hero screenshot)
- `pic ops cf review` showing the CDN findings with actionable recommendations
- `pic ops railway logs -s specs` showing the clean filtered output vs raw noise
- The Sentry → fix flow: triage found SPECS-N → agent investigated → `ON CONFLICT` fix → resolved
- Architecture snippet: how the pi extension delegates to CLI (`sentry-ops.ts` registering tools)
- The per-project Keychain resolution diagram (cwd → project → token)
