project('com.github.bartzaalberg.repositories-manager', 'vala', 'c')

gnome = import('gnome')
i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

executable(
    meson.project_name(),
        'src/Application.vala',
        'src/MainWindow.vala',
        'src/ListBoxRow.vala',
        'src/ListBox.vala',
        'src/ConfigFileReader.vala',
        'src/Constants.vala',
        'src/CommandHandler.vala',
        'src/StackManager.vala',
        'src/ListManager.vala',
        'src/Dialogs/Alert.vala',
        'src/Dialogs/AddRepository.vala',
        'src/Dialogs/EditRepository.vala',
        'src/Dialogs/DeleteConfirm.vala',
        'src/Views/ListView.vala',
        'src/Views/NotFoundView.vala',
        'src/Components/HeaderBar.vala',
        'src/Components/HeaderLabel.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite')
    ],
    install: true
)

executable(
    'com.github.bartzaalberg.repositories-manager-wizard',
        'src/WizardApplication/WizardApplication.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('gio-2.0')
    ],
    install: true
)

subdir('data')

install_data(
    join_paths('data', meson.project_name() + '.desktop'),
    install_dir: join_paths(get_option('datadir'), 'applications')
)

install_data(
    join_paths('data', meson.project_name() + '.appdata.xml'),
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)

python3 = import('python3').find_python()
run_command(python3, '-c', 'import shutil; shutil.copy("hooks/pre-commit.hook", ".git/hooks/pre-commit")')
