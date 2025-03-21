import java.io.File

def propertyContent = new File(propsDir, 'pluginProcedure.txt').text
pluginProcedure = """$propertyContent"""