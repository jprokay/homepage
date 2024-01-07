const loopSelector = document.getElementById("saved-loops");

async function loadLoops() {
  const resp = await fetch('/loops')
  const text = await resp.text()

  const loops = text.split(',')
  loops.forEach((loop) => {
    const [name, uuid] = loop.split('__')
    var opt = document.createElement('option')
    opt.value = uuid;
    opt.innerHTML = name
    loopSelector.appendChild(opt)

  })

  return resp
}

loadLoops()

loopSelector.addEventListener('input', async (evt) => {
  console.log(evt.target.value)

  const resp = await fetch(`/loops/${evt.target.value}`)
  const body = await resp.json()
  console.log(body)

  return resp
})
