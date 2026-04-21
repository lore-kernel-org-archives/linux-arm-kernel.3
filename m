Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF36BF8FA61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Wdm3kV4WDvCDxi2Q1eh8TQdGmwSJyWv03shz+xr93NA=; b=M8i4BQndvlI+GAyimYxYd0CvXa
	nEH1agx183MAnfkrIfUJhxgGzvN7/lQOu4VgT9YHNMTfmGgqPfM4ifylijLHnqEwVY9aBlObMnWKA
	+W1h8hCWGhyvMrj/rEijXGTEWJIqNgmVfu7Tjjqx35zath/c1lTMg6h4n4eJJAQmeidQRFkf8BwM0
	ftReILFT4z33QE8BWkPeD+Fpu/4FNS47A0P46Vyj8yNBPMYGxVrV20Y26/EmqoVflOxwXbCa0dyDV
	Y+xLUYG1Ir47seEWRcZfNRb39SsmQlZupd5ZC9DeCldheFVioixrBQLqPEE7vVBDhT88ffOU4W4aR
	lvGBwzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9d9-00000008Y8q-3SXI;
	Tue, 21 Apr 2026 11:51:03 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9d3-00000008Y2q-1QN2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:51:02 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260421115052euoutp02ad3594a1ae7eecb506e798d02f6a1aca~oXPMmdLg73197531975euoutp02X
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 11:50:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260421115052euoutp02ad3594a1ae7eecb506e798d02f6a1aca~oXPMmdLg73197531975euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776772252;
	bh=Wdm3kV4WDvCDxi2Q1eh8TQdGmwSJyWv03shz+xr93NA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OXRIxigNRGwkHnJiEZ1USlGtyC22qjDAtNpf+a0Ge/z/2SbHAFLKXO3BdBaS2e703
	 YTpSTUwAlx93ngfJ+caYX8rDuOVftYXVl3wRjJMThlON7ULwiDGahtVcDJHx77wCeW
	 vICmQnjG9MlVkJym6OCqB9HE3SEvJ8eDZ2HngkZM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6~oXPMWi_xc0669206692eucas1p1S;
	Tue, 21 Apr 2026 11:50:52 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260421115051eusmtip10861a4b8207300cfdc8286dec4615f9e~oXPL4eC_W1849318493eusmtip1l;
	Tue, 21 Apr 2026 11:50:51 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net,
	andrew+netdev@lunn.ch, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Jakub Raczynski
	<j.raczynski@samsung.com>
Subject: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Date: Tue, 21 Apr 2026 13:50:09 +0200
Message-Id: <20260421115008.2690541-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_045057_992307_949B69D8 
X-CRM114-Status: GOOD (  13.56  )
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

All references to tx_underflow_irq are misspelled as 'undeflow'. Fix them.

Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h         | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c    | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index d26e8a063022..e7da9964854d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -147,7 +147,7 @@ struct stmmac_extra_stats {
 	unsigned long rx_vlan;
 	unsigned long rx_split_hdr_pkt_n;
 	/* Tx/Rx IRQ error info */
-	unsigned long tx_undeflow_irq;
+	unsigned long tx_underflow_irq;
 	unsigned long tx_process_stopped_irq;
 	unsigned long tx_jabber_irq;
 	unsigned long rx_overflow_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 815213223583..068c21f37c29 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -247,7 +247,7 @@ static int loongson_dwmac_dma_interrupt(struct stmmac_priv *priv,
 	if (unlikely(abnor_intr_status)) {
 		if (unlikely(intr_status & DMA_STATUS_UNF)) {
 			ret = tx_hard_error_bump_tc;
-			x->tx_undeflow_irq++;
+			x->tx_underflow_irq++;
 		}
 		if (unlikely(intr_status & DMA_STATUS_TJT))
 			x->tx_jabber_irq++;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index c01b86fd64da..a73720811791 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -459,7 +459,7 @@ static int sun8i_dwmac_dma_interrupt(struct stmmac_priv *priv,
 
 	if (v & EMAC_TX_UNDERFLOW_INT) {
 		ret |= tx_hard_error;
-		x->tx_undeflow_irq++;
+		x->tx_underflow_irq++;
 	}
 
 	if (v & EMAC_TX_EARLY_INT)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index a0383f9486c2..79fe50ad33d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -182,7 +182,7 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 	if (unlikely(intr_status & DMA_STATUS_AIS)) {
 		if (unlikely(intr_status & DMA_STATUS_UNF)) {
 			ret = tx_hard_error_bump_tc;
-			x->tx_undeflow_irq++;
+			x->tx_underflow_irq++;
 		}
 		if (unlikely(intr_status & DMA_STATUS_TJT))
 			x->tx_jabber_irq++;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index c1e26965d9b5..df092fb354ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -78,7 +78,7 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
 	STMMAC_STAT(rx_vlan),
 	STMMAC_STAT(rx_split_hdr_pkt_n),
 	/* Tx/Rx IRQ error info */
-	STMMAC_STAT(tx_undeflow_irq),
+	STMMAC_STAT(tx_underflow_irq),
 	STMMAC_STAT(tx_process_stopped_irq),
 	STMMAC_STAT(tx_jabber_irq),
 	STMMAC_STAT(rx_overflow_irq),
-- 
2.34.1


