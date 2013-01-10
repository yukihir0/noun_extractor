# coding: utf-8
require 'MeCab'

class NounExtractor

    # extract mode
    SINGLE_NOUN_MODE   = 'single'
    COMPOUND_NOUN_MODE = 'compound'
    MODE = [SINGLE_NOUN_MODE, COMPOUND_NOUN_MODE]
  
    # exception message
    INVALID_MODE_ERROR       = 'invalid mode'
    NOT_MECAB_INSTANCE_ERROR = 'not mecab instance'

    def mode
        @mode
    end

    def mode=(_mode)
        if MODE.member?(_mode)
            @mode = _mode
        else
            raise INVALID_MODE_ERROR
        end
    end

    def initialize(mecab, mode=SINGLE_NOUN_MODE)
        if mecab.instance_of?(MeCab::Tagger)
            @mecab = mecab
        else
            raise NOT_MECAB_INSTANCE_ERROR
        end

        self.mode = mode
    end

    def analyze(doc)
        noun_list = Array.new

        unless doc.nil?
            # parse doc by mecab
            node = @mecab.parseToNode(doc)
            
            case @mode
            when SINGLE_NOUN_MODE
                noun_list = analyze_single(node)
            when COMPOUND_NOUN_MODE
                noun_list = analyze_compound(node)
            end
        end

        return noun_list
    end

    private
    def is_noun?(node)
        # split mecab output with comma
        node_feature = node.feature.force_encoding('utf-8').split(/,/)
       
        # determine if node is noun
        /^名詞/ =~ node_feature[0] && /^一般/ =~ node_feature[1]
    end

    def extract_surface(node)
        node.surface.force_encoding('utf-8')
    end
    
    def analyze_single(node)
        noun_list = Array.new
        
        while node
            # extract noun
            if is_noun?(node)
                noun_list << extract_surface(node)
            end
            node = node.next
        end

        return noun_list
    end

    def analyze_compound(node)
        noun_list = Array.new
        compound_noun = "" 
        
        while node
            # extract noun
            if is_noun?(node)
                compound_noun << extract_surface(node)
            else
                # add compound noun to list
                unless compound_noun.empty?
                    noun_list << compound_noun
                    compound_noun = ''
                end
            end
            node = node.next
        end
 
        return noun_list
    end
end
