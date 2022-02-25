require "Van"

describe Van do
    it "Can Van take bikes from the docking station" do
        expect(subject).to respond_to('load_broken_bikes')
        expect(subject.load_broken_bikes).to be_a Array
    end
end