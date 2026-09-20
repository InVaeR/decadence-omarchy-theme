# Decadence - Hyprland configuration
# Golden accents, warm blur and subtle rounding. Part of the Decadence Omarchy theme.

decoration {
    rounding = 10
    rounding_power = 2

    active_opacity = 1.0
    inactive_opacity = 0.96

    blur {
        enabled = true
        size = 8
        passes = 3
        vibrancy = 0.17
        vibrancy_darkness = 0.30
        noise = 0.012
        contrast = 0.9
        brightness = 0.85
        popups = true
        popups_ignorealpha = 0.2
    }

    shadow {
        enabled = true
        range = 30
        render_power = 3
        color = rgba(080808aa)
    }
}

general {
    gaps_in = 6
    gaps_out = 14
    gaps_workspaces = 50
    border_size = 2
    col.active_border = rgba(d4a843ee) rgba(e8c05aee) 45deg
    col.inactive_border = rgba(3d3d3daa)
    resize_on_border = true
    allow_tearing = false
    layout = dwindle
}

animations {
    enabled = true

    bezier = decadence, 0.27, 0.16, 0.16, 1.0

    animation = windows, 1, 5, decadence, popin 85%
    animation = windowsOut, 1, 5, decadence, popin 85%
    animation = windowsMove, 1, 6, decadence, slide
    animation = border, 1, 8, decadence
    animation = borderangle, 1, 30, decadence, once
    animation = fade, 1, 5, decadence
    animation = workspaces, 1, 5, decadence, slidevert
}