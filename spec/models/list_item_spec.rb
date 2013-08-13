require 'spec_helper'

describe ListItem do
  def list
    @list ||= List.create(name: "list")
  end

  describe ".update_positions" do
    def item(position)
      ListItem.create(list: list, position: position, name: position)
    end

    it "takes the array of all ids in the collection, in order" do
      red = item(1)
      blue = item(2)
      green = item(3)

      list.items.reload.should == [red, blue, green]

      list.items.update_positions [blue, green, red].map(&:id)
      list.items.reload.should == [blue, green, red]
    end
  end

  describe "default position" do
    it "sets the first item for an empty list to position 1" do
      item = list.items.create(name: "first")
      item.position.should == 1
    end

    it "puts new items at the end of the list" do
      list.items.create(name: "first", position: 1)
      item = list.items.create(name: "second")
      item.position.should == 2
    end

    it "ignores the positions of items in other lists" do
      List.create(name: "other").items.create(name: "other", position: 1)
      item = list.items.create(name: "mine")
      item.position.should == 1
    end
  end
end
