#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 33
/bin/echo -n .
$cli set repeat.initial_wait 100
/bin/echo -n .
$cli set option.vimode_control_hjkl 1
/bin/echo -n .
$cli set private.app_terminal_esc_with_eisuu 1
/bin/echo -n .
/bin/echo
