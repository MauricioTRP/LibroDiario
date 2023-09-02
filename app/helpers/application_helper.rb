module ApplicationHelper
  def region_address(form)
    form.select(
      :region_id,
      Region.all.collect { |t| [t.region, t.id] },
      { include_blank: true },
      { class: 'h-10 border mt-1 rounded px-4 w-full bg-gray-50' }
    )
  end

  def province_address(form, region_selection = 13)
    form.select(
      :province_id,
      Province.where("region_id = #{region_selection}").collect { |t| [t.provincia, t.id] },
      { include_blank: true },
      { class: 'h-10 border mt-1 rounded px-4 w-full bg-gray-50' }
    )
  end

  def comune_address(form, province_selection = 39)
    form.select(
      :comune_id,
      Comune.where("province_id = #{province_selection}").collect { |t| [t.comuna, t.id] },
      { include_blank: true },
      { class: 'h-10 border mt-1 rounded px-4 w-full bg-gray-50' }
    )
  end
end
