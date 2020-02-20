Name:           trashy
Version:        2.5
Release:        1%{?dist}
Summary:        A sane rm intermediary for the POSIX shell

License:        GPLv3+
URL:            https://www.slackermedia.info/%{name}
Source0:        https://gitlab.com/%{name}/%{name}/-/archive/%{version}/%{name}-%{version}.tar.bz2

Requires:       (bash or tcsh or zsh)

BuildArch:      noarch

%description
Trashy is a shell script providing a (mostly freedesktop.org compliant) trash bin within your POSIX shell. It lets you send unwanted files and folders to you freedesktop Trash (or a .trash folder, if you do not use a desktop) instead of using the rm command. If you change your mind, you can restore trashed files. When you are sure you want to remove the files from your system forever, you can empty your trash.

%prep
%setup -q
autoreconf --install
automake
%build
%configure
make %{?_smp_mflags}

%install
rm -rf $RPM_BUILD_ROOT
%make_install
#gzip man/%{name}.8
gzip slackware/%{name}.info

#mkdir -p %{buildroot}/%{_mandir}
mkdir -p %{buildroot}/%{_infodir}

#install -D -m 0755 man/%{name}.8.gz %{buildroot}/%{_mandir}/%{name}.8.gz 
install -m 0644 slackware/%{name}.info.gz %{buildroot}/%{_infodir}/%{name}.info.gz

%files
%license LICENSE
%{_bindir}/%{name}
%{_mandir}/man8/%{name}.8.gz
%{_infodir}/%{name}.info.gz

%doc README.md 

%post
/usr/bin/ln -f -s /usr/bin/trashy /usr/bin/trash

%postun
[ -L /usr/bin/trash ] && rm /usr/bin/trash

%changelog
* Thu Feb 20 2020 Klaatu <klaatu@fedorapeople.org> - 2.5-1
- version bump
- spec file adjusted for Gitlab tags

* Mon Jan 30 2017 Klaatu <klaatu@fedorapeople.org> - 2.0-2
- URL correction
- post create symlink
- postun remove symlink

* Wed Dec 21 2016 Klaatu <klaatu@fedorapeople.org> - 2.0-1
- Initial RPM build

