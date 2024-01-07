export async function onRequestPost(context) {
  const idRegex = /\bREPEATER_ID=([a-z0-9\-]+)\b/
  const idMatch = context.request.headers.get('cookie').match(idRegex);

  if (idMatch) {
    const userId = idMatch[1]
    console.log(context);

    const formData = await context.request.formData();
    console.log(formData)
    const loopName = formData.get('loop-name')
    const uuid = crypto.randomUUID()

    const userLoops = await context.env.LOOPS.get(`${userId}:loops`)

    const saveString =`${loopName}__${uuid}`
    if (userLoops == null) {

      await context.env.LOOPS.put(`${userId}:loops`, saveString)
    } else {

      await context.env.LOOPS.put(`${userId}:loops`, `${userLoops},${saveString}`)
    }
    const stringified = JSON.stringify(Object.entries(formData))
    console.log(stringified)
    
    await context.env.LOOPS.put(uuid, stringified)
    const result = await context.env.LOOPS.get(uuid)

    console.log(result)
    
    return new Response(uuid)

  }
}

export async function onRequestGet(context) {
  const idRegex = /\bREPEATER_ID=([a-z0-9\-]+)\b/
  const idMatch = context.request.headers.get('cookie').match(idRegex);

  if (idMatch) {
    const userId = idMatch[1]

    const userLoops = await context.env.LOOPS.get(`${userId}:loops`)
    console.log(userLoops)

    return new Response(userLoops)

  }

  return new Response('empty')
}



