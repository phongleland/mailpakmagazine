shared_examples "an object with attributes" do | attributes |
  attributes.each do |attribute|
    it { is_expected.to respond_to( attribute ) }
  end
end