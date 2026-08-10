// whispy dictation pill — standalone Quickshell instance (separate from DMS).
// Run: qs -c whispy
import Quickshell
import Whispy

ShellRoot {
    // Layer-shell overlay pill; reads $XDG_RUNTIME_DIR/whispy/state.json.
    PillPanel {}
}
