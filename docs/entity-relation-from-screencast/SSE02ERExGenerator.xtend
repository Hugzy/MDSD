/*
 * generated by Xtext
 */
package dk.sdu.mmmi.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.xtext.generator.IFileSystemAccess
import dk.sdu.mmmi.sSE02EREx.ERSystem
import dk.sdu.mmmi.sSE02EREx.Entity
import dk.sdu.mmmi.sSE02EREx.Attribute

class SSE02ERExGenerator implements IGenerator {
	
	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
		for(e: resource.getAllContents().toIterable().filter(typeof(Entity))) {
			fsa.generateFile("entityrelation/"+e.name + ".java",e.compile)
		}
	}
	
	def compile(Entity entity) '''
	// This file has been automatically generated
	package entityrelation;
	import java.util.List;
	import java.util.ArrayList;
	public class �entity.name� �IF entity.base!=null�extends �entity.base.name��ENDIF� {
		�FOR attribute: entity.attributes�
		�attribute.compile�
		�ENDFOR�
	}
	'''
	
	def compile(Attribute attribute) '''
		�IF attribute.many�
		private List<�attribute.type.name�> �attribute.name� = new ArrayList<�attribute.type.name�>();
		public List<�attribute.type.name�> get�attribute.name.toFirstUpper�() {
			return �attribute.name�;
		}
		public void add�attribute.name.toFirstUpper�(�attribute.type.name� value) {
			�attribute.name�.add(value);
		}
		�ELSE�
		private �attribute.type.name� �attribute.name�;
		public �attribute.type.name� get�attribute.name.toFirstUpper�() {
			return �attribute.name�;
		}
		public void set�attribute.name.toFirstUpper�(�attribute.type.name� value) {
			�attribute.name� = value;
		}
		�ENDIF�
	'''


}
