
console.log('Hello World');
function confirmDelete(id) {

    Swal.fire({
        title: 'Are you sure?',
        text: "This will permanently delete.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Yes, delete it!',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('deleteForm-' + id).submit();
        }
    });
}

function confirmAction(id, message, action) {
    Swal.fire({
        title: 'Are you sure?',
        text: message,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: action === 'approve' ? '#198754' : '#d33',
        cancelButtonColor: '#6c757d',
        confirmButtonText: action === 'approve' ? 'Yes, approve it!' : 'Yes, reject it!',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById(action + '-' + id).submit();
        }
    });
}

  function showSuccessMessage(message) {
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: message,
            showConfirmButton: false,
            timer: 2000
        });
    }