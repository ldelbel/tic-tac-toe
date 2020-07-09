#spec/board_spec.rb

require './lib/board'

describe Board do
  subject { Board.new(order)}

  context "#win_combinations?" do
    let(:order) { 3 }
    
    it "returns true if there is a row win combination" do
      place = subject.move_empty?(1)
      subject.place_move(place,"X")
      place = subject.move_empty?(2)
      subject.place_move(place,"X")
      place = subject.move_empty?(3)
      subject.place_move(place,"X")

      expect(subject.row_check?("X")).to eql(true)
    end

    it "returns true if there is a column win combination" do
      place = subject.move_empty?(1)
      subject.place_move(place,"X")
      place = subject.move_empty?(4)
      subject.place_move(place,"X")
      place = subject.move_empty?(7)
      subject.place_move(place,"X")

      expect(subject.column_check?("X")).to eql(true)
    end

    it "returns true if there is a diagonal win combination: diagonal I" do
      place = subject.move_empty?(1)
      subject.place_move(place,"X")
      place = subject.move_empty?(5)
      subject.place_move(place,"X")
      place = subject.move_empty?(9)
      subject.place_move(place,"X")

      expect(subject.diagonal_check?("X")).to eql(true)
    end

    it "returns true if there is a diagonal win combination: diagonal II" do
      place = subject.move_empty?(3)
      subject.place_move(place,"X")
      place = subject.move_empty?(5)
      subject.place_move(place,"X")
      place = subject.move_empty?(7)
      subject.place_move(place,"X")

      expect(subject.diagonal_check?("X")).to eql(true)
    end
  end
end