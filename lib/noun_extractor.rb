# coding: utf-8
require "noun_extractor/version"
require 'noun_extractor/analyzer/single_analyzer'
require 'noun_extractor/analyzer/compound_analyzer'
require 'MeCab'

class NounExtractor
    include Analyzer

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
