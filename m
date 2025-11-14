Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856FECE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnhXWAcMimUpwXmvKx8hT4Dy4PiOWSon3MerZPv5kn0=; b=y8vLh3aiSdnYz1Y8z0a90AMFsy
	n3wHMHtVf3T/J56B1B+efNWcabpG6KEZGpyiMJ/v0VC1zdvnrvaBxOASWKVDE2idsY3oVS9OWRyk4
	gVNkjFbgfGHcFXOVYoscqul2ztQFd1u607i6kRDYh7k6+uQvpHi+nYj8hZfw8aE3C3RbNgYZh/Rp9
	vWg3PoLzIkdXrcSnoT3Gk0D7w6x81h+Yi26VUNcw+M8MPmxA9KOfeTGQygIozYpC67urNMGpSOzhj
	lC5150RitI8siYHKw9xJKlAeN7PBRhLdzrBAfovidzfYXXbUzLU/xcW+MF775BGjCJ2Jwuztmo9lz
	ri+4NA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvj0-0000000CYcE-3wbN;
	Fri, 14 Nov 2025 15:28:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJviz-0000000CYbT-2syF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=tnhXWAcMimUpwXmvKx8hT4Dy4PiOWSon3MerZPv5kn0=; b=Gt2V37pcAdZXy17I8pbPh6Pr2a
	pxivLrMsCtjVBAbyN6yZRFcL6soMyxOzK5y/XbAlEaz3istbo/0W7K5MzM2Fm+3GBfoNJGxQ6ugyr
	aPwdExvKbWQWDEOsNFaEm073uM1rXZwjSNdQmfaUjkUqkuMMAPI/4awgzE4pOXvj8oOjTZUndK6qy
	5XGdUWFP4FMNF8OPkJCcQ5gUYDYjQmLy0pHhaHfs9HFoYTzLVGAq6mH76fay1neBWOxXM5vEZ+v6T
	cCSOjmBOJGgv+A4SH7BSONFhg0TLKgYXzJQf0l/wHmPJdeXcjSx7epQmdQ1w3TYKpFxx5yhxQbNHI
	ZwCm8jOg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJurI-00000002p7c-1VmA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tnhXWAcMimUpwXmvKx8hT4Dy4PiOWSon3MerZPv5kn0=; b=YY8rm/oaYXBnXd2leCDRbECgMy
	w4qF7TLhLdC99TuXYsaNrJHZWWrJS7j+R8yeFS5y69vEPzlv18lpQihGWM3kOrjiLKhWoNmamT89R
	pjlr3QIdJEeEVyqm0lRD5TAmGBs5GwR5DwStiUKJTopopLOggRCJiUBlWjuveLJwm6XJnhAxC5t0/
	mw8lJRa1Grr565dj1WX/O/jFzOzqY2NK0LydLFpIcUJXAqvlWqfkZITJaFxUz1pSI+GEQEOAzqlzq
	A64XSocyD4YAKiHJsLclaDXf7Yit682UKoZ5/+MSW7cAYyywPfKrS8NGqQlPbiWjsTiz5fTq5Ey1o
	1dc8p6Mg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43774 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vJviq-00000000762-47yd;
	Fri, 14 Nov 2025 15:28:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vJviq-0000000EVjP-0c0l;
	Fri, 14 Nov 2025 15:28:24 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen Wang <unicorn_wang@outlook.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	sophgo@lists.linux.dev
Subject: [PATCH net-next 01/11] net: stmmac: add stmmac_plat_dat_alloc()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vJviq-0000000EVjP-0c0l@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:28:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143304_535511_F46955EC 
X-CRM114-Status: GOOD (  11.67  )
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

Add a function to allocate and initialise the plat_stmmacenet_data
structure with default values.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h         |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 12 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c    |  2 +-
 6 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index b2194e414ec1..7e56fbc3e141 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1286,7 +1286,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	if (!intel_priv)
 		return -ENOMEM;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index dd2fc39ec3e2..2d803fa37e21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -559,7 +559,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	struct loongson_data *ld;
 	int ret;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 0ea74c88a779..e9ed5086c049 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -408,6 +408,8 @@ int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 			   phy_interface_t interface, int speed);
 
+struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev);
+
 static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 {
 	return !!priv->xdp_prog;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d202f604161e..400b4b955820 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7555,6 +7555,18 @@ static void stmmac_unregister_devlink(struct stmmac_priv *priv)
 	devlink_free(priv->devlink);
 }
 
+struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+
+	plat_dat = devm_kzalloc(dev, sizeof(*plat_dat), GFP_KERNEL);
+	if (!plat_dat)
+		return NULL;
+
+	return plat_dat;
+}
+EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
+
 /**
  * stmmac_dvr_probe
  * @device: device pointer
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 94b3a3b27270..622cdbeca20f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -191,7 +191,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	int ret;
 	int i;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 6483d52b4c0f..38d574907a04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -436,7 +436,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	void *ret;
 	int rc;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.47.3


