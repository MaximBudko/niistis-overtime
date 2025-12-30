Redmine::Plugin.register :overtime_work do
  name 'Overtime Work plugin'
  author 'Maxim Budko'
  description 'Отчет о сверхурочной работе'
  version '0.2.6-b'

  # Разрешение
  project_module :overtime_work do
    permission :view_overtime_report, { over_work: [:generate_overtime_report] }
  end

  # Пункт меню с проверкой разрешения
  menu :top_menu, :overtime_work,
       { controller: 'over_work', action: 'generate_overtime_report' },
       caption: 'Сверхурочная работа',
       if: Proc.new { User.current.allowed_to_globally?(:view_overtime_report) }
end
