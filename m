Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C13C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mTGFzTWHveCEIuDfSBcwTGP4FJ6Gf4w5lufq1wRrVY=; b=ZBnSBDghdE0NO5MNlHhY4RfZoJ
	ShzzEX6FFC7XrlLk4St5oW1aYo6SX7KNPxdY4vXxJnQ3i5O6YBoQSo+KZ6+f6PPuQ8GBhvky2UAR9
	CxE+8lqP1ToVjssTtWm87fZSI6Ramu1kcahOYGeKKdHnM7d/anvfn2jJVrgLJlfM+N49reORohQt5
	t+etPWXuh4DZ0JyJWnDANWOZLco2NKXB+LHQmQ6qrqC6FXx/MD8ItN0w6bMO53nQPlRHpt1bzSllw
	Q2wwVrmVsuRpPkiR//dRegyLSMG49zSND3SIwDRGk8L+DkAvnYDVEiGCx1r+FUuhi4Fjjx/EwV9MB
	J9ktlpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTOD-0000000HTcw-21yR;
	Mon, 10 Feb 2025 12:59:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTHR-0000000HSV7-1A0o;
	Mon, 10 Feb 2025 12:52:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21f4500a5c3so81634495ad.3;
        Mon, 10 Feb 2025 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739191972; x=1739796772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mTGFzTWHveCEIuDfSBcwTGP4FJ6Gf4w5lufq1wRrVY=;
        b=PWtFl8G01Po5j7H7niogHhcOxGOiGq/YMW/4bQW5e6jMa5oymIR3N+pMcamtTG3YM1
         z83ZOTtVnfagmp6vREn7GaCjt2YK4RFTn3uuDWnSN9KHTmPTOeRndqt/BIiOVTI2hn1u
         uYEbWaICwgQszByrTHG3+WCUydsmBLa59vanox9WAeazhbnD1vOiYEWLB4YawGreghXH
         r1UZTsplu18Ud8f6G7mG38eGoqdTpSCHJRbQmbY8NnmS2LbsgfX6gQo06PbNoc1M2Tlx
         jy1EJgm+q0f3iB7a0OXn5PDAck/JW9tSxl406oDo8JwEAF9kBhXXINGl4JEU7jDe1i5/
         HIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191972; x=1739796772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3mTGFzTWHveCEIuDfSBcwTGP4FJ6Gf4w5lufq1wRrVY=;
        b=qjASM3n9+iaViSuVvTul1ezDWhJEJTSld9o89zgLy43acRTcB6MysoTiOHsY/4nBdW
         2SHm/hNlfbEDAun54zGZZtYgFrIBJasTq3NYPxuVbYtuZkiw7MVCzLDkFwC/JHuEeE6K
         HFwCTPeL4X/KPebCuWj5NZU2RiD2cw+jkzUvsWh0zOoYkYA1ReaLVKHaEiAJV9x5E7dC
         YhmZCbQbV+fkpPIrpixuKPXV0aSmh46ovCoN4VTghfOP+VxW/mCHTPFEdgHJw891fzO7
         r1d+Ad8wL3aTNjEHhQ6k4U3q1llGx52UUjIFFSKUtZ3vVV9Xtf7KWEi+6lgdJVay+BDC
         g8mg==
X-Forwarded-Encrypted: i=1; AJvYcCVPkJzhafvM7y374lpB525HzzWq2PZ0cYkG9JVB8wX5nIdkojFvT3FS9kY0BLMKOTxbgLHO5GQkUCmDEuxfMmE=@lists.infradead.org, AJvYcCXnd9rDUVwi6G2m7VfwcUAb4IXYVIiUhRkVLHgbmOr2EnTek5Onrml90d6sCFwrsv2hugr14GObDu73mneDT2Js@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl7NNenGxA+QcBwvTAu+G+MCl3RZphn45CoQ22JILrKMe+Dbgx
	nammimQCuSxUVf7ki+OqTtypW8IA3mP6WI68z/U3e4KMSqaiYIPy
X-Gm-Gg: ASbGncsnBVzVDS/8HCE18dmOxcxAtY5AlVp8DVZE2AJWc5u7LPqEgReQusdeher8yPM
	B8NOre1cQpRyTYH5hP/LdeZ74wZZPVaeTkqzv9J+Ab+sAjYfeH8iyLdh2HmpFuCZfpG5W1gfC0M
	ACUzd5IdYiKgk+XMSEnN8e9a22oVVz2jF1JWM6szPoPTecmlcA08y9pTKN5mnALPNgeP8B02CuM
	G+W53X+d+TL+nak4uM+woe7ZH4SWl6Hv/jAJTeAuObiEFLE7MHGe5a4w3uNC/tUvjV4WxNYAj7A
	agKPaHpq
X-Google-Smtp-Source: AGHT+IFY/eAAJFcD4vitGkVHUca2pVMuKjtQU6WUb3jtGtjhnnqqn/1iKAiFbhnjbTQxyI8lnuDV3w==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1ee03b129eemr26979741637.30.1739191972089;
        Mon, 10 Feb 2025 04:52:52 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730851fa25bsm2641825b3a.180.2025.02.10.04.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:51 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2] net: ethernet: mediatek: add EEE support
Date: Mon, 10 Feb 2025 20:52:45 +0800
Message-ID: <20250210125246.1950142-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045253_326475_292B7A92 
X-CRM114-Status: GOOD (  16.01  )
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

Add EEE support to MediaTek SoC Ethernet. The register fields are
similar to the ones in MT7531, except that the LPI threshold is in
milliseconds.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 64 +++++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 ++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 53485142938c..943636d822b5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -786,6 +786,7 @@ static void mtk_mac_link_up(struct phylink_config *config,
 
 	mcr = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
 	mcr &= ~(MAC_MCR_SPEED_100 | MAC_MCR_SPEED_1000 |
+		 MAC_MCR_EEE100M | MAC_MCR_EEE1G |
 		 MAC_MCR_FORCE_DPX | MAC_MCR_FORCE_TX_FC |
 		 MAC_MCR_FORCE_RX_FC);
 
@@ -811,6 +812,18 @@ static void mtk_mac_link_up(struct phylink_config *config,
 	if (rx_pause)
 		mcr |= MAC_MCR_FORCE_RX_FC;
 
+	if (mode == MLO_AN_PHY && phy && phy_init_eee(phy, false) >= 0) {
+		switch (speed) {
+		case SPEED_2500:
+		case SPEED_1000:
+			mcr |= MAC_MCR_EEE1G;
+			break;
+		case SPEED_100:
+			mcr |= MAC_MCR_EEE100M;
+			break;
+		}
+	}
+
 	mcr |= MAC_MCR_TX_EN | MAC_MCR_RX_EN | MAC_MCR_FORCE_LINK;
 	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
 }
@@ -4474,6 +4487,55 @@ static int mtk_set_pauseparam(struct net_device *dev, struct ethtool_pauseparam
 	return phylink_ethtool_set_pauseparam(mac->phylink, pause);
 }
 
+static int mtk_get_eee(struct net_device *dev, struct ethtool_keee *eee)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+	u32 reg;
+	int ret;
+
+	ret = phylink_ethtool_get_eee(mac->phylink, eee);
+	if (ret)
+		return ret;
+
+	reg = mtk_r32(mac->hw, MTK_MAC_EEECR(mac->id));
+	eee->tx_lpi_enabled = !(reg & MAC_EEE_LPI_MODE);
+	eee->tx_lpi_timer = FIELD_GET(MAC_EEE_LPI_TXIDLE_THD, reg) * 1000;
+
+	return 0;
+}
+
+static int mtk_set_eee(struct net_device *dev, struct ethtool_keee *eee)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+	u32 txidle_thd_ms, reg;
+	int ret;
+
+	/* Tx idle timer in ms */
+	txidle_thd_ms = DIV_ROUND_UP(eee->tx_lpi_timer, 1000);
+	if (!FIELD_FIT(MAC_EEE_LPI_TXIDLE_THD, txidle_thd_ms))
+		return -EINVAL;
+
+	reg = FIELD_PREP(MAC_EEE_LPI_TXIDLE_THD, txidle_thd_ms);
+
+	/* PHY Wake-up time, this field does not have a reset value, so use the
+	 * reset value from MT7531 (36us for 100BaseT and 17us for 1000BaseT).
+	 */
+	reg |= FIELD_PREP(MAC_EEE_WAKEUP_TIME_1000, 17) |
+	       FIELD_PREP(MAC_EEE_WAKEUP_TIME_100, 36);
+
+	if (!eee->tx_lpi_enabled)
+		/* Force LPI Mode without a delay */
+		reg |= MAC_EEE_LPI_MODE;
+
+	ret = phylink_ethtool_set_eee(mac->phylink, eee);
+	if (ret)
+		return ret;
+
+	mtk_w32(mac->hw, reg, MTK_MAC_EEECR(mac->id));
+
+	return 0;
+}
+
 static u16 mtk_select_queue(struct net_device *dev, struct sk_buff *skb,
 			    struct net_device *sb_dev)
 {
@@ -4506,6 +4568,8 @@ static const struct ethtool_ops mtk_ethtool_ops = {
 	.set_pauseparam		= mtk_set_pauseparam,
 	.get_rxnfc		= mtk_get_rxnfc,
 	.set_rxnfc		= mtk_set_rxnfc,
+	.get_eee		= mtk_get_eee,
+	.set_eee		= mtk_set_eee,
 };
 
 static const struct net_device_ops mtk_netdev_ops = {
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0d5225f1d3ee..90a377ab4359 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -453,6 +453,8 @@
 #define MAC_MCR_RX_FIFO_CLR_DIS	BIT(12)
 #define MAC_MCR_BACKOFF_EN	BIT(9)
 #define MAC_MCR_BACKPR_EN	BIT(8)
+#define MAC_MCR_EEE1G		BIT(7)
+#define MAC_MCR_EEE100M		BIT(6)
 #define MAC_MCR_FORCE_RX_FC	BIT(5)
 #define MAC_MCR_FORCE_TX_FC	BIT(4)
 #define MAC_MCR_SPEED_1000	BIT(3)
@@ -461,6 +463,15 @@
 #define MAC_MCR_FORCE_LINK	BIT(0)
 #define MAC_MCR_FORCE_LINK_DOWN	(MAC_MCR_FORCE_MODE)
 
+/* Mac EEE control registers */
+#define MTK_MAC_EEECR(x)		(0x10104 + (x * 0x100))
+#define MAC_EEE_WAKEUP_TIME_1000	GENMASK(31, 24)
+#define MAC_EEE_WAKEUP_TIME_100		GENMASK(23, 16)
+#define MAC_EEE_LPI_TXIDLE_THD		GENMASK(15, 8)
+#define MAC_EEE_CKG_TXIDLE		BIT(3)
+#define MAC_EEE_CKG_RXLPI		BIT(2)
+#define MAC_EEE_LPI_MODE		BIT(0)
+
 /* Mac status registers */
 #define MTK_MAC_MSR(x)		(0x10108 + (x * 0x100))
 #define MAC_MSR_EEE1G		BIT(7)
-- 
2.43.0


