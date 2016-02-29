#!/bin/bash
# script
# description: check and monitors the disk usage reporting status by email.
# version: 2.0
# created by: Braier Alves
# changed by: Joao Bernardes


partitionUsage=(`df -P | egrep -v Filesystem\|tmpfs | awk '{print $5}' | awk -F % '{print $1}'`)
partitionName=(`df -P | egrep -v Filesystem\|tmpfs | awk '{print $6}'`)

memUsage=`free -m | grep Mem | awk '{print $3}' | bc -l`
memTotal=`free -m | grep Mem | awk '{print $2}' | bc -l`
swapUsage=`free -m | grep Swap | awk '{print $3}' | bc -l`
swapTotal=`free -m | grep Swap | awk '{print $2}' | bc -l`
memPerc=`echo "$memUsage*100/$memTotal" | bc`
swapPerc=`echo "$swapUsage*100/$swapTotal" | bc`

cpuUsrUsage=`top -b -n1 | grep "Cpu" | awk '{print $2}' | awk -F % '{print $1}'`
cpuSysUsage=`top -b -n1 | grep "Cpu" | awk '{print $3}' | awk -F % '{print $1}'`
cpuNiceUsage=`top -b -n1 | grep "Cpu" | awk '{print $4}' | awk -F % '{print $1}'`

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

#Transformar na funcao de verificacao de particoes
count=0
for i in "${partitionUsage[@]}"
do
  echo "A partição ${partitionName[$count]} está com $i% de seu volume ocupado."
  count=$count+1
done


# Transformar na funcao de verificacao de memoria
echo memoria uso: $memUsage MB
echo memoria total: $memTotal MB
echo swap uso: $swapUsage MB
echo swap total $swapTotal MB
echo Uso de memória: $memPerc%
echo Uso de Swap: $swapPerc%

# Transformar na função de verificação de processamento
echo "Uso de CPU (User): $cpuUsrUsage%"
echo "Uso de CPU (System): $cpuSysUsage%"
echo "Uso de CPU (Nice) $cpuNiceUsage%"


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
