import com.cyberpunk.events.Event;
import com.cyberpunk.events.EventDB;
import com.cyberpunk.servlets.GameServlet;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.mockito.Mockito.*;

public class GameServletTest {
    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private HttpSession session;

    private final GameServlet servlet = new GameServlet();


    @Test
    public void testCorrectParam() throws Exception {
        MockitoAnnotations.openMocks(this);
        when(request.getSession(true)).thenReturn(session);
        Event event = EventDB.getInstance().getEvent("begin");
        when(request.getParameter("selectedAction")).thenReturn("begin");
        servlet.doPost(request, response);
        verify(session).setAttribute("currentEvent", event);
    }

    @Test
    public void testNullParam() throws Exception {
        MockitoAnnotations.openMocks(this);
        when(request.getSession(true)).thenReturn(session);
        when(request.getParameter("selectedAction")).thenReturn(null);
        servlet.doPost(request, response);
        verify(session, never()).setAttribute(anyString(),any());

    }

    @Test
    public void testIncorrectParam() throws Exception {
        MockitoAnnotations.openMocks(this);
        when(request.getSession(true)).thenReturn(session);
        when(request.getParameter("selectedAction")).thenReturn("UnrealEVENT123455");
        servlet.doPost(request, response);
        verify(session, never()).setAttribute(anyString(),any());

    }

}
