# coding: utf-8
require 'MeCab'
require 'analyzer/single_analyzer'
require 'analyzer/compound_analyzer'

class NounExtractor
    include NounExtractorAnalyzer

    # exception message
    NOT_MECAB_INSTANCE_ERROR = 'not an instance of mecab'

    def initialize(mecab)
        if mecab.instance_of?(MeCab::Tagger)
            @mecab = mecab
            to_single
        else
            raise NOT_MECAB_INSTANCE_ERROR
        end
    end

    def to_single
        @analyzer = SingleAnalyzer.new(@mecab)
        self
    end

    def to_compound
        @analyzer = CompoundAnalyzer.new(@mecab)
        self
    end

    def analyze(doc)
        @analyzer.analyze(doc)
    end
end
