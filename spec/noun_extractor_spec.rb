# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe NounExtractor do
    before do
        @mecab = MeCab::Tagger.new
    end
    
    context 'when SINGLE_NOUN_MODE' do
        before do
            @extractor = NounExtractor.new(@mecab, NounExtractor::SINGLE_NOUN_MODE)
        end

        describe '#attr_reader noun' do
            context 'get' do
                it 'should be SINGLE_NOUN_MODE' do
                    @extractor.mode.should == NounExtractor::SINGLE_NOUN_MODE
                end
            end
        end

        describe '#attr_writer noun' do
            context 'set COMPUND_NOUN_MODE' do
                it 'should be COMPOUND_MODE' do
                    @extractor.mode = NounExtractor::COMPOUND_NOUN_MODE
                    @extractor.mode.should == NounExtractor::COMPOUND_NOUN_MODE
                end
            end
        end

        describe '#analyze' do
            context 'nil input' do
                it 'should be no noun' do
                        noun_list = @extractor.analyze(nil)
                    noun_list.size.should == 0
                end
            end

            context 'null string input' do
                it 'should be no noun' do
                    noun_list = @extractor.analyze('')
                    noun_list.size.should == 0
                end
            end

            context 'no contain noun string input' do
                it 'should be no noun' do
                    noun_list = @extractor.analyze('する。')
                    noun_list.size.should == 0
                end
            end

            context 'contain 1 noun string input' do
                it 'should be 1 noun' do
                    noun_list = @extractor.analyze('こんにちは')
                    noun_list.size.should == 1
                    noun_list[0].to_s.should == 'こんにちは'
                end
            end

            context 'contain 2 noun string input' do
                it 'should be 2 noun' do
                    noun_list = @extractor.analyze('機械制御')
                    noun_list.size.should == 2
                    noun_list[0].to_s.should == '機械'
                    noun_list[1].to_s.should == '制御'
                end
            end
        end
    end

    context 'when COMPUND_NOUN_MODE' do
        before do
            @extractor = NounExtractor.new(@mecab, NounExtractor::COMPOUND_NOUN_MODE)
        end

        describe '#attr_reader noun' do
            context 'get' do
                it 'should be COMPUND_NOUN_MODE' do
                    @extractor.mode.should == NounExtractor::COMPOUND_NOUN_MODE
                end
            end
        end

        describe '#attr_writer noun' do
            context 'set SINGLE_NOUN_MODE' do
                it 'should be SINGLE_MODE' do
                    @extractor.mode = NounExtractor::SINGLE_NOUN_MODE
                    @extractor.mode.should == NounExtractor::SINGLE_NOUN_MODE
                end
            end
        end

        describe '#analyze' do
            context 'nil input' do
                it 'should be no noun' do
                        noun_list = @extractor.analyze(nil)
                    noun_list.size.should == 0
                end
            end

            context 'null string input' do
                it 'should be no noun' do
                    noun_list = @extractor.analyze('')
                    noun_list.size.should == 0
                end
            end

            context 'no contain noun string input' do
                it 'should be no noun' do
                    noun_list = @extractor.analyze('する。')
                    noun_list.size.should == 0
                end
            end

            context 'contain 1 noun string input' do
                it 'should be 1 noun' do
                    noun_list = @extractor.analyze('こんにちは')
                    noun_list.size.should == 1
                    noun_list[0].to_s.should == 'こんにちは'
                end
            end

            context 'contain 1 compound noun string input' do
                it 'should be 1 compound noun' do
                    noun_list = @extractor.analyze('機械制御')
                    noun_list.size.should == 1
                    noun_list[0].to_s.should == '機械制御'
                end
            end
        end
    end

end
