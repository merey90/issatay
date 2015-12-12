module ApplicationHelper
    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
        base_title = "Art Gallery"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    # Returns the list of languages.
    def lang_switcher
        I18n.available_locales.each do |loc|
            locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc)
            if I18n.locale != loc
                concat content_tag(:li, (link_to I18n.t("l#{loc}"), locale_param), class: nil)
            end
        end
    end
end
