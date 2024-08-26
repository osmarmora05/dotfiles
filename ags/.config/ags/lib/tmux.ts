import options from "options"
import { sh } from "./utils"

export async function tmux() {
    const { scheme, dark, light } = options.theme
    const hex = scheme.value === "dark" ? dark.bg.value : light.bg.value
    if (await sh("which kitty").catch(() => false))
        sh(`kitty @ set-colors background=${hex}`)
}

export default function init() {
    options.theme.dark.primary.bg.connect("changed", tmux)
    options.theme.light.primary.bg.connect("changed", tmux)
}