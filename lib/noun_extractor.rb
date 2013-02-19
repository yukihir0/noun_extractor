# coding: utf-8
require "noun_extractor/version"
require 'noun_extractor/analyzer/single_analyzer'
require 'noun_extractor/analyzer/compound_analyzer'

class NounExtractor
    include NounExtractorAnalyzer

    def initialize
        to_single
    end

    def to_single
        @analyzer = SingleAnalyzer.new
        self
    end

    def to_compound
        @analyzer = CompoundAnalyzer.new
        self
    end

    def analyze(doc)
        @analyzer.analyze(doc)
    end
end
