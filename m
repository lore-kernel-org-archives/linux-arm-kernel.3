Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057DAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1ldMZzRY48MPhvy74auPiCjGXjOiQBSOuH+++XP3qw=; b=OQqN71vyLpj6PY5pLjQli57s3v
	tUYsdXsX0z7PPprJc2gAy7kkaqgaxFd+gh+/kRlafcsdEN7ugi2+Hz/4W8VcTlYsyhzGDAc4WbrF4
	mA1PvZYbb7++pbSxgjcBYuREeH0xjPddyWI3uYWCJiDffsuLy6i5kX8rxEX9xMFtheU0GLhDW6DwX
	RLx3XE01aptqDLz6qXj1SwIvATOthi0H1tgwCpl90H0A83R0Li4/kckaKh3fjcCW8+RXC+Nxnqdr4
	eykM7isenPG7udH4d2ZKe+7B9J/lTD31Yy1LInG0r8Qt6iHul6bfH1Ztd727cZdlINeCN9EhfzKMr
	Kaf8C3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEDP0-00000007oz1-3nDe;
	Sun, 11 May 2025 20:36:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uED3M-00000007mst-26Tw;
	Sun, 11 May 2025 20:13:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so27873675e9.2;
        Sun, 11 May 2025 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994419; x=1747599219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1ldMZzRY48MPhvy74auPiCjGXjOiQBSOuH+++XP3qw=;
        b=hmwLWpZYmZhDLBPVwsIncJwhheww1FNoDY2mE+FBAtFqkJJJh4PHobSRrmGwaCf6qt
         B+Ti9tTL0y2iUB+ptbuszlYIRP6dRAJEGDnHWgb/eQCENAOKDp8vqBn+FyuwAKm03gEo
         WTpG+h7qKgeFWBEVhxDhzXyVFw+GouFMJh7omkgeSgxJppXc3iETls9aH4l5hLOVeI7q
         trtu/+uUNakDiefYycdUuacpFEj3rpBCimtTO+ioTg/fGKo+zGyyr12MqAx8orN4uZvP
         piCUEn+u2ywEivZU8+D/qwBp3AB6alBbzaT/iNfp+LNeBFsHHnldf1pq5TGpfeK47BM2
         nZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994419; x=1747599219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1ldMZzRY48MPhvy74auPiCjGXjOiQBSOuH+++XP3qw=;
        b=YI4MHDlJyEClUPukoy07ywbOQqL2FVK/yt4bUh7x6m5bYB2pj6n8ye43L2idLo6aTx
         tPVWnLmt5IJt+lHlIjCP8bh/Qakr+jYMtUaMYEh+VIwpxIjrvUpFOZDQINm9Ri+xlkuY
         OP4TNXksvIlOJp2AUU19JLg1E2+tOaXVzMSLopqFucb6n1sKtHh58GGS6Qg6BnG9Ofuv
         vvRdRmRmHqYFvjQYjxIP6xCeDw+mqTTHKyxjYsJKlG6mSZUoLtPKx1yxeP2hcOhiFMMt
         n+iImEr0K2kHM03X8N2iOv8cd9M0fWZYzU4HwcQUbCsx6bBlH19S73gRtdK0UWKtZ+xR
         tqiA==
X-Forwarded-Encrypted: i=1; AJvYcCVNMbKjqNCVeUK9Gn/8+tQr5miD7enADbKv0QBjvFHr/f9ETpDjPvGN2prKRJypgfprImT4OdsI5/3pco/3hL2g@lists.infradead.org, AJvYcCXvcSP9gfVVDv6rJOUoKAlRkBBAlTWqoM9sO6IqUrIAGerEReYNJW4RvONsZ90XhogRGyAhhg7DU0GX3OTz8nU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWSink3zsJfc7LcXgcWCzorskeLytQRw4pDCs9/FaVy5v5fuIc
	HLfq3nphatLk1Dv+ndwZGo7l8ZEc2bJmf3MvV5zTqOA7bBlR0FhY
X-Gm-Gg: ASbGncuYtZB3XT9er5vG1094rCKf8fWD7lXpThIYzq+udPTbt1Lbc5VY5XLEIcuII0P
	MUBOGbLhCu9zr8fRXZHb18JPsaKIaaHNDgJUi9j6KT0lmR4jpIC9SmfC6UI6x/ED8zrc+B1XAGm
	N8dLVTcxnS62OVQB7DxWhyl1WdOjKfrRCubCza8G98PQVTfncgqlMiP8Lf4u2AqrVRiQXKsT+z6
	hB1m6GwA1kmRO9HJtme2Yf90cV7Yq7im6Ql1Hug4f80UaJxyTN3Vxm7gn0nD+XF4AVUR8t4YxJ4
	6IjJ2A+X0MIOA4zT/DVn1mKTp0mIqMvDl7JnJLNQenCZOC+YGuujAj0rTvS8XxBOq//b+wqS4pw
	8M33mi5zoItTE0VRbOPUS
X-Google-Smtp-Source: AGHT+IHNcYZefBBPiSyJBDsYxacaSeQ7MB6Qh8KUtGFVA2lBNgxp/pOIFsfBehA+M1uENnSRnn+R9A==
X-Received: by 2002:a05:600c:3587:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-442d6dd216fmr83241275e9.27.1746994418629;
        Sun, 11 May 2025 13:13:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 11/11] net: airoha: add phylink support for GDM2/3/4
Date: Sun, 11 May 2025 22:12:37 +0200
Message-ID: <20250511201250.3789083-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250511201250.3789083-1-ansuelsmth@gmail.com>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_131340_540241_2A3B0ACC 
X-CRM114-Status: GOOD (  22.90  )
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

Add phylink support for GDM2/3/4 port that require configuration of the
PCS to make the external PHY or attached SFP cage work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 155 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 3 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931f..3be1ae077a76 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -7,6 +7,7 @@
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
@@ -79,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
 	return port->id == 1;
 }
 
+static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
+{
+	return port->id != 1;
+}
+
 static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 {
 	struct airoha_eth *eth = port->qdma->eth;
@@ -1613,6 +1619,17 @@ static int airoha_dev_open(struct net_device *dev)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
 
+	if (airhoa_is_phy_external(port)) {
+		err = phylink_of_phy_connect(port->phylink, dev->dev.of_node, 0);
+		if (err) {
+			netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
+				   err);
+			return err;
+		}
+
+		phylink_start(port->phylink);
+	}
+
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
 	if (err)
@@ -1665,6 +1682,11 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	if (airhoa_is_phy_external(port)) {
+		phylink_stop(port->phylink);
+		phylink_disconnect_phy(port->phylink);
+	}
+
 	return 0;
 }
 
@@ -2795,6 +2817,115 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 	return false;
 }
 
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
+						    phylink_config);
+	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_eth *eth = qdma->eth;
+	u32 frag_size_tx, frag_size_rx;
+
+	if (port->id != 4)
+		return;
+
+	switch (speed) {
+	case SPEED_10000:
+	case SPEED_5000:
+		frag_size_tx = 8;
+		frag_size_rx = 8;
+		break;
+	case SPEED_2500:
+		frag_size_tx = 2;
+		frag_size_rx = 1;
+		break;
+	default:
+		frag_size_tx = 1;
+		frag_size_rx = 0;
+	}
+
+	/* Configure TX/RX frag based on speed */
+	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG,
+		      GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+		      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+				 frag_size_tx));
+
+	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG,
+		      GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+		      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+				 frag_size_rx));
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_link_up = airoha_mac_link_up,
+};
+
+static int airoha_setup_phylink(struct net_device *dev)
+{
+	struct airoha_gdm_port *port = netdev_priv(dev);
+	struct device_node *np = dev->dev.of_node;
+	struct phylink_pcs **available_pcs;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	unsigned int num_pcs;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&dev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	port->phylink_config.dev = &dev->dev;
+	port->phylink_config.type = PHYLINK_NETDEV;
+	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+						MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD |
+						MAC_5000FD | MAC_10000FD;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), NULL, &num_pcs);
+	if (err)
+		return err;
+
+	available_pcs = kcalloc(num_pcs, sizeof(*available_pcs), GFP_KERNEL);
+	if (!available_pcs)
+		return -ENOMEM;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_pcs,
+				       &num_pcs);
+	if (err)
+		goto out;
+
+	port->phylink_config.available_pcs = available_pcs;
+	port->phylink_config.num_available_pcs = num_pcs;
+
+	__set_bit(PHY_INTERFACE_MODE_SGMII,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_USXGMII,
+		  port->phylink_config.supported_interfaces);
+
+	phy_interface_copy(port->phylink_config.pcs_interfaces,
+			   port->phylink_config.supported_interfaces);
+
+	phylink = phylink_create(&port->phylink_config,
+				 of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink)) {
+		err = PTR_ERR(phylink);
+		goto out;
+	}
+
+	port->phylink = phylink;
+out:
+	kfree(available_pcs);
+
+	return err;
+}
+
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 				 struct device_node *np, int index)
 {
@@ -2873,7 +3004,23 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	if (err)
 		return err;
 
-	return register_netdev(dev);
+	if (airhoa_is_phy_external(port)) {
+		err = airoha_setup_phylink(dev);
+		if (err)
+			return err;
+	}
+
+	err = register_netdev(dev);
+	if (err)
+		goto free_phylink;
+
+	return 0;
+
+free_phylink:
+	if (airhoa_is_phy_external(port))
+		phylink_destroy(port->phylink);
+
+	return err;
 }
 
 static int airoha_probe(struct platform_device *pdev)
@@ -2967,6 +3114,9 @@ static int airoha_probe(struct platform_device *pdev)
 		struct airoha_gdm_port *port = eth->ports[i];
 
 		if (port && port->dev->reg_state == NETREG_REGISTERED) {
+			if (airhoa_is_phy_external(port))
+				phylink_destroy(port->phylink);
+
 			unregister_netdev(port->dev);
 			airoha_metadata_dst_free(port);
 		}
@@ -2994,6 +3144,9 @@ static void airoha_remove(struct platform_device *pdev)
 			continue;
 
 		airoha_dev_stop(port->dev);
+		if (airhoa_is_phy_external(port))
+			phylink_destroy(port->phylink);
+
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 53f39083a8b0..73a500474076 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -498,6 +498,9 @@ struct airoha_gdm_port {
 	struct net_device *dev;
 	int id;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index d931530fc96f..54f7079b28b0 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -357,6 +357,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_GDMA4_TMBI_FRAG		0x2028
+#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_GDMA4_RMBI_FRAG		0x202c
+#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.48.1


