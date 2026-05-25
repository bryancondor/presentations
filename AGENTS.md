# Context Engineering Meetup — AI Agent Context

> This file is the root context for AI agents (Claude, Cursor, Copilot, etc.) working on this Slidev project.
> Read this first. It contains hard-won lessons from a previous session that will save you from repeating bugs.

---

## What this project is

Slidev source for the meetup talk **"Beyond the Vibe: Usando Context Engineering para llevar flujos agénticos a producción"** by **Bryan Condor** (Software Engineer @ Addi).

- **Duration:** 30 min
- **Audience:** software engineers in Spanish-speaking meetup (Lima/LatAm). Mixed maturity in Gen AI/LLM (some in prototypes, some in production). Comfortable with English technical text.
- **Language:** Spanish (Peruvian/Latin neutral — **NO voseo**). Author quotes in English with attribution.
- **Single takeaway:** *"Vibe coding para empezar. Context engineering para escalar."*
- **Hook (anunciado):** *"El vibe-coding es increíble para prototipar… pero el verdadero reto surge cuando esa magia debe enfrentar la complejidad y las reglas del mundo real."*

---

## Versions

| File | Status | Slides | Notes |
|---|---|---:|---|
| `slides.md` | **V2 oficial** (current) | 29 | Focus en estándares, arquitectura comparada, ejemplos verbatim de bank-pro, cierre con feedback form. |
| `slides-v0.md` | V1 archivado | 33 | Primera versión basada en 6 grupos topic-por-topic. Conservada para referencia. |
| `slides.md.bak` | Backup descartable | — | Backup del voseo fix script. Borrable. |

**Run commands:**

```bash
npm run dev                              # V2 oficial → http://localhost:3030
npx slidev slides-v0.md --port 3032      # V1 archivado (referencia)
```

---

## ⚠ CRITICAL technical gotchas

Hit any of these and your slide breaks. Read carefully.

### 1. NEVER use `<img src="/path">` directly

Vue SFC compiler converts `<img src="/path">` to a static JS import. Vite's `fs.allow` then blocks it:

```
[slidev] Import "/path.png" from slide Markdown resolves outside of Vite server.fs.allow
```

**Markdown image syntax `![alt](/path)` has the same bug** — it compiles to the broken `<img>`.

**Fix — always use Vue dynamic binding:**

```html
<img :src="`/path.png`" alt="..." class="..." />
```

The `:src` (shorthand for `v-bind:src`) is a runtime expression, NOT a compile-time import. All images in this project use this pattern.

### 2. NEVER put `---` on a line by itself inside code blocks

Slidev splits slides on `^---$` BEFORE processing code fences. If a code block contains `---` (typical for YAML frontmatter), Slidev breaks the slide there and cascading layout errors follow.

**Fix:** show YAML content without the `---` delimiters:

```text
name: tdd
description: ...
allowed-tools: Read Glob Grep
```

### 3. NEVER use `<word-with-dash>` inside code blocks

Vue compiler treats `<change-id>`, `<api-version>`, etc. as custom HTML elements requiring closing tags. Even inside fenced code blocks, Vue's SFC processor parses them and errors with "Element is missing end tag."

**Use placeholders instead:**
- ✅ `[change-id]`
- ✅ `{placeholder}`
- ✅ `<PLACEHOLDER>` (uppercase — Vue ignores)
- ❌ `<change-id>` (breaks)

### 4. `<pre>` blocks break on blank lines (CommonMark spec)

HTML blocks (type 6) end on a blank line. If a `<pre>` contains content with blank lines, markdown-it re-engages and parses `## Heading` inside as actual H2 (huge rendered text).

**Fix:** use fenced code blocks (```` ```text ````) instead of `<pre>` tags. Fenced blocks treat content literally until the closing fence.

### 5. Spanish: NO voseo

The speaker is Peruvian. Argentine voseo (vos/tenés/podés/decís/hacés/escribí/mostrá) sounds wrong for Lima/LatAm audience.

**Always use:** tú / tienes / puedes / dices / haces / escribe / muestra.

A `fix-voseo.sh` perl script in the project root converts ~90 voseo patterns to neutral Spanish:

```bash
bash fix-voseo.sh
```

It creates `.bak` files first. Review the diff before deleting backups.

Full mapping table at: `~/.claude/projects/-Users-bcondor-bcd-bcd-vault-agent-brain/memory/feedback_spanish_latin_no_voseo.md`

---

## Project structure

```
context-engineering-meetup/
├── AGENTS.md            ← this file
├── README.md            ← human-facing intro
├── slides.md            ← V2 oficial
├── slides-v0.md         ← V1 archivado
├── package.json
├── fix-voseo.sh         ← perl script: voseo → tú-form
├── .gitignore
└── public/
    ├── context-window-basic.png       ← Anthropic docs (slide 8)
    ├── context-window-with-tools.png  ← Anthropic docs (slide 9)
    ├── ce-scope.png                   ← Dex Horthy graphic (slide 11)
    ├── bryan-condor.png               ← Speaker photo (slide 27)
    ├── feedback-qr.png                ← QR → Google Form
    └── linkedin-qr.png                ← QR → LinkedIn (V0 only, unused in V2)
```

---

## V2 deck structure (29 slides)

| Range | Theme | Slides |
|---|---|---|
| 1-7 | Opening (cover + vibe coding pros/cons + greenfield/brownfield + failure modes) | 7 |
| 8-12 | CE foundation (context window + definiciones + Venn + prompt vs CE) | 5 |
| 13-16 | Standards (intro + AGENTS.md + SKILL.md + Memory Bank) | 4 |
| 17-19 | Architecture (sin CE + con CE + juntas) | 3 |
| 20-23 | Examples (AGENTS.md por dentro + 9 inventario + SKILL.md por dentro + 17 inventario) | 4 |
| 24-26 | Lecciones (standards/symlinks + compound + skills meta combo) | 3 |
| 27 | **Cierre QR** (frase + foto Bryan + feedback form QR) | 1 |
| 28-29 | Appendix Q&A (3 disciplinas Osmani + pildora harness) | 2 |

The talk **ends officially on slide 27**. Slides 28-29 are appendix accessible only if Q&A goes there. They're marked with a small "appendix · Q&A" badge in the top-right.

---

## Design conventions

- **Tufte-min aesthetic** — minimal text per slide, speaker carries narrative.
- **Quote highlights:** green = lo que el estándar promueve · red = lo que evita.
- **Color scheme:**
  - AGENTS.md → blue (`border-blue-500`, `text-blue-500`)
  - SKILL.md → purple (`border-purple-500`, `text-purple-500`)
  - Código + configs → gray (default opacity)
- **Author quotes** in English, narrator habla en español.
- **Attribution** discreet, right-aligned, `opacity-70` or `opacity-60`.
- **External resource links** compact: `↗ ver completo` (no `📄 Archivo completo: full-URL` — eso ocupa demasiado).
- **Layouts used:** `default`, `center`, `cover`. Avoid `two-cols` (causes title-in-left-column bug); use `grid grid-cols-2` manually instead.
- **NEVER underline links** in body text — use inline `style="text-decoration: none !important; border: none !important"` to override Slidev theme defaults.

---

## Related vault notes (decision history)

The full story of how this deck was designed lives in these vault notes:

- `~/bcd/bcd-vault/agent-brain/20-Drafts/authored/Context Engineering Presentation.md` — original brain dump
- `~/bcd/bcd-vault/agent-brain/20-Drafts/authored/Context Engineering Presentation - Refinado.md` — V0 structure
- `~/bcd/bcd-vault/agent-brain/20-Drafts/authored/Context Engineering Presentation - Speaker Notes.md` — V0 detailed speaker script
- `~/bcd/bcd-vault/agent-brain/20-Drafts/authored/Context Engineering Presentation - V2 Plan.md` — **V2 decisions (most useful for context)**
- `~/bcd/bcd-vault/agent-brain/20-Drafts/generated/claude-context-engineering-meetup-research.md` — synthesis of 21 sources (Karpathy, Schmid, Cherny, Manus, Breunig, Lopopolo, Horthy, etc.)
- `~/bcd/bcd-vault/agent-brain/20-Drafts/generated/claude-harness-engineering-meetup-research.md` — synthesis of 22 sources (Osmani, Hashimoto, harness ecosystem) — only used in appendix slides 28-29
- `~/bcd/bcd-vault/agent-brain/30-Knowledge/context-engineering-bankpro.md` — how bank-pro implements CE

---

## bank-pro project (the showcase)

The talk demonstrates context engineering using `~/bcd/project/bank-pro/` — Bryan's personal backend project that processes PDFs from LATAM banks.

Bank-pro is already aligned to the standards (`.agents/skills/`, AGENTS.md hierarchy).

**Files referenced verbatim in slides:**
- `~/bcd/project/bank-pro/AGENTS.md` — root entry point (slide 20)
- `~/bcd/project/bank-pro/.agents/skills/api/SKILL.md` — API skill example (slide 22)
- 17 skills total under `.agents/skills/`
- 9 AGENTS.md (root + 6 src subdomains + tests + examples)

**To regenerate the architecture map shown in slide 18:**

```bash
~/bcd/dotfiles/scripts/context-engineering-map ~/bcd/project/bank-pro
```

---

## Quotes used in the deck (verbatim)

These are anchored to specific slides. Don't change wording without checking source.

| Slide | Author | Quote (short) |
|---|---|---|
| 5 | Phil Schmid | *"Most agent failures are not model failures anymore, they are context failures."* |
| 10 | Andrej Karpathy | *"…delicate art and science of filling the context window…"* |
| 10 | Harrison Chase | *"…building dynamic systems to provide the right information and tools…"* |
| 12 | Harrison Chase | *"Prompt engineering is a subset of context engineering."* |
| 14 | Ryan Lopopolo (OpenAI Codex) | *"Instead of treating AGENTS.md as the encyclopedia, we treat it as the table of contents."* |
| 15 | agentskills.io spec | *"Full instructions load only when a task calls for them…"* |
| 29 (appendix) | Addy Osmani | *"Agent = Model + Harness. If you're not the model, you're the harness."* |
| 29 (appendix) | Addi Engineering | *"The most productive AI teams in 2026 spend more time building their harness than writing code."* |

Full quote bank with cross-references in `Context Engineering Presentation - Refinado.md`.

---

## Pending TODOs

- [ ] Rehearse 2 complete pass aloud
- [ ] Verify the 8 verbatim quotes against source files in `10-Sources/`
- [ ] Test `npm run export` → PDF
- [ ] Confirm feedback form structure (rating first, name optional, demographics added — per V2 Plan note)
- [ ] (Optional) Decide whether to keep appendix slides 28-29 or remove

---

## How future agents should work with this project

1. **Read this file first** (you're doing it ✓).
2. **Check the V2 Plan note** in the vault for full decision history before making structural changes.
3. **Edit `slides.md`** (V2 oficial). Do NOT touch `slides-v0.md` unless explicitly asked to restore something.
4. **Test changes** by checking `http://localhost:3030` after `npm run dev`.
5. **Watch for the 5 critical gotchas** above — they account for ~80% of bugs hit in the previous session.
6. **Run `fix-voseo.sh`** after adding any Spanish content to catch voseo slips.
7. **Update V2 Plan note** in the vault if making significant structural changes (new themes, removed slides, etc.).
8. **Images via `:src` binding** — never use raw `src=` for paths starting with `/`.
9. **Speak Spanish in Peruvian/Latin neutral** — no voseo, ever.
10. **Ask user before touching V0** or making non-trivial structural changes to V2.
