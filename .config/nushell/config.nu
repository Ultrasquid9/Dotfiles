# Starship prompt
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

export-env {
	# Nvim as default editor
	# Maybe consider switching back to Helix once they have plugins 
	$env.EDITOR = "nvim"

	# Used for FZF ctrl-t searching
	$env.FZF_CTRL_T_COMMAND = "fd --type file --hidden"
	$env.FZF_CTRL_T_OPTS = "--preview 'bat --color=always --style=full --line-range=:500 {}' "

	# Fix core dump with Minecraft when exiting game
	$env.__GL_THREADED_OPTIMIZATIONS = 0
}

$env.config = {
	# Disabling the default welcome banner
	show_banner: false

	# Setting Helix as the default editor
	buffer_editor: "helix"

	# FZF Bindings
	keybindings: [
		{
			name: fzf
			modifier: control
			keycode: char_t
			mode: emacs
			event: {
				send: executehostcommand,
				cmd: "
				let fzf_ctrl_t_command = \$\"($env.FZF_CTRL_T_COMMAND) | fzf ($env.FZF_CTRL_T_OPTS)\";
				let result = nu -l -i -n -c $fzf_ctrl_t_command;
				commandline edit --append $result;
				commandline set-cursor --end
				"
			}
		},
		{
			name: fzf_change_dir
			modifier: control
			keycode: char_y
			mode: emacs
			event: {
				send: executehostcommand,
				cmd: "
				cd (
					ls
					| where type == dir 
					| each {|it| $it.name} 
					| str join (char nl)
					| fzf
					| decode utf-8
					| str trim
				)
				"
			}
		}
	]
}

# Shortcut to commit all changed dotfiles
def yadm-commit [] {
	cd
	let files = yadm ls-files . -m | parse '{file}'
	for x in $files { yadm add $x.file }
	yadm commit
}

# Allow Yazi to change the shell directory
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# Enabling zoxide
source ~/.zoxide.nu
alias cd = z

# Changes "clear" to run fastfetch
alias strip = clear
def clear [] {
	strip
	hyfetch
}

clear
