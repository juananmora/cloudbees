import java.io.File

def propertyContent = new File(propsDir, 'retrieveToDirectory.txt').text
retrieveToDirectory = """$propertyContent"""