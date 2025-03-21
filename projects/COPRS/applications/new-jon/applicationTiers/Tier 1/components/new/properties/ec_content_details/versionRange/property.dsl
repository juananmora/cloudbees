import java.io.File

def propertyContent = new File(propsDir, 'versionRange.txt').text

property 'versionRange', value: """$propertyContent""", {
  description = ''
  expandable = '1'
  suppressValueTracking = '0'
}
