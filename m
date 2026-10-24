Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE12606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DjPDdgU1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EpyDMWxG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=; b=DjPDdgU1/Z4SLP
	SkWFY35L3oyTtjBI74JRBiYpagJnLtQ18Zf3vV64n3860m+1CPmOSpyMJqgDjN85rOJBFD0TaPTTS
	F4yADMhIA592KFLDCM+TyAL9S6vF10imPKvhZ2RbUb6IwFSnud3V+pp38ZWrCNGT2lXNWAd/TnuUq
	/zyxhom00/3htXn1ZX6w7tPOEybOwR0Y1v+qrwdpgJNcA+kDonOCDGi6QDEKOHosIu/8PZpcfBV87
	mnH+9dQODuNH0vmWIuLxW5L0W0AzYJZTlMw9IL70F5h3TUBNgPqXrpZduQj9j36iwD2l0kX+nL6M/
	W247WcNRH1bbtzAF3ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVR4-0000000HV7w-3eTh;
	Sat, 24 Oct 2026 06:40:58 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVQy-0000000HV5e-1hFD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 06:40:53 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-82380b0f55dso638247a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 23:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792824051; x=1793428851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=EpyDMWxGyb6LJVeOCL4p6v6/Cx2mA15KopyUWMQFY6K/Ld6yxQqHjNtYB6vOg0Eue2
         3yoXZidH/IBqYSPJBJ6QJ2xgmBEphebLCzIrmQ2C3CxoTZ/FUP7BgyZ/hZTMAEzorYft
         ohbgI+7tJzdXqB8QH3uoYzbfTO97zuhhwGHXoz8NnANkAggla3lMVYswmCDEHuEK6Boq
         P59QBsLyKCQGsvrpjzK+Ztvrt+9uFVeuHFuv9/ojd34KZYonq7RSky5xy4haa0togku/
         iV8mbnj1q2P1osYovOwoOZLhNZq0fcWqjPKnmpZMVcZLxCSLO5V5td29HmIxHHpUIz55
         KVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792824051; x=1793428851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=Osq1bbpXU+FJd/JPOJEXv8gI+9sKJJt3xhiVemW39HY8sn3PoCX0hKFzmrIWJaQTF7
         SZJHuqtHzfg34kVksa5PGa1BZF7BPtsy/tiVTGCKGHSpkFMKV3ChOt4N9vgRAcjfxvdm
         8rydZiZDxSb/dWdT0tapjdAJd7Qgnvzx4M141FwxhAESZaNxdyGscbJbT5jdEQ1q/O7e
         hB66FnDyPmJtYcdTJLN0AVx6GwQHb/jy8G4VuEYP5f94O1cSB+PFVBYmcub+qbmxyxNX
         AEMveJpP/+AB4TDexKORmKo6daMem+f0vWCM1ESlr0rKp2r+GJ3dcfCBHwYiC7kNHF+u
         vpCw==
X-Forwarded-Encrypted: i=1; AKwUvBzkOsqZFVEv1XwNl2L1TCkayn9voXP5AIcOCrAC8GzJGweIKFDYs1nlZmZQxaA34HeNfAlNjxPZnKQipFHkdsbu@lists.infradead.org
X-Gm-Message-State: AFq9FYJvnJqOqMHru1xIVHhIzu3ZvN3ATvAcKZIrTw+RiWsaMguwLCc3
	4eFG/YOmPQNQTF1ECcK00IUFgsut/NQENjwHGu0k3usDbSxTUtunrNR0
X-Gm-Gg: AYBFou0A5caW+k8u/EczkM9RIx3hliuUdAHiCrQI+XukGzzU994x+ORxLMYLG9YYtxc
	/55RfSEhLr/rPNagiiTpwPeX8nmecbsuKb4AF9pM3XYLtyRxAnwAJz81eh4EBONCVgPORqiXVps
	hA6rLRiTASg8zIDox9w0HChC90gw0WdfiOz2GRhHRgBN86oEWyk7OU9YRe1pSz1kiS8Ie9sCC/g
	pXaN151uFSV/Lp/Rn7XYjhEynJeUvHFOeGVdcUYLfGON9sOe6Whur1rKo73FrC8zno4aB5rCtDE
	23ZeaLS6rTcLIe4d40UNtWa8XOoF3/13DWEAiUx6bwjVPt9I/7bAJYNT9RIT6kWt9PAXME2kXKD
	unDqrYcZjcZXEpFEQmFRmsyJ9GXmQpdObHxvWk196bLbHBpibm3BYqtGQKCUZ5YCtgyfLsvDUa2
	WySQIiqerJM7UEctp4KyTU4s5I/r6fVKA4mgy5042Lhtq8a/20fReu/HYlBJGqXqj6inxXr7+qL
	dEXdYhaMXx7/N9wr9LYB+ROmp59KYv1B5ciUQRFTUYmYg925QX8WXeD1XCUsc2lPPQN5nguGNxT
	xA0zTCJBHfHt0XpnSfUeJ/z98OWT6Ip5SFl57BnEkWAuPpo/ykmmAnElK1Zbt4PaPO+PYjlBM2c
	BM5q1POH7WnvdpBhmsR88hfOD6ZGlRBvfljSo8GqPuGa9GPHKNw2A1TSS2FyyL+1rmCx66TUsAW
	pfTKmWzPVcTJ4/C7cbKGktQ+Y=
X-Received: by 2002:a05:6808:4fe3:b0:4f0:1f76:8ca0 with SMTP id 5614622812f47-55c003e9dbbmr788058b6e.56.1792824051160;
        Fri, 23 Oct 2026 23:40:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c56asm864633b6e.9.2026.10.23.23.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:40:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 00:40:40 -0600
Subject: [PATCH v5 1/5] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v5-1-9e52968928d2@gmail.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_234052_460017_DED76CAC 
X-CRM114-Status: GOOD (  12.56  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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


