require 'griddler'
require 'griddler/mandrill/version'
require 'griddler/mandrill/adapter'
require 'griddler/mandrill/logging'

Griddler.adapter_registry.register(:mandrill, Griddler::Mandrill::Adapter)