Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C14EFD20D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkRfojPSv3CP3LZanTyC5uu1PLQ8pOplU1rIVTgxy/U=; b=Yw2SacFuoFEXaN0y6DJiyDUygP
	8dzwZatXQl+Gp5gdeoLNU7VIaZnBQOfpofFqvqLK/apL3liZG5xn5q0Y7w5XV3pqXj0wNL7RMLGDp
	B7Us9baDluljf874EZzaVLXTA7ayhg1TshWtI7aXPKx8EiONNj8qQwn5Yd0HM1Dx/o0g6Rm2DKkyV
	eg8Auz4SrRYNBfk7/OxAa+m4uO5XYsJnsT+WVg5bAMWCcnmOW9+wgkjN2npXnLsURSi48+wDfEgxk
	MIB4KvosXcM6jBkQIGJh6NFoEP0s20EOLdDzvgudBE8d4IxO0JFRis4S4jSJpE12K8qHmrW8is3j9
	llzJ++cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAn8-00000003cYD-0INI;
	Wed, 25 Feb 2026 09:02:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAn6-00000003cXn-32ln
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 09:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=PkRfojPSv3CP3LZanTyC5uu1PLQ8pOplU1rIVTgxy/U=; b=ELCSd+MJ6iAF6VHb4zLO6fwwQ8
	eOcUV9O3/nVgRyDZLV7wOHbyf3dGgxOFj0N3M+biWq535krO2BZKyNM/andqkARs+1RQra9n5EIEZ
	8UlvTLmrzopWkQvMUX4VlLZdI7CgrV45aywF1rNZcSPmK2nfngXTY2n8dYxZn7eI+ARfhggIfUywo
	DKxMfGp/lt9VgXe1alw2kmV8jKtda1kxPHlwnIrnnmPgoKneUVA7XkAsvhVVOBem9iIutUTsPS6PW
	UZTPYJJle0zWkD2hzCguqysOxY5lFlJTMio5s2wLMftaRXNNVQpZuaSR78mZWg4NBkljYbdjrfsJ3
	sUaA4PZA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAn3-00000008coQ-16vM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PkRfojPSv3CP3LZanTyC5uu1PLQ8pOplU1rIVTgxy/U=; b=mGvdCjFXqsMyeKvb7vFrgntCfk
	iJAYiH/OWHS3Ic7DKg+Tdq9gxL63fnxfGwmQ+FTmL66pjBZ6xsH3nTjPlVr8O+jD7N2QjMg5CMVk/
	7/UcnoP/KXrisFMD4YrPtl9zcYjk6B9H9mdM7yfILdkU0UNUZO0OSYmPZgusGQjC4GNHe1Ex9oNCu
	V2JN0hZjgh9endPTH18fdZWjLgpt4wnSAMj4/uS5GNkxRi6U7tjhI1m8ZxU9Nq5hoZjui4JIWP3Uc
	Qvk/vi0xKfqttMROgsax59JJrWvmdyu4wyQr2IW3ZKpDCvwRG2b6MfDdADd5cRm0pv3vXa7IDuJhP
	cqZqwNiA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41384 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvAmz-000000006Gy-2kfF;
	Wed, 25 Feb 2026 09:02:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvAmy-0000000Aqp9-3OCe;
	Wed, 25 Feb 2026 09:02:36 +0000
In-Reply-To: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 8/8] net: stmmac: qcom-ethqos: remove
 phy_set_mode_ext() after phy_power_on()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvAmy-0000000Aqp9-3OCe@rmk-PC.armlinux.org.uk>
Date: Wed, 25 Feb 2026 09:02:36 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090242_144471_C4F7B055 
X-CRM114-Status: GOOD (  15.78  )
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

The call to phy_set_mode_ext() after phy_power_on() was a work-around
for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
phy_power_on() but did not configure the PHY. Now that the SerDes driver
fully configures the SerDes at phy_power_on(), there is no need to call
phy_set_mode_ext() immediately afterwards.

This also means we no longer need to record the previous operating mode
of the driver - this is up to the SerDes driver. In any case, the only
thing that we care about is the SerDes provides the necessary clocks to
the stmmac core to allow it to reset at this point. The actual mode is
irrelevant at this point as the correct mode will be configured in
ethqos_mac_finish_serdes() just before the network device is brought
online.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8913f6f02b9e..cb1c074c2053 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,7 +105,6 @@ struct qcom_ethqos {
 
 	struct clk *link_clk;
 	struct phy *serdes_phy;
-	phy_interface_t serdes_mode;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -648,17 +647,8 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 		return ret;
 
 	ret = phy_power_on(ethqos->serdes_phy);
-	if (ret) {
-		phy_exit(ethqos->serdes_phy);
-		return ret;
-	}
-
-	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
-			       ethqos->serdes_mode);
-	if (ret) {
-		phy_power_off(ethqos->serdes_phy);
+	if (ret)
 		phy_exit(ethqos->serdes_phy);
-	}
 
 	return ret;
 }
@@ -681,12 +671,9 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
-	    interface == PHY_INTERFACE_MODE_2500BASEX) {
+	    interface == PHY_INTERFACE_MODE_2500BASEX)
 		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
-		if (ret == 0)
-			ethqos->serdes_mode = interface;
-	}
 
 	return ret;
 }
@@ -839,7 +826,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
-		ethqos->serdes_mode = PHY_INTERFACE_MODE_SGMII;
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
-- 
2.47.3


