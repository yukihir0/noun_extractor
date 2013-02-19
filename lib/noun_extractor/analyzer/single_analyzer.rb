# coding: utf-8
require 'noun_extractor/analyzer/base_analyzer'

module NounExtractorAnalyzer
    class SingleAnalyzer < BaseAnalyzer
        def do_analyze(node)
            result = Array.new
            
            while node
                result << get_surface(node) if is_noun?(node)
                node = node.next
            end
            result
        end
    end
end
