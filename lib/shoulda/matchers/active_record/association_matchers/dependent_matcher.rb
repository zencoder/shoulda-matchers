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
            @subject = subject
            if @dependent.nil? || @dependent.to_s == reflection.options[:dependent].to_s
              true
            else
              @missing = "#{@name} should have #{@dependent} dependency"
              false
            end
          end

          def reflection
            @reflection ||= model_class.reflect_on_association(@name)
          end

          def model_class
            @subject.class
          end
        end
      end
    end
  end
end
