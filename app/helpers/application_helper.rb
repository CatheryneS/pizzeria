module ApplicationHelper
    def flash_class(level)
        case level
            when 'success' then "success"
            when 'error' then "danger"
        end
    end
end
