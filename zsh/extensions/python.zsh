# Configure better python dev
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export PIP_REQUIRE_VIRTUALENV=true
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
