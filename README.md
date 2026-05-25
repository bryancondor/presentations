# Context Engineering Meetup — Slidev

Slidev source for the **"Beyond the Vibe: Usando Context Engineering para llevar flujos agénticos a producción"** meetup talk.

- **Speaker:** Bryan Condor · Software Engineer @ Addi
- **Duration:** 30 min
- **Language:** español (quotes en inglés con atribución)

## Companion: speaker notes

Speaker script (verbatim + beats), ASCII mocks per slide, and personal reminders live in the vault:

```
~/bcd/bcd-vault/agent-brain/20-Drafts/authored/Context Engineering Presentation - Speaker Notes.md
```

Always edit slides here and speaker notes there. Keep both in sync.

## Run locally

```bash
npm install
npm run dev
```

Open <http://localhost:3030> in the browser.

## Export to PDF

```bash
npm run export
```

Output: `slides-export.pdf` in the project root.

## Project structure

```
context-engineering-meetup/
├── slides.md         ← main slidev file (one file, all slides)
├── package.json
├── README.md
├── .gitignore
└── public/           ← static assets (images, screenshots, diagrams)
```

## Conventions

- Each `---` on its own line is a slide separator.
- Use Slidev layouts: `cover`, `center`, `default`, `two-cols`, `section`, `image-right`, `end`.
- Author quotes stay in English with attribution; speaker narrates in Spanish.
- Assets in `public/` referenced as `/asset-name.png`.

## Related notes (in vault)

- `Context Engineering Presentation.md` — original draft
- `Context Engineering Presentation - Refinado.md` — refined slide-by-slide structure (the spine)
- `Context Engineering Presentation - Speaker Notes.md` — companion to this slidev project
- `claude-context-engineering-meetup-research.md` — research synthesis (21 sources)
- `claude-harness-engineering-meetup-research.md` — research synthesis (22 sources, used only in closing pildora)
- `context-engineering-bankpro.md` — how bank-pro implements context engineering
