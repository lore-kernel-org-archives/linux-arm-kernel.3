Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21182606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=apau6llC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9WUIGRF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=; b=apau6llCSuxxxW
	fc0/1qs2QU5mahoFTcfjTi4HkIhryfjgv+cjczm8otAuIKVG03deBIwI2ZM+WTAIwns5C5PtIlv6x
	dZ1w+BU1wbfobmA7TdBNcpjZmIKgG+DcvNMglMpn5u2LIZp+DY7Vy/xc5CWcH+JHjVit0oKFsT9JB
	+nZi/EEeFs25SGmN5D/UtDqEHCHe10HAl/wMLVJNqFThmP4HD9DMHAkKIZr/u7BB05KsF36DIcj3D
	4VvVA+rlbkIXFa8Gc/Omad8reORU3LYC1iL0dx9gh7NxV1ZFy8YaCCdLZjSno3Gip+n0kWHGj3MSL
	/no0uy+6gHMpCgT8UNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKhz-00000008YgS-3p01;
	Thu, 29 Oct 2026 07:38:00 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKho-00000008Yda-0BR3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:37:57 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-85a5455bd3cso1139670a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259466; x=1793864266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=A9WUIGRF6ClzspiUddMxUjy3ejYNgzUECaJAyQWgkiMERd8ygZ25q40ZPHguTq3IBb
         dM6fHVDEL++uOWrfKmJMJbN4WkC2YbIEsV7gqO5N8Jzq3gf/68LbmQWZN7a+NWQ5aP+F
         X5EyAuvGTOP9LkqvZn2OExKFU7f07mvCuRtXgEA2WM6wRmC7vEdaI0pXLpyjJXhr/JxB
         ee0hRw+lw9djRTxHcQ0WOaWkUz5pTbzLnJZOQMNo1dnoVUZAn9lO+/FMf4aIjdGTsxDz
         Kt2pj3tcJYk8NMFhNSGdGIRDB4zOC9Rz7ta68k4OoNT5G/qrJegQ8F0ftWz77lt+e6Gr
         uoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259466; x=1793864266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=ok/A0yeL1RxS8Cr/a2s/CphEfiAeay14txMxcmjXUhhRhJUK3cif0ZK6jVBfdwyJ8X
         MLg0LyUMvUl3oZAt6AJFL+pM5CbGPIFYSPaugK1HeDXtaAUoKHHY7s26HbEvHtkx9p3q
         inSzcIoqbkpOpC4LAds7ksJgUjJfmmOB2eJ+LGjOqtl8nKDRKO4fp9Et4NSeRaBZi/iz
         zCXH7Z2WgFOM35V51BJjnPH4iUwZJOSUukv0ho0eqAn8so0CD/LoClkf8u8tipW2dkwB
         8HNeE2ddH2RZBwUCgX7PR83hbyZON4u0KqBFL84JHXOS7dxGew9ilDHRBXm1fmdOfiiL
         ZsKg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ0YUw/Tymc/QaqvSQvSRbticPLSt7XGT34wZSJWOC/b6qzCBh2JJjMWLPa5EtFYbGJBilMjFZJvum/tcOuX3x@lists.infradead.org
X-Gm-Message-State: AFq9FYKgECLNekwz7ViuEaNOeVAt1Oq7uqXQ50eqoiZadPygAVdAiKbO
	+2onx9MiRpuFG2aJctzI0QaST6q9L7RedjFg734nwcTGs9erUMclVXmd
X-Gm-Gg: AYBFou2tv7r2r3fWd7CcXRZg4SemLBgoKEGlfTl3gGbZkEAzKPJle7AIcPrf7/PVTm+
	yFOgNueA/MdRuvrNGFlMEmM5a/xkjmXuGJYd3Gnnv2mKK8VsXvwSvXFOb3g5MYIPwY2ZG0IhXe1
	7VR9Z4pgo6YFX5hxwKADvlNXiqLZNfbrrbB1+GT10inAIEEOt7WEH3GdPLHptkmw78Lefw5ns4W
	GcdRqTLPQdqUSfm/mKIN5VJa4/CM1gXmGW8r+XxbLEFL+WMGOoSw79JsNtz06FyM431kyShvNbC
	qcJ9UjSKbRDtWTqXJzsK5Lo5LnFQ89eiOYmkc1f07IwEXqYC/auAXlqJtofBG1otP4B5D2l0WPU
	ooLCZ8b4uGzjOuRnLvVI5ifZdv/a1rYBTqxlpeS1BQkydMN+brRnorL493cVP0WfhC5ULuecB/d
	qXVCUsXfKK+/OHnUqugNCx315tX8/Iu4/1J9+l2PWFyBAGwEUrYhf1SYYhO+JkVzAIEdchXP734
	H3NxOgwBBZSNH45/dJSnJPfOGPVAmyiqgrVIkwIFLAig+YuBzwUQXoqnCF+EGRCjEJXzQ0gx1Ik
	Lh/GLEieocIe1OuIveh6ekdjxf/oBXwX3/DYvfV0Kk+rJu5ePMioW5ujp5Fma6sKcGPcBoGoqgD
	Im8HIk+lYsPKMybiaj4p2iTM50mt0zhWUbPxBvSn7hszoTd7dWfuCd91Q4pBAbcbNREhQuIt75B
	RvWxI1GHBr8KN0aGSHh9T01uinkbEjkr+hT9adp7brB0XPKbGoHYuMgQkX7wv7qUpcVbpb8IQXC
	g==
X-Received: by 2002:a05:6808:508a:b0:4d5:295c:a831 with SMTP id 5614622812f47-56384191e36mr3343729b6e.62.1793259466485;
        Thu, 29 Oct 2026 00:37:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c3638604sm3321976b6e.1.2026.10.29.00.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:37:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 01:36:57 -0600
Subject: [PATCH v8 1/6] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-serial-8250-dma-cancel-v1-v8-1-3fd56ba352ed@gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
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
X-CRM114-CacheID: sfid-20261029_003752_630534_99EE1957 
X-CRM114-Status: GOOD (  13.05  )
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


