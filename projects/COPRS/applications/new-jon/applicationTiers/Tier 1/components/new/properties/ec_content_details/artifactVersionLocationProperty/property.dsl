import java.io.File

def propertyContent = new File(propsDir, 'artifactVersionLocationProperty.txt').text
artifactVersionLocationProperty = """$propertyContent"""