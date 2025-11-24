Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5DACFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+2VNKYVSBcrc1VyyHdGwlpo/7zwStLekQ2MuxGIm91M=; b=2uPyuVmm8H4uqErkDroIaHX0Q7
	5R5tXDmTHpZtK6aclGBla4PRnXUOGjI2jZFq1ZS+SrEBikWp8guTeTMlb2Lj1e4r7/+POUWxiER/q
	X+LQ/uZRF3x2HXzELE7IyfYO7V5HXjvfzG+77jUi1dE3lt4HAQe3PDM08Jz8jOh6DAVDgnaFB3mx6
	pvET8c562KDgwO4yG+UzVVFwgQKkP4yifbom7t54mLBOrbA6V3YRFzdTwybPkijeYF8VVDiP4G5tM
	XUNMJM9SQzUUnrnV2Fwwuomp7JVun4N2+gMybGRnyYMygVD4uGQXhVKeLEzkEugLFBH2cvTjJ05h0
	HAHGS5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUjX-0000000BYYm-0MRt;
	Mon, 24 Nov 2025 11:27:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUjV-0000000BYYT-2F5x
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 11:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:In-Reply-To:References;
	bh=+2VNKYVSBcrc1VyyHdGwlpo/7zwStLekQ2MuxGIm91M=; b=KRFq9Sgdkh+X05DT5f3GvG6O5D
	t7zgGUiJbznEl6KXnbJtEC2yshIhydRtaTu6ChllO/Gyqb+Yh/WhF2Lbl0g42Q0U2gcHIaHm6vVEw
	UA9LVr37BLWb1MdhunE1dtcbtV7t1pyZ9cHVctJGOsQkBrFFxOCMxGuI78bwxwBT3I+e/metmdkT7
	zOi+aQ4D+Eza7x8veRXyWx1GtxWl40pz7jwRKIjbK1u9fpCBLi/sCzeVq/0UY4JCBJIIZbX051FbA
	Q4VVwCaZNBV9IUs8rjkgHKZaKWOz/KbuWbmHLiRO9MfRpq4ff4qtwYDFmqsPoiFbR3Jk6SaMeKu3K
	SAkroltQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTrq-00000003X7f-4BVA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+2VNKYVSBcrc1VyyHdGwlpo/7zwStLekQ2MuxGIm91M=; b=se+EkqTUZ2JsHHqRGkjGWssdU5
	RaNhntOk1D2FYeNNJYJcZ2J5/zJNwCXPgTVT+4AvGdrACkeEyyn0d7AS+9dT5zPRpnaRrwu0WKOSH
	3Meo8EXRvuq+GbE/jIZ7qCWnrf37fK4EhwaKHuX3Kfmv56bYqc/WrTV7sDy/PJELMNQpewOpxZe8s
	CisBjdG07xBhNasTRs3sg/Kv9rfjSNrf9pZtTaXufHx04ERkFjts+BBMp3GZzEFCY2JX1x/N2SsV1
	DP2UvVKlAlCB7SD0BA0fYxYrcUuA9AUGTxdAAxU13Y9BVrHvSn/0GikJfM0lj1zvGjhleXKbVdseI
	I5asktsg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49258 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vNUjD-000000001e9-0FhO;
	Mon, 24 Nov 2025 11:27:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vNUjC-0000000FhjR-0h6P;
	Mon, 24 Nov 2025 11:27:30 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	<imx@lists.linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	<linux-arm-kernel@lists.infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Wei Fang <wei.fang@nxp.com>
Subject: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
Date: Mon, 24 Nov 2025 11:27:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_103223_191804_6784FD92 
X-CRM114-Status: GOOD (  18.78  )
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

Some platforms have problems when EEE is enabled, and thus need a way
to disable stmmac EEE support. Add a flag before the other LPI related
flags which tells stmmac to avoid populating the phylink LPI
capabilities, which causes phylink to call phy_disable_eee() for any
PHY that is attached to the affected phylink instance.

iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
along with the main dwmac interrupts. Since lpi_intr_o is synchronous
to the receive clock domain, and takes four clock cycles to clear, this
leads to interrupt storms as the interrupt remains asserted for some
time after the LPI control and status register is read.

This problem becomes worse when the receive clock from the PHY stops
when the receive path enters LPI state - which means that lpi_intr_o
can not deassert until the clock restarts. Since the LPI state of the
receive path depends on the link partner, this is out of our control.
We could disable RX clock stop at the PHY, but that doesn't get around
the slow-to-deassert lpi_intr_o mentioned in the above paragraph.

Previously, iMX8MP worked around this by disabling gigabit EEE, but
this is insufficient - the problem is also visible at 100M speeds,
where the receive clock is slower.

There is extensive discussion and investigation in the thread linked
below, the result of which is summarised in this commit message.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
For Laurent to add to a patch series appropriately adding
STMMAC_FLAG_EEE_DISABLE to dwmac-imx.c

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 include/linux/stmmac.h                            | 9 +++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6cacedb2c9b3..ca0eee58a8a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1324,7 +1324,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 				 config->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	if (priv->dma_cap.eee) {
+	/* Some platforms, e.g. iMX8MP, wire lpi_intr_o to the same interrupt
+	 * used for stmmac's main interrupts, which leads to interrupt storms.
+	 * STMMAC_FLAG_EEE_DISABLE allows EEE to be disabled on such platforms.
+	 */
+	if (priv->dma_cap.eee &&
+	    !(priv->plat->flags & STMMAC_FLAG_EEE_DISABLE)) {
 		/* Assume all supported interfaces also support LPI */
 		memcpy(config->lpi_interfaces, config->supported_interfaces,
 		       sizeof(config->lpi_interfaces));
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f1054b9c2d8a..5ed49d5363ee 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -187,10 +187,11 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
-#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
-#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
-#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
-#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
+#define STMMAC_FLAG_EEE_DISABLE			BIT(10)
+#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(11)
+#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(12)
+#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(13)
+#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(14)
 
 struct mac_device_info;
 
-- 
2.47.3


