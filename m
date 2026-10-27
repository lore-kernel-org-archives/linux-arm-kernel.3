Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7CD606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BqgajBGp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4yhVrm0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=; b=BqgajBGpF10p+l
	CCtEg5AYt9soQQvhEVl/NsijfNgyB/jfLLY1o5EitmoOdv/P5NuSsNXQzU4ajqpdJq3ZwTbGnTDHi
	Px8uWaItbkBo6fp8vpMKDTl2I9O+Q9MKmvPn+Iz6qCxZS43Aw6shhFqiz3LHAVqkNf3qn1hQMiEsq
	jt2Y1YMjwrGfvyDab85MQyqqs0wOXtOljrBrwYeMrJR8dNG0K2fZ1IbDLb9uF6xFrzKHqrYOrEBfG
	V7cIOqRPBTX6xHoHfwcEwlPzxK8e7dWUzaxKYIu2fmHx1g/um410mlTqwcVcY4+XrQdnOomSCJ8+U
	/qRgw4zDga4CnrFDVuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqlt-00000005wF5-3DAK;
	Tue, 27 Oct 2026 23:40:01 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqlm-00000005wCH-2o89
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:39:55 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-84d5e56f876so296269a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144393; x=1793749193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=j4yhVrm06Kb5R6Gv04aAlqJx3A/8ThMo5VKyXPIzxrjiBnHrjy6LUlmGMB6PPuiLsK
         tyIpZiw68Gxk1/W4FZAEwd8hFNTOHGSqm9MrDqG2IETAQkQrbSs+6Z8omeM2uiP0jnqa
         Pf3pqtG3opyQybV05MmqDfGL2R5UsPPddHmpPGXrrXQ+3Ntlg1flE3ykuKTYkwc9cuTc
         NA/gEGlmwIMXKO0LOBhU1PQvmcSqsuAVqTA2EX61jKN8YXCaVXIlURzyvHRZDSyRDh6/
         ZUY/F10av1Jq8faHa3ax+cIXHJcCIJnb3jt24wa0GXCZ41Cqkna0Igq9Ywn64SWneouo
         myRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144393; x=1793749193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=OZnN0HiIOdp45W0Bk4dEs4ieM8Gm9prqxKVnwvz2eIS2i7OYiO1XdO0DcUiCLVhonk
         TliW3I7G71f9KoIaYZAeCXr8k/Z3EsH0njzFK7yaGVQEffMyeuGqDBuB8lhL2FMAnQ0V
         pKkYhG4h1OC3djze95B8yDTNQC/5qj5ELA/sXi8tqNi3GFfoqkhvo1AQ6KvtI+K3j4TC
         Ltzs1J/ECEjBWdsYEc8fSWrOJqk0wYnAs29bXAFvgnrKEX50PswYjY2Ik/HEYJQjHyUJ
         0bBxAYXyuLuq12HNcOWTlV1u2ShP54/s9Fq4JZtzUpYclSFNzQMw79SVyXmivK6PcjU2
         l2WA==
X-Forwarded-Encrypted: i=1; AKwUvBxbrskAw/bLQRAP4TvEN8zWnWZkuoBZiQLwvi7dDMRRVh2sQoLgIMxNftcVeTb/kPrAB21t6AuQVh7cdzhqENGz@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0DvWc/EtgoGLjgyyg2AssUxJ5wS063xICCTnrq5Sz8uRBu/br
	ntjRsvZL1L80BjPxYzts61AyyAnfrIuuJgdnkOgq8naasmfqGmIBTK57
X-Gm-Gg: AYBFou3yfJAosOLFZgvzsGhBNuxcmKpX3HAEc5V0kcSfuCsqlL5gts85ESmXist+lbI
	Ck8vppXxZcQ144SG8gIleD5KfA8rUZrDYNBhxJJujl6jhnbZpjFUBnv/Qeo/2w/BzLRBZf6XwvM
	Ixka0EkyndTnCE/RgncN/3rZLqmuTo4cjYAZDM2qjVIQ2DXPqxHjet13nOVrMfUqUor1WOqww7N
	bW/B3+m295wNDRjshGTSq2ic2B31fjkdbahit8Owl1ZwGSUctbMhfSiqD7XvQvPStOl78fuLJtH
	i6Ug8hQifdfZYtMuFRFpSa46dB2hACjyY/cutjn8v/hXCsWq9weZbPwSq9WhQ1zOWheyDSqtfIi
	MA/s/Xwm5nBISPOSTt4sFmDa84au8yr/MJ8F/6PNzcc9aCK7fi94APAVX/kHSr5SVnXF1qMvogS
	yMJMVBoed6B74YSbi5z9zShKk4HyKd6+u28QL0mWe6T/nOS1wdeJMQZGhzhY+45Y9E2+Pg8HYve
	iX2xPAkTgExGQgs4GzPGAihQuxHbVgDx0DDc6WMRDTBXjmfekv6eNQlbYJKQiisozP/JRpTh9Ml
	j6IjqSL5I3aPg1CNtpvDepkzfsD99bHhiYuPPI432dC/BYDEyrYsrY1NOC9/QYVXKBb3yxGpG2Y
	LJUufXw7m73UbZNlUEgeOH75jo7j34QwwN2MZLBmRbFjfwOjbqGzCzFPoXMtRY0FK6kz7/g0+w+
	9jNXw=
X-Received: by 2002:a05:6830:25d1:b0:82f:5471:4dd7 with SMTP id 46e09a7af769-85ac11bfa1cmr895947a34.30.1793144393599;
        Tue, 27 Oct 2026 16:39:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1fd31a6fsm62836a34.18.2026.10.27.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:39:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:39:46 -0600
Subject: [PATCH v7 1/5] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-serial-8250-dma-cancel-v1-v7-1-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Timur Tabi <timur@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_163954_728741_B2D20D85 
X-CRM114-Status: GOOD (  13.29  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 4805b644ccb1..b6f108d34854 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1080,18 +1080,13 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 
 static int omap_8250_tx_dma(struct uart_8250_port *p);
 
-static void omap_8250_dma_tx_complete(void *param)
+static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tport = &p->port.state->port;
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
-	guard(uart_port_lock_irqsave)(&p->port);
-	if (dma->shutting_down)
-		return;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
@@ -1123,6 +1118,18 @@ static void omap_8250_dma_tx_complete(void *param)
 	}
 }
 
+static void omap_8250_dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (dma->shutting_down)
+		return;
+	omap_8250_tx_dma_complete(p);
+}
+
 static int omap_8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;

-- 
2.53.0


