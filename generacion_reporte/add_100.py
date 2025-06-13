import xml.etree.ElementTree as ET

# Define el archivo .jmx
jmx_file = "test_plan.jmx"

# Definir las variables y sus valores
variables = {
    "RUN_add_100": "1",
    "RUN_add_50": "0"
}

# Parsear el archivo .jmx
tree = ET.parse(jmx_file)
root = tree.getroot()

# Encontrar la sección de Arguments
arguments_section = root.find(".//Arguments/collectionProp[@name='Arguments.arguments']")
if arguments_section is None:
    print("No se encontró la sección 'Arguments.arguments'.")
    exit(1)

# Iterar sobre las variables y reemplazar los valores en el archivo .jmx
for var_name, var_value in variables.items():
    # Buscar el elementProp correspondiente a la variable
    found = False
    for elem in arguments_section.findall('elementProp'):
        name_elem = elem.find('stringProp[@name="Argument.name"]')
        if name_elem is not None and name_elem.text == var_name:
            # Modificar el valor de la variable
            value_elem = elem.find('stringProp[@name="Argument.value"]')
            if value_elem is not None:
                value_elem.text = var_value
            found = True
            break

    # Si no se encontró la variable, agregar un nuevo elementProp
    if not found:
        new_elem = ET.SubElement(arguments_section, 'elementProp', {'name': var_name, 'elementType': 'Argument'})
        ET.SubElement(new_elem, 'stringProp', {'name': 'Argument.name'}).text = var_name
        ET.SubElement(new_elem, 'stringProp', {'name': 'Argument.value'}).text = var_value
        ET.SubElement(new_elem, 'stringProp', {'name': 'Argument.metadata'}).text = '='

# Guardar el archivo .jmx modificado
tree.write(jmx_file)

print(f"Archivo {jmx_file} actualizado con éxito.")
