# frozen_string_literal: true

require "spec_helper"

RSpec.describe(RSpec::StubbedEnv::HideHelpers) do
  describe "hide_env" do
    context "when no hiding" do
      subject(:myenv) { FooByEnv.new }

      it "is test env" do
        expect(myenv.env).to(eq("test"))
      end

      it "has 2 localhost settings" do
        expect(myenv.array.grep(/localhost:\d{3}\Z/).length).to(eq(2))
      end

      it "has size 2" do
        expect(myenv.size).to(eq(2))
      end
    end

    context "when development environment" do
      subject(:myenv) { FooByEnv.new }

      include_context "with hidden env"

      let(:environment) { "development" }

      before do
        ENV["MEDIUM_1"] = "datastore-01.example.org"
        ENV["MEDIUM_2"] = "datastore-02.example.org"
        ENV["IRRELEVANT_3"] = "datastore-03.example.org"
        allow(Rails).to(receive(:env).and_return(environment))
      end

      after do
        ENV.delete("MEDIUM_1")
        ENV.delete("MEDIUM_2")
        ENV.delete("IRRELEVANT_3")
      end

      it "is development env" do
        expect(myenv.env).to(eq(environment))
      end

      it "has 2 example.org settings" do
        expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(2))
      end

      it "has size 2" do
        expect(myenv.size).to(eq(2))
      end

      context "when hiding" do
        before do
          hide_env("MEDIUM_2")
        end

        it "has 2 example.org settings" do
          expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(1))
        end

        it "has size 1" do
          expect(myenv.size).to(eq(1))
        end
      end
    end

    context "when production environment" do
      subject(:myenv) { FooByEnv.new }

      include_context "with hidden env"

      let(:environment) { "production" }

      before do
        ENV["BIG_1"] = "datastore-01.example.org"
        ENV["BIG_2"] = "datastore-02.example.org"
        ENV["BIG_3"] = "datastore-03.example.org"
        ENV["BIG_4"] = "datastore-04.example.org"
        ENV["IRRELEVANT_5"] = "datastore-03.example.org"
        allow(Rails).to(receive(:env).and_return(environment))
      end

      after do
        ENV.delete("BIG_1")
        ENV.delete("BIG_2")
        ENV.delete("BIG_3")
        ENV.delete("BIG_4")
        ENV.delete("IRRELEVANT_5")
      end

      it "is production env" do
        expect(myenv.env).to(eq(environment))
      end

      it "has 4 example.org settings" do
        expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(4))
      end

      it "has size 4" do
        expect(myenv.size).to(eq(4))
      end

      context "when hiding via single call" do
        before do
          hide_env("BIG_2", "BIG_4")
        end

        it "has 2 example.org settings" do
          expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(2))
        end

        it "has size 2" do
          expect(myenv.size).to(eq(2))
        end
      end

      context "when hiding via multiple calls" do
        before do
          hide_env("BIG_1")
          hide_env("BIG_3")
        end

        it "has 2 example.org settings" do
          expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(2))
        end

        it "has size 2" do
          expect(myenv.size).to(eq(2))
        end
      end
    end
  end

  describe "#values_at" do
    include_context "with hidden env"

    before do
      ENV["TO_BE_HIDDEN"] = "to_be_hidden"
      ENV["NOT_HIDDEN"] = "not_hidden"
    end

    after do
      ENV.delete("TO_BE_HIDDEN")
      ENV.delete("NOT_HIDDEN")
    end

    context "when not hidden" do
      it "returns original" do
        expect(ENV.values_at("TO_BE_HIDDEN", "NOT_HIDDEN")).to(contain_exactly("to_be_hidden", "not_hidden"))
      end
    end

    context "when hidden" do
      it "returns no hidden values" do
        hide_env("TO_BE_HIDDEN")
        expect(ENV.values_at("TO_BE_HIDDEN", "NOT_HIDDEN")).to(contain_exactly(nil, "not_hidden"))
      end
    end
  end

  describe "stubbing" do
    subject(:do_stub) { hide_env("STAR") }

    include_context "with hidden env"

    before do
      ENV["STAR"] = "BURN"
      ENV["MAG"] = "NET"
    end

    after do
      ENV.delete("STAR")
      ENV.delete("MAG")
    end

    it "does not raise error" do
      block_is_expected.to(not_raise_error)
    end

    it "hides a key that was previously set" do
      block_is_expected.to(change { ENV["STAR"] }.from("BURN").to(nil))
    end

    it "does not modify other keys" do
      block_is_expected.to(not_change { ENV["MAG"] }.from("NET"))
    end
  end

  describe "hiding trough context arguments" do
    include_context "with hidden env", "FAFF", "DANK"

    before do
      ENV["FAFF"] = "BURN"
      ENV["DANK"] = "NET"
    end

    after do
      ENV.delete("FAFF")
      ENV.delete("DANK")
    end

    it "hides all keys provided in the arguments" do
      ["FAFF", "DANK"].each do |key|
        expect(ENV[key]).to(be_nil)
      end
    end

    it "hides them so well" do
      ["FAFF", "DANK"].each do |key|
        expect { ENV.fetch(key) }.to raise_error(KeyError)
      end
    end
  end
end
