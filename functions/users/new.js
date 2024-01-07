export async function onRequestGet(context) {
  const idRegex = /\bREPEATER_ID=([a-z0-9\-]+)\b/
  const idMatch = context.request.headers.get('cookie').match(idRegex);

  if (idMatch) {
    console.log('cookie set')
    return new Response()
  }
  const id = crypto.randomUUID()
  const response = new Response()
  response.headers.set('Set-Cookie', `REPEATER_ID=${id}; Path=/; HttpOnly; Secure; SameSite=None`)
  response.headers.set('Access-Control-Allow-Credentials', true)
  response.headers.set('Access-Control-Allow-Origin', 'https://localhost:8788')

  return response
}
