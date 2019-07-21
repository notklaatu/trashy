Name:           trashy
Version:        2.0
Release:        2%{?dist}
Summary:        A sane rm intermediary for the POSIX shell

License:        GPLv3+
URL:            https://www.slackermedia.info/%{name}
Source0:        http://www.slackermedia.info/%{name}/dist/%{name}-%{version}.tar.bz2

Requires:       (bash or tcsh or zsh)

BuildArch:      noarch

%description
Trashy is a shell script providing a (mostly freedesktop.org compliant) trash bin within your POSIX shell. It lets you send unwanted files and folders to you freedesktop Trash (or a .trash folder, if you do not use a desktop) instead of using the rm command. If you change your mind, you can restore trashed files. When you are sure you want to remove the files from your system forever, you can empty your trash.

%prep
%setup -q

%build
gzip %{name}.8
gzip %{name}.info

%install

mkdir -p %{buildroot}/%{_bindir}
mkdir -p %{buildroot}/%{_mandir}
mkdir -p %{buildroot}/%{_infodir}

install -m 0755 %{name} %{buildroot}/%{_bindir}/%{name}
install -m 0755 %{name}.8.gz %{buildroot}/%{_mandir}/%{name}.8.gz 
install -m 0644 %{name}.info.gz %{buildroot}/%{_infodir}/%{name}.info.gz

%files
%license LICENSE
%{_bindir}/%{name}
%{_mandir}/%{name}.8.gz
%{_infodir}/%{name}.info.gz

%doc README.md 

%post
/usr/bin/ln -f -s /usr/bin/trashy /usr/bin/trash

%postun
[ -L /usr/bin/trash ] && rm /usr/bin/trash

%changelog
* Mon Jan 30 2017 Klaatu <klaatu@fedorapeople.org> - 2.0-2
- URL correction
- post create symlink
- postun remove symlink

* Wed Dec 21 2016 Klaatu <klaatu@fedorapeople.org> - 2.0-1
- Initial RPM build

