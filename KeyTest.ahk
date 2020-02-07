; KeyTest
; -------
; Use Up and Down keys to select a Virtual Key code
; The select Virtual Key code will be displayed in a tool tip
; Use Space to send the Virtual Key code

k := 0

; Ignore Space, Up, and Down to avoid loop
IsDisabled(k) {
    disabled := k = 0x20 || k = 0x26 || k = 0x28
    return disabled
}

GetVK()
{
    vk := Format("vk{:02x}", k)
    return vk
}

UpdateToolTip()
{
    vk := GetVK()
    name := GetKeyName(vk)
    if (IsDisabled(k)) {
        name := name . " [disabled]"
    }
    ToolTip , %vk%: %name%, 40, 40, 1
}

Up::
    global k
    if (k < 255)
    {
        k++
    }
    UpdateToolTip()
    return

Down::
    global k
    if (k > 0)
    {
        k--
    }
    UpdateToolTip()
    return

*Space::
    ; Ignore Space, Up, and Down to avoid loop
    disabled := IsDisabled(k)
    if (disabled) {
        return
    }
    vk := GetVK()
    send {Blind}{%vk%}
    return
