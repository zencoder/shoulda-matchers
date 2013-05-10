module Shoulda # :nodoc:
  module Matchers
    module ActiveRecord # :nodoc:
      module AssociationMatchers
        class ModelReflector
          def initialize(subject, name)
            @subject = subject
            @name = name
          end

          def reflection
            @reflection ||= reflect_on_association(@name)
          end

          def reflect_on_association(name)
            model_class.reflect_on_association(name)
          end

          #repeated exactly
          def model_class
            @subject.class
          end
        end
      end
    end
  end
end
