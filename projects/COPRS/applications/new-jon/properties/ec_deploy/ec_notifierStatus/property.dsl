import java.io.File

def propertyContent = new File(propsDir, 'ec_notifierStatus.txt').text
ec_notifierStatus = """$propertyContent"""