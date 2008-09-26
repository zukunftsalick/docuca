tinyMCEPopup.requireLangPack();

var InternallinkDialog = {
	init : function() {
		var f = document.forms[0];
		
		new Ajax.Updater('select_study_cases', '/study_cases', 
			{
				asynchronous:true, 
				evalScripts:true, 
				method:'get'
			});
			
		// Get the selected contents as text and place it in the input
		f.someval.value = tinyMCEPopup.editor.selection.getContent({format : 'text'});
		f.somearg.value = tinyMCEPopup.getWindowArg('some_custom_arg');
	},

	insert : function() {
		// Insert the contents from the input into the document
	 	var value = document.forms[0].someval.value;
		var internal_link = '<a href="/study_cases/'+ $('select_study_cases').value + '/pages/' + $('select_pages').value +'" >'+value + '</a>';
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, internal_link);
		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(InternallinkDialog.init, InternallinkDialog);

function load_select_pages(value){
	if (value!=''){
		new Ajax.Updater('select_pages', '/study_cases/'+value+'/pages', 
		{
			asynchronous:true, 
			evalScripts:true, 
			method:'get'
		});
	} else{
		$('select_pages').innerHTML = '';
	}
}