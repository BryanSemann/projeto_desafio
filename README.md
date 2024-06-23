# projeto_desafio

### Explicação das Decisões Técnicas no Projeto

**Arquitetura do Projeto**
Para este projeto, optei por utilizar a arquitetura MVVM (Model-View-ViewModel). Essa arquitetura é amplamente adotada em projetos Flutter por sua capacidade de separar a lógica de negócios da interface do usuário, resultando em um código mais modular, testável e escalável.

**MVVM em Detalhes:**
- **Model:** Representa as estruturas de dados. No nosso caso, temos os modelos `Car` e `Lead` que representam os carros e os leads de compra, respectivamente.
- **View:** A interface do usuário. Neste projeto, temos várias views como `CarListView` e `CarDetailView`.
- **ViewModel:** Contém a lógica de apresentação e comunica-se com os modelos para fornecer dados à View. Usamos `CarListViewModel` e `LeadSubmissionViewModel`.

**Motivação para Escolha de MVVM:**
- **Separação de Responsabilidades:** Facilita a manutenção e testes do código ao separar claramente a lógica de negócios e a interface do usuário.
- **Reatividade:** Utilizando o pacote `Provider`, podemos facilmente atualizar a UI em resposta a mudanças nos dados subjacentes.

**Serviços e Armazenamento Local**
Para gerenciar dados e interações com a API e armazenamento local, criei serviços específicos.

**ApiService:**
- **Fetch Cars:** Busca dados do JSON em `https://wswork.com.br/cars.json`.
- **Post Lead:** Envia leads para `https://www.wswork.com.br/cars/leads`.

**DatabaseService:**
- **SQLite:** Utilizamos SQLite para armazenamento local dos leads, garantindo que os dados do usuário possam ser salvos offline e enviados posteriormente quando necessário.
- **CRUD:** Métodos de inserção e busca de leads foram implementados para gerenciar os dados localmente.

**Interface do Usuário (UI)**
Para a interface do usuário, foram criadas duas principais views:
- **CarListView:** Exibe a lista de carros. Utiliza um `ListView.builder` para renderizar cada carro e permite navegação para `CarDetailView`.
- **CarDetailView:** Exibe detalhes do carro selecionado e permite que o usuário registre o interesse no carro (lead).

**Navegação**
Utilizei a navegação nomeada do Flutter para facilitar a navegação entre as diferentes telas do aplicativo. O arquivo `main.dart` define as rotas principais e inicializa os view models necessários.

**Gerenciamento de Estado**
Optei pelo uso do pacote `Provider` para gerenciamento de estado devido à sua simplicidade e integração fluida com a arquitetura MVVM. Ele permite que a UI reaja de maneira eficiente às mudanças de estado, garantindo uma experiência de usuário responsiva.

**Rotina de Postagem Automática**
Implementei uma rotina para enviar os leads salvos no banco de dados para a API de tempos em tempos. Isso poderia ser realizado utilizando o pacote `WorkManager` para tarefas em segundo plano ou um `Timer` para execução periódica.

**Decisões de Design**
- **Reusabilidade:** Componentes de UI e lógica de negócios foram projetados para serem altamente reutilizáveis e modulares.
- **Escalabilidade:** A arquitetura MVVM e o uso de `Provider` facilitam a adição de novas funcionalidades sem comprometer a estabilidade do código existente.
- **Usuário Primeiro:** O design das views e a navegação foram pensados para proporcionar uma experiência de usuário intuitiva e sem fricções.

### Conclusão
Este projeto foi estruturado para ser escalável, modular e de fácil manutenção. A arquitetura MVVM, combinada com o uso de `Provider` para gerenciamento de estado e SQLite para armazenamento local, garante que o aplicativo não apenas atenda aos requisitos funcionais, mas também ofereça uma base sólida para futuras expansões e melhorias.
