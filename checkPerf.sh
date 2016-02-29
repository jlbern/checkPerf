#!/bin/bash
# script
# description: check and monitors the disk usage reporting status by email.
# version: 2.0
# created by: Braier Alves
# changed by: Joao Bernardes, 

#ESPACO=`df -h | awk '{print $5}' | grep -v Use | sort -nr | awk -F % '{print $1}' | head -n1`
# variavel alterada para acomodar os valores de todas as particoes
ESPACO=`df -P | awk '{print $5}' | grep -v Capacity | awk -F % '{print $1}'`
ALERTA_NORMAL="O DISCO ESTA OPERANDO NORMALMENTE. \n\n `df -h ` \n\n `uname -a`"
ALERTA_RISCO="O DISCO ESTA PRESTES A FICAR SEM ESPACO!! POR FAVOR, VERIFICAR!!  \n\n `df -h `  \n\n `uname -a`"
ALERTA_CHEIO="O DISCO ESTA CHEIO!!! VERIFICAR COM URGENCIA!!! \n\n `df -h ` \n\n  `uname -a`"
ASSUNTO_0="O DISCO ESTA OPERANDO NORMALMENTE"
ASSUNTO_1="ESPACO EM DISCO PREOCUPANTE!!"
ASSUNTO_2="ESPACO EM DISCO ACABOU!!!"
EMAIL_DST="email de destinatแrio"
EMAIL_ORI="email de origem"
SERVER="servidor SMTP"
SMTPLOGIN="login"
SMTPPASS="senha"

#Alimenta o array
count=0
while read excpt
  do
    espacoArray[$count]="$ESPACO"
    echo $espacoArray[$count]
    count=$count+1
done < $ESPACO
unset count

#case $ESPACO in

#[1-9])# Caso o disco esteja entre 1% a 9%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
#sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

 #       1[0-9])# Caso o disco esteja entre 1% a 19%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
  #      sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

   #             2[0-9])# Caso o disco esteja entre 1% a 29%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
    #            sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

     #                   3[0-9])# Caso o disco esteja entre 1% a 39%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
      #                  sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

       #                         4[0-9])# Caso o disco esteja entre 1% a 49%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
        #                        sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

         #                               5[0-9])# Caso o disco esteja entre 1% a 59%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
          #                              sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

           #                     6[0-9])# Caso o disco esteja entre 1% a 69%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
            #                    sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

             #           7[0-9])# Caso o disco esteja entre 1% a 79%, um email ้ enviado avisando: "O DISCO ESTม OPERANDO NORMALMENTE."
              #          sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_0 -m "$ALERTA_NORMAL" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

               # 8[0-9])# Caso o disco esteja entre 81% a 89%, um email ้ enviado avisando: "O DISCO ESTA PRESTES A FICAR SEM ESPACO!! POR FAVOR, VERIFICAR!!"
                #sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_1 -m "$ALERTA_RISCO" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

        #9[0-9])# Caso o disco esteja entre 91% a 99%, um email ้ enviado avisando: "O DISCO ESTA PRESTES A FICAR SEM ESPACO!! POR FAVOR, VERIFICAR!!"
       # sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_1 -m "$ALERTA_RISCO" -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

#100)# Caso o disco esteja cheio(100%), um email ้ enviado avisando: "O DISCO ESTA CHEIO!!! VERIFICAR COM URGENCIA!!!"
#sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $ASSUNTO_2 -m "$ALERTA_CHEIO"  -s $SERVER:25 -xu $SMTPLOGIN -xp $SMTPPASS;;

#esac
