export async function onRequestGet(context) {
  const loop = await context.env.LOOPS.get(context.params.loop)
  console.log('Loop: ', context.params.loop, ' Body: ', loop)

  return new Response(loop)
}
