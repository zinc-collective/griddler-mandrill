require 'griddler'
require 'griddler/mandrill/adapter'
require 'griddler/mandrill/logging'
require 'griddler/mandrill/spf_filter'
require 'griddler/mandrill/version'

Griddler.adapter_registry.register(:mandrill, Griddler::Mandrill::Adapter)

module Griddler
  module Mandrill

    def self.spf_allow
      @spf_allow ||= Set.new([:pass, :neutral])
    end
  end
end