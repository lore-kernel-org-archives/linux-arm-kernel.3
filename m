Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694EBC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8zY5F3UU/0eu+ezWkplimwRrPs6tfR7OLj+CFgWxLMM=; b=kwchSZHE5839nob6crOfPIc3s9
	atqrfOxqBlGO0V28383mXmsuguiDstPy5p1DeBTnRsVIb1Kssi7uZWNzqNkwyrCNhSv5DkEfb9re1
	4Cksz1RdudpczDtbIu1PVn6Imo+JC6E+/W3ILuvaBzMPas4akck9ld1ajByO7O0Hx9pPXKjc+9V1z
	dUGO8WmYA4CPZq9q02UxxllNcegojJA8OQs5WvQsBzHqiR0M9eOfT+QrtBhM33GEMg7RYulD4jilH
	5RTblCOpnMBgkdySk2xStEXkZMoMIjIOf72IsQJSFm0PBmVR8SJCsSFu11ouNUoM1mmUeWrxyc8kj
	R8HqGDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSg-0000000DTMp-1dRY;
	Thu, 19 Jun 2025 15:45:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDiw-0000000Cw7P-0e0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:46:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23636167b30so6949035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750333589; x=1750938389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zY5F3UU/0eu+ezWkplimwRrPs6tfR7OLj+CFgWxLMM=;
        b=cvm0w/qZelalY9K38Zvydt1OE+EuWce45I+Gf3rzXcqNnMZMH6kAL5CRl8bAHhoPhR
         6VP0/b/09jtB9Af2b8MIdp48PWQE78w+FF/kA7UnrRBucujfpa+p6wi1fzDZPubfcz3u
         FtC8NyhyzCdUtM0TAkiGnTp10uHGXWBVrD0Qe5Ct/pSOtf9IgssKT68A653y1K1Rp7oA
         2GYVV9bzzUJWwUdMyIzGeUiOmnY71h2nHWoDrD+R3OCVLuuUVtzqN2sNgokrUX0Dwd4j
         m5loTgGtzjsjj+9u/ukaAlrmMEuduj5xXEH1atjkwAuqFTK33dRYsB55xurK5B6NcGO4
         vlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333589; x=1750938389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zY5F3UU/0eu+ezWkplimwRrPs6tfR7OLj+CFgWxLMM=;
        b=rBjBKJUZ03yAdf3yO1gzuQ0t1tDFu2buhikcwann722EDp4MIrQrZqnaI4CGJju0zk
         MP0DWKLetJ0b5AUuTurg84UVqbAkdEeAvyBsQ5E+AXo4UFWCxnL/ABD/j2tqvIOyrXkh
         hcCGkb1iAPmV1miuTPSTGzvNlbVy0fkw+EKFtXcPt1HOORzx642lrF5mqrK+yDqCwzfX
         h3dZlrgXOx32pnX/nZwIE+6FeZz3+Of8dsWU9Huyh2yFmQyBGaJTJGAZ61yIxVcrZ7aL
         j2UWLuMAlQ23RirIlIRI06Y6YHcacz8EGfiqBavB6dz0LfjwdozBNnMDbdt4iUoOh/7j
         fHHw==
X-Forwarded-Encrypted: i=1; AJvYcCUyKtSgibWtbXq7/OrAxO8+0Ik2taQAfeWquhos2rmyT1RCFALj1BDFk2JDtb+airJMSosXlBRiwSMedY2SqviH@lists.infradead.org
X-Gm-Message-State: AOJu0YyZS90Sgmg9g6TkuIN5cqQjX9jEgJdWH9ViAGeGAOuG6Hs3gV0V
	4q1ejTxldTjwCJ6TZD/GlwogvwFTTMA3401qGoNRlUJ8EjqbNJRuodPe
X-Gm-Gg: ASbGncu54Wd+ueyXBwXE5PcYqHeSFSNEYJapDTYnJtFdWwbEXC0I7woZbc8NT9PyiFh
	6/ozid0WmjlZS0tcPjGXoLdGu0ubx1DfhEZUXfbROziWMzhuxrPe5ika1biWEjC16pX8A5075Xt
	nr2nP/KKLPbqLGys6lHi2z611MbciegYM6XtHSXsvO+lMTS3uq/AHrZP49hFnR9vyoeFN0cTCKw
	jqGHVE1ncmxa+MeUymuRO/LTXlHKAvVdbItiPxXefIr7nEwokdjW9+AG4Cp7pluQH5SiHdYcCTh
	iKr74bJ1cbQ5sLi9X5EMQzFIHBU8v10eggLrzFY3D3+VrEKe0veJOEBmM+iwPQ3F6kBy0ffm1UL
	G
X-Google-Smtp-Source: AGHT+IEqXJC4DnaLV0/S7qFrQlXQuofYwv0L6qzubFHg7yn/7ZdwZoXIcPaXqkUudCmoUPKjE0YIWA==
X-Received: by 2002:a17:902:dad2:b0:234:9670:cc73 with SMTP id d9443c01a7336-2366b32e583mr333965975ad.5.1750333588935;
        Thu, 19 Jun 2025 04:46:28 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c1e2:f516:9efb:a31c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1919sm118782665ad.66.2025.06.19.04.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:46:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: shawnguo@kernel.org,
	kernel@pengutronix.de,
	tomasz.mon@camlingroup.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] serial: imx: Restore original RXTL for console to fix data loss
Date: Thu, 19 Jun 2025 08:46:17 -0300
Message-Id: <20250619114617.2791939-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_044630_189975_A1067D48 
X-CRM114-Status: GOOD (  15.33  )
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

Commit 7a637784d517 ("serial: imx: reduce RX interrupt frequency")
introduced a regression on the i.MX6UL EVK board. The issue can be
reproduced with the following steps:

- Open vi on the board.
- Paste a text file (~150 characters).
- Save the file, then repeat the process.
- Compare the sha256sum of the saved files.

The checksums do not match due to missing characters or entire lines.

Fix this by restoring the RXTL value to 1 when the UART is used as a
console.

This ensures timely RX interrupts and reliable data reception in console
mode.

With this change, pasted content is saved correctly, and checksums are
always consistent.

Cc: stable@vger.kernel.org
Fixes: 7a637784d517 ("serial: imx: reduce RX interrupt frequency")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/tty/serial/imx.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index bd02ee898f5d..500dfc009d03 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -235,6 +235,7 @@ struct imx_port {
 	enum imx_tx_state	tx_state;
 	struct hrtimer		trigger_start_tx;
 	struct hrtimer		trigger_stop_tx;
+	unsigned int		rxtl;
 };
 
 struct imx_port_ucrs {
@@ -1339,6 +1340,7 @@ static void imx_uart_clear_rx_errors(struct imx_port *sport)
 
 #define TXTL_DEFAULT 8
 #define RXTL_DEFAULT 8 /* 8 characters or aging timer */
+#define RXTL_CONSOLE_DEFAULT 1
 #define TXTL_DMA 8 /* DMA burst setting */
 #define RXTL_DMA 9 /* DMA burst setting */
 
@@ -1457,7 +1459,7 @@ static void imx_uart_disable_dma(struct imx_port *sport)
 	ucr1 &= ~(UCR1_RXDMAEN | UCR1_TXDMAEN | UCR1_ATDMAEN);
 	imx_uart_writel(sport, ucr1, UCR1);
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	sport->dma_is_enabled = 0;
 }
@@ -1482,7 +1484,12 @@ static int imx_uart_startup(struct uart_port *port)
 		return retval;
 	}
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	if (uart_console(&sport->port))
+		sport->rxtl = RXTL_CONSOLE_DEFAULT;
+	else
+		sport->rxtl = RXTL_DEFAULT;
+
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	/* disable the DREN bit (Data Ready interrupt enable) before
 	 * requesting IRQs
@@ -1948,7 +1955,7 @@ static int imx_uart_poll_init(struct uart_port *port)
 	if (retval)
 		clk_disable_unprepare(sport->clk_ipg);
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	uart_port_lock_irqsave(&sport->port, &flags);
 
@@ -2040,7 +2047,7 @@ static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termio
 		/* If the receiver trigger is 0, set it to a default value */
 		ufcr = imx_uart_readl(sport, UFCR);
 		if ((ufcr & UFCR_RXTL_MASK) == 0)
-			imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+			imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 		imx_uart_start_rx(port);
 	}
 
@@ -2302,7 +2309,7 @@ imx_uart_console_setup(struct console *co, char *options)
 	else
 		imx_uart_console_get_options(sport, &baud, &parity, &bits);
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	retval = uart_set_options(&sport->port, co, baud, parity, bits, flow);
 
-- 
2.34.1


