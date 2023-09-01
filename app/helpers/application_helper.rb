module ApplicationHelper
  def region_address(form)
    form.select(
      :region_id,
      Region.all.collect{ |t| [t.region, t.id] },
      { include_blank: true},
      { class: 'h-10 border mt-1 rounded px-4 w-full bg-gray-50' }
    )
  end

  def province_address(form)
    form.select(
      :province_id,
      Province.all.collect{ |t| [t.provincia, t.id] },
      { include_blanck: true },
      { class: 'h-10 border mt-1 rounded px-4 w-full bg-gray-50' }
    )
  end

  def comune_address(form)
    form.select(
      :comune_id,
      Comune.all.collect{ |t| [t.comuna, t.id] },
      { include_blanck: true },
      { class: 'h-10 border mt-1 rounded px-4 w-full bg-gray-50' }
    )
  end
end
