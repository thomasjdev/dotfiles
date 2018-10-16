# Configure better python dev
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [ -f /usr/local/anaconda3/etc/profile.d/conda.sh ]; then
  source /usr/local/anaconda3/etc/profile.d/conda.sh
  conda activate
fi

anaconda_precmd() {
  if [[ -n $CONDA_DEFAULT_ENV ]] && [[ $CONDA_DEFAULT_ENV != "base" ]]; then  
    echo $CONDA_DEFAULT_ENV
    echo `echo ${CONDA_DEFAULT_ENV:t} | wc -m`
    export VIRTUAL_ENV=$CONDA_DEFAULT_ENV
  fi  
}
add-zsh-hook precmd anaconda_precmd
 

