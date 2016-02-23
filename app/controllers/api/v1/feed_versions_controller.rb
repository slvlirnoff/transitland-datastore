# == Schema Information
#
# Table name: feed_versions
#
#  id                     :integer          not null, primary key
#  feed_id                :integer
#  feed_type              :string
#  file                   :string
#  earliest_calendar_date :date
#  latest_calendar_date   :date
#  sha1                   :string
#  md5                    :string
#  tags                   :hstore
#  fetched_at             :datetime
#  imported_at            :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  import_level           :integer          default(0)
#
# Indexes
#
#  index_feed_versions_on_feed_type_and_feed_id  (feed_type,feed_id)
#

class Api::V1::FeedVersionsController < Api::V1::BaseApiController
  include JsonCollectionPagination
  include DownloadableCsv

  before_action :set_feed
  before_action :set_feed_version, only: [:show]

  def index
    @feed_versions = @feed.feed_versions

    respond_to do |format|
      format.json do
        render paginated_json_collection(
          @feed_versions,
          Proc.new { |params| api_v1_feed_feed_versions_url(params) },
          params[:offset],
          params[:per_page],
          params[:total],
          {}
        )
      end
      format.csv do
        return_downloadable_csv(@feed_versions, 'feed_versions')
      end
    end
  end

  def show
    render json: @feed_version
  end

  private

  def set_feed
    @feed = Feed.find_by!(onestop_id: params[:feed_id])
  end

  def set_feed_version
    @feed_version = @feed.feed_versions.find_by!(sha1: params[:id])
  end
end
