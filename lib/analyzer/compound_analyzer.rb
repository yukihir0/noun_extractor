# coding: utf-8
require 'analyzer/base_analyzer'

module NounExtractorAnalyzer
    class CompoundAnalyzer < BaseAnalyzer
        def do_analyze(node)
            compound_noun = ''
            result = Array.new
            
            while node
                if is_noun?(node)
                    # make compound noun
                    compound_noun += get_surface(node)
                else
                    unless compound_noun.empty?
                        # save compound noun to result
                        result << compound_noun
                        compound_noun = ''
                    end
                end
                node = node.next
            end
            result
        end
    end
end
