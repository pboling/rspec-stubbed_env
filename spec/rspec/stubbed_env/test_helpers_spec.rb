# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RSpec::StubbedEnv::TestHelpers do
  describe 'stub_env' do
    context 'control without stubbing' do
      subject { FooByEnv.new }
      it 'is test env' do
        expect(subject.env).to eq('test')
      end
      it 'has 2 localhost settings' do
        expect(subject.array.grep(/localhost:\d{3}\Z/).length).to eq(2)
      end
      it 'has size 2' do
        expect(subject.size).to eq(2)
      end
    end
    context 'hash signature' do
      context 'development environment' do
        include_context 'with stubbed env'
        let(:environment) { 'development' }
        before do
          stub_env(
              'MEDIUM_1' => 'datastore-01.example.org',
              'MEDIUM_2' => 'datastore-02.example.org',
              'IRRELEVANT_3' => 'datastore-03.example.org',
              )
          allow(Rails).to receive(:env).and_return(environment)
        end
        subject { FooByEnv.new }
        it 'is development env' do
          expect(subject.env).to eq(environment)
        end
        it 'has 2 example.org settings' do
          expect(subject.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to eq(2)
        end
        it 'has size 2' do
          expect(subject.size).to eq(2)
        end
      end
      context 'production environment' do
        include_context 'with stubbed env'
        let(:environment) { 'production' }
        before do
          stub_env(
              'BIG_1' => 'datastore-01.example.org',
              'BIG_2' => 'datastore-02.example.org',
              'BIG_3' => 'datastore-03.example.org',
              'BIG_4' => 'datastore-04.example.org',
              'IRRELEVANT_5' => 'datastore-03.example.org',
              )
          allow(Rails).to receive(:env).and_return(environment)
        end
        subject { FooByEnv.new }
        it 'is production env' do
          expect(subject.env).to eq(environment)
        end
        it 'has 4 example.org settings' do
          expect(subject.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to eq(4)
        end
        it 'has size 4' do
          expect(subject.size).to eq(4)
        end
      end
    end
    context 'key, value signature' do
      context 'development environment' do
        include_context 'with stubbed env'
        let(:environment) { 'development' }
        before do
          stub_env('MEDIUM_1', 'datastore-01.example.org')
          stub_env('MEDIUM_2', 'datastore-02.example.org')
          stub_env('IRRELEVANT_3', 'datastore-03.example.org')
          allow(Rails).to receive(:env).and_return(environment)
        end
        subject { FooByEnv.new }
        it 'is development env' do
          expect(subject.env).to eq(environment)
        end
        it 'has 2 example.org settings' do
          expect(subject.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to eq(2)
        end
        it 'has size 2' do
          expect(subject.size).to eq(2)
        end
      end
      context 'production environment' do
        include_context 'with stubbed env'
        let(:environment) { 'production' }
        before do
          stub_env('BIG_1', 'datastore-01.example.org')
          stub_env('BIG_2', 'datastore-02.example.org')
          stub_env('BIG_3', 'datastore-03.example.org')
          stub_env('BIG_4', 'datastore-04.example.org')
          stub_env('IRRELEVANT_5', 'datastore-05.example.org')
          allow(Rails).to receive(:env).and_return(environment)
        end
        subject { FooByEnv.new }
        it 'is production env' do
          expect(subject.env).to eq(environment)
        end
        it 'has 4 example.org settings' do
          expect(subject.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to eq(4)
        end
        it 'has size 4' do
          expect(subject.size).to eq(4)
        end
      end
    end
  end
end
