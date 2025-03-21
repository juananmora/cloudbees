import java.io.File

def propertyContent = new File(propsDir, 'ddd.txt').text
ddd = """$propertyContent"""