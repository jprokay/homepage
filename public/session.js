async function loadSession() {
  const resp = await fetch('/users/new', { credentials: 'include'})
  console.log('cookie', resp.headers)
  console.log('cookie', Array.from(resp.headers.entries()))
}

loadSession()
