import java.io.File

def propertyContent = new File(propsDir, 'formType.txt').text
formType = """$propertyContent"""