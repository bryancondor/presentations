#!/usr/bin/env bash
# fix-voseo.sh — Reemplaza voseo argentino con español neutral/peruano
# en slides.md y la nota de speaker notes.
# Crea backups (.bak) antes de modificar. Idempotente (correr varias veces no rompe).
#
# Uso:
#   bash fix-voseo.sh
#
# Revertir:
#   mv slides.md.bak slides.md
#   mv "Context Engineering Presentation - Speaker Notes.md.bak" "Context Engineering Presentation - Speaker Notes.md"

set -euo pipefail

SLIDES="/Users/bcondor/bcd/presentations/context-engineering-meetup/slides.md"
NOTES="/Users/bcondor/bcd/bcd-vault/agent-brain/20-Drafts/authored/Context Engineering Presentation - Speaker Notes.md"

backup() {
  cp "$1" "$1.bak"
  echo "  backup: $(basename "$1").bak"
}

fix() {
  perl -i -CSD -pe '
    # === Pronoun ===
    s/\bvos\b/tú/g;

    # === 2nd person singular indicative (voseo) ===
    s/\btenés\b/tienes/g;
    s/\bpodés\b/puedes/g;
    s/\bquerés\b/quieres/g;
    s/\bdecís\b/dices/g;
    s/\bhacés\b/haces/g;
    s/\bsabés\b/sabes/g;
    s/\bsos\b/eres/g;
    s/\bagregás\b/agregas/g;
    s/\barmás\b/armas/g;
    s/\bempezás\b/empiezas/g;
    s/\belegís\b/eliges/g;
    s/\bvivís\b/vives/g;
    s/\bescribís\b/escribes/g;
    s/\bpensás\b/piensas/g;
    s/\busás\b/usas/g;
    s/\bbuscás\b/buscas/g;
    s/\bentendés\b/entiendes/g;
    s/\bheredás\b/heredas/g;
    s/\baprendés\b/aprendes/g;
    s/\bllevás\b/llevas/g;
    s/\bcontás\b/cuentas/g;
    s/\bperdés\b/pierdes/g;
    s/\bnecesitás\b/necesitas/g;
    s/\babrís\b/abres/g;
    s/\bencontrás\b/encuentras/g;
    s/\bvenís\b/vienes/g;
    s/\bsalís\b/sales/g;
    s/\btraés\b/traes/g;
    s/\bdormís\b/duermes/g;
    s/\bconocés\b/conoces/g;
    s/\brecibís\b/recibes/g;
    s/\belegis\b/eliges/g;

    # === Imperatives (voseo → tú form, regular) ===
    s/\bmirá\b/mira/g;
    s/\bescuchá\b/escucha/g;
    s/\bmostrá\b/muestra/g;
    s/\bescribí\b/escribe/g;
    s/\bpensá\b/piensa/g;
    s/\busá\b/usa/g;
    s/\baprendé\b/aprende/g;
    s/\benfatizá\b/enfatiza/g;
    s/\bpausá\b/pausa/g;
    s/\bchequeá\b/chequea/g;
    s/\bajustá\b/ajusta/g;
    s/\bconsiderá\b/considera/g;
    s/\bevitá\b/evita/g;
    s/\brecordá\b/recuerda/g;
    s/\breforzá\b/refuerza/g;
    s/\bexplicá\b/explica/g;
    s/\bmencioná\b/menciona/g;
    s/\bmantené\b/mantén/g;
    s/\baprovechá\b/aprovecha/g;
    s/\bagarrá\b/agarra/g;
    s/\bdejá\b/deja/g;
    s/\brepetí\b/repite/g;
    s/\bavisá\b/avisa/g;
    s/\bcontá\b/cuenta/g;
    s/\bllevá\b/lleva/g;
    s/\bvení\b/ven/g;
    s/\bandá\b/anda/g;
    s/\bseguí\b/sigue/g;
    s/\bcambiá\b/cambia/g;
    s/\bsacá\b/saca/g;
    s/\bbuscá\b/busca/g;
    s/\bcerrá\b/cierra/g;
    s/\babrí\b/abre/g;
    s/\bllamá\b/llama/g;
    s/\bmandá\b/manda/g;
    s/\bcorré\b/corre/g;
    s/\bagregá\b/agrega/g;
    s/\belegí\b/elige/g;
    s/\bempezá\b/empieza/g;
    s/\bterminá\b/termina/g;
    s/\bcuidá\b/cuida/g;
    s/\bencontrá\b/encuentra/g;
    s/\barmá\b/arma/g;
    s/\bprobá\b/prueba/g;
    s/\bnecesitá\b/necesita/g;
    s/\btomá\b/toma/g;
    s/\bpedí\b/pide/g;
    s/\bsubí\b/sube/g;
    s/\bbajá\b/baja/g;
    s/\bsegu(?=\s)\b/sigue/g;
    s/\bdormí\b/duerme/g;
    s/\bperdé\b/pierde/g;

    # === Pronominal imperatives ending in -te ===
    s/\bdecime\b/dime/g;
    s/\bmostrame\b/muéstrame/g;
    s/\bcontame\b/cuéntame/g;
    s/\bavisame\b/avísame/g;
    s/\bponete\b/ponte/g;
    s/\bmetete\b/métete/g;
    s/\bacordate\b/acuérdate/g;
    s/\bolvidate\b/olvídate/g;
    s/\bpreparate\b/prepárate/g;
    s/\bsentate\b/siéntate/g;
    s/\blevantate\b/levántate/g;
    s/\bquedate\b/quédate/g;
    s/\bfijate\b/fíjate/g;
    s/\bandate\b/vete/g;

    # === Misc patterns ===
    s/\bcomo querás\b/como quieras/g;
    s/\bsi querés\b/si quieres/g;
  ' "$1"
}

count_changes() {
  if [[ -f "$1.bak" ]]; then
    diff "$1.bak" "$1" 2>/dev/null | grep -c "^>" || echo 0
  else
    echo "?"
  fi
}

echo "==> Creando backups..."
backup "$SLIDES"
backup "$NOTES"

echo ""
echo "==> Aplicando reemplazos a slides.md..."
fix "$SLIDES"
echo "  cambios: $(count_changes "$SLIDES") líneas modificadas"

echo ""
echo "==> Aplicando reemplazos a speaker notes..."
fix "$NOTES"
echo "  cambios: $(count_changes "$NOTES") líneas modificadas"

echo ""
echo "==> Listo. Revisar diff con:"
echo "  diff '$SLIDES.bak' '$SLIDES'"
echo "  diff '$NOTES.bak' '$NOTES'"
echo ""
echo "==> Para revertir si algo se rompió:"
echo "  mv '$SLIDES.bak' '$SLIDES'"
echo "  mv '$NOTES.bak' '$NOTES'"
echo ""
echo "==> Si todo bien, eliminar backups:"
echo "  rm '$SLIDES.bak' '$NOTES.bak'"
