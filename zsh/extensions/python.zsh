# Configure better python dev
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [[ -x /usr/local/anaconda3/bin/conda ]]; then
  export PATH=/usr/local/anaconda3/bin:$PATH
fi