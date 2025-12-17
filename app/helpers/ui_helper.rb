module UiHelper
    def status_badge(status)
      color = {
        "Open" => "warning",
        "In Progress" => "info",
        "Closed" => "success"
      }[status.to_s] || "secondary"

      content_tag(:span, status, class: "badge text-bg-#{color}")
    end

    def priority_badge(priority)
      color = {
        "Low" => "success",
        "Medium" => "primary",
        "High" => "danger"
      }[priority.to_s] || "secondary"

      content_tag(:span, priority, class: "badge text-bg-#{color}")
    end
end
