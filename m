Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8371E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wKWPcZIS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DbWcZJLz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=; b=wKWPcZISHO1WaC
	aBTD/hDZU7l0GeNKC24Vf/+y6EG40ekajLkWs10QbLGXR4kh1+ZXbdBspclnjV/ZcPBoKsi5/iIpG
	iWPoQXFIcXVEtkAyulN+4sow3mMjWkkBpqIQ648tGPTvV32ecRUK/G1M+g7SzmhjUfi9y3cKmgGfm
	762qdAIp6T6ht4xvRrW5kQ7YEX9b919R7Q2P5ediFvCUOwtOIa9meLMbwh4uxeZ0fLEWdBox3x1mR
	Qc3i10BUyLNuoO3x1Gq8Lj0fKGPJ7fJWOy5XPOJWVSpxoW90V7eESyRFNkgQdhGJSb7wFwjekiUIQ
	j5z0Ao0QwBRvJJ24gUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKijJ-00000000Wtb-0U8d;
	Sat, 24 Oct 2026 20:52:41 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKijC-00000000WrD-0i74
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:52:35 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-833e671ee9fso1689257a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875153; x=1793479953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=DbWcZJLzxbOgs51TU+l9JnR1WsPoGQVCB8NjS2x/tqdr7BcUSG1ogQxBy4DYPkD1U1
         B1HGRWuCvk9+L8rmENIQ3h7oazjLB4epxySyzrVfvjI9Vi+mDayhmbXYg5gnxfV9zdcd
         s14lKlYTHw9OkHZQ1/hYl0r4O+lp8qdTaXJzPM16A5BXlA2KquPCHirkHxzgUJn1Q3GA
         vEbBcsYZDQp67UDWJi7mv7qtjbhz+ZAGYf/jlGemTru/Ao2/MI4DB3KmvqplOqQzlK4H
         bXvMPcPXREkJGhExyDMrgr3pMaR8yaf+eQ90viYBZMg/kZgYkQW5KTZrTAuLu4+gw+/2
         15Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875153; x=1793479953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=iiIL1TNuq76g7nFmY1lYLY/EHYgVJu+ygNeTee2B3e909HbM+Zb8NmOqAV4qX+Ln7C
         0I1FILU2+KcZw9ct8UjxtMGZ5qcBN3lFHOp8KJKsPgFelqCUh5rep369m8k0AYoqzkHm
         vRw2oyyrq11aARmAWwo/SXu1akKi/nLLCrXRMekcCxOikknJYbD031Gl5elnDDMnut3b
         082hHYDhf5BGR4Eif7v5IrxVJkG1oKDjyrdiCSQyiw8a2JlprlA5EHnX3M3zubFi9zll
         q9qaUpHwatc/088QjmgHf+ImEYSm40WJpjHVjlWW5Jjdo5fePfPgxhU0KLu8ddjmSTGm
         pgGA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ47c7ICJFqMpbmdohgeurcMiGlhAKT7XFa/qIzKc1Dmz1R8QrVU7Rf5zRUlXNNyjZ1vEep6vj2pHwIuwgiEqm@lists.infradead.org
X-Gm-Message-State: AFq9FYJD/Y1IxI2dGJdtNkJKZG3vMcE2VdO5nbQ2ipLF5Ca9tt6frghZ
	F5B2f8YHUNF24aLxQClKlMtK09/h61zE9KS0KsN/JHhpNtOocxYJFHSI
X-Gm-Gg: AYBFou3t/63ZUbeIh1wtnco1nuZNnaAwwYgf5M6nnCgVK/NHJAtAeil5V9mdsAciy+1
	2eFkiXZX6VrH7PZWekEOYLkw7kPUIYgFNGy20YpHk7NOV4ob7WQDjQBmUW8humP5RWFqIJd8SCA
	Umcj+YlZtDoSB9vARa21nZ4T4tTFSlLWIRlOClYAETuCqyv3RttqLazuti4zVv3VSWYntHvKAKK
	OEo2LHXvtZq2+2MKZxD6rM3qyxgVcTVSzfIflEGsYOXOFkIjeZCTneUsYzomCKe3keSEPQJPuav
	OBCOTgkHuJ20k39GVB3++vYoHdnxUbA2LdRH3A6laSwg7J14rYbZHoH7sxzxvuTX7RI4aoS1yHt
	hbizrsM959boCcE8E+OxBvbQ2k5WhntQ42l0qzmln+elkVK5ehStmgOtNX/4qu01p65IwbiZ3d9
	vQz73XYjAgu6/c09mG+uDOXZttEzM1KjC8EFMV2YHd4STjhtrxXBp039jAGRAqPHKIfgKc1Vdf6
	T3+DuXtnuX5PD01vHoZkBBt9cZnUj+BWNCAOwkuvkZjMaKw0VVEfRn2AzdkwmCpkvRVO00uLQW0
	83mepS9r4AzaiP4aEXW8Y7ekOlGKBIuehDylVmosF3yzOUHEBf98v+uSwsp1zx9vD6mAcq6OhuY
	ypCOYlSPrIbQxtjUtkiYkjADc6i7wQLvJjcsBkKcb4pN5DFAPmaDlQGpTELlGCd8coozHEoyrO0
	Zh4A==
X-Received: by 2002:a05:6808:c1c8:b0:549:a550:8acf with SMTP id 5614622812f47-55c003426f1mr2007470b6e.50.1792875153162;
        Sat, 24 Oct 2026 13:52:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c932sm1986785b6e.7.2026.10.24.13.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:52:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:52:26 -0600
Subject: [PATCH v6 1/5] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v6-1-6f366591f566@gmail.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
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
X-CRM114-CacheID: sfid-20261024_135234_208051_3A14B04F 
X-CRM114-Status: GOOD (  12.71  )
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


