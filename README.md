# McKenzie's Meats x Webprofits (encrypted Pages site)

Password-protected proposal for McKenzie's Meats (Pipedrive deal 1165), to be served by GitHub Pages from `travist-WP/mckenzies-proposal` once Travis has reviewed the draft. Every HTML page is a StatiCrypt blob that decrypts in the browser; the plaintext source lives in `public-encrypted/` on the author's machine only and is never committed. Scaffolded 17 Nov 2026 from `../hellotech-proposal-pages/` (same encryption-setup layout).

- Source of truth for the content: `../mckenzies-meats/` (`proposal-content.json` + `build_proposal.py`). Rebuild there, copy `proposal/*.html` into `public-encrypted/proposal/` and `terms.html` into `public-encrypted/`, any changed assets into `public/proposal/assets/`, then `make encrypt-changed`.
- Password: one shared password for every page, in `.env` (`ENCRYPT_PASSWORD`, gitignored; to go in 1Password). Share it with Tom separately from the URL. `.env` also carries `ENCRYPT_SECRET` and `STATICRYPT_LIB` (the pinned staticrypt@3.5.4 library the encrypt script and `make release-check` need).
- Guard: `make release-check` refuses any plain HTML in `public/` other than the root redirect.
- Not yet: no git commit, no GitHub repo, no Pages. The publish steps are in `../mckenzies-meats/README.md` (Publish).
- Live URL once published: https://travist-wp.github.io/mckenzies-proposal/proposal/ (terms at `/terms.html`; the site root redirects to the proposal).
