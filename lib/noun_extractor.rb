# coding: utf-8
require 'MeCab'

class NounExtractor

    # extract mode
    SINGLE_NOUN   = 'single'
    COMPOUND_NOUN = 'compound'
    EXTRACT_MODE  = [SINGLE_NOUN, COMPOUND_NOUN]
  
    # exception message
    INVALID_MODE_ERROR       = 'invalid mode'
    NOT_MECAB_INSTANCE_ERROR = 'not mecab instance'

    def mode
        @mode
    end

    def mode=(_mode)
        if EXTRACT_MODE.member?(_mode)
            @mode = _mode
        else
            raise INVALID_MODE_ERROR
        end
    end

    def initialize(mecab, options = { mode: SINGLE_NOUN })
        if mecab.instance_of?(MeCab::Tagger)
            @mecab = mecab
            self.mode = options[:mode]
        else
            raise NOT_MECAB_INSTANCE_ERROR
        end
    end

    def analyze(doc)
        @result = Array.new

        unless doc.nil?
            # parse doc by mecab
            node = @mecab.parseToNode(doc)
            
            case @mode
            when SINGLE_NOUN
                analyze_single(node)
            when COMPOUND_NOUN
                analyze_compound(node)
            end
        end

        return @result
    end

    private
    def is_noun?(node)
        # split mecab output with comma
        node_feature = node.feature.force_encoding('utf-8').split(/,/)
       
        # determine if node is noun
        /^名詞/ =~ node_feature[0] && /^一般/ =~ node_feature[1]
    end

    def get_surface(node)
        node.surface.force_encoding('utf-8')
    end
    
    def analyze_single(node)
        while node
            @result << get_surface(node) if is_noun?(node)
            node = node.next
        end
    end

    def analyze_compound(node)
        compound_noun = "" 
        
        while node
            if is_noun?(node)
                # make compound noun
                compound_noun << get_surface(node)
            else
                unless compound_noun.empty?
                    # add compound noun to result
                    @result << compound_noun
                    compound_noun = ''
                end
            end
            node = node.next
        end
    end
end
