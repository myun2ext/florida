module Florida::Router; end
require 'florida/router/path_matcher'

describe Florida::Router::PathMatcher do
  let!(:matcher) { Florida::Router::PathMatcher.new("/exmpale") }

  describe "#of_index" do
    let(:of_index) { matcher.of_index }

    it { expect("/exmpale").to match(of_index) }
    it { expect("/exmpale/").to match(of_index) }
    it { expect("/exmpale.json").to match(of_index) }
    it { expect("/exmpale.json/").to match(of_index) }

    it { expect("/exmpal").not_to match(of_index) }
    it { expect("/exmpale.").not_to match(of_index) }
    it { expect("/exmpale_").not_to match(of_index) }
    it { expect("a/exmpale").not_to match(of_index) }
    it { expect("/exmpale/z").not_to match(of_index) }
  end

  describe "#of_show" do
    let(:of_show) { matcher.of_show }

    it { expect("/exmpale/1").to match(of_show) }
    it { expect("/exmpale/1/").to match(of_show) }
    it { expect("/exmpale/1.json").to match(of_show) }
    it { expect("/exmpale/1.json/").to match(of_show) }

    it { expect("/exmpale").not_to match(of_show) }
    it { expect("/exmpale/").not_to match(of_show) }
    it { expect("/exmpale/+").not_to match(of_show) }
    it { expect("/exmpale/1.").not_to match(of_show) }
    it { expect("a/exmpale/1").not_to match(of_show) }
  end
end
