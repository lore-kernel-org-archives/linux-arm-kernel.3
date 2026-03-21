Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F37B109446A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UgY+bZ2Pi6QuHNfOxNlG1hBhelRVpcsVVWMlo73lQbk=; b=hsa92+6pFfdG2o/cBmWZcyjMUa
	vWDJPDvhc0Ot1d30YJkyxUlXeRoPqmoa1jCCvMxvKs1wwVH3cT7oSI8FAu8C8Ckzjl1wN34Vk/I28
	syzSh3fzwNHDjFEwdGUCYGJkCtAZvRucoVal0yN2qEmpy+mgiiVLQKR+64ozwBoqJm1G/3V1r9ds3
	b5SW8/ppMnNRurM9OOmmM5RGndrnp7fzjsPx2QwP1GmwgYghUjqryIGfYujZr2+7X8tysu40sTMVR
	fseQfiEDbQHqan0+wcHEYJvEITlbQrMX97/+M6LUK5Yf3npAeosMVY6oL0fsusnTj+H1l+kIiZmDu
	rXRHCvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u5Z-0000000ENwa-21zG;
	Sat, 21 Mar 2026 11:01:53 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u5W-0000000ENrm-376M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 11:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090807;
	bh=UgY+bZ2Pi6QuHNfOxNlG1hBhelRVpcsVVWMlo73lQbk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=YKEIMMMsqaHQmUWA1d2Mub/qnFrOHbhzPWfuS/Wi7+J0sYHAi+CAKsj2YZvg4ONvK
	 8miT1wRCcG/AXZ8IQCBQ/lv33764yc4IMLxNdosu20AURLS5l7t4s7N5uiqEw6JMlW
	 2q6rQwgTxIYlmmUNeKrwGsbahxZnRTDbL+pQBVso=
X-QQ-mid: esmtpgz13t1774090799t5668526a
X-QQ-Originating-IP: ZrdkgHjjMhQNONcsOHs5GV8Jhia1x2+PRCdOqvj8ShE=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 18:59:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4747820319854510971
EX-QQ-RecipientCnt: 14
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] tty: atmel_serial: update outdated reference to atmel_tasklet_func()
Date: Sat, 21 Mar 2026 18:59:56 +0800
Message-Id: <20260321105956.8401-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: Nug9j1wRJ1f1Elj023aqJE2KafR74f7Jn9shFAujVoTzDqB3uojZpI/O
	jK1yMDTq7fZdrOqVHhwLM0w+PDaLbXxO3xcfQ+KNExLFLBu9AOAACXsY14V2BBs6yqKvBoc
	y7lAmHNobr31HcrzvvswKHYDBobLgqnX0qo7ih4gkNb5Cr/NPHKQR00/Otvz/QqhSeXlbYT
	okDmQy+RTspW2f7ZEda0SzJunu9M7IDSc2IR//Jy80PAOOPVDjZJL+pkP6VN6V94NF/oNXk
	r/hdwNPnhjfzyxAb+NKveo4ONtIrY0AeDh7zX2onEoG9JRLWZos6uqbM4Er5Jv9eOkriC3A
	rmF5BU6J315VLbbP5uQvOCzPCx3xSqBbWQ0e7MzT1zN1gpwE0GajvGh2Dj1Oeqa3WyPzkcl
	eOz7ApA6oRybmN0ZW1rGvAXN6A0gqIhJpqPD/011E0QF2rN/b/dGm54cyxufENql4jAH9Vj
	Hysg9+R0UShuBD7Z3ACcf4lq3Os2SmwutXjrSW9zVrBkVbMLDfF3SbzO9SvXR7oWhJC2d/4
	TbJxBwXcYarG5tX9UWhSkZQ4mCtpT6Hw45VHdXDxE4QB/Kwtpmnp6o/MQlnPiRrQiKHnRj0
	TiQw8MheoHwoh9kMP6oM+EQXtg2a/oItOpilhlmg1d74k3wp3OXapxT9UyXTh0tfiYcS+sx
	tkQBFRQ+FvPKCaDuFnSVA5jpKJdaw4WwEM4EdDnWQEFktJpt4F3JIWvjzO75ssi2GuXE8gU
	K31C5P77nv+01GYXALpSUCvPbzOnJo3bhPEpu2HI6dAj7vp6osgavDNFV1tcKXED7NlZhIP
	KqoU+FwzHSlWhChGLPtZK6zFBehZkrk0irDmjy+sknrmOgUXwxRd4oP7jzzJ5Fd4vxkh/sE
	q2wpEWUlJnIuZo932fmnO1RB2ltB0QSBWlE/t91DhHcRzCoV3E8TerHMBo3KmiZKfQ7/Sdh
	Ktuc/pWutbAYym5EaeJlqSiIWdT3MWUvSFEASsXptx1x4diBhfNBirUReaeJbIc1i/1laLv
	2jC4MhXETLdZrqT2OPdU13qTlugZsdNycFH4CSCMvmbK0TqmZRKfp2myQdWhMvQ65JKJLxG
	4vvc5lx1qE6w4+HfDidClecV9mWZqOkzg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_040151_133467_C2E60BAC 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The modem-status comparison that used irq_status_prev was
moved from atmel_tasklet_func() into atmel_handle_status() in
commit 2c7af5ba65cf ("tty: serial: atmel: rework interrupt and
wakeup handling").  atmel_tasklet_func() itself was later split
into atmel_tasklet_rx_func() and atmel_tasklet_tx_func() in
commit 00e8e65870cc ("tty/serial: atmel: split tx and rx
paths").  Update the comment to reference
atmel_handle_status(), which now performs the comparison.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/tty/serial/atmel_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 08dd8f887956..5d8c1cfc1c60 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1927,7 +1927,7 @@ static int atmel_startup(struct uart_port *port)
 		atmel_uart_writel(port, ATMEL_US_FMR, fmr);
 	}
 
-	/* Save current CSR for comparison in atmel_tasklet_func() */
+	/* Save current CSR for comparison in atmel_handle_status() */
 	atmel_port->irq_status_prev = atmel_uart_readl(port, ATMEL_US_CSR);
 
 	/*
-- 
2.25.1


