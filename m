Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D117C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMDNxhjS6p7m3ikTdxZ2TWzg9kXtx6ojXOERB6s57fk=; b=s//KT7wIxXOpjRdjnVA2BZy7W4
	/qm5Gd97Znbf+Pt7u6WVryQGVedAOUEdxg5kFyox1XCq9dy2cJtS/n1iecfi7/cPEHEJ4sJkh3bHN
	9YtU5BWTcQ+t6jW++TJJUxeBBpc8+mX5dlWGPzPHS3Y/FROh/SrRknNsZ38xNjCh3O1xares3Wkqd
	D5Tm8yvnergBGZnvopxu9jMH1M4HODSVEFh03lC6MPAckqOUTtGPYch1iszIYw5VXkqnyafl1ZN6w
	pU1Jze7lLw+44RJKg4nZd7N4tKn5nz2t/UjC4dT6RAqXInJM64V01r3soWGRx/RVbZm6liL1sK/JC
	4oYmHyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0waw-00000008kE8-32Za;
	Mon, 31 Aug 2026 07:38:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wak-00000008k9g-0slD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:38:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AE33E4E41467;
	Mon, 31 Aug 2026 07:38:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C65C601E1;
	Mon, 31 Aug 2026 07:38:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E40BB11C788FA;
	Mon, 31 Aug 2026 09:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788161883; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QMDNxhjS6p7m3ikTdxZ2TWzg9kXtx6ojXOERB6s57fk=;
	b=wCVk8Ng1hsrjwSVgqmJTOIECQsxQPp5bBuzahUP2MBEsmFz4DbbimBqwTcbDE6BdnSf+sp
	MbxQwSPgUZhFjY+9TtIt/V55rNKG9KR6LKskHE2TfYhrUh3ZqcVOeOAaN+EkL9PYkD+DoE
	EpS7uRXlaOsXL486oO9y56ZN03F1biMYw8axUZQ90sIGVthMlzJGnJ467YbUSOvxG6HOBH
	Ce/6tzZoSU5uGpEbPLls0WuY3Xv9moj/2itktGtHLSjGbDAM/RRaQso8j3DemNDW0Fr+Nk
	yCDnHoI36Rb0hfU8AYPkgtnb+W4ThHOqq0AsPkVnIv13kaL3O7QJgricQMJCmA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Yao Zi <me@ziyao.cc>,
	Frank <Frank.Sae@motor-comm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 2/3] net: phy: motorcomm: Add a dedicated .config_init for YT8531S
Date: Mon, 31 Aug 2026 09:37:44 +0200
Message-ID: <20260831073747.361482-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
References: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_003806_398228_51320767 
X-CRM114-Status: GOOD (  13.29  )
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

The YT8531S PHY configuration logic is similar to the YT8521, but with
some extra steps for the RGMII configuration. In preparation for
improvements in the YT8531S configuration for the version found
integrated with the YT6801 PCIe NIC, let's split the logic out by
extending the YT8521 configuration sequence.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/motorcomm.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 58e4d67b945f..36c229460a77 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -1700,19 +1700,12 @@ static int __yt8521_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
-	if (device_property_read_bool(dev, "motorcomm,keep-pll-enabled")) {
+	if (device_property_read_bool(dev, "motorcomm,keep-pll-enabled"))
 		/* enable RXC clock when no wire plug */
-		ret = ytphy_modify_ext(phydev, YT8521_CLOCK_GATING_REG,
-				       YT8521_CGR_RX_CLK_EN, 0);
-		if (ret < 0)
-			return ret;
-	}
+		return ytphy_modify_ext(phydev, YT8521_CLOCK_GATING_REG,
+					YT8521_CGR_RX_CLK_EN, 0);
 
-	if (phy_interface_is_rgmii(phydev) &&
-	    phydev_id_compare(phydev, PHY_ID_YT8531S))
-		ret = yt8531_set_ds(phydev);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1735,6 +1728,25 @@ static int yt8521_config_init(struct phy_device *phydev)
 	return phy_restore_page(phydev, old_page, ret);
 }
 
+static int yt8531s_config_init(struct phy_device *phydev)
+{
+	int old_page, ret = 0;
+
+	old_page = phy_select_page(phydev, YT8521_RSSR_UTP_SPACE);
+	if (old_page < 0)
+		goto err_restore_page;
+
+	ret = __yt8521_config_init(phydev);
+	if (ret)
+		goto err_restore_page;
+
+	if (phy_interface_is_rgmii(phydev))
+		ret = yt8531_set_ds(phydev);
+
+err_restore_page:
+	return phy_restore_page(phydev, old_page, ret);
+}
+
 static const unsigned long supported_trgs = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
 					     BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
 					     BIT(TRIGGER_NETDEV_LINK)        |
@@ -3143,7 +3155,7 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 		.set_wol	= ytphy_set_wol,
 		.config_aneg	= yt8521_config_aneg,
 		.aneg_done	= yt8521_aneg_done,
-		.config_init	= yt8521_config_init,
+		.config_init	= yt8531s_config_init,
 		.read_status	= yt8521_read_status,
 		.soft_reset	= yt8521_soft_reset,
 		.suspend	= yt8521_suspend,
-- 
2.55.0


