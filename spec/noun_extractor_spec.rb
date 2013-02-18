# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe NounExtractor do
    context 'uninitialized' do
        describe '#initialize' do
            context 'when call' do
                it 'SingleAnalyzer' do
                    extractor = NounExtractor.new
                    extractor.instance_eval('@analyzer').instance_of?(SingleAnalyzer).should be_true
                end
            end
        end
    end

    context 'initialized' do
        before(:each) do
            @extractor = NounExtractor.new
        end

        describe '#to_single' do
            context 'when call' do
                it 'SingleAnalyzer' do
                    @extractor.to_single
                    @extractor.instance_eval('@analyzer').instance_of?(SingleAnalyzer).should be_true
                end
            end
        end

        describe '#to_compound' do
            context 'when call' do
                it 'CompoundAnalyzer' do
                    @extractor.to_compound
                    @extractor.instance_eval('@analyzer').instance_of?(CompoundAnalyzer).should be_true
                end
            end
        end

        describe '#analyze' do
            context 'when call' do
                it 'call analyzer#analyze' do
                    doc = 'test doc'

                    analyzer = mock('analyzer')
                    analyzer.should_receive(:analyze).with(doc)
                    @extractor.instance_variable_set(:@analyzer, analyzer)

                    noun_list = @extractor.analyze(doc)
                end
            end
        end
    end
end
