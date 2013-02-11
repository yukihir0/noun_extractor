# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe NounExtractor do
    context 'uninitialized' do
        describe '#initialize' do
            context 'when nil input' do
                it 'raise error' do
                    expect { extractor = NounExtractor.new(nil)
                    }.to raise_error(RuntimeError, NounExtractor::NOT_MECAB_INSTANCE_ERROR)
                end
            end

            context 'when null string input' do
                it 'raise error' do
                    expect { extractor = NounExtractor.new('')
                    }.to raise_error(RuntimeError, NounExtractor::NOT_MECAB_INSTANCE_ERROR)
                end
            end

            context 'when not mecab instance input' do
                it 'raise error' do
                    expect { extractor = NounExtractor.new('mecab')
                    }.to raise_error(RuntimeError, NounExtractor::NOT_MECAB_INSTANCE_ERROR)
                end
            end

            context 'when mecab instance input' do
                it 'SingleAnalyzer' do
                    mecab = MeCab::Tagger.new
                    extractor = NounExtractor.new(mecab)
                    extractor.instance_eval('@analyzer').instance_of?(SingleAnalyzer).should be_true
                end
            end
        end
    end

    context 'initialized' do
        before(:each) do
            mecab = MeCab::Tagger.new
            @extractor = NounExtractor.new(mecab)
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
                it 'call analyzer #analyze' do
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
