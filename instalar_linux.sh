#!/bin/bash

echo "🧠 Iniciando o Instalador Automático do TermiSmarth para Linux..."
echo "------------------------------------------------------------"

# 1. Atualiza o sistema e instala dependências nativas
echo "📦 Passo 1: Instalando dependências do sistema (Python, Tkinter e Git)..."
sudo apt update
sudo apt install python3-pip python3-tk git -y

# 2. Instala as bibliotecas de IA e interface pulando bloqueios do Ubuntu
echo "🐍 Passo 2: Instalando bibliotecas do Python (CustomTkinter, Requests, PyAutoGUI)..."
pip3 install customtkinter requests pyautogui --break-system-packages

# 3. Cria a pasta oficial do programa no computador do usuário
echo "📂 Passo 3: Configurando as pastas do sistema..."
mkdir -p ~/TermiSmarth

# 4. Baixa a interface atualizada direto do seu repositório do GitHub
echo "🌐 Passo 4: Baixando os arquivos mais recentes da IA..."
curl -s https://githubusercontent.com -o ~/TermiSmarth/interface.py

# 5. Cria o arquivo secreto de autorização de telas do Linux (.Xauthority) caso não exista
echo "🖥️ Passo 5: Configurando permissões de tela visual..."
touch ~/.Xauthority
chmod 600 ~/.Xauthority

# 6. Cria o Gancho Automático no arquivo .bashrc do usuário
echo "🪝 Passo 6: Injetando o corretor inteligente no terminal..."
if ! grep -q "command_not_found_handle" ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc

# --- GANCHO INTELIGENTE TERMISMARTH ---
command_not_found_handle() {
    python3 ~/TermiSmarth/interface.py "$@"
    return 127
}
EOF
    echo "✅ Gancho injetado com sucesso no ~/.bashrc!"
else
    echo "⚠️ O gancho do TermiSmarth já estava instalado."
fi

echo "------------------------------------------------------------"
echo "🎉 INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
echo "🚀 Reinicie o seu terminal ou digite 'source ~/.bashrc' para ativar."
echo "💡 Teste digitando um comando errado de propósito (ex: gutr status)"
