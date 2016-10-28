{-# LANGUAGE NoMonomorphismRestriction #-}
module Main where

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO
import XMonad.Layout.Spacing
import XMonad.Actions.Volume
import XMonad.Util.Dzen
import XMonad.Layout.SimpleDecoration
import XMonad.Util.Themes
import XMonad.Util.SpawnOnce
import XMonad.Layout.Gaps
import XMonad.Layout.OneBig

blue :: String
blue = "#69b8c6"

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ def
    { manageHook = manageDocks <+> manageHook def
    , layoutHook = let
      tiled = Tall 1 (3/100) (3/5)
      adjust
        = avoidStruts
        . gaps [(U,5),(D,5),(L,5),(R,5)]
        . spacing 5
      in adjust tiled ||| adjust (OneBig 0.75 0.75) ||| Full
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppCurrent = xmobarColor blue "" . wrap "[" "]"
      , ppTitle = xmobarColor blue "" . shorten 100
      , ppLayout = const ""
      }
    , handleEventHook = docksEventHook <+> handleEventHook def
    , focusFollowsMouse = False
    , borderWidth = 2
    , focusedBorderColor = "black"
    , normalBorderColor = "#999"
    , modMask = mod4Mask
    , startupHook = do
      spawnOnce "xscreensaver -no-splash"
      spawnOnce "feh --bg-fill /home/mtolly/Pictures/1477063948332.jpg"
      spawnOnce "udiskie --no-notify"
    } `additionalKeys`
    [ ((mod1Mask .|. controlMask, xK_Delete), spawn "xscreensaver-command -lock; xset dpms force off")
    , ((mod4Mask .|. shiftMask, xK_f), spawn "firefox")
    , ((mod4Mask .|. shiftMask, xK_t), spawn "thunar")
    , ((mod4Mask .|. shiftMask, xK_Up), raiseVolume 4 >>= dzenConfig return . show . floor)
    , ((mod4Mask .|. shiftMask, xK_Down), lowerVolume 4 >>= dzenConfig return . show . floor)
    ]
