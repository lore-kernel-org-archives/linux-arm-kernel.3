Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48540606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Js6dJuYx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgERvO1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=; b=Js6dJuYxP11i5T
	5Yb5M1cWTyOAM/ctrsMEiYUNS6XL18cBlI6hXczVw2jJZk2sZEi86mFeH6hdEn4LL0U9FV45Bl1S3
	fQhZ2Ke778ea8ryVFQzGXlSrBU4Ryvdll6u2kq+Yik1sJ5w7hN8+ziznaoT0j6hkrMaTSH4FmcQzO
	YT9JWshXlmRgV8lsLkNGwqj6luSt+sTTOoWti7Nt/zlLbvDfrLIflzYOL4uB2omvpsKSw3gKILl1S
	OyhCC7wwS6ZpmszewG5gHLFdu/MtelNiSDYwVPV4fnohLDgMWYyfkJHTi4Lv/Y+NiShbt3vndly2Z
	QYdFRNYPYz/4hD/VV71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Eg-00000000crs-05rB;
	Mon, 02 Nov 2026 23:14:42 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Ed-00000000cqr-0QRw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:14:40 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6d290b10a35so1510523eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661278; x=1794266078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=mgERvO1fRGeIjI0lmAa9LXFn1AxtwtPAWYAGXGfbcnb04yQiZqNnCPN0JLmi6voP6D
         NDmAh+AWJ5xL3hk+VL5zsLOP7P+7gHAUtgWcgXCz3V1MGfazcdEMroQnGgQGIyaKYv0+
         uSQAejLbUC1poI/gr/hmjq6NJ9/FFfbpI3WYXa267zIzDaoLYaqOYkGeD8x6Ii4HEe28
         NGAO2KSb8m4n1lN0rQo5hJoLO4IX0tDv4Z4Ni1zPOsSCL6hS4jR+peNIcQdwSJ1XThB/
         TsB/oNGxNdg1EdDfotOBBDw/FlZ4igtbwLrPe1I4o6a01Gc2IAlKhE0+0YPuwgQCNmS1
         cAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661278; x=1794266078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=GBhJcbhCmq4m0uycOkdoqtReSdMSogWURWUijnyyAlusYITrx2BNX8EO74rp4W/SJQ
         yIr4H+/T2odalF160z8+iKswEvRUzjpo8p3lGipgCjowINsyF2q9WvhKeaR+x8tJGjZm
         LeOLaxrzakWzYWJ2wubj2FR6ffu8LGTlVZHNZsreOqiWwK7If3vTpnV+J6J2LZdwz8Lv
         /WyzygcoKJFvgh+T0JdSZW9AsVDapnUwc1S3RvQeo3NsOj8DGfQC7a6V+XlUifz5UsrT
         4s18rZf2+k9GbdEjP0KkXHggiSLOTvreeMz8Dg+kQC4K/OmGADGLYrN1tuA+eRYVOgwP
         MccQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNVH34T71HR1AWxeZGf9ivdzNxf5n4vHb0RkGLdqE2e5/SM7i17+fymCNgaOjOpUVetCkEM9vTkZP9UyqzHdWR@lists.infradead.org
X-Gm-Message-State: AFq9FYK/HBHeVHWV+hlyn9h8zFz5Vq3N5XpiVZpuAlgzcMLEWu6PNBwa
	+0xJo1OcQGLe+zLfzApABUmpXbXNbmwS/LiUNPwu6OB0KVBdbTsaLdMM
X-Gm-Gg: AYBFou0FJEUiu1j7IvCtiuRGoac1mGnszuwiqHQG9rhh3994zdynbkE6qE7JsxyIzNp
	+I6pUzdEIWKhAEmXiL8AZUZOt3vurRP4HnQU4nTPruC9nG9UwTiVbsPUg9P7kce82RSYGLef6Zy
	AjlyaZSWvczgL4tlaLN1Bqf3m6Rry+5Q/uSeQPJDACOLOKBCkJeeBuE2NQEMUTk5JVwHiwRutzW
	ut9XcuJ2f05GL9LPXeJiFgZH0IWGtFWAit9KfT+NC+R4gBrsIDm7x1rXJpXBnMyLR2Rf1l3/0sg
	orab2X0kP+NIamykBUNzUO2wKtvFJon13YuSOb09psmM80fpHO90SREej4qPAtW7bA01dzcNs1x
	IznBTTC84+GOWH4PlfUdIu4D+YDc+EuN4hFmadzleAImz+qJ+14IWe4S3nVbAwuelVZyxnklU2e
	XY7XDLfyyqhG0OvTNDZTuS2kxBcFKj7IAAnwwztXzd+jrGMPryBQWkX9RAD5KIPCXFpht8Uj/DO
	JSy6gzLViFmnuY1LQt7hg1Uc2HFOHI+keP9tBeSGLDQ/t7YBX6e3RIwFEO01xTclGBSvXy3QSlS
	23J1b5hClPnqSRqu48t9ZtMRKSNo+0FCh3zD1Icf7NzA6KAwLjqZJ12huKuAjYLmjg3O4oDhS/M
	YRNscsAzdjqvVECbtJQ5J5Rew02F2RBrxfu2W1A3ZOqDm87XfRRBiTbSV9N8AeGLhAwebVwrv1V
	p/MFza+5Upa3u2XTIPIM34nbUpVPK6OFx0HBkdrMs4XH9myfAx2Uc=
X-Received: by 2002:a05:6820:1621:b0:6b7:8396:f3cf with SMTP id 006d021491bc7-714f29e457fmr6317068eaf.49.1793661278004;
        Mon, 02 Nov 2026 15:14:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:28 -0700
Subject: [PATCH v9 1/8] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
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
 Timur Tabi <timur@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151439_148797_71866C5C 
X-CRM114-Status: GOOD (  13.38  )
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


