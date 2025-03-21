import java.io.File

def propertyContent = new File(propsDir, 'filterList.txt').text
filterList = """$propertyContent"""