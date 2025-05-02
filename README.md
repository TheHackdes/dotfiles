# Dotfiles

Vous trouverez ici mes fichiers de configuration personnels créés uniquement pour optimiser mon travail en tant qu'administrateur système et réseau. Pas de transitions élégantes ou d'interface ergonomique, mais simplement des outils pour améliorer la productivité.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé l'outil suivant :

- [`stow`](https://www.gnu.org/software/stow/)

## Cloner le projet

Pour cloner ce dépôt, exécutez les commandes suivantes dans votre terminal :

```bash
cd ~
git clone https://github.com/TheHackdes/dotfiles
cd dotfiles
```

## Appliquer une configuration

Pour appliquer une configuration spécifique, utilisez la commande suivante. Par exemple, pour configurer `kitty`, exécutez la commande suivante dans le répertoire cloné :

```bash
stow kitty
```

## Contribuer

1. Fork
2. Crée ta branche : `git checkout -b feature/ma-fonction`
3. Commit : `git commit -m "feat: ajoute une fonction"`
4. Push : `git push origin feature/ma-fonction`
5. Ouvre une Pull Request

## Auteur

- @TheHackdes
