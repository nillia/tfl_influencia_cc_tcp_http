from pathlib import Path

imagenes = list(Path("./img/").glob("*.svg"))
imagenes.sort()

documento = ""
prefijo_ruta = "https://github.com/nillia/tfl_influencia_cc_tcp_http/tree/master/resultados/img"

experimento = None
recurso = None
bw = None
for img in imagenes:
    descr = img.with_suffix('').name.split("_")
    descr_imagen = "Gráfico de resultados del "

    if experimento != descr[0].capitalize():
        experimento = descr[0].capitalize()
        if experimento == "Loss":
            str_exp = "Impacto de la tasa de pérdida de paquetes en los tiempos de descarga"
        else:
            str_exp = "Impacto del RTT en los tiempos de descarga"

    descr_imagen += str_exp

    if recurso != descr[1].capitalize():
        recurso = descr[1].capitalize()
        if recurso == "Archivo":
            descr_imagen += " en el flujo continuo de bytes"
            documento += "# {} del flujo continuo de bytes\n".format(str_exp)
        else:
            descr_imagen += " en el sitio Web: {}".format(recurso)
            documento += "# {} del Sitio Web: {}\n".format(str_exp, recurso)

    if bw != descr[4]:
        bw = str(int(int(descr[4]) / 1024))
        descr_imagen += " con una tasa de transferencia de {} Mbps y".format(bw)
        documento += "## Con una tasa de transferencia de {} Mbps\n".format(bw)

    if experimento == "Loss":
        descr_imagen += " {} ms de RTT".format(descr[5])
    else:
        loss = float(descr[5])
        if loss == 0:
            descr_imagen += "sin pérdida de paquetes."
        else:
            descr_imagen += " con un {}% de pérdida de paquetes".format(int(loss)*100)

    documento += "![{}]({}/{})\n".format(descr_imagen, prefijo_ruta, img.name)

print(documento)
