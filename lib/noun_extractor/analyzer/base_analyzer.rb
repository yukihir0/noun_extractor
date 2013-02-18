# coding: utf-8

module Analyzer
    class BaseAnalyzer

        ENCODING = 'utf-8'

        # exception message
        ABSTRACT_METHOD_CALL_ERROR = 'abstract method called'

        public
        def initialize(mecab)
            @mecab = mecab
        end
        
        def analyze(doc)
            result = Array.new
            unless doc.nil? || doc.empty?
                node   = @mecab.parseToNode(doc)
                result = do_analyze(node)
            end
            result
        end

        protected
        def do_analyze(node)
            raise ABSTRACT_METHOD_CALL_ERROR
        end

        private
        def is_noun?(node)
            # split mecab output with comma
            node_feature = node.feature.force_encoding(ENCODING).split(/,/)
           
            # determine if node is noun
            /^名詞/ =~ node_feature[0] && /^一般/ =~ node_feature[1]
        end

        def get_surface(node)
            node.surface.force_encoding(ENCODING)
        end
    end
end