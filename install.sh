#!/bin/bash

set -euo pipefail

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m' # No Color

# Configuration
# Check for latest version at: https://github.com/thoughtbot/rcm/releases
readonly RCM_VERSION="1.3.4"
readonly INSTALL_PREFIX="${HOME}/.local"

# Print functions
print_info() {
    echo -e "${GREEN}==>${NC} $*"
}

print_error() {
    echo -e "${RED}Error:${NC} $*" >&2
}

print_warning() {
    echo -e "${YELLOW}Warning:${NC} $*"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check required commands
check_requirements() {
    local missing_commands=()

    for cmd in wget tar make gcc autoconf automake; do
        if ! command_exists "$cmd"; then
            missing_commands+=("$cmd")
        fi
    done

    if [[ ${#missing_commands[@]} -gt 0 ]]; then
        print_error "Missing required commands: ${missing_commands[*]}"
        print_info "Please install these packages before running this script"
        return 1
    fi
}

# Install rcm to $HOME/.local/
install_rcm() {
    print_info "Installing rcm v${RCM_VERSION}..."

    # Check if rcm is already installed
    if command_exists rcup && [[ -x "${INSTALL_PREFIX}/bin/rcup" ]]; then
        print_warning "rcm is already installed at ${INSTALL_PREFIX}/bin/rcup"
        read -p "Do you want to reinstall? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Skipping rcm installation"
            return 0
        fi
    fi

    # Create secure temporary directory
    local temp_dir
    temp_dir=$(mktemp -d -t dotfiles.XXXXXXXXXX)

    # Setup cleanup trap
    trap 'rm -rf "${temp_dir}"' EXIT

    print_info "Downloading rcm v${RCM_VERSION}..."
    cd "${temp_dir}"
    wget -q --show-progress "https://github.com/thoughtbot/rcm/archive/refs/tags/v${RCM_VERSION}.tar.gz"

    print_info "Extracting archive..."
    tar xzf "v${RCM_VERSION}.tar.gz"

    print_info "Building rcm..."
    cd "rcm-${RCM_VERSION}"
    ./autogen.sh
    ./configure --prefix="${INSTALL_PREFIX}"
    make

    print_info "Installing rcm to ${INSTALL_PREFIX}..."
    make install

    print_info "rcm installation complete!"
}

# Install dotfiles using rcm
install_dotfiles() {
    print_info "Installing dotfiles..."

    # Get the directory where this script is located
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    # Ensure rcup is in PATH
    export PATH="${INSTALL_PREFIX}/bin:${PATH}"

    if ! command_exists rcup; then
        print_error "rcup command not found. Installation may have failed."
        return 1
    fi

    "${INSTALL_PREFIX}/bin/rcup" -d "${script_dir}"

    print_info "Dotfiles installation complete!"
}

# Main function
main() {
    print_info "Starting dotfiles installation..."

    check_requirements || exit 1

    # Create install prefix if it doesn't exist
    mkdir -p "${INSTALL_PREFIX}"

    install_rcm
    install_dotfiles

    print_info "All done! You may need to restart your shell or source your config files."
}

# Run main function
main "$@"
