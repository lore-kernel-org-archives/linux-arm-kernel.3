Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B33C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b96fP0PKnSqz6xZp1n4Stntc07MfkBqVjxTOrAFZBU8=; b=aaMYrN/eBV2IoP/PN36Wx+zIou
	Sa5zC7RfJG7shp+A5jRTwdrO2dvYTAyejqhn3HGWhjvTXrPgjoHl+aYXv3LSn6stRsGjEq5CiFCqV
	G71e8WRYim6b3drPziGBtChNqZGbOzKRr6S0oA4/o5n/qeiV8SxSfuJqidAGko/KDYxojngamVyaV
	VsDqILGfwaQYbuiYM/Tvrk376LJMElVpenBUD3r3tHP312SVfqx4XVa26PVsGumPcrX3Xo3om3nIb
	/cBNu6JlNh/T4oDaALnxdhEKdfagpat432Bi+ik7RRIcKU7ZVhhqqyc/Dg90gKhEZzCk+h1Xiv4De
	cn7/qSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YaO-0000000FwOQ-3UJ5;
	Sun, 06 Apr 2025 22:35:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGr-0000000FsyK-11NX;
	Sun, 06 Apr 2025 22:15:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43edb40f357so14827175e9.0;
        Sun, 06 Apr 2025 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977716; x=1744582516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b96fP0PKnSqz6xZp1n4Stntc07MfkBqVjxTOrAFZBU8=;
        b=HUb8sqHsnV8cgZIPQU5Uh1k5RedC6VAXsPbThRGndzoOclhC+PRhMEi1rwRCxZ0kQu
         7oKktJpKstKCvdRf8MYUbnAqHfMPvlJjLUUr4Y1stAVx/gNATjUNSN3E8ubhlXQ/p06J
         5U2TZItOwVDeQsgNsVkpSgfBh7TN/IpK/onlyjP/FyK1e2LiJGo3S4VfCJOqAeQNiulL
         185g0rzCvwbNLcsUdm1ApnhZlWAjceNAjfXqmbbLTpLmxMLk4AnCXFmxk/0aiDOfWBOz
         3HoEjJifCL5p5bWckwd4SHEzEROm6NClOJEBWCGofKTSAhUO0upathL9d6qcKZ5gFEZ+
         BQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977716; x=1744582516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b96fP0PKnSqz6xZp1n4Stntc07MfkBqVjxTOrAFZBU8=;
        b=I6jYIWwXj66LVY+4o+eJwxjui191j56vflmpBptZuJG1j9MJOznPosoaxsAAT9GFBm
         0gJDP3GWKjTPbEiCK+RfvjLfa5KfvhzMxc4b3/uBtEQkLY+bdDKzQMhJSGdWHn7GEbEK
         MaqR3rzR8+PCp4JG5/SWdikMzPNXJ4nmHswIj5aJ4hGIGS0g+FmOknAhkk5che9xcHed
         EMpCEiX274LXF5BwRrZxGv0CM+L8F+94w1wfCMftUhjK0QhQd5mSxiO9NHQN0PcYUYqA
         WdHARQWFqKbtSKnAT8yhVKDoA1zYsNARutegCIUL5sGwcUjUOElv+joI5SUOuCEtroRL
         y+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Krag+NIyqwyd6u4oERh2OAhd4X5rbCT7ixRLjDqK4AqLMpOtwkKqm1aDC4kHTr4nwiNqmRumnyvMS1QfdUQ=@lists.infradead.org, AJvYcCXmU95PcCCunU4nBDW85VXik05w8yobiWendF9nIwtP+zRAtNJINA4VDWQR6ebrKT2dbE8AGRDseiMNwTN+zskg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5epeMPlzQ/WADFTAURZkKBAKJ1TPS8WohnuqlUeWeIhG43PuZ
	0AHEo3h++e+MqawLD/SwG6FRHhoTsneKfZbE/TSF94t+65MkoVvX
X-Gm-Gg: ASbGncshyJfgRhW9iSNkfxAlqKuD+aCAlGhZxLK2yfhh2uant05PejaIMFYJkMosMdA
	S7DTGaLHrp9VeqshhEKFy46ycYy2snf94rcILwl4kvAEmdBUEvXlsI7F2DvYwIfOjbUSD+S1nZy
	gl7OubU7UTn6zDil9FJhzb5Qi/X3WmIx+oe0I3yxRgUmTHE9fvyGdTSIH9Sgxs/cevsVQyfPap7
	unqmzf2TSMR1EMjXfBoDikJ6SyicqDPkta5A47T+yPACQcg311Yw01mrXm+aaqFDh+vakXcOXQc
	vVfje8s9DZ6/Qr8joa9vDYHIKl8se1jBtkFBrM1sbfmfVWGXXepwg9E1aQs2gjs31WwgSEScrt3
	VpITKyj1vOEnNAg4ctvgT5s0T
X-Google-Smtp-Source: AGHT+IF3Ek6iO4PYxtYKLThazbN2LB6KUW0Tmo9V03xxyHAX8IEpXOCaqbayQqhjyu1/kpycZ5YfOQ==
X-Received: by 2002:a05:600c:3489:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43ee0617025mr62016505e9.7.1743977715512;
        Sun, 06 Apr 2025 15:15:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:15 -0700 (PDT)
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: [RFC PATCH net-next v2 11/11] net: airoha: add phylink support for GDM2/3/4
Date: Mon,  7 Apr 2025 00:14:04 +0200
Message-ID: <20250406221423.9723-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151517_415847_FEFD9AE3 
X-CRM114-Status: GOOD (  23.62  )
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
 drivers/net/ethernet/airoha/airoha_eth.c  | 266 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   4 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 +
 include/linux/pcs/pcs-airoha.h            |  15 ++
 4 files changed, 296 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index c0a642568ac1..40d5d7cb1410 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -5,9 +5,13 @@
  */
 #include <linux/of.h>
 #include <linux/of_net.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
+#include <linux/pcs/pcs-airoha.h>
 #include <linux/u64_stats_sync.h>
+#include <linux/regmap.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
 #include <net/pkt_cls.h>
@@ -76,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
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
@@ -1535,6 +1544,17 @@ static int airoha_dev_open(struct net_device *dev)
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
@@ -1587,19 +1607,36 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	if (airhoa_is_phy_external(port)) {
+		phylink_stop(port->phylink);
+		phylink_disconnect_phy(port->phylink);
+	}
+
 	return 0;
 }
 
 static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
+	const u8 *mac_addr = dev->dev_addr;
 	int err;
 
 	err = eth_mac_addr(dev, p);
 	if (err)
 		return err;
 
-	airoha_set_macaddr(port, dev->dev_addr);
+	airoha_set_macaddr(port, mac_addr);
+
+	/* Update XFI mac address */
+	if (airhoa_is_phy_external(port)) {
+		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRL,
+			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRL,
+					mac_addr[0] << 24 | mac_addr[1] << 16 |
+					mac_addr[2] << 8 | mac_addr[3]));
+		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRH,
+			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRH,
+					mac_addr[4] << 8 | mac_addr[5]));
+	}
 
 	return 0;
 }
@@ -2454,6 +2491,210 @@ static void airoha_metadata_dst_free(struct airoha_gdm_port *port)
 	}
 }
 
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
+						    phylink_config);
+
+	/* Frag disable */
+	regmap_update_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			   AIROHA_PCS_XFI_RX_FRAG_LEN,
+			   FIELD_PREP(AIROHA_PCS_XFI_RX_FRAG_LEN, 31));
+	regmap_update_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			   AIROHA_PCS_XFI_TX_FRAG_LEN,
+			   FIELD_PREP(AIROHA_PCS_XFI_TX_FRAG_LEN, 31));
+
+	/* IPG NUM */
+	regmap_update_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			   AIROHA_PCS_XFI_IPG_NUM,
+			   FIELD_PREP(AIROHA_PCS_XFI_IPG_NUM, 10));
+
+	/* Enable TX/RX flow control */
+	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			AIROHA_PCS_XFI_TX_FC_EN);
+	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			AIROHA_PCS_XFI_RX_FC_EN);
+}
+
+static int airoha_mac_prepare(struct phylink_config *config, unsigned int mode,
+			      phy_interface_t iface)
+{
+	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
+						    phylink_config);
+
+	/* MPI MBI disable */
+	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			AIROHA_PCS_XFI_RXMPI_STOP |
+			AIROHA_PCS_XFI_RXMBI_STOP |
+			AIROHA_PCS_XFI_TXMPI_STOP |
+			AIROHA_PCS_XFI_TXMBI_STOP);
+
+	/* Write 1 to trigger reset and clear */
+	regmap_clear_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_LOGIC_RST,
+			  AIROHA_PCS_XFI_MAC_LOGIC_RST);
+	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_LOGIC_RST,
+			AIROHA_PCS_XFI_MAC_LOGIC_RST);
+
+	usleep_range(1000, 2000);
+
+	/* Clear XFI MAC counter */
+	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_CNT_CLR,
+			AIROHA_PCS_XFI_GLB_CNT_CLR);
+
+	return 0;
+}
+
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
+						    phylink_config);
+
+	/* MPI MBI disable */
+	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			AIROHA_PCS_XFI_RXMPI_STOP |
+			AIROHA_PCS_XFI_RXMBI_STOP |
+			AIROHA_PCS_XFI_TXMPI_STOP |
+			AIROHA_PCS_XFI_TXMBI_STOP);
+}
+
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
+	if (port->id == 4) {
+		airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, GDMA4_SGMII0_TX_FRAG_SIZE,
+			      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE, frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, GDMA4_SGMII0_RX_FRAG_SIZE,
+			      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE, frag_size_rx));
+	}
+
+	/* BPI BMI enable */
+	regmap_clear_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
+			  AIROHA_PCS_XFI_RXMPI_STOP |
+			  AIROHA_PCS_XFI_RXMBI_STOP |
+			  AIROHA_PCS_XFI_TXMPI_STOP |
+			  AIROHA_PCS_XFI_TXMBI_STOP);
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_config = airoha_mac_config,
+	.mac_prepare = airoha_mac_prepare,
+	.mac_link_down = airoha_mac_link_down,
+	.mac_link_up = airoha_mac_link_up,
+};
+
+static int airoha_setup_phylink(struct net_device *dev)
+{
+	struct device_node *pcs_np, *np = dev->dev.of_node;
+	struct airoha_gdm_port *port = netdev_priv(dev);
+	struct phylink_pcs **available_pcs;
+	struct platform_device *pdev;
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
+	pcs_np = of_parse_phandle(np, "pcs-handle", 0);
+	if (!pcs_np)
+		return -ENODEV;
+
+	if (!of_device_is_available(pcs_np)) {
+		of_node_put(pcs_np);
+		return -ENODEV;
+	}
+
+	pdev = of_find_device_by_node(pcs_np);
+	of_node_put(pcs_np);
+	if (!pdev || !platform_get_drvdata(pdev)) {
+		if (pdev)
+			put_device(&pdev->dev);
+		return -EPROBE_DEFER;
+	}
+
+	port->xfi_mac = dev_get_regmap(&pdev->dev, "xfi_mac");
+	if (IS_ERR(port->xfi_mac))
+		return PTR_ERR(port->xfi_mac);
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
@@ -2532,6 +2773,23 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	if (err)
 		return err;
 
+	if (airhoa_is_phy_external(port)) {
+		const u8 *mac_addr = dev->dev_addr;
+
+		err = airoha_setup_phylink(dev);
+		if (err)
+			return err;
+
+		/* Setup XFI mac address */
+		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRL,
+			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRL,
+					mac_addr[0] << 24 | mac_addr[1] << 16 |
+					mac_addr[2] << 8 | mac_addr[3]));
+		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRH,
+			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRH,
+					mac_addr[4] << 8 | mac_addr[5]));
+	}
+
 	return register_netdev(dev);
 }
 
@@ -2626,6 +2884,9 @@ static int airoha_probe(struct platform_device *pdev)
 		struct airoha_gdm_port *port = eth->ports[i];
 
 		if (port && port->dev->reg_state == NETREG_REGISTERED) {
+			if (airhoa_is_phy_external(port))
+				phylink_destroy(port->phylink);
+
 			unregister_netdev(port->dev);
 			airoha_metadata_dst_free(port);
 		}
@@ -2653,6 +2914,9 @@ static void airoha_remove(struct platform_device *pdev)
 			continue;
 
 		airoha_dev_stop(port->dev);
+		if (airhoa_is_phy_external(port))
+			phylink_destroy(port->phylink);
+
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 60690b685710..bc0cbeb6bd6d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -460,6 +460,10 @@ struct airoha_gdm_port {
 	struct net_device *dev;
 	int id;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+	struct regmap *xfi_mac;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 8146cde4e8ba..72f7824fcc2e 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -356,6 +356,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_GDMA4_TMBI_FRAG		0x2028
+#define GDMA4_SGMII1_TX_WEIGHT		GENMASK(31, 26)
+#define GDMA4_SGMII1_TX_FRAG_SIZE	GENMASK(25, 16)
+#define GDMA4_SGMII0_TX_WEIGHT		GENMASK(15, 10)
+#define GDMA4_SGMII0_TX_FRAG_SIZE	GENMASK(9, 0)
+
+#define REG_GDMA4_RMBI_FRAG		0x202c
+#define GDMA4_SGMII1_RX_WEIGHT		GENMASK(31, 26)
+#define GDMA4_SGMII1_RX_FRAG_SIZE	GENMASK(25, 16)
+#define GDMA4_SGMII0_RX_WEIGHT		GENMASK(15, 10)
+#define GDMA4_SGMII0_RX_FRAG_SIZE	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
diff --git a/include/linux/pcs/pcs-airoha.h b/include/linux/pcs/pcs-airoha.h
index 07797645ff15..947dbcbc5206 100644
--- a/include/linux/pcs/pcs-airoha.h
+++ b/include/linux/pcs/pcs-airoha.h
@@ -5,7 +5,22 @@
 
 /* XFI_MAC */
 #define AIROHA_PCS_XFI_MAC_XFI_GIB_CFG		0x0
+#define   AIROHA_PCS_XFI_RX_FRAG_LEN		GENMASK(26, 22)
+#define   AIROHA_PCS_XFI_TX_FRAG_LEN		GENMASK(21, 17)
+#define   AIROHA_PCS_XFI_IPG_NUM		GENMASK(15, 10)
 #define   AIROHA_PCS_XFI_TX_FC_EN		BIT(5)
 #define   AIROHA_PCS_XFI_RX_FC_EN		BIT(4)
+#define   AIROHA_PCS_XFI_RXMPI_STOP		BIT(3)
+#define   AIROHA_PCS_XFI_RXMBI_STOP		BIT(2)
+#define   AIROHA_PCS_XFI_TXMPI_STOP		BIT(1)
+#define   AIROHA_PCS_XFI_TXMBI_STOP		BIT(0)
+#define AIROHA_PCS_XFI_MAC_XFI_LOGIC_RST	0x10
+#define   AIROHA_PCS_XFI_MAC_LOGIC_RST		BIT(0)
+#define AIROHA_PCS_XFI_MAC_XFI_MACADDRH		0x60
+#define   AIROHA_PCS_XFI_MAC_MACADDRH		GENMASK(15, 0)
+#define AIROHA_PCS_XFI_MAC_XFI_MACADDRL		0x64
+#define   AIROHA_PCS_XFI_MAC_MACADDRL		GENMASK(31, 0)
+#define AIROHA_PCS_XFI_MAC_XFI_CNT_CLR		0x100
+#define   AIROHA_PCS_XFI_GLB_CNT_CLR		BIT(0)
 
 #endif /* __LINUX_PCS_AIROHA_H */
-- 
2.48.1


