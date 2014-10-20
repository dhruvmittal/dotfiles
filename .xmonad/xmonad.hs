import qualified Data.Map as M
import XMonad
import XMonad.Actions.CopyWindow(copy)
import XMonad.Actions.CycleWS
{-import XMonad.Actions.MouseResize-}
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.Navigation2D
import XMonad.Config.Gnome
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.AutoMaster
import XMonad.Layout.Circle
import XMonad.Layout.Grid
import XMonad.Layout.Maximize
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
{-import XMonad.Layout.WindowArranger-}
import XMonad.Prompt
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W



conf = ewmh defaultConfig
	{ terminal	= "gnome-terminal"
	, modMask 	= mod4Mask
	, borderWidth	= 1
	, layoutHook= myLayout
	, manageHook=manageHook defaultConfig <+> manageDocks
	, handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
	, startupHook = myStartupHook
	, focusedBorderColor = myFocusedBorderColor
	{-, keys = myKeys <+> keys defaultConfig-}
	{-, workspaces = myWorkspaces-}
	}
	`additionalKeys`
	[
	-- Switch between layers
	 {-((mod4Mask,                 xK_space), switchLayer)-}

	-- Directional navigation of screens
	((mod4Mask.|. controlMask, xK_Right    ), screenGo R False)
	, ((mod4Mask .|. controlMask, xK_Left    ), screenGo L False)

	-- Swap workspaces on adjacent screens
	{-, ((mod4Mask .|. controlMask, xK_Up    ), screenSwap R False)-}
	{-, ((mod4Mask .|. controlMask, xK_Down    ), screenSwap L False)-}

	-- Send window to adjacent screen
	, ((mod4Mask .|. mod1Mask,    xK_r    ), windowToScreen R False)
	, ((mod4Mask .|. mod1Mask,    xK_l    ), windowToScreen L False)

	--  CycleWS stuff
	, ((mod4Mask,               xK_Right),  removeEmptyWorkspaceAfter(nextWS))
	, ((mod4Mask,               xK_Left),   removeEmptyWorkspaceAfter( prevWS))
	, ((mod4Mask .|. shiftMask, xK_l),  removeEmptyWorkspaceAfter(nextWS))
	, ((mod4Mask .|. shiftMask, xK_h),   removeEmptyWorkspaceAfter( prevWS))
	, ((mod4Mask .|. shiftMask, xK_Right), removeEmptyWorkspaceAfter( shiftToNext))
	, ((mod4Mask .|. shiftMask, xK_Left),    removeEmptyWorkspaceAfter(shiftToPrev))

	-- DynamicWorkspaces
	, ((mod4Mask, xK_BackSpace), removeEmptyWorkspace)
	, ((mod4Mask, xK_1), removeEmptyWorkspaceAfter(addWorkspace("1")))
	, ((mod4Mask, xK_2), removeEmptyWorkspaceAfter(addWorkspace("2")))
	, ((mod4Mask, xK_3), removeEmptyWorkspaceAfter(addWorkspace("3")))
	, ((mod4Mask, xK_4), removeEmptyWorkspaceAfter(addWorkspace("4")))
	, ((mod4Mask, xK_5), removeEmptyWorkspaceAfter(addWorkspace("5")))
	, ((mod4Mask, xK_6), removeEmptyWorkspaceAfter(addWorkspace("6")))
	, ((mod4Mask, xK_7), removeEmptyWorkspaceAfter(addWorkspace("7")))
	, ((mod4Mask, xK_8), removeEmptyWorkspaceAfter(addWorkspace("8")))
	, ((mod4Mask, xK_9), removeEmptyWorkspaceAfter(addWorkspace("9")))
	, ((mod4Mask .|. shiftMask, xK_v      ), selectWorkspace defaultXPConfig)
	{-, ((mod4Mask, xK_m                    ), withWorkspace defaultXPConfig (windows . W.shift))-}
	{-, ((mod4Mask .|. shiftMask, xK_m      ), withWorkspace defaultXPConfig (windows . copy))-}
	{-, ((mod4Mask .|. shiftMask, xK_r      ), renameWorkspace defaultXPConfig)-}
	, ((mod4Mask, xK_m), withFocused (sendMessage . maximizeRestore))
	] 
	{-++-}
	{-zip (zip (repeat (mod4Mask)) [xK_1..xK_9]) (map (withNthWorkspace W.greedyView) [0..])-}
	{-++-}
	{-zip (zip (repeat (mod4Mask .|. shiftMask)) [xK_1..xK_9]) (map (withNthWorkspace W.shift) [0..])-}


{-myWorkspaces = ["www", "term"]-}
{- myWorkspaces = withScreens 2 ["1", "2", "3", "4", "5", "6", "7", "8", "9"]-}
{- myWorkspaces = withScreens 2 ["1", "2", "3", "4"]-}

myLayout = smartBorders (avoidStruts(maximize (spiral ratio ||| autoMaster 1 (1/100) Grid ) ||| noBorders(Full)) ||| noBorders(Full))
	where
		ratio	= toRational (2/(1+sqrt(5)::Double)) 

myStartupHook = do
	spawnOnce "tint2"
	spawnOnce "gnome-session"
	spawnOnce "volumeicon"
	{-spawnOnce "compton"-}

myFocusedBorderColor = "#d64937"


{-myKeys conf@(XConfig {XMonad.modMask = mod4Mask}) = M.fromList-}


main = xmonad conf
