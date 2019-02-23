class AddVotesCountToLink < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :votes_count, :integer, default: 0

    reversible { |dir| dir.up do
      Link.find_each { |link| Link.reset_counters(link.id, :votes) }
    end }
  end
end
