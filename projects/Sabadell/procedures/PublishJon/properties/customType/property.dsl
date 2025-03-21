import java.io.File

def propertyContent = new File(propsDir, 'customType.txt').text
customType = """$propertyContent"""