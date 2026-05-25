---
theme: default
title: Context Engineering — Beyond the Vibe (V2)
info: |
  ## Beyond the Vibe (V2)
  Usando Context Engineering para llevar flujos agénticos a producción.

  Bryan Condor · Software Engineer @ Addi · Meetup 2026
highlighter: shiki
drawings:
  persist: false
mdc: true
---

<!-- Slide 1 — Cover -->

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
layout: default
---

<!-- Slide 2 — Theme 1: Vibe Coding funciona -->

# Vibe coding funciona

<div class="text-sm opacity-70">3 razones por las que es real</div>

<div class="grid grid-cols-3 gap-6 mt-12">

<div class="border-t-4 border-green-500 pt-4">
<div class="text-2xl font-bold">⚡ Velocidad</div>
<div class="text-base mt-3 opacity-85">De idea a demo en una tarde. A veces en horas.</div>
</div>

<div class="border-t-4 border-blue-500 pt-4">
<div class="text-2xl font-bold">🚪 Low barrier</div>
<div class="text-base mt-3 opacity-85">Cero curva de aprendizaje. Empiezas y avanzas.</div>
</div>

<div class="border-t-4 border-purple-500 pt-4">
<div class="text-2xl font-bold">🔍 Exploración</div>
<div class="text-base mt-3 opacity-85">Ideal para validar una idea antes de invertir tiempo serio.</div>
</div>

</div>

---
layout: default
---

<!-- Slide 3 — Theme 2: Greenfield vs Brownfield -->

# Hasta acá llega

<div class="text-sm opacity-70">Greenfield brilla. Brownfield rompe.</div>

<div class="grid grid-cols-2 gap-10 mt-10">

<div class="border-l-4 border-green-500 pl-5">
<div class="text-2xl font-bold">Greenfield <span class="text-green-500">✓</span></div>
<div class="text-base mt-4 opacity-90 leading-relaxed">
Idea → demo en horas.<br/>
Sin lineamientos previos, vibe coding alcanza.
</div>
</div>

<div class="border-l-4 border-red-500 pl-5">
<div class="text-2xl font-bold">Brownfield <span class="text-red-500">✗</span></div>
<div class="text-base mt-4 opacity-90 leading-relaxed">
Tu proyecto productivo tiene lineamientos. Dos trampas:
<ul class="mt-3 ml-4 list-disc">
<li>Repites TODO cada iteración</li>
<li>O lo dejas avanzar y se sale del carril</li>
</ul>
</div>
</div>

</div>

---
layout: center
class: text-center
---

<!-- Slide 4 — Theme 2: No fue el modelo (reuso V1 slide 3) -->

<div class="text-5xl font-bold leading-tight">
No fue el modelo.
</div>

<div class="text-5xl font-bold mt-6 leading-tight">
Fue el <span class="text-red-500">contexto</span> que le di.
</div>

---
layout: center
---

<!-- Slide 5 — Theme 2: Schmid quote (reuso V1 slide 4) -->

<div class="text-3xl italic leading-relaxed max-w-4xl">
"Most agent failures are not model failures anymore, they are <span class="text-red-500 font-semibold not-italic">context failures</span>."
</div>

<div class="text-right mt-12 text-base opacity-80">
— <strong>Phil Schmid</strong><br/>
<span class="text-sm opacity-60">2025</span>
</div>

---

<!-- Slide 6 — Theme 2: 4 failure modes (reuso V1 slide 5) -->

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

<!-- Slide 7 — Theme 2: Pregunta retórica (reuso V1 slide 6) -->

<div class="text-5xl font-bold leading-relaxed">
¿Cuántos de estos<br/>
han visto en sus<br/>
<span class="text-red-500">propios agentes</span>?
</div>

---
layout: default
---

<!-- Slide 8 — Theme 3a: ¿Qué hay en el context-window? -->

# ¿Qué hay en el context-window?

<div class="flex justify-center mt-4">
<img :src="`/context-window-basic.png`" alt="Basic context window per turn" class="max-h-80 object-contain" />
</div>

<div class="text-center mt-4 text-base opacity-80 max-w-3xl mx-auto">
Cada turn acumula el anterior. Solo con user message + response, los tokens ya suben.
</div>

<div class="text-right text-xs opacity-60 mt-3">
Source: docs.anthropic.com
</div>

---
layout: default
---

<!-- Slide 9 — Theme 3b: ¿Y si agregas tools? -->

# ¿Y si agregas tools?

<div class="flex justify-center mt-4">
<img :src="`/context-window-with-tools.png`" alt="Context window with tools and extended thinking" class="max-h-80 object-contain" />
</div>

<div class="text-center mt-4 text-base opacity-80 max-w-3xl mx-auto">
Tools, tool results, extended thinking… en 3 turns ya se trunca.
</div>

<div class="text-right text-xs opacity-60 mt-3">
Source: docs.anthropic.com
</div>

---
layout: default
---

<!-- Slide 10 — Theme 4a: Dos definiciones (vertical) -->

# Dos definiciones

<div class="mt-10 max-w-4xl mx-auto">

<div class="text-lg italic leading-relaxed">
"Context engineering is the <span class="font-semibold not-italic">delicate art and science</span> of filling the context window with just the right information for the next step."
</div>

<div class="text-right mt-3 text-sm">
— <strong>Andrej Karpathy</strong> · 2025-06-25 · <span class="opacity-60 italic">(poética)</span>
</div>

</div>

<div class="mt-12 max-w-4xl mx-auto">

<div class="text-lg italic leading-relaxed">
"Context engineering is <span class="font-semibold not-italic">building dynamic systems</span> to provide the right information and tools in the right format such that the LLM can plausibly accomplish the task."
</div>

<div class="text-right mt-3 text-sm">
— <strong>Harrison Chase</strong> · LangChain · 2025-06-23 · <span class="opacity-60 italic">(operacional)</span>
</div>

</div>

---
layout: default
---

<!-- Slide 11 — Theme 4b: Gráfico + timeline curio -->

# Lo que involucra Context Engineering

<div class="flex justify-center mt-4">
<img :src="`/ce-scope.png`" alt="Context Engineering scope by Dex Horthy" class="max-h-80 object-contain" />
</div>

<div class="text-right text-xs opacity-60 mt-2 mr-12">
Source: <a href="https://x.com/dexhorthy/status/1933283008863482067" class="underline">@dexhorthy</a>
</div>

<div class="absolute bottom-8 left-0 right-0 text-xs opacity-60 text-center max-w-3xl mx-auto px-12">
<strong>Dato curioso:</strong> el término "Context Engineering" se acuñó entre junio y septiembre de 2025 (Tobi Lütke → Karpathy → Anthropic).
</div>

---
layout: default
---

<!-- Slide 12 — Theme 5: Prompt Engineering ≠ Context Engineering -->

# Prompt Engineering ≠ Context Engineering

<div class="mt-6 text-sm">

|                  | **Prompt Engineering** | **Context Engineering**                       |
|------------------|------------------------|-----------------------------------------------|
| Unit of work     | A string               | A system                                      |
| Time scope       | Single call            | Multi-turn, long-horizon                      |
| Components       | Words, phrases         | Instructions + RAG + state + memory + tools   |
| Skill            | Writing                | Engineering                                   |
| Typical failure  | "Bad prompt"           | Poisoning / Distraction / Confusion / Clash   |

</div>

<div class="text-center mt-12 text-2xl italic">
"Prompt engineering is a <span class="text-red-500 font-semibold not-italic">subset</span> of context engineering."
</div>

<div class="text-right text-sm opacity-70 mt-2 mr-12">
— Harrison Chase
</div>

---
layout: default
---

<!-- Slide 13 — Theme 6: Estándares intro -->

# Dos estándares emergentes

<div class="grid grid-cols-2 gap-10 mt-12">

<div class="border-l-4 border-blue-500 pl-6 pt-2">
<div class="text-3xl font-bold">AGENTS.md</div>
<div class="text-sm opacity-70 mt-1">
<a href="https://agents.md" class="underline">agents.md</a>
</div>
<div class="text-base mt-8 leading-relaxed">
El <strong>entry point</strong> del agente.<br/>
Se carga al inicio de cada sesión.
</div>
</div>

<div class="border-l-4 border-purple-500 pl-6 pt-2">
<div class="text-3xl font-bold">SKILL.md</div>
<div class="text-sm opacity-70 mt-1">
<a href="https://agentskills.io" class="underline">agentskills.io</a>
</div>
<div class="text-base mt-8 leading-relaxed">
<strong>Procedural how-to</strong>.<br/>
Se carga on-demand cuando se invoca.
</div>
</div>

</div>

<div class="absolute bottom-8 left-0 right-0 text-center text-sm opacity-70">
Cross-CLI · open standards · version-controlled
</div>

---
layout: default
---

<!-- Slide 14 — Theme 7: AGENTS.md deep dive -->

# AGENTS.md

<div class="text-sm opacity-70 mb-8">
<a href="https://agents.md" class="underline">agents.md</a> standard
</div>

<div class="text-2xl italic leading-relaxed max-w-4xl mx-auto mt-10">
"Instead of treating AGENTS.md as the <span class="text-red-500 not-italic font-semibold">encyclopedia</span>, we treat it as the <span class="text-green-500 not-italic font-semibold">table of contents</span>."
</div>

<div class="text-right mt-6 text-sm opacity-80 max-w-4xl mx-auto">
— <strong>Ryan Lopopolo</strong> · OpenAI Codex case study
</div>

<div class="absolute bottom-12 left-0 right-0 text-center max-w-3xl mx-auto px-12">
<div class="text-base border-t border-gray-300 pt-4">
Se carga <strong>al inicio</strong> de cada sesión. Todo el documento. Cada vez.
</div>
</div>

---
layout: default
---

<!-- Slide 15 — Theme 8: SKILL.md deep dive -->

# SKILL.md

<div class="text-sm opacity-70 mb-8">
<a href="https://agentskills.io" class="underline">agentskills.io</a> standard · developed by Anthropic
</div>

<div class="text-xl italic leading-relaxed max-w-4xl mx-auto mt-10">
"Full instructions load <span class="text-green-500 not-italic font-semibold">only when a task calls for them</span>, so agents can keep many skills on hand with only a <span class="text-red-500 not-italic font-semibold">small context footprint</span>."
</div>

<div class="text-right mt-6 text-sm opacity-80 max-w-4xl mx-auto">
— <strong>agentskills.io</strong> · spec oficial
</div>

<div class="absolute bottom-12 left-0 right-0 text-center max-w-3xl mx-auto px-12">
<div class="text-base border-t border-gray-300 pt-4">
Se carga <strong>on-demand</strong> cuando el agente invoca la skill o tipeas <code>/skill-name</code>.
</div>
</div>

---
layout: center
class: text-center
---

<!-- Slide 16 — Theme 9: Memory Bank -->

<div class="text-5xl font-bold leading-tight max-w-4xl mx-auto">
Memory Bank <span class="opacity-50">existe.</span>
</div>

<div class="text-5xl font-bold leading-tight mt-4 max-w-4xl mx-auto">
<span class="text-red-500">No lo usamos.</span>
</div>

<div class="text-sm opacity-60 mt-16 max-w-2xl mx-auto">
Patrón community para Cline. Lo que cubre, ya lo cubrimos con AGENTS.md + SKILL.md.
</div>

<div class="text-xs opacity-50 mt-4">
<a href="https://cline.bot" class="underline">cline.bot</a>
</div>

---
layout: default
---

<!-- Slide 17 — Theme 10: Backend architecture sin LLM tooling -->

# Sin context engineering

<div class="text-sm opacity-70">Cómo se vería bank-pro sin AGENTS.md ni SKILL.md</div>

<div class="flex justify-center mt-8">
<pre class="text-base font-mono leading-relaxed opacity-90">
bank-pro/
├── src/
│   ├── api/
│   ├── db/
│   ├── domain/
│   ├── parsers/
│   └── services/
├── tests/
├── scripts/
├── docker-compose.yml
├── pyproject.toml
├── README.md
└── uv.lock
</pre>
</div>

<div class="absolute bottom-8 left-0 right-0 text-center text-sm opacity-60">
Código puro. Cero context engineering. ¿Cómo le explicas a un agente nuevo qué hace este proyecto?
</div>

---
layout: default
---

<!-- Slide 18 — Theme 11: Architecture con AGENTS/SKILL (script output) -->

# Solo context engineering

<div class="text-sm opacity-70 mb-2">
Output de <code>context-engineering-map ~/bcd/project/bank-pro</code>
</div>

<div class="flex justify-center mt-4">
<pre class="text-xs font-mono leading-tight">
bank-pro/
├── .agents/skills/
│   ├── tdd/                  BankPRO TDD guide. Red-Green-Refactor cycle per layer…
│   ├── parsers/              BankPRO bank parser guide. One file per bank/account type…
│   ├── architecture/         BankPRO architecture index. High-level overview of layers…
│   ├── db/                   BankPRO database layer guide. ORM models, repositories…
│   ├── audit-ai-docs/        BankPRO AI docs quality audit. Evaluates AGENTS.md and…
│   ├── sync-docs/            BankPRO documentation sync. Reviews staleness after features…
│   ├── openspec-explore/     OpenSpec explore mode. Thinking partner for investigation…
│   └── <span class="opacity-60">… (+10 more)</span>
├── AGENTS.md
├── examples/
│   └── AGENTS.md
├── src/
│   ├── AGENTS.md
│   ├── api/AGENTS.md
│   ├── db/AGENTS.md
│   ├── domain/AGENTS.md
│   ├── parsers/AGENTS.md
│   └── services/AGENTS.md
└── tests/
    └── AGENTS.md
</pre>
</div>

<div class="absolute bottom-6 left-0 right-0 text-center text-xs opacity-60">
17 skills · 9 AGENTS.md · cero código de producto
</div>

---
layout: default
---

<!-- Slide 19 — Theme 12: Arquitecturas juntas (combined con color) -->

# Juntas

<div class="text-sm opacity-70">Código + Context Engineering conviviendo</div>

<div class="grid grid-cols-[auto_auto] gap-16 mt-6 justify-center">

<div>
<pre class="text-xs font-mono leading-tight">
bank-pro/
├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
├── <span class="text-purple-500 font-semibold">.agents/skills/</span>     <span class="opacity-60">← 17 SKILL.md</span>
├── src/
│   ├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
│   ├── api/
│   │   ├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
│   │   └── <span class="opacity-90">... (.py files)</span>
│   ├── db/
│   │   ├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
│   │   └── <span class="opacity-90">... (.py files)</span>
│   ├── domain/
│   │   ├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
│   │   └── <span class="opacity-90">... (.py files)</span>
│   ├── parsers/
│   │   ├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
│   │   └── <span class="opacity-90">... (.py files)</span>
│   └── services/
│       ├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
│       └── <span class="opacity-90">... (.py files)</span>
├── tests/
│   ├── <span class="text-blue-500 font-semibold">AGENTS.md</span>
│   └── <span class="opacity-90">... (test files)</span>
├── docker-compose.yml
├── pyproject.toml
└── README.md
</pre>
</div>

<div class="text-sm space-y-4 pt-12">
<div class="font-semibold opacity-60 text-xs uppercase tracking-wider mb-2">Leyenda</div>
<div><span class="text-blue-500 font-bold text-base">■</span> <code>AGENTS.md</code></div>
<div><span class="text-purple-500 font-bold text-base">■</span> <code>.agents/skills/</code></div>
<div><span class="opacity-70 font-bold text-base">■</span> Código + configs</div>
</div>

</div>

---
layout: default
---

<!-- Slide 20 — Theme 13a: AGENTS.md por dentro (estructura) -->

# AGENTS.md por dentro

<div class="text-sm opacity-70">Estructura del AGENTS.md raíz de bank-pro <span class="opacity-60">(condensado para el slide)</span></div>

<div class="flex justify-center mt-6 [&_pre]:p-8 [&_pre]:min-w-[700px]">

```text
# BankPRO — AI Agent Context

> Read this first. Navigate downstream...

## What Is BankPRO            ...

## Architecture — DDD + Flat Hexagonal
   ### The One Rule
   ### Dependency Table
   ### Architecture Rules
       1. domain/ pure Python, no I/O
       2. services/ orchestrates via ports
       3. Protocols in services/ports.py
       4. api/ routes ≤ 20 lines
       5. One parser per bank × type
       6. New bank = one new file
       7. Never float for money

## Tech Stack                 ...
## Module Structure           ...
## Development Workflow       ...
```

</div>

<div class="absolute bottom-4 right-6 text-xs opacity-60">
<a href="https://github.com/bryancondor/bank-pro/blob/master/AGENTS.md" class="underline">↗ ver completo</a>
</div>

---
layout: default
---

<!-- Slide 21 — Theme 13b: 9 AGENTS.md en bank-pro -->

# 9 AGENTS.md en bank-pro

<div class="text-sm opacity-70">Inventario completo — uno por subdominio</div>

<div class="mt-8 max-w-4xl mx-auto text-base space-y-3">

<div><code class="text-blue-500 font-semibold">AGENTS.md</code> <span class="opacity-70 ml-2">— architecture, rules, navigation</span></div>
<div><code class="text-blue-500 font-semibold">src/AGENTS.md</code> <span class="opacity-70 ml-2">— layer dependency graph</span></div>
<div><code class="text-blue-500 font-semibold">src/api/AGENTS.md</code> <span class="opacity-70 ml-2">— FastAPI route patterns</span></div>
<div><code class="text-blue-500 font-semibold">src/db/AGENTS.md</code> <span class="opacity-70 ml-2">— SQLAlchemy + Alembic</span></div>
<div><code class="text-blue-500 font-semibold">src/domain/AGENTS.md</code> <span class="opacity-70 ml-2">— pure Python value objects</span></div>
<div><code class="text-blue-500 font-semibold">src/parsers/AGENTS.md</code> <span class="opacity-70 ml-2">— one file per bank</span></div>
<div><code class="text-blue-500 font-semibold">src/services/AGENTS.md</code> <span class="opacity-70 ml-2">— ports + orchestration</span></div>
<div><code class="text-blue-500 font-semibold">tests/AGENTS.md</code> <span class="opacity-70 ml-2">— pytest, fixtures, conventions</span></div>
<div><code class="text-blue-500 font-semibold">examples/AGENTS.md</code> <span class="opacity-70 ml-2">— sample integration specs</span></div>

</div>

---
layout: default
---

<!-- Slide 22 — Theme 14a: SKILL.md por dentro (estructura) -->

# SKILL.md por dentro

<div class="text-sm opacity-70">Estructura del SKILL.md de <code>api</code> <span class="opacity-60">(condensado)</span></div>

<div class="flex justify-center mt-4 [&_pre]:p-6 [&_pre]:min-w-[700px]">

```text
name: api
description: BankPRO REST API guide...
allowed-tools: Read Glob Grep

# BankPRO REST API
> Location: src/api/ · Inbound adapter · Max ~20 lines/route

## Files
   src/api/
   ├── main.py     ← FastAPI app factory
   ├── routes.py   ← all route handlers
   └── schemas.py  ← Pydantic models

## Route Pattern
   validate → call service → serialize

## Pydantic Schemas        ...
## Dependency Injection    ...
## Error Handling          ...
## Common Mistakes         ...
## What to read next       ...
```

</div>

<div class="absolute bottom-4 right-6 text-xs opacity-60">
<a href="https://github.com/bryancondor/bank-pro/blob/master/.agents/skills/api/SKILL.md" class="underline">↗ ver completo</a>
</div>

---
layout: default
---

<!-- Slide 23 — Theme 14b: 17 SKILL.md en bank-pro -->

# 17 SKILL.md en bank-pro

<div class="text-sm opacity-70">Inventario completo — procedural how-tos por layer y workflow</div>

<div class="grid grid-cols-2 gap-x-8 gap-y-2 mt-8 max-w-6xl mx-auto text-sm">

<div><code class="text-purple-500 font-semibold">tdd/SKILL.md</code> <span class="opacity-70">— Red-Green-Refactor cycle</span></div>
<div><code class="text-purple-500 font-semibold">start/SKILL.md</code> <span class="opacity-70">— feature onboarding flow</span></div>

<div><code class="text-purple-500 font-semibold">parsers/SKILL.md</code> <span class="opacity-70">— bank parser impl</span></div>
<div><code class="text-purple-500 font-semibold">sync-docs/SKILL.md</code> <span class="opacity-70">— doc staleness check</span></div>

<div><code class="text-purple-500 font-semibold">architecture/SKILL.md</code> <span class="opacity-70">— layers overview</span></div>
<div><code class="text-purple-500 font-semibold">audit-ai-docs/SKILL.md</code> <span class="opacity-70">— quality auditor</span></div>

<div><code class="text-purple-500 font-semibold">db/SKILL.md</code> <span class="opacity-70">— ORM + alembic</span></div>
<div><code class="text-purple-500 font-semibold">openspec-explore/SKILL.md</code> <span class="opacity-70">— SDD explore</span></div>

<div><code class="text-purple-500 font-semibold">api/SKILL.md</code> <span class="opacity-70">— FastAPI + Pydantic</span></div>
<div><code class="text-purple-500 font-semibold">openspec-propose/SKILL.md</code> <span class="opacity-70">— SDD propose</span></div>

<div><code class="text-purple-500 font-semibold">domain/SKILL.md</code> <span class="opacity-70">— value objects</span></div>
<div><code class="text-purple-500 font-semibold">openspec-apply-change/SKILL.md</code> <span class="opacity-70">— SDD apply</span></div>

<div><code class="text-purple-500 font-semibold">services/SKILL.md</code> <span class="opacity-70">— ports + orchestration</span></div>
<div><code class="text-purple-500 font-semibold">openspec-archive-change/SKILL.md</code> <span class="opacity-70">— SDD archive</span></div>

<div><code class="text-purple-500 font-semibold">testing/SKILL.md</code> <span class="opacity-70">— pytest patterns</span></div>
<div><code class="text-purple-500 font-semibold">local-env/SKILL.md</code> <span class="opacity-70">— setup + docker + uv</span></div>

<div><code class="text-purple-500 font-semibold">tech-stack/SKILL.md</code> <span class="opacity-70">— libraries + configs</span></div>
<div></div>

</div>

---
layout: default
---

<!-- Slide 24 — Theme 15a: Lección 1 — Standards + symlinks -->

# Lecciones

<div class="text-sm opacity-70">Lo que aprendí duro · 1 de 3</div>

<div class="mt-12 max-w-4xl mx-auto">

<div class="text-3xl font-semibold leading-relaxed">
Sigue el <span class="text-red-500">estándar</span> desde el día 1.
</div>

<div class="text-xl mt-6 opacity-80">
Compatibilidad multi-CLI vía <strong>symlinks</strong>.
</div>

</div>

<div class="mt-12 max-w-3xl mx-auto [&_pre]:p-6">

```text
CLAUDE.md         → AGENTS.md
.claude/skills/   → .agents/skills/
.cursor/rules/    → .agents/skills/   (cuando lo necesites)
```

</div>

---
layout: default
---

<!-- Slide 25 — Theme 15b: Lección 2 — Compound engineering -->

# Lecciones

<div class="text-sm opacity-70">Lo que aprendí duro · 2 de 3</div>

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

<!-- Slide 26 — Theme 15c: Lección 3 — Skills meta combo -->

# Lecciones

<div class="text-sm opacity-70">Lo que aprendí duro · 3 de 3</div>

<div class="mt-12 max-w-4xl mx-auto">

<div class="text-3xl font-semibold leading-relaxed">
Las skills <span class="text-red-500">auditan</span> a las skills.
</div>

</div>

<div class="grid grid-cols-2 gap-8 mt-12 max-w-4xl mx-auto">

<div class="border-l-4 border-purple-500 pl-5">
<div class="text-lg font-bold"><code>/audit-ai-docs</code></div>
<div class="text-sm mt-2 opacity-80">Puntúa AGENTS.md + SKILL.md contra rúbrica de calidad. Surface gaps.</div>
</div>

<div class="border-l-4 border-green-500 pl-5">
<div class="text-lg font-bold"><code>/sync-docs</code></div>
<div class="text-sm mt-2 opacity-80">Detecta staleness después de cada feature. Avisa si la doc se desfasa del código.</div>
</div>

</div>

<div class="mt-12 text-xl text-center opacity-90 max-w-3xl mx-auto">
La disciplina se vuelve <strong>automática</strong>.
</div>

---
layout: default
---

<!-- Slide 27 — Cierre: frase + foto + nombre destacado + QR feedback -->

<div class="mt-8 max-w-5xl mx-auto text-center">

<div class="text-4xl font-bold leading-tight">
Vibe coding para <span class="text-green-500">empezar</span>.
</div>

<div class="text-4xl font-bold leading-tight mt-3">
Context engineering para <span class="text-blue-500">escalar</span>.
</div>

</div>

<div class="mt-10 flex items-center justify-center gap-5">

<img :src="`/bryan-condor.png`" alt="Bryan Condor" class="w-20 h-20 rounded-full object-cover object-[center_25%]" />

<div class="text-left">
<div class="text-2xl font-bold">Bryan Condor</div>
<div class="text-sm opacity-70 mt-1">Software Engineer @ Addi</div>
<div class="text-sm opacity-70 mt-1"><a href="https://www.linkedin.com/in/bryancondor" class="no-underline" style="text-decoration: none !important; border: none !important; border-bottom: none !important;">linkedin.com/in/bryancondor</a></div>
</div>

</div>

<div class="mt-8 flex flex-col items-center">

<img :src="`/feedback-qr.png`" alt="Feedback QR — Google Forms" class="w-40 h-40" />

<div class="text-sm opacity-80 mt-3">
Feedback de la charla <span class="opacity-60">(60 seg)</span>
</div>

</div>

---
layout: default
---

<!-- Slide 28 — APPENDIX · 3 disciplinas (reuso V1 slide 31) -->

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

<div class="absolute top-4 right-6 text-xs opacity-50 uppercase tracking-wider font-semibold">
appendix · Q&A
</div>

---
layout: default
---

<!-- Slide 29 — APPENDIX · Pildora harness (reuso V1 slide 32 + Osmani link) -->

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

<div class="mt-8 text-base">
Si esto les hizo sentido, el siguiente paso es:
</div>

<div class="text-sm mt-3 opacity-80 leading-loose">
<code>sub-agents</code> · <code>MCP servers complejos</code> · <code>evals automatizados</code> · <code>CI loops para agentes</code> · <code>cloud agent infrastructure</code>
</div>

<div class="mt-4 text-base italic opacity-80">
Eso es harness engineering. Charla para otro meetup.
</div>

<div class="absolute bottom-4 right-6 text-xs opacity-60">
📖 <a href="https://addyosmani.com/blog/agent-harness-engineering/" class="underline">addyosmani.com/blog/agent-harness-engineering</a>
</div>

<div class="absolute top-4 right-6 text-xs opacity-50 uppercase tracking-wider font-semibold">
appendix · Q&A
</div>
