module Shoulda # :nodoc:
  module Matchers
    module ActiveRecord # :nodoc:
      module AssociationMatchers
        class ThroughMatcher
          def initialize(through, name)
            @through = through
            @name = name
            @missing_option = ''
          end

          def description
            " through #{@through}"
          end

          def matches?(subject)
            @subject = ModelReflector.new(subject, @name)
            @through.nil? || (through_association_exists? && through_association_correct?)
          end

          def missing_option
            @missing_option
          end

          def through_association_exists?
            if through_reflection.nil?
              @missing_option = "#{@subject.model_class.name} does not have any relationship to #{@through}"
              false
            else
              true
            end
          end

          def through_reflection
            @through_reflection ||= @subject.reflect_on_association(@through)
          end

          def through_association_correct?
            if @through == @subject.reflection.options[:through]
              true
            else
              @missing_option = "Expected #{@subject.model_class.name} to have #{@name} through #{@through}, " +
                "but got it through #{@subject.reflection.options[:through]}"
              false
            end
          end
        end
      end
    end
  end
end
