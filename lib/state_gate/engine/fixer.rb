# frozen_string_literal: true

module StateGate
  class Engine
    ##
    # = Description
    #
    # Provides prefix and suffix helper methods for StateGate::Engine.
    #
    module Fixer

      # ======================================================================
      #   Configuration Methods
      # ======================================================================

      # A phrase to add before state names when using Class Scopes.
      # This helps differential attributes that have similar state names.
      # (Symbol | optional)
      #
      #   prefix :before  # => Class.before_active
      #
      def prefix(val = nil)
        cerr(:prefix_type_err, kattr: true) unless val.is_a?(Symbol)
        cerr(:prefix_multiple_err, kattr: true) if @prefix
        @prefix = "#{val.to_s.downcase}_"
      end # prefix



      # A phrase to add before state names when using Class Scopes.
      # This helps differential attributes that have similar state names.
      # (Symbol | optional)
      #
      #   suffix :after  # => Class.active_after
      #
      def suffix(val = nil)
        cerr(:suffix_type_err, kattr: true) unless val.is_a?(Symbol)
        cerr(:suffix_multiple_err, kattr: true) if @suffix
        @suffix = "_#{val.to_s.downcase}"
      end # suffix



      # ======================================================================
      #   Helper Methods
      # ======================================================================

      ##
      # Returns the defined prefix for the state_gate, or an empty string if no
      # prefix has been defined.
      #
      #   .state_prefix   # => 'my_prefix'
      #   .state_prefix   # => ''
      #
      def state_prefix
        @prefix
      end



      ##
      # Returns the defined suffix for the state_gate, or an empty string if no
      # suffix has been defined.
      #
      #   .state_suffix   # => 'my_suffix'
      #   .state_suffix   # => ''
      #
      def state_suffix
        @suffix
      end


    end # Sequencer
  end # Engine
end # StateGate
