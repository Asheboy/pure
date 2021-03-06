source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_is_inside_container.fish
source $current_dirname/../functions/_pure_user_at_host.fish
source $current_dirname/../functions/_pure_prompt_container.fish
@mesg (_print_filename $current_filename)


function setup
    _purge_configs
    _disable_colors
end

if test "$USER" = 'nemo'
@test "_pure_prompt_container: displays 'user@hostname' when inside container" (
    string match --quiet --regex "$USER@[\w]+" (_pure_prompt_container)
) $status -eq $SUCCESS
end
