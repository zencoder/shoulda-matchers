module Shoulda # :nodoc:
  module Matchers
    module ActiveRecord # :nodoc:
      module AssociationMatchers
        class DependentMatcher
          def initialize(dependent, name)
            @dependent = dependent
            @name = name
            @missing_option = ''
          end

          def description
            " dependent => #{@dependent}"
          end

          def missing_option
            @missing
          end

          def matches?(subject)
            @subject = ModelReflector.new(subject, @name)
            if @dependent.nil? || @dependent.to_s == @subject.reflection.options[:dependent].to_s
              true
            else
              @missing = "#{@name} should have #{@dependent} dependency"
              false
            end
          end
        end
      end
    end
  end
end
