<script>
const CookieService = {
    setCookie(name, value, days) {
        let expires = '';

        if (days) {
            const date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = '; expires=' + date.toUTCString();
        }

        document.cookie = name + '=' + (value || '')  + expires + ';';
    },

    getCookie(name) {
        const cookies = document.cookie.split(';');

        for (const cookie of cookies) {
            if (cookie.indexOf(name + '=') > -1) {
                return cookie.split('=')[1];
            }
        }

        return null;
    }
};
</script>

<script>
const showExitIntentPopup = () => {
    document.querySelector('.exit-intent-popup').classList.add('visible');
    CookieService.setCookie('exitIntentShown', true, 30);
};

if (!CookieService.getCookie('exitIntentShown')) {
    setTimeout(() => {
        showExitIntentPopup();
    }, 2000); // Display after 2 seconds of page loading

    document.querySelector('.exit-intent-popup').addEventListener('click', () => {
        document.querySelector('.exit-intent-popup').classList.remove('visible');
    });
}
</script>
