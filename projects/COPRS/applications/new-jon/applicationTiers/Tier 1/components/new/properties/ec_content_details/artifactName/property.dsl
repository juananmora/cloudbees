import java.io.File

def propertyContent = new File(propsDir, 'artifactName.txt').text

property 'artifactName', value: """$propertyContent""", {
  description = ''
  expandable = '1'
  suppressValueTracking = '0'
}
