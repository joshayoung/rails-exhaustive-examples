require "rails_helper"

RSpec.feature "Degrees" do
  describe "#last_degree?" do
    let(:degree) { Degree.new }
    context "when there is more than one degree" do
      it "returns nil" do
        allow(degree).to receive(:number_of_degrees).and_return(2)
        expect(degree.last_degree?).to eq(nil)
      end
    end

    context "when there is one degree" do
      it "throws abort" do
        allow(degree).to receive(:number_of_degrees).and_return(1)
        expect { degree.last_degree? }.to throw_symbol(:abort)
      end
    end

    context "when there is less than one degree" do
      it "throws abort" do
        allow(degree).to receive(:number_of_degrees).and_return(0)
        expect { degree.last_degree? }.to throw_symbol(:abort)
      end
    end
  end

  describe "#number_of_degrees" do
    it "returns the numbers of degrees for a teacher" do
      teacher = Teacher.create(name: "Sam", age: 41)
      Degree.create(
        title: "doctorate of history",
        level: 3,
        completed: Date.today - 10.years,
        from: "washington university",
        teacher: teacher
      )
      degree = Degree.create(
        title: "doctorate of history",
        level: 3,
        completed: Date.today - 10.years,
        from: "washington university",
        teacher: teacher
      )

      expect(degree.number_of_degrees).to eq(2)
    end
  end
end
