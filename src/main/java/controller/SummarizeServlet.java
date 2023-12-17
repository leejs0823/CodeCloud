package controller;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.concurrent.CompletableFuture;

@WebServlet("/summarizeText")
public class SummarizeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String OPENAI_API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "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"; // 여기에 본인의 API 키를 넣으세요.

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userMessage = request.getParameter("textToSummarize");

        try {
            String aiResponse = getResponseFromOpenAI(userMessage).join();
            response.setContentType("application/json"); // JSON 형태의 응답을 기대합니다.
            response.getWriter().write(aiResponse);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "API 요청 중 오류가 발생했습니다.");
        }
    }
    
    

    private CompletableFuture<String> getResponseFromOpenAI(String userMessage) {
        HttpClient client = HttpClient.newHttpClient();

        // JSON 요청 본문을 올바르게 구성합니다.
     // JSON 요청 본문을 올바르게 구성합니다.
        String requestBody = String.format("{\"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": \"%s\"}]}",userMessage.replace("\"", "\\\""));

        System.out.println(requestBody);
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(OPENAI_API_URL))
            .header("Content-Type", "application/json")
            .header("Authorization", "Bearer " + API_KEY)
            .POST(HttpRequest.BodyPublishers.ofString(requestBody, StandardCharsets.UTF_8))
            .build();

        return client.sendAsync(request, HttpResponse.BodyHandlers.ofString())
                     .thenApply(HttpResponse::body);
             
    }
    
  
}
