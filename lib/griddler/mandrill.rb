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

    def self.allow_spf_none?
      spf_allow.include?(:none)

    end

    def self.allow_spf_none=(allow_spf_none)
      if allow_spf_none
        spf_allow.add(:none)
      else
        spf_allow.delete(:none)
      end
    end
  end
end