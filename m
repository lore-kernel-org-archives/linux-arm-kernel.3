Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D03BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJdSXpXW9LlkBOPkFR0Utx/8PFGdBu9YmyGsnlOk7f4=; b=0EfxGf0r5t+AOSqfgQkB0/VJjt
	FFa43RGtmp0ye6gK7hJ+PRFA0UaYGqJytbkMR0MnAVSgM5AGIox2Rx00z6Z8tbZe7i1P39p5fC5VP
	mGV6NstGhvPzVe6SBWaMwxqQzuWp0OzIi3vw+5QFR5B7TJ7Tg92OduFxgU/Z5XoDCeCIaOk6lAtKO
	MWP1E8FGopEnzStVYRohCXSjS/82pFWVPwL9FNZbEQqFE+tsroM3wHc7FQxiqk6Jc6LuaYxj4f0YM
	KCKv5hqCto3v63qgFAB7LRpEDSKJfJs+65XaFm7Fmagcf8Fhe3vKla0idi7bnnyNHng2lHj9iI27+
	ShaG5IfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykX-00000004AXV-2C7s;
	Mon, 17 Feb 2025 10:53:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxc5-00000003xog-2AzH;
	Mon, 17 Feb 2025 09:40:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220dc3831e3so58011955ad.0;
        Mon, 17 Feb 2025 01:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739785228; x=1740390028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJdSXpXW9LlkBOPkFR0Utx/8PFGdBu9YmyGsnlOk7f4=;
        b=WkL3WFv3r3yJMmcpkEPq1Vh4qfDLS1w4M0rKsyj9QOoLfM7ucjbDymRYblSusUv9co
         iDGduNr8sWOMWv6pRiq6GXID8YZ04CMdhzIysKPCf31E/j7ogKrvQnIQegOJ0bAT/8df
         Jbd783BpQIW749r9AKQ4mrSFGjGK0H6Xtf6bDIeFtIsK2NBum5fBHLtTItST0CDPALVD
         oQ9cymxqpnDwzwoO8ZhmJifyA+C5S2PGbQ26aRHY6AKc6jZLXf6UCo/3UQH12QAh8nx9
         9JvQGnM5z8I2cEKrJ9hS1qJLfaS38GyGm3t+fIMyeVBqGvyXaJdIJI/1+svcQ2ZrB56H
         g1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785228; x=1740390028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJdSXpXW9LlkBOPkFR0Utx/8PFGdBu9YmyGsnlOk7f4=;
        b=cRtv33KwNDrk/EwzLgP+Sl3kC54DEisMs6ze5a8zxArCe91jRb9n5GL7ez5lZe8HJm
         oNkUSk5S9K13YJ1W/bNqFcUtaEbcPl5y13odRFSCxWRsNDaDD9Bh+VzmO+jhjmfdSrTE
         rr3yqlNk0LkhXlhBj8tbl87ttFxWgWDP2x+ojzOxRUeJGJw6hmgPCz4IEy75O5+dcXXz
         rXXUp/To8SQcGnqYtRA4MDQdTQEWL1O34Xw9oM6VZSMvCh2bAuCyygwzp+1WUrxU86IS
         znJTJ9it0Bfdk6AiHhvMoRW3D6Ju/D2v+sZx34jeJiOZpZXKkYfNZPXamfptiYFw6NdS
         xlYw==
X-Forwarded-Encrypted: i=1; AJvYcCUaYrDExb6s/DwWNeqk6Jx2WsrMRCZ8URLNfDG8Ondg+usLJsdFB3eMqE37jJXJzASX6Fj2lcJ2ifs1+RsN10Sr@lists.infradead.org, AJvYcCWQPhZGsdQQaZeSqK0QCtXFy+oqjUk7IMAtPpL5wIlPF8oCC+g88Ikm+5NWJnZF6vKOCP+d0VTlj9x08gw0K+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAWgk0YdVyDwhN3R79cgDVcIjWnfhFC+4Jeb3Z3LyD2Li8JiRR
	zTehltSFOCf5Ov7jw4/hbLsez5BW2gHPaZC/RHF/5KQXOtfc8orq
X-Gm-Gg: ASbGncuOrC5s3JxfuD7cbdTOH+LJD+tUj6lTf+tODg4Mw3vkkg5MV0a+Gn94QEdNnZL
	zqgWM+dFmFg1tJvNU2ZOTcME4bnWLhW6xfVs1DCpjlxktTKkThfxmEZTvr6MjQRjTUjAQE56BVZ
	A0KNCQPXYXwPFJ1WUKqm/MChXTtTHUgVaOVPFCQ3xbFLa+0JUjWUGxwYwqlVEI2gdwFrkCQBLP2
	Pm9avXkh6IVA690ASONJdjV0NPhzHPh63DIK8D2yrr09tuZPLu0keCgyGekE3X2wzb8JnEy7XDi
	yJJP8nKs
X-Google-Smtp-Source: AGHT+IElh54SBERly9RJ4+nFUA5iu6PJvcF2dB2EW9JHMiqhpE+vcHK/m2s43XEf/EAUzaCYFZraHQ==
X-Received: by 2002:a05:6a00:4643:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7323c751ab9mr34939772b3a.8.1739785228464;
        Mon, 17 Feb 2025 01:40:28 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467adsm7947446b3a.15.2025.02.17.01.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:40:28 -0800 (PST)
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
Subject: [PATCH net-next v4] net: ethernet: mediatek: add EEE support
Date: Mon, 17 Feb 2025 17:40:21 +0800
Message-ID: <20250217094022.1065436-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_014029_558757_94A1D9E7 
X-CRM114-Status: GOOD (  16.53  )
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
v4: fix build warning

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 67 +++++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 ++++
 2 files changed, 78 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0ad965ced5ef..922330b3f4d7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -815,12 +815,60 @@ static void mtk_mac_link_up(struct phylink_config *config,
 	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
 }
 
+static void mtk_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct mtk_mac *mac = container_of(config, struct mtk_mac,
+					   phylink_config);
+	struct mtk_eth *eth = mac->hw;
+
+	mtk_m32(eth, MAC_MCR_EEE100M | MAC_MCR_EEE1G, 0, MTK_MAC_MCR(mac->id));
+}
+
+static int mtk_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+				 bool tx_clk_stop)
+{
+	struct mtk_mac *mac = container_of(config, struct mtk_mac,
+					   phylink_config);
+	struct mtk_eth *eth = mac->hw;
+	u32 val;
+
+	/* Tx idle timer in ms */
+	timer = DIV_ROUND_UP(timer, 1000);
+
+	/* If the timer is zero, then set LPI_MODE, which allows the
+	 * system to enter LPI mode immediately rather than waiting for
+	 * the LPI threshold.
+	 */
+	if (!timer)
+		val = MAC_EEE_LPI_MODE;
+	else if (FIELD_FIT(MAC_EEE_LPI_TXIDLE_THD, timer))
+		val = FIELD_PREP(MAC_EEE_LPI_TXIDLE_THD, timer);
+	else
+		val = MAC_EEE_LPI_TXIDLE_THD;
+
+	if (tx_clk_stop)
+		val |= MAC_EEE_CKG_TXIDLE;
+
+	/* PHY Wake-up time, this field does not have a reset value, so use the
+	 * reset value from MT7531 (36us for 100M and 17us for 1000M).
+	 */
+	val |= FIELD_PREP(MAC_EEE_WAKEUP_TIME_1000, 17) |
+	       FIELD_PREP(MAC_EEE_WAKEUP_TIME_100, 36);
+
+	mtk_w32(eth, val, MTK_MAC_EEECR(mac->id));
+	mtk_m32(eth, 0, MAC_MCR_EEE100M | MAC_MCR_EEE1G, MTK_MAC_MCR(mac->id));
+
+	return 0;
+}
+
 static const struct phylink_mac_ops mtk_phylink_ops = {
 	.mac_select_pcs = mtk_mac_select_pcs,
 	.mac_config = mtk_mac_config,
 	.mac_finish = mtk_mac_finish,
 	.mac_link_down = mtk_mac_link_down,
 	.mac_link_up = mtk_mac_link_up,
+	.mac_disable_tx_lpi = mtk_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = mtk_mac_enable_tx_lpi,
 };
 
 static int mtk_mdio_init(struct mtk_eth *eth)
@@ -4469,6 +4517,20 @@ static int mtk_set_pauseparam(struct net_device *dev, struct ethtool_pauseparam
 	return phylink_ethtool_set_pauseparam(mac->phylink, pause);
 }
 
+static int mtk_get_eee(struct net_device *dev, struct ethtool_keee *eee)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	return phylink_ethtool_get_eee(mac->phylink, eee);
+}
+
+static int mtk_set_eee(struct net_device *dev, struct ethtool_keee *eee)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	return phylink_ethtool_set_eee(mac->phylink, eee);
+}
+
 static u16 mtk_select_queue(struct net_device *dev, struct sk_buff *skb,
 			    struct net_device *sb_dev)
 {
@@ -4501,6 +4563,8 @@ static const struct ethtool_ops mtk_ethtool_ops = {
 	.set_pauseparam		= mtk_set_pauseparam,
 	.get_rxnfc		= mtk_get_rxnfc,
 	.set_rxnfc		= mtk_set_rxnfc,
+	.get_eee		= mtk_get_eee,
+	.set_eee		= mtk_set_eee,
 };
 
 static const struct net_device_ops mtk_netdev_ops = {
@@ -4610,6 +4674,9 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
+		MAC_2500FD;
+	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
 	 * in its .mac_config method (since state->speed is not valid there.
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


