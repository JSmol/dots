function fish_prompt
    echo -n (set_color $fish_color_cwd)(basename (pwd)) 'λ '
end
