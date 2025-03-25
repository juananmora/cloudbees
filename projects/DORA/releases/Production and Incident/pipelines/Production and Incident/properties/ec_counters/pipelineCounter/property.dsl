import java.io.File

def propertyContent = new File(propsDir, 'pipelineCounter.txt').text
pipelineCounter = """$propertyContent"""