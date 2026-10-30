Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30556606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gWpJKRQi;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CL2Ou8qH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MoAghpZzhMWka6buBPWIBz9Jz+B7Jbd30cQS0OP8bSY=; b=gWpJKRQioPxTy2X0ZIXbTdRgVj
	pSTgHAwZj/t3k0afgB70TD/d4wJA7iew27sg+EewsqqFBn1TbXronBPtgde1bqAcPc0oEbIANOGV6
	X71coc7uAes2jf5fj6WCgJ22iKHPbRj7yhlX9TYPLwFxmVktfBgesH/qUB7fAFexb5fk2X89L5UvB
	2ETExdhv/KCFaG3rwHUjHJXxnsW5FUT5JhIoKiMlxPgVFL+PW4A1SI+dXmNnCeA6nXtstt7a3CM09
	vdR7jFUScZVMcX2NLbVAoBbf1t4eXRsBuX/8SlFUovhFRiIPZ8t4s5WH2LcTWtU3LFA+IktsXq0BW
	TLkec+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjlO-0000000BNpS-41ek;
	Fri, 30 Oct 2026 10:23:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjlL-0000000BNnh-30Wm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:23:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4DFD5C49F5E;
	Fri, 30 Oct 2026 10:24:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7BBF9603C2;
	Fri, 30 Oct 2026 10:23:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7AA9103287DA;
	Fri, 30 Oct 2026 11:22:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793355781; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=MoAghpZzhMWka6buBPWIBz9Jz+B7Jbd30cQS0OP8bSY=;
	b=CL2Ou8qHtleTe62SzBLW7vbfcRTy7bXMr0HJ/6B8Wso+cJjQ72BwU3zWfGXZtcUDYwRoL6
	JGyGL1kdp5WYuhZRHsiOx+nDHt7k8ZXNQRU2ZAn4mtxUAFtRO2drnurQ7/XjafNVa+G3km
	ykfVUmOmQ6GqOWw7N6mL4ETShxWpqRyNvDRckGSDYPRWrr19Li7+W/yjzQDHQukznxVGa3
	Vp2uS3GDSteydhURZZkOQelGDjTKozhbSw4XmVLu/ugi8DhF4U6o9GvgjaQn40vL1TbJtA
	5ZvKh4Pf57SJf5g1xaR6dTGa0Jg9h2lKlK2TtgqajLE4jDJUYMziIy7XexLKtg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net] net: stmmac: Clear DMA errors for multi-channel interrupts
Date: Fri, 30 Oct 2026 11:22:49 +0100
Message-ID: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_032307_925379_D81E320E 
X-CRM114-Status: GOOD (  19.00  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
and this leads to interrupt storms when one of these interrupts starts
firing :

 - The RBU (rx buff unav) which triggers under high traffic load

   This triggers easily with iperf3 and small udp packets, and shows
   when running the netpoll kselftest

 - The RPS (rx process stop) which triggers when we stop the DMA RX.

   This one shows when restarting the RX logic without doing a down/up
   cycle, like when attaching an XDP program. The XSK kselftests
   triggers it.

Let's make sure we clear these interrupts for multi-MSI cases. It's
already properly done for the single-chan interrupt, and for that
introduce an "ERR" DMA dir, as we don't want to touch the RI/TI bits
when handling these interrupts.

To avoid duplication, the DMA TX error handling is factored out in a
dedicated helper (in the same commit to ease backporting).

Both of the above storms have been found on dwmac-motorcomm (YT8601),
and are triggered by the xdp.py, xsk_reconfig.py, xdp_features.py,
ring_reconfig.py and netpoll_basic kernel selftests.

This seems to only affect dwmac4, there's no multi-msi mode on
dwmac1000, and on dwxgmac these interrupts are masked as of today.

Fixes: 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=1 for multi-MSI")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  5 ++
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 46 +++++++++++++------
 4 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index c74bc7c9750e..a972bee66504 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -382,6 +382,7 @@ enum dma_irq_dir {
 	DMA_DIR_RX = 0x1,
 	DMA_DIR_TX = 0x2,
 	DMA_DIR_RXTX = 0x3,
+	DMA_DIR_ERR = 0x4,
 };
 
 enum request_irq_err {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 43b036d4e95b..a7caac3c98e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -173,6 +173,11 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 					 DMA_CHAN_STATUS_TI | \
 					 DMA_CHAN_STATUS_MSK_COMMON)
 
+#define DMA_CHAN_STATUS_MSK_ERR		(DMA_CHAN_STATUS_AIS | \
+					 DMA_CHAN_STATUS_FBE | \
+					 DMA_CHAN_STATUS_RPS | \
+					 DMA_CHAN_STATUS_RBU)
+
 int dwmac4_dma_reset(void __iomem *ioaddr);
 void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			   u32 chan, bool rx, bool tx);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index a0249715fafa..02aa1a3dd1e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -150,6 +150,8 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 		intr_status &= DMA_CHAN_STATUS_MSK_RX;
 	else if (dir == DMA_DIR_TX)
 		intr_status &= DMA_CHAN_STATUS_MSK_TX;
+	else if (dir == DMA_DIR_ERR)
+		intr_status &= DMA_CHAN_STATUS_MSK_ERR;
 
 	/* ABNORMAL interrupts */
 	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9ded31150fbe..2068b57df8d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3141,6 +3141,16 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
 	return status;
 }
 
+static void stmmac_dma_tx_error(struct stmmac_priv *priv, u32 chan, int status)
+{
+	if (unlikely(status & tx_hard_error_bump_tc)) {
+		/* Try to bump up the dma threshold on this failure */
+		stmmac_bump_dma_threshold(priv, chan);
+	} else if (unlikely(status == tx_hard_error)) {
+		stmmac_tx_err(priv, chan);
+	}
+}
+
 /**
  * stmmac_dma_interrupt - DMA ISR
  * @priv: driver private structure
@@ -3165,13 +3175,24 @@ static void stmmac_dma_interrupt(struct stmmac_priv *priv)
 		status[chan] = stmmac_napi_check(priv, chan,
 						 DMA_DIR_RXTX);
 
-	for (chan = 0; chan < tx_channel_count; chan++) {
-		if (unlikely(status[chan] & tx_hard_error_bump_tc)) {
-			/* Try to bump up the dma threshold on this failure */
-			stmmac_bump_dma_threshold(priv, chan);
-		} else if (unlikely(status[chan] == tx_hard_error)) {
-			stmmac_tx_err(priv, chan);
-		}
+	for (chan = 0; chan < tx_channel_count; chan++)
+		stmmac_dma_tx_error(priv, chan, status[chan]);
+}
+
+static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
+{
+	u8 tx_channel_count = priv->plat->tx_queues_to_use;
+	u8 channels_to_check = max(priv->plat->rx_queues_to_use,
+				   tx_channel_count);
+	int status;
+	u8 chan;
+
+	for (chan = 0; chan < channels_to_check; chan++) {
+		status = stmmac_dma_interrupt_status(priv, priv->ioaddr,
+						     &priv->xstats, chan,
+						     DMA_DIR_ERR);
+		if (chan < tx_channel_count)
+			stmmac_dma_tx_error(priv, chan, status);
 	}
 }
 
@@ -6466,6 +6487,9 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
 	/* To handle Common interrupts */
 	stmmac_common_interrupt(priv);
 
+	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
+		stmmac_dma_err_interrupt(priv);
+
 	return IRQ_HANDLED;
 }
 
@@ -6500,13 +6524,7 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
 		return IRQ_HANDLED;
 
 	status = stmmac_napi_check(priv, chan, DMA_DIR_TX);
-
-	if (unlikely(status & tx_hard_error_bump_tc)) {
-		/* Try to bump up the dma threshold on this failure */
-		stmmac_bump_dma_threshold(priv, chan);
-	} else if (unlikely(status == tx_hard_error)) {
-		stmmac_tx_err(priv, chan);
-	}
+	stmmac_dma_tx_error(priv, chan, status);
 
 	return IRQ_HANDLED;
 }
-- 
2.56.0


