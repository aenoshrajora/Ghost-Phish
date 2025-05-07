Name:           ghostphish
Version:        1.1
Release:        1
Summary:        GhostPhish - Phishing Simulation & Awareness Toolkit

License:        MIT
URL:            https://github.com/aenoshrajora/Ghost-Phish
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch

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
* Tue May 7 2025 Aenosh Rajora <aenoshrajora79@gmail.com> - 1.1-1
- Initial RPM package for GhostPhish