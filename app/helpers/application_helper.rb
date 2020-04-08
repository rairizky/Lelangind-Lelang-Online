module ApplicationHelper
    def current_class?(path)
        'active' if request.path == path
    end
    def current_class_f?(path)
        'uk-active' if request.path == path
    end
end
