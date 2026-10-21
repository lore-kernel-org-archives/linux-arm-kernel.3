Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06DC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NICQJLf8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GueiJ2bg;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=XkatiXhW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nFUjZYDapTkbLCvTjG9bKTgAC6ACt8mMkSnyt4ocuA=; b=NICQJLf8daqHdz4v9i8gs/ECpH
	83YOaauqqUn1M/3KYdSPw5iLXvPl9WlPkPHigA84wdHeNqp7rT7ZVET2QZJMWCEXN8WdRRAUVysFS
	8nP1h9hjKI14jxEJk6WyGcXbx2w8YH4p9tD8pp3xCj6ip9ExDN3ec6xovNWjOtFsLUM3h+dgJTknp
	6zBYbA7pQs2nI8/xuZz3rFI5u7PUtAPfxW5GShfpCVWT+2wy0Eauf/w321DIgxTS5xavEFSdosE+Q
	sMZ969YrGukRuiBVDOPQbWbrwy668VhkVKZJQ5N2XUVprPL4qF7rlhqE3iZPgwRI8ykDlkVS44v8G
	rGuBgA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7D-0000000CYD1-3Ucx;
	Wed, 21 Oct 2026 17:28:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa75-0000000CY8t-3fpP;
	Wed, 21 Oct 2026 17:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7nFUjZYDapTkbLCvTjG9bKTgAC6ACt8mMkSnyt4ocuA=; b=GueiJ2bgJd7yzdNwoHR8xBcCi1
	HdZxIhmiWW4jQWAXXrN5kg68JneouTocf0DR7HULdtJ+xQ29XRwogzBlu83I2VbmMFMM7n6nYj0jC
	iSKGSD2jKdOuAvESHcr+nJTgYJ6aXCBrZT3OUrpyUMkxQVU3rayGY6FSBo79OBCN2Bbrt4//1MPwu
	SmmP+ZFXxZxxfqaK2lIs0QC920XISi0isHwKz+TET5qJK0gFKPfVacWF155gPNN26tDpWFhbIDj3V
	0WDLeelf8hWZIZxhDtJ0kRRb7NiuZw4B8WMLmmvh3H8qzE5eAP1EGmfbc/RTDyfWheB0Bt0V5WzFc
	CRTkkxNA==;
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJa72-000000064su-2Rjg;
	Wed, 21 Oct 2026 17:28:30 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F187FC0003E1;
	Wed, 21 Oct 2026 10:28:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F187FC0003E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603707;
	bh=9qnWNVbt/BUNu2NxqN3Isa5I+n4msAp7wLc+YfU7eU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XkatiXhWZKwZefxO2F3+tevZDehgywbxiS9iscb/yr4RV0dB1TX3ci1YGLfvDlLbZ
	 0oPMNwf8exIhJ1nOw3NporSeTQz1yarAVG7YtzuyDKkQIEDrgmEHFmE3pXwC4fE6yK
	 QV+nIbQ2pwn9N4iVauVfKDU/cvgNY+tjw+1qxGYY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 91B61AEA3;
	Wed, 21 Oct 2026 13:28:25 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 3/9] phy: broadcom: ns-usb3: Coordinate NSP USB2 and USB3 initialization
Date: Wed, 21 Oct 2026 10:28:12 -0700
Message-ID: <20261021172819.668120-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_182828_789637_29FF33B7 
X-CRM114-Status: GOOD (  19.46  )
X-Spam-Score: -1.2 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The iProc SDK holds both USB2 and USB3 cores in reset while programming
the USB3 PLL, then releases USB2 before USB3. It also enables the USB2
IDM interface clock. The Northstar Bx initialization used by NSP does
not perform the USB2 setup or retain the SDK settling intervals.

Implement an NSP variant with the coordinated reset sequence and
interface clock enable. Sharing one PHY between the HCDs lets the PHY
core serialize and reference-count initialization, preventing a later
host probe from resetting an already active USB2 controller.

Retain the downstream delays around reset and MDIO operations, and
leave both NSP cores reset if programming fails. Keep existing
Northstar Ax and Bx reset behavior unchanged.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/phy/broadcom/phy-bcm-ns-usb3.c | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb3.c b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
index b40033144080..b3b5b74ead09 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb3.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
@@ -44,12 +44,14 @@ enum bcm_ns_family {
 	BCM_NS_UNKNOWN,
 	BCM_NS_AX,
 	BCM_NS_BX,
+	BCM_NSP,
 };
 
 struct bcm_ns_usb3 {
 	struct device *dev;
 	enum bcm_ns_family family;
 	void __iomem *dmp;
+	void __iomem *usb2_dmp;
 	struct mdio_device *mdiodev;
 	struct phy *phy;
 };
@@ -63,6 +65,10 @@ static const struct of_device_id bcm_ns_usb3_id_table[] = {
 		.compatible = "brcm,ns-bx-usb3-phy",
 		.data = (int *)BCM_NS_BX,
 	},
+	{
+		.compatible = "brcm,nsp-usb3-phy",
+		.data = (void *)BCM_NSP,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm_ns_usb3_id_table);
@@ -86,6 +92,9 @@ static int bcm_ns_usb3_write_seq(struct bcm_ns_usb3 *usb3,
 		err = bcm_ns_usb3_mdio_phy_write(usb3, seq[i].reg, seq[i].value);
 		if (err)
 			return err;
+
+		if (usb3->family == BCM_NSP)
+			usleep_range(10000, 20000);
 	}
 
 	return 0;
@@ -121,8 +130,18 @@ static int bcm_ns_usb3_phy_init_ns_bx(struct bcm_ns_usb3 *usb3)
 	if (err)
 		return err;
 
+	if (usb3->usb2_dmp) {
+		writel(0, usb3->usb2_dmp + BCMA_RESET_CTL);
+		readl(usb3->usb2_dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
+
 	/* Deasserting USB3 system reset */
 	writel(0, usb3->dmp + BCMA_RESET_CTL);
+	if (usb3->family == BCM_NSP) {
+		readl(usb3->dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
 
 	return bcm_ns_usb3_write_seq(usb3, phy_seq, ARRAY_SIZE(phy_seq));
 }
@@ -160,16 +179,35 @@ static int bcm_ns_usb3_phy_init_ns_ax(struct bcm_ns_usb3 *usb3)
 static int bcm_ns_usb3_phy_init(struct phy *phy)
 {
 	struct bcm_ns_usb3 *usb3 = phy_get_drvdata(phy);
+	u32 val;
 	int err;
 
+	/*
+	 * NSP requires both hosts to remain in reset while programming the PLL.
+	 * Sharing this PHY between all three HCDs makes the PHY core serialize
+	 * and reference-count this sequence, regardless of their probe order.
+	 */
+	if (usb3->usb2_dmp) {
+		val = readl(usb3->usb2_dmp + BCMA_IOCTL);
+		writel(val | BCMA_IOCTL_CLK, usb3->usb2_dmp + BCMA_IOCTL);
+		writel(BCMA_RESET_CTL_RESET, usb3->usb2_dmp + BCMA_RESET_CTL);
+		readl(usb3->usb2_dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
+
 	/* Perform USB3 system soft reset */
 	writel(BCMA_RESET_CTL_RESET, usb3->dmp + BCMA_RESET_CTL);
+	if (usb3->family == BCM_NSP) {
+		readl(usb3->dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
 
 	switch (usb3->family) {
 	case BCM_NS_AX:
 		err = bcm_ns_usb3_phy_init_ns_ax(usb3);
 		break;
 	case BCM_NS_BX:
+	case BCM_NSP:
 		err = bcm_ns_usb3_phy_init_ns_bx(usb3);
 		break;
 	default:
@@ -177,6 +215,11 @@ static int bcm_ns_usb3_phy_init(struct phy *phy)
 		err = -ENOTSUPP;
 	}
 
+	if (err && usb3->usb2_dmp) {
+		writel(BCMA_RESET_CTL_RESET, usb3->usb2_dmp + BCMA_RESET_CTL);
+		writel(BCMA_RESET_CTL_RESET, usb3->dmp + BCMA_RESET_CTL);
+	}
+
 	return err;
 }
 
@@ -225,6 +268,18 @@ static int bcm_ns_usb3_mdio_probe(struct mdio_device *mdiodev)
 	if (IS_ERR(usb3->dmp))
 		return PTR_ERR(usb3->dmp);
 
+	if (usb3->family == BCM_NSP) {
+		syscon_np = of_parse_phandle(dev->of_node, "usb2-dmp-syscon", 0);
+		err = of_address_to_resource(syscon_np, 0, &res);
+		of_node_put(syscon_np);
+		if (err)
+			return err;
+
+		usb3->usb2_dmp = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(usb3->usb2_dmp))
+			return PTR_ERR(usb3->usb2_dmp);
+	}
+
 	usb3->phy = devm_phy_create(dev, NULL, &ops);
 	if (IS_ERR(usb3->phy)) {
 		dev_err(dev, "Failed to create PHY\n");
-- 
2.53.0


