class Logger
  class Formatter
    def call(severity, time, program_name, message)
      format = "[%s pid=%d] [%s]: %s\n"
      format % [format_datetime(time), $$, severity, message]
    end
  end
end