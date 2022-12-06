#!/bin/bash


#####   configuration SSH    ######


# Copier le fichier de configuration sur le serveur
cp ./config__files/ssh/sshd_config /etc/ssh/sshd_config
cp ./config__files/ssh/Banner /etc/Banner


#####  Création d'un user   ######


echo -e "\nVeuillez ecrire votre nom d'utilisateur :\n"
read USERNAME

useradd -m -d /home/$USERNAME -s /bin/bash $USERNAME
echo -e "\nUtilisateru crée\n"

echo -e "\nVeuillez saisir un mot de passe :\n"
passwd $USERNAME

# ajout au grroupe sudo 
usermod -aG sudo $USERNAME
echo -e "l'Utilisateur est devenue root"


#####   Authentification par clé    ######


echo -e "\nVeuillez entrer votre clé :\n"
read KEY

echo $KEY >> ~/.ssh/authorized_keys
echo -e "\nVotre clé a été ajoutée !!\n"

# Redemarrer le service sshd

systemctl restart sshd
