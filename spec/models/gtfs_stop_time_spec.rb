# == Schema Information
#
# Table name: gtfs_stop_times
#
#  id                       :integer          not null, primary key
#  stop_sequence            :integer          not null
#  stop_headsign            :string
#  pickup_type              :integer
#  drop_off_type            :integer
#  shape_dist_traveled      :float
#  timepoint                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  feed_version_id          :integer          not null
#  trip_id                  :integer          not null
#  origin_id                :integer          not null
#  destination_id           :integer
#  origin_arrival_time      :integer
#  origin_departure_time    :integer
#  destination_arrival_time :integer
#
# Indexes
#
#  index_gtfs_stop_times_on_destination_arrival_time  (destination_arrival_time)
#  index_gtfs_stop_times_on_destination_id            (destination_id)
#  index_gtfs_stop_times_on_feed_version_id           (feed_version_id)
#  index_gtfs_stop_times_on_origin_arrival_time       (origin_arrival_time)
#  index_gtfs_stop_times_on_origin_departure_time     (origin_departure_time)
#  index_gtfs_stop_times_on_origin_id                 (origin_id)
#  index_gtfs_stop_times_on_stop_headsign             (stop_headsign)
#  index_gtfs_stop_times_on_stop_sequence             (stop_sequence)
#  index_gtfs_stop_times_on_trip_id                   (trip_id)
#  index_gtfs_stop_times_unique                       (feed_version_id,trip_id,stop_sequence) UNIQUE
#

RSpec.describe GTFSStopTime, type: :model do
    context 'interpolate_stop_times' do
      it 'test' do
      end
    end
end  
