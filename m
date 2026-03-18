Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3F110775FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvhhv7MIWMegmnz4QXxXkxWDldAObm8AahQjpmMTPy8=; b=WXiXPLmTURx2u+0GiPuXurLxbq
	32eG0iKwlbWGM48fsOSSAcaguaHNBAd2AtkN3izGW7hLMzyNgGnZocj0x5T3Ooga/ctqkEXF+sjqT
	Qh2nL9OHPfYJK/cXeBmvPqVofHPxPZdnSt+n/D22dODni/HJeNvazz7j3SWVDyaTsbBtir3iFgHHq
	u6F/rwrmKB3dgFfUCj+PHXiGnv8f9Y17bV3MXTlXcd+ing/7WrlWrl3yUfXpPkNdI+V79OtV6AA9A
	fiovOYLDx5avdy/vEttoDj8I7pz5OQMtLC8kum+YYY3s2ULrOyYe+5srdzeo9w+YFjuafe0FZCybM
	eEflVaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vba-00000009AIT-2sZb;
	Wed, 18 Mar 2026 18:26:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbY-00000009AGs-1GT6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 18:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=fvhhv7MIWMegmnz4QXxXkxWDldAObm8AahQjpmMTPy8=; b=fW3hHGs1Y7BMxym9kcyjPyrNWJ
	vEymvM3gUFSahks6u6uvCANbQskvzyoq+GXHpQ9otuAlmh/CLTwhXW4hlqWZrglW4gED3deG2XRJ4
	9+h5MG3pmKIY5C+HIYQfspRXBfCnYleSP7GT2jkSGfiBCw2kVSiYvmBtLN5fACA4WsoMOIU72E+o4
	IPZkcWgOBRxt9J63cc5y8lPJ3h45+10Kjjmdq7xbR7XOZMacu5pk7A2xnyF11MuNydOIXwsXKMIK1
	LsastXXdzmYo1igL7KL3YMfEZjRx4bRcUU6tNDiOWUbchxYYRnGeDa+mgaaEF9sCzQUdro+smSzMV
	FWndb1Rw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbV-0000000C1YE-13x4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fvhhv7MIWMegmnz4QXxXkxWDldAObm8AahQjpmMTPy8=; b=UFKrgh4/dGkHv3DqRzbF2Q09ao
	OErSkJwUIa8beFUyVkpbmjC3r+aHHBQKi3fFeAi73kk7BaxRGSH3uhEKIxDbTgVcrLcZshqGS+pi4
	im5rb99PB4rX6D2P5i9PHQOwDJNs3F85B11k6SKSdY1zCD2LTsjMCIEUOQuGxGKB6oCczGkXI6w4p
	eNugQtcRNbUFGvr4Rr8czBppP7UH99EC3U/wETPufwtXVPWJu6B3c2VyBsEiyGzTfYtgbsEE/4Z2V
	9OlT/8y9EFXe9LJOwcOAgUqgV6aG2SIZ3Y3mgFRwdh2rpTxxmfs+3zw1IWMbp1z1CgTLm9vxB+Ib1
	xz8zAogQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44962 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w2vbQ-000000003pW-3uXk;
	Wed, 18 Mar 2026 18:26:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w2vbQ-0000000DbWc-0ty5;
	Wed, 18 Mar 2026 18:26:44 +0000
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 3/5] net: stmmac: simplify DMA descriptor
 allocation/init/freeing
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w2vbQ-0000000DbWc-0ty5@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 18:26:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_182649_315169_927914AF 
X-CRM114-Status: GOOD (  15.85  )
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

Rather than having separate branches to handle the different types of
descriptors, use the helper functions to calculate the total size of
the DMA descriptors.

Use this to allocate or free the descriptor array, and use a local
variable to hold the address of the descriptor array, so we only need
one dma_alloc_coherent() or dma_free_coherent() call in these paths.

Also do the same for the receive ring initialisation. The transmit
ring can't be converted as there is a case where stmmac_mode_init()
is not called.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 57 +++++++++----------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 567499e74917..8a84fdd4577d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1885,6 +1885,7 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 				    u32 queue, gfp_t flags)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	void *des;
 	int ret;
 
 	netif_dbg(priv, probe, priv->dev,
@@ -1928,13 +1929,12 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 	/* Setup the chained descriptor addresses */
 	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
 		if (priv->extend_desc)
-			stmmac_mode_init(priv, rx_q->dma_erx,
-					 rx_q->dma_rx_phy,
-					 dma_conf->dma_rx_size, 1);
+			des = rx_q->dma_erx;
 		else
-			stmmac_mode_init(priv, rx_q->dma_rx,
-					 rx_q->dma_rx_phy,
-					 dma_conf->dma_rx_size, 0);
+			des = rx_q->dma_rx;
+
+		stmmac_mode_init(priv, des, rx_q->dma_rx_phy,
+				 dma_conf->dma_rx_size, priv->extend_desc);
 	}
 
 	return 0;
@@ -2148,6 +2148,8 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	size_t size;
+	void *addr;
 
 	/* Release the DMA RX socket buffers */
 	if (rx_q->xsk_pool)
@@ -2159,14 +2161,14 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	rx_q->xsk_pool = NULL;
 
 	/* Free DMA regions of consistent memory previously allocated */
-	if (!priv->extend_desc)
-		dma_free_coherent(priv->device, dma_conf->dma_rx_size *
-				  sizeof(struct dma_desc),
-				  rx_q->dma_rx, rx_q->dma_rx_phy);
+	if (priv->extend_desc)
+		addr = rx_q->dma_erx;
 	else
-		dma_free_coherent(priv->device, dma_conf->dma_rx_size *
-				  sizeof(struct dma_extended_desc),
-				  rx_q->dma_erx, rx_q->dma_rx_phy);
+		addr = rx_q->dma_rx;
+
+	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
+
+	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2251,6 +2253,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	struct page_pool_params pp_params = { 0 };
 	unsigned int dma_buf_sz_pad, num_pages;
 	unsigned int napi_id;
+	size_t size;
+	void *addr;
 	int ret;
 
 	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
@@ -2286,24 +2290,17 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	if (!rx_q->buf_pool)
 		return -ENOMEM;
 
-	if (priv->extend_desc) {
-		rx_q->dma_erx = dma_alloc_coherent(priv->device,
-						   dma_conf->dma_rx_size *
-						   sizeof(struct dma_extended_desc),
-						   &rx_q->dma_rx_phy,
-						   GFP_KERNEL);
-		if (!rx_q->dma_erx)
-			return -ENOMEM;
+	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	} else {
-		rx_q->dma_rx = dma_alloc_coherent(priv->device,
-						  dma_conf->dma_rx_size *
-						  sizeof(struct dma_desc),
-						  &rx_q->dma_rx_phy,
-						  GFP_KERNEL);
-		if (!rx_q->dma_rx)
-			return -ENOMEM;
-	}
+	addr = dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
+				  GFP_KERNEL);
+	if (!addr)
+		return -ENOMEM;
+
+	if (priv->extend_desc)
+		rx_q->dma_erx = addr;
+	else
+		rx_q->dma_rx = addr;
 
 	if (stmmac_xdp_is_enabled(priv) &&
 	    test_bit(queue, priv->af_xdp_zc_qps))
-- 
2.47.3


