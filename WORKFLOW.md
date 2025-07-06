# 🚀 Guia de Fluxo de Trabalho com Branches

Este documento descreve o fluxo de trabalho com branches implementado neste repositório para garantir um desenvolvimento organizado e eficiente.

## 📋 Sumário

- [Estratégia de Branches](#estratégia-de-branches)
- [Convenções de Nomenclatura](#convenções-de-nomenclatura)
- [Fluxo de Trabalho](#fluxo-de-trabalho)
- [Pull Requests](#pull-requests)
- [Proteção de Branches](#proteção-de-branches)
- [Automação e CI/CD](#automação-e-cicd)
- [Comandos Úteis](#comandos-úteis)

## 🌿 Estratégia de Branches

### Branch Principal
- **`main`**: Branch de produção, sempre estável e deployável
  - Contém apenas código testado e aprovado
  - Protegida contra push direto
  - Requer pull request para mudanças

### Branches de Desenvolvimento
- **`develop`**: Branch de integração e desenvolvimento
  - Onde features são integradas antes do merge para main
  - Base para criação de novas features
  - Sincronizada regularmente com main

### Branches de Feature
- **`feature/[nome-da-feature]`**: Para desenvolvimento de novas funcionalidades
- **`fix/[nome-do-bug]`**: Para correções de bugs
- **`docs/[descrição]`**: Para melhorias na documentação
- **`chore/[descrição]`**: Para tarefas de manutenção

## 📝 Convenções de Nomenclatura

### Formato Geral
```
tipo/breve-descrição-em-kebab-case
```

### Tipos de Branch
- `feature/`: Novas funcionalidades
- `fix/`: Correções de bugs
- `docs/`: Documentação
- `chore/`: Tarefas de manutenção
- `refactor/`: Refatoração de código
- `style/`: Melhorias de estilo/formatação
- `test/`: Adição ou correção de testes
- `perf/`: Melhorias de performance

### Exemplos
```bash
feature/adicionar-nova-secao-skills
fix/corrigir-link-quebrado-readme
docs/atualizar-guia-contribuicao
chore/configurar-github-actions
refactor/reorganizar-estrutura-imagens
style/melhorar-formatacao-badges
```

## 🔄 Fluxo de Trabalho

### 1. Criando uma Nova Feature

```bash
# 1. Atualizar branch principal
git checkout main
git pull origin main

# 2. Criar nova branch
git checkout -b feature/minha-nova-feature

# 3. Fazer alterações e commits
git add .
git commit -m "feat: adicionar nova funcionalidade"

# 4. Enviar para o repositório remoto
git push origin feature/minha-nova-feature

# 5. Abrir Pull Request no GitHub
```

### 2. Trabalhando com Develop

```bash
# Sincronizar develop com main
git checkout develop
git pull origin main
git push origin develop

# Criar feature a partir de develop
git checkout -b feature/nova-funcionalidade develop
```

### 3. Hotfix em Produção

```bash
# Criar hotfix diretamente de main
git checkout main
git pull origin main
git checkout -b fix/hotfix-critico

# Fazer correção
git add .
git commit -m "fix: corrigir bug crítico"

# Enviar e criar PR para main
git push origin fix/hotfix-critico
```

## 🔍 Pull Requests

### Checklist Obrigatório
- [ ] Título descritivo seguindo convenções
- [ ] Descrição clara das mudanças
- [ ] Tipo de mudança selecionado
- [ ] Testes passando (quando aplicável)
- [ ] Documentação atualizada
- [ ] Screenshots para mudanças visuais

### Processo de Review
1. **Criação**: Usar template padrão
2. **Labels**: Aplicados automaticamente
3. **Review**: Pelo menos uma aprovação
4. **Merge**: Squash merge preferido
5. **Cleanup**: Branch deletada após merge

## 🛡️ Proteção de Branches

### Main Branch
- ✅ Requer pull request
- ✅ Requer aprovação de reviewers
- ✅ Requer status checks
- ✅ Requer branches atualizadas
- ✅ Restringe push direto
- ✅ Restringe force push

### Develop Branch
- ✅ Requer pull request
- ✅ Permite merge direto de features
- ✅ Requer status checks básicos

## 🤖 Automação e CI/CD

### GitHub Actions Configuradas

#### 1. **Quality Check** (`.github/workflows/quality-check.yml`)
- Lint de Markdown
- Verificação de ortografia
- Validação de links
- Validação de YAML

#### 2. **Auto Label** (`.github/workflows/auto-label.yml`)
- Labels automáticos baseados em arquivos alterados
- Categorização de PRs

#### 3. **Snake Animation** (`.github/workflows/snake.yml`)
- Geração diária do gráfico de contribuições
- Atualização automática

### Status Checks
Todos os workflows devem passar antes do merge:
- ✅ Lint de Markdown
- ✅ Verificação de ortografia
- ✅ Validação de links
- ✅ Validação de YAML

## 🛠️ Comandos Úteis

### Sincronização
```bash
# Sincronizar fork com upstream
git remote add upstream https://github.com/original/repo.git
git fetch upstream
git checkout main
git merge upstream/main

# Atualizar todas as branches
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all
```

### Limpeza
```bash
# Limpar branches locais deletadas no remoto
git remote prune origin

# Deletar branches locais já mergeadas
git branch --merged main | grep -v "main\|develop" | xargs -n 1 git branch -d
```

### Verificação
```bash
# Ver status de todas as branches
git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads

# Ver branches não mergeadas
git branch --no-merged main
```

## 📊 Versionamento

### Semantic Versioning
- **MAJOR**: Mudanças incompatíveis
- **MINOR**: Novas funcionalidades compatíveis
- **PATCH**: Correções de bugs

### Tags
```bash
# Criar tag
git tag -a v1.0.0 -m "Versão 1.0.0"

# Enviar tags
git push origin --tags
```

## 🎯 Boas Práticas

### Commits
- Use mensagens descritivas
- Siga o padrão: `tipo: descrição`
- Faça commits pequenos e frequentes
- Use co-authored-by para colaborações

### Branches
- Mantenha branches pequenas e focadas
- Delete branches após merge
- Sincronize regularmente com main
- Use rebase para manter histórico limpo

### Pull Requests
- Teste localmente antes de criar PR
- Mantenha PRs pequenos e focados
- Responda a comentários rapidamente
- Use draft PRs para trabalho em progresso

## 🆘 Troubleshooting

### Conflitos de Merge
```bash
# Resolver conflitos
git checkout main
git pull origin main
git checkout feature/minha-branch
git rebase main

# Resolver conflitos manualmente
git add .
git rebase --continue
```

### Reverter Mudanças
```bash
# Reverter commit
git revert <commit-hash>

# Reverter merge
git revert -m 1 <merge-commit-hash>
```

---

## 📚 Recursos Adicionais

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Git Branching Strategies](https://nvie.com/posts/a-successful-git-branching-model/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub Actions](https://docs.github.com/en/actions)

---

**Última atualização**: $(date)
**Versão**: 1.0.0