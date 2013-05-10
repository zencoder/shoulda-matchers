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
            @subject = ModelReflector.new(subject, @name)
            if @order.to_s == @subject.reflection.options[:order].to_s
              true
            else
              @missing_option = "#{@name} should be ordered by #{@order}"
              false
            end
          end

          #repeated exactly
          def missing_option
            @missing_option
          end

          #repeated exactly
        end
      end
    end
  end
end
