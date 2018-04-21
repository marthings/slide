import { Controller } from "stimulus"

export default class extends Controller {

    static targets = [ "completed" ]
    
    toggle(event) {
      let formData = new FormData()
      formData.append("hello[completed]", this.completedTarget.checked);
      fetch(this.data.get("update-url"), {
        body: formData,
        method: 'PATCH',
        dataType: 'script',
        credentials: "include",
        headers: {
                "X-CSRF-Token": getMetaValue("csrf-token")
              },
        })
        
        function getMetaValue(name) {
          const element = document.head.querySelector(`meta[name="${name}"]`).content
          return element.getAttribute("content")
        }
    }
}
