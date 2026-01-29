Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBDFD73E81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EzSUVdWbzL09q1wpoJDD+cItE7l8w9GaRtPysrK7P+M=; b=ug2SxFNZKHVzpvDdzfC3mQA4wE
	z6Bkwu0f5glLFwk297b15GqOMPoZKwMsgfn08aCgVkzDOvvgK8s1bPiTCTy507dnuWHsb/WCBGJDm
	14vfSC6B1/Sr72wnPhqzcFGNeGYgsB2+/RpMfajWv/y/DDY1j8vRvHz8obACUkb4ECedd3xxOC8KU
	8dIbScoD820LwgExQ3TkmXzOdmc7y7HeZIYOtzZaIQGV+eozbosieWlZGUy738ulIoc7BrpKtku/j
	65HoYh4XJ6SNOBuZoVHDJ5o7U272h9sQyAb6kvBuuuTxPFvnnp35voO+Tz4/8svnvldcicl0Ore7L
	DqFxwp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVvN-00000000Rd8-2NzU;
	Thu, 29 Jan 2026 17:35:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVvI-00000000Rc1-3VaA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80839418F8;
	Thu, 29 Jan 2026 17:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00624C4CEF7;
	Thu, 29 Jan 2026 17:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708115;
	bh=LZLX7bGtrwHwOhYAzCzwWn2KMP5/JcVHZ43OVV++yko=;
	h=From:Date:Subject:To:Cc:From;
	b=ivCxkCuyrvgLWutUxOh2SyVaA6+WINxXAYT8QqC11eVthh2rcJLJhDG+TuWu8+XDa
	 ooSSxS9xk/ZHGU5K1ldwWOTLS4MYV+yErsdK9+z3kdQaDou7UxfL/ILP9hatgiu7oy
	 /d8n4m38Ou7qxSLBf3PQyy/vsLVhctpKmWBLZlQ4/IT3qMt7hzQpjkuK3xugHPn9uu
	 sndTXDFk0V/Vg2ZXEqUmvgj7pHZjOdUkRcFp7W59gEceBPc5TjL7HnTlEftG0qnz1f
	 dNoz/ZOsPwsjkDRJv3iBM3qSWgya0FWopfLAdcFXcZxHozTxjdaw2GR2Ghog2v5jBt
	 1ydPy6Y5h2GBg==
From: Simon Horman <horms@kernel.org>
Date: Thu, 29 Jan 2026 17:35:03 +0000
Subject: [PATCH net-next] net: stmmac: spelling corrections
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEaae2kC/x3MQQqDMBBG4avIrDuQTLXSXqW4SOPfdkBTyQQRx
 LsbuvwW7+1kyAqjR7NTxqqmv1ThLw3Fb0gfsI7VJE5uzsudrcxziGwLpolf8HJ1Etuu76kmS8Z
 bt//uSQmFE7ZCw3GchHEK3WgAAAA=
X-Change-ID: 20260129-stmmac-spell-be12302c4577
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_093516_924522_09430E3C 
X-CRM114-Status: GOOD (  24.77  )
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

Correct spelling as flagged by codespell.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c        |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c         |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      | 10 +++++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
 10 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 97de4726208e1bc01e4980da99ace72a3e2e1d54..ecc0c34834235207cd082655cb021da3382cb350 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -270,9 +270,9 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 	if (of_machine_is_compatible("fsl,imx8mp") ||
 	    of_machine_is_compatible("fsl,imx91") ||
 	    of_machine_is_compatible("fsl,imx93")) {
-		/* Binding doc describes the propety:
+		/* Binding doc describes the property:
 		 * is required by i.MX8MP, i.MX91, i.MX93.
-		 * is optinoal for i.MX8DXL.
+		 * is optional for i.MX8DXL.
 		 */
 		dwmac->intf_regmap =
 			syscon_regmap_lookup_by_phandle_args(np, "intf_mode", 1,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 8aa496ac85cce5bc3e2bcec5ceb880ada79e472c..c01b86fd64da1303aa4c905a7c6bb844515d5130 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -746,7 +746,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 	v = readl(priv->ioaddr + EMAC_BASIC_CTL1);
 	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
 
-	/* The timeout was previoulsy set to 10ms, but some board (OrangePI0)
+	/* The timeout was previously set to 10ms, but some board (OrangePI0)
 	 * need more if no cable plugged. 100ms seems OK
 	 */
 	err = readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
@@ -821,7 +821,7 @@ static int sun8i_dwmac_power_internal_phy(struct stmmac_priv *priv)
 		return ret;
 	}
 
-	/* Make sure the EPHY is properly reseted, as U-Boot may leave
+	/* Make sure the EPHY is properly reset, as U-Boot may leave
 	 * it at deasserted state, and thus it may fail to reset EMAC.
 	 *
 	 * This assumes the driver has exclusive access to the EPHY reset.
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index b3135df0a359cd5ea36db325c4a37075991b6712..9fe639fb06bb3f61179e967b663927cce50ff3ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -152,7 +152,7 @@ enum inter_frame_gap {
 
 /*--- DMA BLOCK defines ---*/
 /* DMA Bus Mode register defines */
-/* Programmable burst length (passed thorugh platform)*/
+/* Programmable burst length (passed through platform)*/
 #define DMA_BUS_MODE_PBL_MASK	GENMASK(13, 8)	/* Programmable Burst Len */
 #define DMA_BUS_MODE_ATDS	0x00000080	/* Alternate Descriptor Size */
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 4efe4c3ae5dcc53a7b9826f3e2b1bd54f6e256c4..db4fbe64a38afc3142bc2fd4ed9b53230c05031b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -108,7 +108,7 @@ static void dwmac100_set_filter(struct mac_device_info *hw,
 		memset(mc_filter, 0, sizeof(mc_filter));
 		netdev_for_each_mc_addr(ha, dev) {
 			/* The upper 6 bits of the calculated CRC are used to
-			 * index the contens of the hash table
+			 * index the contents of the hash table
 			 */
 			int bit_nr = ether_crc(ETH_ALEN, ha->addr) >> 26;
 			/* The most significant bit determines the register to
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index d571241e64dd929536aa3158f352a281d9b1834b..8f6993c8bcae5be7fd064a5b1259901b4f643747 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -88,7 +88,7 @@ static int enh_desc_coe_rdes0(int ipc_err, int type, int payload_err)
 
 	/* bits 5 7 0 | Frame status
 	 * ----------------------------------------------------------
-	 *      0 0 0 | IEEE 802.3 Type frame (length < 1536 octects)
+	 *      0 0 0 | IEEE 802.3 Type frame (length < 1536 octets)
 	 *      1 0 0 | IPv4/6 No CSUM errorS.
 	 *      1 0 1 | IPv4/6 CSUM PAYLOAD error
 	 *      1 1 0 | IPv4/6 CSUM IP HR error
diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index 0fab842902a850022a3be368d4972e4f4e9bcdc9..1b3b114e7bec86971c99e219db213eb11c022ebc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -252,7 +252,7 @@ static void dwmac_mmc_intr_all_mask(void __iomem *mmcaddr)
 	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_RX_IPC_INTR_MASK);
 }
 
-/* This reads the MAC core counters (if actaully supported).
+/* This reads the MAC core counters (if actually supported).
  * by default the MMC core is programmed to reset each
  * counter after a read. So all the field of the mmc struct
  * have to be incremented.
@@ -420,7 +420,7 @@ static void dwxgmac_read_mmc_reg(void __iomem *addr, u32 reg, u32 *dest)
 		*dest = *dest + tmp;
 }
 
-/* This reads the MAC core counters (if actaully supported).
+/* This reads the MAC core counters (if actually supported).
  * by default the MMC core is programmed to reset each
  * counter after a read. So all the field of the mmc struct
  * have to be incremented.
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index bb110124f21e2d89493359374a33446178a80496..b9a985fa772c993a7b00c27046f4a9555e60e461 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -43,7 +43,7 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 	unsigned long data;
 	u32 reg_value;
 
-	/* For GMAC3.x, 4.x versions, in "fine adjustement mode" set sub-second
+	/* For GMAC3.x, 4.x versions, in "fine adjustment mode" set sub-second
 	 * increment to twice the number of nanoseconds of a clock cycle.
 	 * The calculation of the default_addend value by the caller will set it
 	 * to mid-range = 2^31 when the remainder of this division is zero,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 347a0078f622277a9792cce3ad6f1719d168c040..268289a324f3c3b697f6232353d8a96c65d94f61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1114,7 +1114,7 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 			     STMMAC_DEFAULT_TWT_LS);
 
-	/* Try to cnfigure the hardware timer. */
+	/* Try to configure the hardware timer. */
 	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
 				  priv->tx_lpi_clk_stop, priv->tx_lpi_timer);
 
@@ -3495,7 +3495,7 @@ static void stmmac_mac_config_rss(struct stmmac_priv *priv)
 /**
  *  stmmac_mtl_configuration - Configure MTL
  *  @priv: driver private structure
- *  Description: It is used for configurring MTL
+ *  Description: It is used for configuring MTL
  */
 static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 {
@@ -4373,7 +4373,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	/* Always insert VLAN tag to SKB payload for TSO frames.
 	 *
-	 * Never insert VLAN tag by HW, since segments splited by
+	 * Never insert VLAN tag by HW, since segments split by
 	 * TSO engine will be un-tagged by mistake.
 	 */
 	if (skb_vlan_tag_present(skb)) {
@@ -5946,7 +5946,7 @@ static int stmmac_napi_poll_rxtx(struct napi_struct *napi, int budget)
 		unsigned long flags;
 
 		spin_lock_irqsave(&ch->lock, flags);
-		/* Both RX and TX work done are compelte,
+		/* Both RX and TX work done are complete,
 		 * so enable both RX & TX IRQs.
 		 */
 		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
@@ -6278,7 +6278,7 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
 /**
  *  stmmac_ioctl - Entry point for the Ioctl
  *  @dev: Device pointer.
- *  @rq: An IOCTL specefic structure, that can contain a pointer to
+ *  @rq: An IOCTL specific structure, that can contain a pointer to
  *  a proprietary structure used to pass information to the driver.
  *  @cmd: IOCTL command
  *  Description:
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 1e82850f2a25c33dffafa2fd3fb77a04852e9ace..a7c2496b39f286699da5395ec7e468ca84feaa62 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -483,7 +483,7 @@ void stmmac_pcs_clean(struct net_device *ndev)
  *	If a specific clk_csr value is passed from the platform
  *	this means that the CSR Clock Range selection cannot be
  *	changed at run-time and it is fixed (as reported in the driver
- *	documentation). Viceversa the driver will try to set the MDC
+ *	documentation). Vice versa the driver will try to set the MDC
  *	clock dynamically according to the actual clock input.
  */
 static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index e90a2c469b9a6f576c1b6f99954af08bae69007c..08b60b7d5fd641846ec1c31cca332833771a991c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -2000,7 +2000,7 @@ void stmmac_selftest_run(struct net_device *dev,
 		}
 
 		/*
-		 * First tests will always be MAC / PHY loobpack. If any of
+		 * First tests will always be MAC / PHY loopback. If any of
 		 * them is not supported we abort earlier.
 		 */
 		if (ret) {




