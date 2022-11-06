import com.example.notesapplication.persistence.DatabaseConnection;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class NoteMapperTest {
    NoteMapper mapper = new NoteMapper();

    @BeforeAll
    public void setup(DatabaseConnection connection) {
        connection = new DatabaseConnection();
    }

    @Test
    public void addNote() {

    }
}
