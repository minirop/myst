require "../visitor"
require "colorize"

module Myst
  class TreeDumpVisitor < Visitor
    visit AST::Node do
      io.puts(node.type_name)
      io << "\n"
    end

    visit AST::Block do
      io << "#{node.type_name}".colorize(:red).mode(:bold) << "\n"
      recurse node.children
    end


    visit AST::BinaryExpression do
      io << "#{node.type_name}".colorize(:cyan)
      io << "|#{node.operator}\n"
      recurse [node.left, node.right]
    end

    visit AST::UnaryExpression do
      io << "#{node.type_name}".colorize(:cyan)
      io << "|#{node.operator}\n"
      recurse [node.operand]
    end


    visit AST::IntegerLiteral, AST::FloatLiteral do
      io << "#{node.type_name}".colorize(:yellow)
      io << "(#{node.value})\n"
    end

    visit AST::StringLiteral do
      io << "#{node.type_name}".colorize(:yellow)
      io << "(#{node.value})\n"
    end



    COLORS = [
      # :green, :blue, :magenta, :cyan,
      :light_green, :light_blue, :light_magenta, :light_cyan,
      :light_gray, :dark_gray
    ]

    macro recurse(children)
      current_color = COLORS.sample
      {{children}}.each_with_index do |child, child_index|
        str = String.build{ |str| child.accept(self, str) }

        str.lines.each_with_index do |line, line_index|
          if line_index == 0
            if node.children.size > 1 && child_index < node.children.size-1
              io << "├─".colorize(current_color)
            else
              io << "└─".colorize(current_color)
            end
          else
            if node.children.size > 1 && child_index < node.children.size-1
              io << "│ ".colorize(current_color)
            else
              io << "  ".colorize(current_color)
            end
          end

          io << line
          io << "\n"
        end
      end
    end
  end
end
