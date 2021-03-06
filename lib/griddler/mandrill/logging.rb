module Griddler
  module Mandrill
    module Logging
      # The default logger discards all message; as we do not want
      # to start clogging up existing users logs.
      def self.logger
        @logger ||= NullLogger.new(STDOUT)
      end

      # Set your application's logger
      # @example In a Rails initializer:
      #    Griddler::Mandrill::Logging.logger = Rails.logger
      # @example Logging to the same location Rails does, but at a different log level
      #    Griddler::Mandrill::Logging.logger = ActiveSupport::Logger.new(Rails.logger.instance_variable_get("@logdev"), level: :debug)
      def self.logger=(logger)
        @logger = logger
      end

      # A logger which discards messages
      class NullLogger < Logger
        # Overload the Logger#add method as this is where the #info/#warn/#error methods
        # send their messags to the logging subsystem.
        def add(*_arguments)
        end
      end
    end
  end
end