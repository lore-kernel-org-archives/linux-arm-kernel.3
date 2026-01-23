Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79548D72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZh72J4Tq0dy1l0Nj6WDkQvyxSW++B/372OvBmFERyE=; b=C9iP8hBH2ETOXn+5JIEzCuzL0b
	7icU8E6kcW362CK8RUw1t6J+k7vzy02e6ODLpfGAsz1zwSK036yRY+n5BpbUUiyl+T98rxl7A/Ffp
	jwg7eOj5D2IkKoVrT13SBvox8rYaKwx4WSOAxEPv+OsqjXQGHnsBJwG1QMQGcxMilymjkGmqqmwBb
	DmLDMwEBAH4aMZ8umS89bLgShyv1QvpL42XM51yZSyCOURygz1tu3p4rchMHvUscbMGkoulKTXZ/6
	TLoJ6wX/iQ7qBCe1p+DRNjvQvrTDWsV3waGGXzlvfwbXy5c6xi654P1m547956sYDgMOy7FX70ZXa
	II9QVTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDro-00000008d7X-3OW1;
	Fri, 23 Jan 2026 09:54:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDrd-00000008cyj-25vy;
	Fri, 23 Jan 2026 09:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=PZh72J4Tq0dy1l0Nj6WDkQvyxSW++B/372OvBmFERyE=; b=EEwo9i7CKeibXTH/NgNbR5uOdU
	bVimJJw851lFPzLuZF8l5petKl69J/QDs1eLvSjK3CVl1F5MjFbeknJ/gK8gsLSZn7Cr9cgdQ9+s7
	/oWDSWYeIp+GExdsZLaGIEdLU/VK10V1kQzNTDsC/aospoOjc1GuE+nnklBjW/Psx4cABUbcU2noq
	k+NBCDitusxBbQKNbQNZTqj6k93MH92OMetNhv6vX/9MRWnL3de3HHBimtvXYk8CMO9WPgpiOaS3g
	6QX+OjhcIabt+SZFhxZKtZW9+05jtKMhQD5RVMlIt9ZPP43rTv1+Fnci3fYlx4FJOdEx9IgQi/NC8
	yb7z+eGQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDra-000000025Qy-2ZKq;
	Fri, 23 Jan 2026 09:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PZh72J4Tq0dy1l0Nj6WDkQvyxSW++B/372OvBmFERyE=; b=RHI/9xIWGsDOmWMK4mC5AJqS0L
	RiHFE/FZokoU28ceizHz7GtZ4VNky7e2hxE9kr8renMePrEAYVFRc9oU4qe8lpZzgkEQluz5715w4
	TOKSHASY17fV2PZ51KFV0FaHZZSDp2Wwqu2WGEklrm1w5F5gGXWDGcKwwVxErzLtX8wnTmPyn0KYC
	ZuxcE1HR/3/B7Yjrarkv0lMc/RFNY/19MR0svoE45f4yMm68lebZCJyY6J5oF07McNrpsAxMx1vUM
	ZX4a6k9CpCfutjfrdb/CWNtqMYaKRZIAagbIKJVdqqtdbTVnUph7OAbDtvpTNRxbD2k9ZdItAnttq
	QmVoy0Ug==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37516 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDrJ-000000001b1-0g2T;
	Fri, 23 Jan 2026 09:53:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDrH-00000005fQL-0QPb;
	Fri, 23 Jan 2026 09:53:39 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 04/14] net: stmmac: wrap phylink's rx_clk_stop
 functions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjDrH-00000005fQL-0QPb@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:53:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_095358_780807_36125B15 
X-CRM114-Status: GOOD (  12.70  )
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

With generic SerDes support, stmmac will need to do more work to ensure
that clk_rx_i is running in all configurations. Rather than turn each
site that calls phylink_rx_clk_stop_xxx() into a list of functions,
move these to their own pair of functions so that they can be
augmented at a single location.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 ++++++++++++-------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c2589f02ff7e..24a2555ca329 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3547,6 +3547,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 	}
 }
 
+static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
+{
+	phylink_rx_clk_stop_block(priv->phylink);
+}
+
+static void stmmac_clk_rx_i_release(struct stmmac_priv *priv)
+{
+	phylink_rx_clk_stop_unblock(priv->phylink);
+}
+
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
@@ -3578,12 +3588,12 @@ static int stmmac_hw_setup(struct net_device *dev)
 	 * Block the receive clock stop for LPI mode at the PHY in case
 	 * the link is established with EEE mode active.
 	 */
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 
 	/* DMA initialization and SW reset */
 	ret = stmmac_init_dma_engine(priv);
 	if (ret < 0) {
-		phylink_rx_clk_stop_unblock(priv->phylink);
+		stmmac_clk_rx_i_release(priv);
 		netdev_err(priv->dev, "%s: DMA engine initialization failed\n",
 			   __func__);
 		return ret;
@@ -3591,7 +3601,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Copy the MAC addr into the HW  */
 	stmmac_set_umac_addr(priv, priv->hw, dev->dev_addr, 0);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	/* Initialize the MAC Core */
 	stmmac_core_init(priv, priv->hw, dev);
@@ -3670,9 +3680,9 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	return 0;
 }
@@ -6107,9 +6117,9 @@ static int stmmac_set_features(struct net_device *netdev,
 	else
 		priv->hw->hw_vlan_en = false;
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	return 0;
 }
@@ -6378,9 +6388,9 @@ static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
 	if (ret)
 		goto set_mac_error;
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_umac_addr(priv, priv->hw, ndev->dev_addr, 0);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 set_mac_error:
 	pm_runtime_put(priv->device);
@@ -8192,11 +8202,11 @@ int stmmac_resume(struct device *dev)
 	stmmac_init_timestamping(priv);
 
 	stmmac_init_coalesce(priv);
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_rx_mode(ndev);
 
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
-- 
2.47.3


