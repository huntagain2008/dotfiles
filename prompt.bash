# ANSI Colors
C_DEF='\[\e[39m\]'; C_RED='\[\e[31m\]'; C_GRN='\[\e[32m\]'; C_YLW='\[\e[33m\]'; C_BLU='\[\e[34m\]'; C_MAG='\[\e[35m\]'; C_CYN='\[\e[36m\]'; C_GRY='\[\e[38;5;246m\]'

machine_name() { [[ -f $HOME/.name ]] && cat $HOME/.name || hostname; }

PROMPT_DIRTRIM=3

# 紧凑版 PS1: \u@\h:\w
# 错误检测逻辑合并，使用 $ 作为提示符
PS1="\n${C_CYN}\u${C_DEF}@${C_MAG}\$(machine_name)${C_DEF}:${C_YLW}\w${C_DEF}\n\$(if [ \$? -ne 0 ]; then echo \"${C_RED}! \"; fi)${C_BLU}\$${C_DEF} "
PS2="${C_BLU}>${C_DEF} "

demoprompt() {
    PROMPT_DIRTRIM=1
    PS1="${C_GRY}\w ${C_BLU}\$ ${C_DEF}"
    trap '[[ -t 1 ]] && tput sgr0' DEBUG
}
