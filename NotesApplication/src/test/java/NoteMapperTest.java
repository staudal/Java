import com.example.notesapplication.persistence.DatabaseConnection;
import com.example.notesapplication.persistence.NoteMapper;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class NoteMapperTest {
    NoteMapper mapper = new NoteMapper();

    @BeforeAll
    public void setup(DatabaseConnection connection) {
        connection = new DatabaseConnection();
        c
    }

    @Test
    public void addNote() {

    }
}
