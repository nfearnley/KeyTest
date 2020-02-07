; KeyTest
; -------
; Use Up and Down keys to select a Virtual Key code
; The select Virtual Key code will be displayed in a tool tip
; Use Space to send the Virtual Key code

k := 0
vk := ""

UpdateVK()
{
    global vk
    global k
    vk := Format("vk{:02x}", k)
    name := GetKeyName(vk)
    ToolTip , %vk%: %name%, 40, 40, 1
}

UpdateVK()

Up::
    global vk
    global k
    if (k < 255)
    {
        k++
        UpdateVK()
    }
    return

Down::
    global vk
    global k
    if (k > 0)
    {
        k--
        UpdateVK()
    }
    return

Space::send {%vk%}
