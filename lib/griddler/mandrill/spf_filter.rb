module Griddler
  module Mandrill
    # Checks whether an events SPF result matches the configured preferences
    class SpfFilter
      attr_accessor :allow
      def initialize(allow: default_allow_options)
        self.allow = allow
      end

      def passes?(event)
        event[:spf].present? && allow.include?(event[:spf][:result].to_sym)
      end

      private

      def default_allow_options
        Griddler::Mandrill.spf_allow.dup
      end
    end
  end
end