export PATH="/faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/bin:/home/emmachristensen/.pixi/bin:/home/emmachristensen/.local/bin:/home/emmachristensen/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin"
export CONDA_SHLVL=1
export CONDA_PREFIX=/faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default
export PIXI_PROJECT_ROOT=/faststorage/project/emma_giraf/people/emmachristensen/emma-giraf
export PIXI_PROJECT_NAME=emma-giraf
export PIXI_IN_SHELL=1
export PIXI_PROJECT_MANIFEST=/faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/pixi.toml
export PIXI_PROJECT_VERSION=0.1.0
export PIXI_EXE=/home/emmachristensen/.pixi/bin/pixi
export CONDA_DEFAULT_ENV=emma-giraf
export PIXI_ENVIRONMENT_NAME=default
export PIXI_ENVIRONMENT_PLATFORMS=linux-64
export PIXI_PROMPT='(emma-giraf) '
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/activate-r-base.sh
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/deno.sh
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/deno_dom.sh
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/libarrow_activate.sh
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/libglib_activate.sh
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/libxml2-split_activate.sh
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/quarto.sh
. /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/etc/conda/activate.d/typst_activate.sh
source /faststorage/project/emma_giraf/people/emmachristensen/emma-giraf/.pixi/envs/default/share/bash-completion/completions/*

# shellcheck shell=bash
pixi() {
    local first_arg="${1-}"

    "${PIXI_EXE-}" "$@" || return $?

    case "${first_arg-}" in
    add | a | remove | rm | install | i)
        eval "$("$PIXI_EXE" shell-hook --change-ps1 false)"
        hash -r
        ;;
    esac || :

    return 0
}

export PS1="(emma-giraf) ${PS1:-}"
