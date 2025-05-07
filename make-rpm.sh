#!/bin/bash

set -e

PROJECT_NAME="ghostphish"
VERSION="1.1"
RELEASE="1"
SPEC_FILE="$PROJECT_NAME.spec"
SOURCE_DIR="$HOME/Ghost-Phish"
BUILD_DIR="$HOME/rpmbuild"
SOURCES_DIR="$BUILD_DIR/SOURCES"
SPECS_DIR="$BUILD_DIR/SPECS"
ARCHITECTURE="noarch"

mkdir -p "$SOURCES_DIR" "$SPECS_DIR"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "[*] Cloning GhostPhish repository..."
  git clone https://github.com/aenoshrajora/Ghost-Phish.git "$SOURCE_DIR"
fi

cd "$SOURCE_DIR"
echo "[*] Creating source tarball..."
git archive --format=tar.gz --prefix=$PROJECT_NAME-$VERSION/ HEAD > "$SOURCES_DIR/$PROJECT_NAME-$VERSION.tar.gz"

cat <<EOF > "$SPECS_DIR/$SPEC_FILE"
Name:           $PROJECT_NAME
Version:        $VERSION
Release:        $RELEASE
Summary:        GhostPhish - Phishing Simulation & Awareness Toolkit

License:        MIT
URL:            https://github.com/aenoshrajora/Ghost-Phish
Source0:        %{name}-%{version}.tar.gz
BuildArch:      $ARCHITECTURE

Requires:       bash

%description
GhostPhish is a Bash-based phishing simulation and awareness tool for red teamers and security engineers.

%prep
%setup -q

%build
# No build step required

%install
mkdir -p %{buildroot}/usr/local/bin
install -m 0755 ghost-phish.sh %{buildroot}/usr/local/bin/ghostphish

%files
/usr/local/bin/ghostphish

%changelog
* Tue May 7 2025 Aenosh Rajora <aenosh@example.com> - $VERSION-$RELEASE
- Initial RPM package for GhostPhish
EOF

echo "[*] Building RPM..."
rpmbuild -ba "$SPECS_DIR/$SPEC_FILE"

echo "[✔] RPM built successfully. Find it at:"
find "$BUILD_DIR/RPMS" -name "*.rpm"