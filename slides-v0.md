---
theme: default
title: Context Engineering — Beyond the Vibe
info: |
  ## Beyond the Vibe
  Usando Context Engineering para llevar flujos agénticos a producción.

  Bryan Condor · Software Engineer @ Addi · Meetup 2026
highlighter: shiki
drawings:
  persist: false
mdc: true
---

<!-- Slide 1.1 — Cover -->

# Context Engineering

<div class="text-3xl mt-4 opacity-90">
Beyond the Vibe
</div>

<div class="mt-12 text-lg opacity-80 max-w-2xl mx-auto leading-relaxed">
Usando context engineering para llevar flujos agénticos a producción
</div>

<div class="absolute bottom-12 left-0 right-0 text-center text-base opacity-70">
Bryan Condor · Software Engineer @ Addi<br/>
<span class="text-sm opacity-60">Meetup · Mayo 2026</span>
</div>

---
layout: center
class: text-center
---

<!-- Slide 1.2 — Anécdota -->

<div class="text-7xl font-bold">
Vibe coding.
</div>

<div class="text-5xl mt-8 opacity-70 italic">
Hasta que…
</div>

---
layout: center
class: text-center
---

<!-- Slide 1.3 — Statement: no fue el modelo -->

<div class="text-5xl font-bold leading-tight">
No fue el modelo.
</div>

<div class="text-5xl font-bold mt-6 leading-tight">
Fue el <span class="text-red-500">contexto</span> que le di.
</div>

---
layout: center
---

<!-- Slide 2.1 — Quote Schmid -->

<div class="text-3xl italic leading-relaxed max-w-4xl">
"Most agent failures are not model failures anymore, they are <span class="text-red-500 font-semibold not-italic">context failures</span>."
</div>

<div class="text-right mt-12 text-base opacity-80">
— <strong>Phil Schmid</strong><br/>
<span class="text-sm opacity-60">2025</span>
</div>

---

<!-- Slide 2.2 — 4 failure modes (Breunig) -->

# Cuatro formas en que tu contexto falla

<div class="grid grid-cols-2 gap-8 mt-12">

<div class="border-l-4 border-red-500 pl-6">
  <div class="text-2xl font-bold">POISONING</div>
  <div class="text-lg mt-3 opacity-80">La alucinación que se autoreferencia sesión tras sesión</div>
</div>

<div class="border-l-4 border-orange-500 pl-6">
  <div class="text-2xl font-bold">DISTRACTION</div>
  <div class="text-lg mt-3 opacity-80">Demasiado contexto: el modelo se pierde en él</div>
</div>

<div class="border-l-4 border-yellow-500 pl-6">
  <div class="text-2xl font-bold">CONFUSION</div>
  <div class="text-lg mt-3 opacity-80">El "por si acaso" que degrada la respuesta</div>
</div>

<div class="border-l-4 border-blue-500 pl-6">
  <div class="text-2xl font-bold">CLASH</div>
  <div class="text-lg mt-3 opacity-80">Tu spec dice X, tu código hace Y</div>
</div>

</div>

<div class="text-right mt-12 text-sm opacity-60">
— Drew Breunig · 2025-06
</div>

---
layout: center
class: text-center
---

<!-- Slide 2.3 — Pregunta retórica -->

<div class="text-5xl font-bold leading-relaxed">
¿Cuántos de estos<br/>
han visto en sus<br/>
<span class="text-red-500">propios agentes</span>?
</div>

---
layout: default
---

<!-- Slide 3.1 — Dual definition Karpathy + Chase -->

# Dos definiciones

<div class="grid grid-cols-2 gap-12 mt-8">

<div>

<div class="text-base italic leading-relaxed">
"Context engineering is the <span class="font-semibold not-italic">delicate art and science</span> of filling the context window with just the right information for the next step."
</div>

<div class="text-right mt-6 text-sm">
— <strong>Andrej Karpathy</strong><br/>
<span class="text-xs opacity-60">2025-06-25</span>
</div>

<div class="text-center mt-8 text-sm opacity-60 italic">
(poética)
</div>

</div>

<div>

<div class="text-base italic leading-relaxed">
"Context engineering is <span class="font-semibold not-italic">building dynamic systems</span> to provide the right information and tools in the right format such that the LLM can plausibly accomplish the task."
</div>

<div class="text-right mt-6 text-sm">
— <strong>Harrison Chase</strong> · LangChain<br/>
<span class="text-xs opacity-60">2025-06-23</span>
</div>

<div class="text-center mt-8 text-sm opacity-60 italic">
(operacional)
</div>

</div>

</div>

---
layout: default
---

<!-- Slide 3.2 — Venn diagram (centerpiece) -->

<div class="text-center text-2xl font-bold mt-2">Context Engineering</div>
<div class="text-center text-sm opacity-70 mt-1">¿Qué cabe adentro del context window?</div>

<div class="flex justify-center mt-4">
<svg width="720" height="430" viewBox="0 0 1000 600" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg">
  <!-- Big CE circle (background) -->
  <circle cx="560" cy="320" r="270" fill="#b3d4ff" fill-opacity="0.4" stroke="#5a8dff" stroke-width="2"/>

  <!-- Structured Outputs (partial outside CE) -->
  <ellipse cx="265" cy="370" rx="90" ry="105" fill="#ffd6a5" fill-opacity="0.6" stroke="#e89c5e" stroke-width="2"/>

  <!-- Prompt Engineering -->
  <circle cx="440" cy="320" r="100" fill="#fff3a0" fill-opacity="0.7" stroke="#d1b900" stroke-width="2"/>

  <!-- RAG -->
  <circle cx="630" cy="225" r="115" fill="#cdb4ff" fill-opacity="0.55" stroke="#7b6cff" stroke-width="2"/>

  <!-- State / History -->
  <circle cx="755" cy="365" r="120" fill="#ffc6ff" fill-opacity="0.55" stroke="#d873d4" stroke-width="2"/>

  <!-- Memory -->
  <circle cx="585" cy="475" r="120" fill="#a5e8b8" fill-opacity="0.55" stroke="#3da567" stroke-width="2"/>

  <!-- Labels (explicit style to avoid font-size inheritance) -->
  <text x="265" y="365" text-anchor="middle" style="font-size: 22px; font-family: sans-serif; fill: #111;">Structured</text>
  <text x="265" y="392" text-anchor="middle" style="font-size: 22px; font-family: sans-serif; fill: #111;">Outputs</text>

  <text x="440" y="316" text-anchor="middle" style="font-size: 22px; font-family: sans-serif; fill: #111;">Prompt</text>
  <text x="440" y="343" text-anchor="middle" style="font-size: 22px; font-family: sans-serif; fill: #111;">Engineering</text>

  <text x="630" y="232" text-anchor="middle" style="font-size: 30px; font-family: sans-serif; fill: #111; font-weight: 500;">RAG</text>

  <text x="755" y="360" text-anchor="middle" style="font-size: 22px; font-family: sans-serif; fill: #111;">State /</text>
  <text x="755" y="387" text-anchor="middle" style="font-size: 22px; font-family: sans-serif; fill: #111;">History</text>

  <text x="585" y="482" text-anchor="middle" style="font-size: 26px; font-family: sans-serif; fill: #111; font-weight: 500;">Memory</text>
</svg>
</div>

---
layout: default
---

<!-- Slide 3.3 — Origen como disciplina (timeline) -->

# Origen: 18 días en junio de 2025

<div class="grid grid-cols-3 gap-6 mt-16">

<div class="border-t-4 border-blue-500 pt-4">
  <div class="text-sm opacity-60">19 jun 2025</div>
  <div class="text-xl font-bold mt-1">Tobi Lütke</div>
  <div class="text-sm mt-2 opacity-80">CEO de Shopify acuña el término en un tweet</div>
</div>

<div class="border-t-4 border-green-500 pt-4">
  <div class="text-sm opacity-60">25 jun 2025</div>
  <div class="text-xl font-bold mt-1">Andrej Karpathy</div>
  <div class="text-sm mt-2 opacity-80">Lo valida y le da la definición canónica (1.9M views)</div>
</div>

<div class="border-t-4 border-purple-500 pt-4">
  <div class="text-sm opacity-60">29 sep 2025</div>
  <div class="text-xl font-bold mt-1">Anthropic</div>
  <div class="text-sm mt-2 opacity-80">Lo formaliza en un blog post oficial de engineering</div>
</div>

</div>

<div class="text-center mt-20 text-xl">
<strong>11 meses de nombre.</strong> <span class="opacity-70">Siglos de práctica latente.</span>
</div>

---
layout: default
---

<!-- Slide 3.4 — Tabla prompt vs context engineering -->

# Prompt Engineering ≠ Context Engineering

<div class="mt-6 text-sm">

|                  | **Prompt Engineering** | **Context Engineering**                       |
|------------------|------------------------|-----------------------------------------------|
| Unidad de trabajo | Un string              | Un sistema                                    |
| Time scope       | Single call            | Multi-turn, long-horizon                      |
| Componentes      | Palabras, frases       | Instructions + RAG + estado + memoria + tools |
| Habilidad        | Writing                | Engineering                                   |
| Falla típica     | "Mal prompt"           | Poisoning / Distraction / Confusion / Clash   |

</div>

<div class="text-center mt-12 text-2xl italic">
"Prompt engineering is a <span class="text-red-500 font-semibold not-italic">subset</span> of context engineering."
</div>

<div class="text-right text-sm opacity-70 mt-2 mr-12">
— Harrison Chase
</div>

---
layout: section
---

<!-- Divider 1 — Mi solución -->

# Mi solución

<div class="text-2xl mt-6 opacity-80">
Lo que armé para que no me vuelva a pasar.
</div>

---
layout: default
---

<!-- Slide 4.1 — Arquitectura completa (file tree de bank-pro) -->

# bank-pro

<div class="text-sm opacity-70">7 capas de context engineering · backend Python · ~5K LOC</div>

<div class="text-xs mt-4 leading-tight font-mono">

```text
bank-pro/
├── AGENTS.md                       ← entry point (agents.md)
├── CLAUDE.md → AGENTS.md           ← symlink Claude Code
├── .agents/
│   ├── skills/                     ← agentskills.io
│   │   ├── tdd/SKILL.md
│   │   ├── parsers/SKILL.md
│   │   ├── architecture/SKILL.md
│   │   └── … (17 skills)
│   └── commands/opsx/              ← slash commands SDD
├── .claude/
│   ├── skills    → ../.agents/skills    ← symlink
│   └── commands  → ../.agents/commands  ← symlink
├── context/                        ← reference docs estáticos
│   ├── API.yaml
│   ├── DATA_MODEL.md
│   ├── ERROR_CATALOG.md
│   └── PRODUCT.md
├── openspec/                       ← state + structured outputs
└── src/
    ├── AGENTS.md
    ├── api/AGENTS.md
    ├── db/AGENTS.md
    ├── domain/AGENTS.md
    ├── parsers/AGENTS.md
    └── services/AGENTS.md
```

</div>

---
layout: default
---

<!-- Slide 4.2 — AGENTS.md raíz (estándar) -->

# AGENTS.md

<div class="text-sm opacity-70 mb-2">
<a href="https://agents.md" class="underline">agents.md</a> standard · siempre cargado · CLI-agnostic
</div>

<div class="text-xs mt-4">

~~~md
# BankPRO — AI Agent Context

> Read this first. Navigate downstream as you go deeper.

## Architecture — DDD + Flat Hexagonal

         api/    parsers/    db/
           └────────┬───────┘    │
                    ▼            │
               services/  ◄──────┘
                    │
                    ▼
                 domain/

### The One Rule
`domain/` imports nothing outside Python stdlib.

### Rules
1. `domain/` is pure Python. No I/O.
2. `services/` orchestrates — never does I/O directly.
3. All protocols live in `services/ports.py`.
4. `api/` routes are thin. Max ~20 lines.
5. One parser file per bank/account type.
6. Adding a new bank = one new file in `parsers/`.
7. Never use `float` for money. Always `Decimal`.
~~~

</div>

---
layout: default
---

<!-- Slide 4.2b — CLI compatibility via symlinks -->

# Un archivo. Muchos CLIs.

<div class="text-sm opacity-70 mb-4">
Patrón de symlinks: canonical en `AGENTS.md`, adaptadores per-CLI.
</div>

<div class="text-sm mt-4">

```bash
$ ls -la bank-pro/
-rw-r--r--  AGENTS.md                ← canonical
lrwxrwxrwx  CLAUDE.md  → AGENTS.md   ← Claude Code
drwxr-xr-x  .agents/
drwxr-xr-x  .claude/
```

```bash
$ ls -la bank-pro/.claude/
lrwxrwxrwx  skills    → ../.agents/skills
lrwxrwxrwx  commands  → ../.agents/commands
```

</div>

<div class="mt-8 text-base">
Si mañana cambias de claude-code a OpenCode o Cursor: <strong>un symlink más, cero contexto perdido</strong>.
</div>

---
layout: default
---

<!-- Slide 4.3 — AGENTS.md jerárquico (just-in-time) -->

# AGENTS.md jerárquico

<div class="text-sm opacity-70">Just-in-time context: cargás lo que necesitás, cuando lo necesitás</div>

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="text-xs font-mono">

```text
src/
├── AGENTS.md         ← layer rules
├── api/AGENTS.md     ← FastAPI conventions
├── db/AGENTS.md      ← SQLAlchemy patterns
├── domain/AGENTS.md  ← value objects, Money
├── parsers/AGENTS.md ← one file per bank
└── services/AGENTS.md ← ports + orchestration
```

</div>

<div class="text-xs">

~~~md
# Bank Parser Layer

Location: `src/parsers/`

One file per bank × account type.
Each parser reads PDF, extracts
transactions, normalizes to domain.

## Adding a New Bank

1. Create `parsers/{bank}_{type}.py`
2. Implement `BankParser` port
3. Add detection to `registry.py`
4. Add test with real PDF fixture
5. Done — nothing else changes.
~~~

</div>

</div>

<div class="mt-8 text-base">
El agente trabajando en <code>parsers/</code> lee <strong>solo</strong> <code>parsers/AGENTS.md</code>. No carga la convención de DB ni de API.
</div>

---
layout: default
---

<!-- Slide 4.4 — Skills + slash commands + MCP -->

# Skills · SKILL.md

<div class="text-sm opacity-70 mb-4">
<a href="https://agentskills.io" class="underline">agentskills.io</a> standard · procedural how-to (no qué-es)
</div>

<div class="grid grid-cols-2 gap-6 mt-2">

<div class="text-xs">

**17 skills en bank-pro:**

<div class="mt-3 text-sm leading-loose">
<code>tdd</code> · <code>parsers</code> · <code>architecture</code> · <code>db</code> · <code>api</code> · <code>domain</code> · <code>services</code> · <code>testing</code> · <code>tech-stack</code> · <code>local-env</code> · <code>start</code> · <code>sync-docs</code> · <code>audit-ai-docs</code> · <code>openspec-explore</code> · <code>openspec-propose</code> · <code>openspec-apply-change</code> · <code>openspec-archive-change</code>
</div>

</div>

<div class="text-xs">

**<code>.agents/skills/tdd/SKILL.md</code>:**

```yaml
name: tdd
description: BankPRO TDD guide.
  Use when implementing any
  feature. Explains Red-Green-
  Refactor per layer.
allowed-tools: Read Glob Grep
```

```md
# BankPRO TDD Guide

All implementation follows TDD:
write failing test first, then
write minimum code to pass.
```

</div>

</div>

<div class="mt-6 text-sm">
<strong>3 formas de exponer capabilities al agente:</strong> skills (en repo) · slash commands (<code>.agents/commands/opsx/*</code>) · MCP servers (proceso propio)
</div>

---
layout: default
---

<!-- Slide 4.5 — context/ (RAG estático) -->

# context/

<div class="text-sm opacity-70">RAG estático: docs estables, sin vector store</div>

<div class="text-xs mt-6 font-mono">

```text
context/
├── API.yaml          ← OpenAPI spec (REST endpoints)
├── DATA_MODEL.md     ← Postgres schemas + relations
├── ERROR_CATALOG.md  ← códigos de error + remediation
└── PRODUCT.md        ← especificación de producto
```

</div>

<div class="mt-6 text-base">
No todo retrieval necesita un vector store. Para docs estables que el agente consulta pocas veces por sesión, <strong>archivos planos alcanzan</strong>.
</div>

<div class="mt-4 text-sm opacity-70">
Si tu app necesita retrieval dinámico (search, customer support, semantic Q&A) → aquí entra RAG con embeddings. En bank-pro los PDFs son la entrada, no el corpus a buscar.
</div>

---
layout: default
---

<!-- Slide 4.6 — OpenSpec + SDD insight -->

# OpenSpec

<div class="text-sm opacity-70">State entre turnos · structured output · workflow SDD</div>

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="text-xs font-mono">

```text
openspec/
├── specs/                ← evergreen specs
└── changes/
    └── [change-id]/
        ├── proposal.md   ← propose
        ├── tasks.md      ← apply
        └── specs/        ← what to update
```

</div>

<div class="text-sm">

**Workflow (Spec-Driven):**

<div class="mt-3 leading-loose font-mono text-xs">

<code>/explore</code> → <code>/propose</code> → <code>/apply</code> → <code>/archive</code>

</div>

Cada fase es un slash command. Estado explícito en archivos: el agente sabe en qué fase está <strong>porque está escrito</strong>, no porque lo recuerda.

</div>

</div>

<div class="mt-8 text-base italic border-l-4 border-yellow-500 pl-4">
Si hacés Context Engineering seriamente, <strong class="not-italic">terminás haciendo SDD</strong> — cualquier sistema que toma intent humano y lo convierte en ejecución necesita un artefacto intermedio que sobreviva entre turnos. Lo llames spec o no, es un spec.
</div>

---
layout: default
---

<!-- Slide 4.7 — Memory cross-session (dual-stack) -->

# Memory cross-session

<div class="text-sm opacity-70">LLMs no tienen memoria entre sesiones. Vos sí podés dársela.</div>

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="border-l-4 border-blue-500 pl-4">

### Project-level

<code>AGENTS.md</code> + <code>SKILL.md</code>

<div class="text-sm mt-3 opacity-90">
• Vive con el repo<br/>
• Versionada (PR review)<br/>
• La lee cualquier agente en cualquier máquina<br/>
• <strong>Del equipo, no tuya</strong>
</div>

</div>

<div class="border-l-4 border-purple-500 pl-4">

### Personal

<code>~/.claude/projects/.../MEMORY.md</code><br/>
<span class="text-xs opacity-70">(o vault tipo <code>agent-brain</code>)</span>

<div class="text-sm mt-3 opacity-90">
• Vive con tÃº<br/>
• Cross-session, cross-proyecto<br/>
• Convenciones, preferencias, lecciones<br/>
• <strong>Tuya, no del equipo</strong>
</div>

</div>

</div>

<div class="mt-6 text-base">
<strong>No los mezcles.</strong> Preferencias personales no van al <code>AGENTS.md</code>. Reglas del proyecto no van a tu memoria personal.
</div>

<div class="mt-4 text-xs opacity-70">
⚠ AGENTS.md y SKILL.md tienen estándar. <strong>Memory todavía no</strong>. Cada CLI guarda la suya donde quiere. Watch this space.
</div>

---
layout: default
---

<!-- Slide 4.8 — Mantenimiento + economics -->

# Mantenimiento — cierre del loop

<div class="text-sm opacity-70">Sin mantenimiento, Context Engineering es deuda técnica</div>

<div class="grid grid-cols-3 gap-4 mt-6 text-sm">

<div class="border-l-4 border-orange-500 pl-3">
<div class="font-bold">① Git pre-commit hook</div>
<div class="text-xs mt-1 opacity-80">Si código cambia sin actualizar AGENTS.md → warning antes del commit</div>
</div>

<div class="border-l-4 border-green-500 pl-3">
<div class="font-bold">② Skill <code>sync-docs</code></div>
<div class="text-xs mt-1 opacity-80">Después de cada feature, revisa AGENTS.md + SKILL.md por staleness</div>
</div>

<div class="border-l-4 border-purple-500 pl-3">
<div class="font-bold">③ Skill <code>audit-ai-docs</code></div>
<div class="text-xs mt-1 opacity-80">Puntúa todos los docs contra criterios de calidad. Surface gaps.</div>
</div>

</div>

<div class="grid grid-cols-2 gap-6 mt-8">

<div class="text-sm italic border-l-2 border-gray-400 pl-3">
"Cached input tokens cost <strong class="not-italic">0.30 USD/MTok</strong>, uncached <strong class="not-italic">3 USD/MTok</strong> — a 10× difference."
<div class="text-right text-xs not-italic mt-2 opacity-70">— Manus / Yichao Ji</div>
</div>

<div class="text-sm italic border-l-2 border-gray-400 pl-3">
"Keep context utilization in the <strong class="not-italic">40%–60%</strong> range throughout the workflow."
<div class="text-right text-xs not-italic mt-2 opacity-70">— Dex Horthy · 12-Factor Agents</div>
</div>

</div>

<div class="mt-6 text-base font-semibold">
Si no lo medís, no es disciplina.
</div>

---
layout: section
---

<!-- Divider 2 — Disciplina de equipo -->

# Disciplina de equipo

<div class="text-2xl mt-6 opacity-80">
De "yo hago esto" a "ustedes hacen esto".
</div>

---
layout: center
---

<!-- Slide 5.1 — Cherny verbatim -->

<div class="text-2xl italic leading-relaxed max-w-4xl mx-auto">
"Anytime they see Claude do something incorrectly, they add it to the <span class="bg-yellow-200 text-black px-1 not-italic font-mono text-xl">CLAUDE.md</span>, so Claude knows not to do it next time."
</div>

<div class="text-right mt-10 text-base opacity-80 max-w-4xl mx-auto">
— <strong>Boris Cherny</strong><br/>
<span class="text-sm opacity-60">Claude Code · creator</span>
</div>

<div class="text-center mt-10 text-sm opacity-60 italic max-w-2xl mx-auto">
(en bank-pro: AGENTS.md. El principio es el mismo — entry point estándar.)
</div>

---
layout: default
---

<!-- Slide 5.2 — Checklist 4 preguntas para el lunes -->

# 4 preguntas para tu equipo el lunes

<div class="grid grid-cols-2 gap-6 mt-8">

<div class="border-l-4 border-red-500 pl-4">
<div class="text-2xl font-bold">①</div>
<div class="text-base font-semibold mt-2">¿Quién es dueño del <code>AGENTS.md</code> raíz?</div>
<div class="text-xs mt-2 opacity-70">Si no hay nombre, no hay disciplina.</div>
</div>

<div class="border-l-4 border-orange-500 pl-4">
<div class="text-2xl font-bold">②</div>
<div class="text-base font-semibold mt-2">¿Con qué cadencia se actualiza?</div>
<div class="text-xs mt-2 opacity-70">Diaria, semanal, never. Tiene que tener cadencia.</div>
</div>

<div class="border-l-4 border-green-500 pl-4">
<div class="text-2xl font-bold">③</div>
<div class="text-base font-semibold mt-2">¿Cómo medís si funciona?</div>
<div class="text-xs mt-2 opacity-70">Eval automático · audit · encuesta del equipo.</div>
</div>

<div class="border-l-4 border-blue-500 pl-4">
<div class="text-2xl font-bold">④</div>
<div class="text-base font-semibold mt-2">¿Código (PR review) o wiki (free edit)?</div>
<div class="text-xs mt-2 opacity-70">Cualquiera funciona, pero <strong>decidan</strong>.</div>
</div>

</div>

---
layout: center
class: text-center
---

<!-- Slide 5.3 — Takeaway big -->

<div class="text-4xl font-bold leading-tight max-w-5xl mx-auto">
Context engineering<br/>
es <span class="text-red-500">disciplina de equipo</span>,<br/>
no artesanía personal.
</div>

<div class="text-2xl mt-12 opacity-80 max-w-3xl mx-auto">
Versionado · medido · con dueño.
</div>

---
layout: default
---

<!-- Slide 6.1 — Greenfield path -->

# Greenfield

<div class="text-sm opacity-70">Empezás de cero. ¿Qué hacer primero?</div>

<div class="grid grid-cols-4 gap-4 mt-12">

<div class="border-t-4 border-green-500 pt-3">
<div class="text-sm opacity-60">Día 1</div>
<div class="text-base font-bold mt-1"><code>AGENTS.md</code> raíz</div>
<div class="text-xs mt-2 opacity-80">Arquitectura, dependency table, 3-5 reglas no-negociables.</div>
</div>

<div class="border-t-4 border-blue-500 pt-3">
<div class="text-sm opacity-60">Semana 1</div>
<div class="text-base font-bold mt-1">2-3 <code>SKILL.md</code></div>
<div class="text-xs mt-2 opacity-80">Las básicas: tdd, architecture, tech-stack.</div>
</div>

<div class="border-t-4 border-purple-500 pt-3">
<div class="text-sm opacity-60">Mes 1</div>
<div class="text-base font-bold mt-1">Subdomain <code>AGENTS.md</code></div>
<div class="text-xs mt-2 opacity-80">Cuando aparezca el segundo dominio (api, parsers, etc.).</div>
</div>

<div class="border-t-4 border-orange-500 pt-3">
<div class="text-sm opacity-60">Mes 2</div>
<div class="text-base font-bold mt-1">Maintenance loop</div>
<div class="text-xs mt-2 opacity-80">Pre-commit hook + <code>sync-docs</code> skill.</div>
</div>

</div>

<div class="mt-10 text-base text-center italic">
Empezá pequeño. Hacé que duela el contraste cuando no exista.
</div>

---
layout: default
---

<!-- Slide 6.2 — Brownfield path -->

# Brownfield

<div class="text-sm opacity-70">Heredás un repo con 2 años de código. ¿Por dónde?</div>

<div class="grid grid-cols-2 gap-6 mt-8">

<div class="border-l-4 border-red-500 pl-4">
<div class="text-base font-bold">① Documentá lo que YA existe</div>
<div class="text-sm mt-2 opacity-80">Reglas tribales, convenciones que el código respeta. <strong>No inventes</strong> reglas que el código no sigue — eso es Context Clash.</div>
</div>

<div class="border-l-4 border-orange-500 pl-4">
<div class="text-base font-bold">② <code>AGENTS.md</code> raíz primero</div>
<div class="text-sm mt-2 opacity-80">Un archivo. Sin jerarquía todavía. La jerarquía viene cuando haya volumen.</div>
</div>

<div class="border-l-4 border-yellow-500 pl-4">
<div class="text-base font-bold">③ Un subdomain por iteración</div>
<div class="text-sm mt-2 opacity-80">El que <strong>más duele</strong> en code review es el primer candidato.</div>
</div>

<div class="border-l-4 border-green-500 pl-4">
<div class="text-base font-bold">④ Skill <code>audit-ai-docs</code></div>
<div class="text-sm mt-2 opacity-80">Encontrá gaps que tÃº no detectaste. El agente lee mejor que tÃº.</div>
</div>

</div>

<div class="mt-8 text-base text-center italic">
El <code>AGENTS.md</code> no es aspiracional — es <strong>descriptivo</strong>.
</div>

---
layout: center
class: text-center
---

<!-- Slide 6.3 — SDD como herramienta dual -->

<div class="text-3xl font-bold leading-tight max-w-4xl mx-auto">
SDD diseña producto.<br/>
SDD también diseña tu <span class="text-red-500">Context Engineering</span>.
</div>

<div class="text-xl mt-10 opacity-80 italic">
Spec-Driven Context Engineering.
</div>

<div class="text-sm mt-8 opacity-60 max-w-2xl mx-auto">
Escribe un spec de qué quieres que el agente sepa <strong>antes</strong> de escribir el <code>AGENTS.md</code>.
</div>

---
layout: default
---

<!-- Slide 7.1 — Lección Compound engineering -->

# Lecciones

<div class="text-sm opacity-70">Lo que aprendí duro · 1 de 3</div>

<div class="mt-16 max-w-4xl mx-auto">

<div class="text-3xl font-semibold leading-relaxed">
Cada error del agente, arreglado en <code>AGENTS.md</code>,<br/>
sobrevive <span class="text-red-500">forever</span>.
</div>

<div class="text-xl mt-8 opacity-80">
Compounding. La memoria del proyecto crece sin que la pidas.
</div>

</div>

---
layout: default
---

<!-- Slide 7.2 — Lección Just-in-time discovery -->

# Lecciones

<div class="text-sm opacity-70">Lo que aprendí duro · 2 de 3</div>

<div class="mt-16 max-w-4xl mx-auto">

<div class="text-3xl font-semibold leading-relaxed">
Mi primer <code>AGENTS.md</code> tenía 800 líneas.<br/>
<span class="text-red-500">Nadie lo leía.</span>
</div>

<div class="text-xl mt-8 opacity-80">
Lo partí en jerarquía y empezó a funcionar. Just-in-time, no all-at-once.
</div>

</div>

---
layout: default
---

<!-- Slide 7.3 — Lección Less is more -->

# Lecciones

<div class="text-sm opacity-70">Lo que aprendí duro · 3 de 3</div>

<div class="mt-12 max-w-4xl mx-auto">

<div class="text-3xl font-semibold leading-relaxed">
Un <code>AGENTS.md</code> gigante "por si acaso" =<br/>
<span class="text-red-500">Context Distraction</span> inmediata.
</div>

<div class="text-xl mt-6 opacity-80">
Menos es más. Siempre.
</div>

<div class="mt-8 text-base italic border-l-2 border-gray-400 pl-3 max-w-3xl">
"No matter how big context windows get, you always get better results if you use <strong class="not-italic">less</strong> of them."
<div class="text-right text-sm not-italic mt-2 opacity-70">— Dex Horthy</div>
</div>

</div>

---
layout: default
---

<!-- Slide 8.1 — Tabla 3 disciplinas (Osmani) -->

# 3 disciplinas

<div class="text-sm opacity-70">Dónde estamos · dónde vamos</div>

<div class="grid grid-cols-3 gap-4 mt-10">

<div class="border-t-4 border-yellow-500 pt-3">
<div class="text-base font-bold">Prompt Engineering</div>
<div class="text-xs mt-3 leading-relaxed">
<strong>Unit:</strong> un string<br/>
<strong>Scope:</strong> 1 call<br/>
<strong>Falla:</strong> "mal prompt"
</div>
</div>

<div class="border-t-4 border-blue-500 pt-3">
<div class="text-base font-bold">Context Engineering</div>
<div class="text-xs mt-3 leading-relaxed">
<strong>Unit:</strong> context window<br/>
<strong>Scope:</strong> sesión multi-turn<br/>
<strong>Falla:</strong> 4 failure modes
</div>
</div>

<div class="border-t-4 border-red-500 pt-3">
<div class="text-base font-bold">Harness Engineering</div>
<div class="text-xs mt-3 leading-relaxed">
<strong>Unit:</strong> entorno completo<br/>
<strong>Scope:</strong> multi-sesión long-horizon<br/>
<strong>Falla:</strong> agent drift, slop accumulation
</div>
</div>

</div>

<div class="text-center mt-10 text-base">
Cada disciplina <strong>contiene</strong> a la anterior.
</div>

<div class="text-right text-sm opacity-70 mt-4">
— Addy Osmani · 2026
</div>

---
layout: default
---

<!-- Slide 8.2 — Pildora harness -->

# Próximo nivel: harness engineering

<div class="grid grid-cols-2 gap-6 mt-8">

<div class="text-base italic border-l-4 border-red-500 pl-4">
"Agent = Model + Harness.<br/>
If you're not the model, you're the <strong class="not-italic">harness</strong>."
<div class="text-right text-xs not-italic mt-3 opacity-70">— Addy Osmani</div>
</div>

<div class="text-base italic border-l-4 border-orange-500 pl-4">
"The most productive AI teams in 2026 spend more time building their <strong class="not-italic">harness</strong> than writing code."
<div class="text-right text-xs not-italic mt-3 opacity-70">— Addi Engineering</div>
</div>

</div>

<div class="mt-10 text-base">
Si esto les hizo sentido, el siguiente paso es:
</div>

<div class="text-sm mt-3 opacity-80 leading-loose">
<code>sub-agents</code> · <code>MCP servers complejos</code> · <code>evals automatizados</code> · <code>CI loops para agentes</code> · <code>cloud agent infrastructure</code>
</div>

<div class="mt-4 text-base italic opacity-80">
Eso es harness engineering. Charla para otro meetup.
</div>

---
layout: end
class: text-center
---

<!-- Slide 8.3 — Q&A / Gracias -->

# Gracias

<div class="mt-12 text-2xl">
¿Preguntas?
</div>

<div class="mt-16 text-base opacity-80 max-w-2xl mx-auto leading-relaxed">
Bryan Condor · Software Engineer @ Addi
</div>

<div class="mt-8 text-sm opacity-70 max-w-3xl mx-auto leading-loose">
Research synthesis · 21 fuentes:<br/>
Karpathy · Chase · Schmid · Anthropic · Cherny · Manus · Breunig · Horthy · Osmani
</div>

<div class="mt-12 text-sm opacity-60">
agents.md · agentskills.io
</div>
