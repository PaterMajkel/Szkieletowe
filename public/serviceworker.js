self.addEventListener("push", (event) => {
    var mess = event.data.text().split('|')
    let title = (event.data && mess[0]) || "Yay a message";
    let body = (event.data && mess[1]) || "Sprawdź teraz!";
    let tag = "push-simple-demo-notification-tag";
    let icon = '/assets/my-logo-120x120.png';

    event.waitUntil(
        self.registration.showNotification(title, { body, icon, tag })
    )
});