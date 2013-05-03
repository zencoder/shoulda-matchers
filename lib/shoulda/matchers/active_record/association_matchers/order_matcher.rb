module Shoulda # :nodoc:
  module Matchers
    module ActiveRecord # :nodoc:
      module AssociationMatchers
        class OrderMatcher
          def initialize(order, name)
            @order = order
            @name = name
            @missing_option = ''
          end

          def description
            " order => #{@order}"
          end

          def matches?(subject)
            @subject = subject
            if @order.to_s == reflection.options[:order].to_s
              true
            else
              @missing_option = "#{@name} should be ordered by #{@order}"
              false
            end
          end

          def missing_option
            @missing_option
          end

          def reflection
            @reflection ||= model_class.reflect_on_association(@name)
          end

          def model_class
            @subject.model_class
          end
        end
      end
    end
  end
end
