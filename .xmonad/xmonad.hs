import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts
import System.IO

myLayout = tiled ||| noBorders Full
  where
    tiled   = smartSpacing 8
            $ Tall nmaster delta ratio

    nmaster = 1
    ratio   = 1/2
    delta   = 1/100

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { terminal = "alacritty"
        , modMask = mod4Mask
        -- , workspaces = map show [1 .. 4]
        , workspaces = [
          "<fn=1>\xf054</fn>",
          "<fn=1>\xf268</fn>",
          "<fn=1>\xf392</fn>",
          "<fn=1>\xf1bc</fn>"
        ]
        , borderWidth = 2
        , normalBorderColor = "#000000"
        , focusedBorderColor = "#ffffff"
        , manageHook = manageDocks <+> manageHook defaultConfig 
        , layoutHook = avoidStruts
                     $ smartBorders 
                     $ myLayout

        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput  = hPutStrLn xmproc
                        , ppCurrent = (\str -> str) xmobarColor "white" ""
                        -- , ppCurrent = (\str -> "●")
                        -- , ppVisible = (\str -> "○")
                        , ppHidden  = (\str -> str) xmobarColor "darkgrey" ""
                        , ppHiddenNoWindows  = (\str -> str) xmobarColor "darkgrey" ""
                        -- , ppVisibleNoWindows = (\str -> "○")
                        , ppLayout  = (\str -> "")
                        -- , ppSep     = " | "
                        , ppTitle   = (\str -> "") -- xmobarColor "white" "" . shorten 60
                        }

        } `additionalKeys`
        [ ((0                     , xK_Print    ), spawn "scrot -e 'mv $f ~/pictures/screenshots'")
        , ((mod4Mask              , xK_Print    ), spawn "scrot -s -e 'mv $f ~/pictures/screenshots'")
        , ((mod4Mask              , xK_p        ), spawn "rofi -show drun")
        , ((0                     , xK_F1       ), spawn "~/.config/scripts/wal-tile")
        , ((0                     , xK_F2       ), spawn "~/.screenlayout/1bigmonitor.sh")
        , ((0                     , xK_F3       ), spawn "~/.screenlayout/0bigmonitor.sh")

        , ((mod4Mask              , xK_w        ), kill)
 
        , ((0                     , 0x1008FF11  ),  spawn "pamixer -d 5; ~/.config/scripts/notify-send.sh --expire-time=1000 --replace-file=/tmp/volumenotification `~/.config/scripts/vol`")
        , ((0                     , 0x1008FF12  ),  spawn "pamixer -t;   ~/.config/scripts/notify-send.sh --expire-time=1000 --replace-file=/tmp/volumenotification `~/.config/scripts/vol`")
        , ((0                     , 0x1008FF13  ),  spawn "pamixer -i 5; ~/.config/scripts/notify-send.sh --expire-time=1000 --replace-file=/tmp/volumenotification `~/.config/scripts/vol`")

        , ((0                     , 0x1008FF14  ),  spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
        , ((0                     , 0x1008FF16  ),  spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
        , ((0                     , 0x1008FF17  ),  spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")

        , ((mod4Mask              , xK_f        ), sendMessage ToggleStruts)
        , ((mod4Mask              , xK_g        ), toggleWindowSpacingEnabled)
        , ((mod4Mask              , xK_bracketleft  ), incSpacing (-4))
        , ((mod4Mask              , xK_bracketright ), incSpacing 4)
        ]

