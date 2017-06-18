{-# LANGUAGE NoMonomorphismRestriction #-}
module Main where

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys, removeKeys)
import System.IO
import XMonad.Actions.Volume
import XMonad.Util.Dzen
import XMonad.Layout.SimpleDecoration
import XMonad.Util.Themes
import XMonad.Util.SpawnOnce
import XMonad.Layout.Gaps
import XMonad.Layout.OneBig
import XMonad.Layout.NoBorders
import XMonad.Util.Dmenu
import Control.Monad (when)
import System.Exit
import Data.List (isPrefixOf)

confirm :: String -> X () -> X ()
confirm m f = do
  result <- dmenu [m]
  when ("y" `isPrefixOf` result) f

xmobarHighlight :: String
xmobarHighlight = "#9d83c1"

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "Keepassx" --> doShift "9pw"
  ]

rofiOptions :: String
rofiOptions = "-font 'Changa Medium 18'"

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  spawn "killall nautilus"
  spawn "feh --bg-fill /home/mtolly/Pictures/1486436469338.png"
  xmonad $ def
    { manageHook = myManageHook <+> manageDocks <+> manageHook def
    , layoutHook = let
      tiled = Tall 1 (3/100) (3/5)
      adjust = avoidStruts
      in adjust tiled ||| noBorders Full
    , workspaces = map show [1..8] ++ ["9pw"]
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppCurrent = xmobarColor xmobarHighlight "" . wrap "[" "]"
      , ppTitle = xmobarColor xmobarHighlight "" . shorten 100
      , ppLayout = const ""
      }
    , handleEventHook = docksEventHook <+> handleEventHook def
    , focusFollowsMouse = False
    , borderWidth = 2
    , focusedBorderColor = "#eee"
    , normalBorderColor = "#222"
    , modMask = mod4Mask
    , startupHook = do
      spawnOnce "xscreensaver -no-splash"
      spawnOnce "udiskie --no-notify"
      spawnOnce "trayer --edge bottom --align right --SetDockType true --SetPartialStrut true --expand true --transparent true --tint 0x000000 --height 30"
      spawnOnce "nm-applet"
      spawnOnce "pasystray"
      spawnOnce "redshift-gtk -l43.0481434:-89.3455351"
      spawnOnce "keepassx"
    } `additionalKeys`
    [ ((mod1Mask .|. controlMask, xK_Delete), spawn "xscreensaver-command -lock; xset dpms force off")
    , ((mod4Mask .|. shiftMask, xK_f), spawn "chromium-browser")
    , ((mod4Mask .|. shiftMask, xK_t), spawn "thunar")
    , ((mod4Mask .|. shiftMask, xK_Home), spawn "unity-control-center")
    , ((mod4Mask, xK_p), spawn $ "rofi -show drun " ++ rofiOptions)
    , ((mod4Mask, xK_g), spawn $ "rofi -show run " ++ rofiOptions)
    , ((mod4Mask .|. shiftMask, xK_q), confirm "Exit" $ liftIO $ exitWith ExitSuccess)
    ]
