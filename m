Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B73C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDP3LAoBuDV0dcjl3fJDl8UTcbp9bRn+Gea2H63cGWk=; b=w3zXA/a0K/gnA3CX2I1WBVAvsn
	nxsgzjV/PcbB8V/pV9CWcWv+/U3EPU6ipsR5VM7Ifp+SQzJw0Ga4dl/7X9Fi6+YUTqNKWzajwoSmx
	sfg/d9B5F+4NOffmgvonrmSlRGrVnMtFS1opVPvbHyapIqjroSsETLQfhj1lh+qNH2CTC+rGy59KA
	hnqgNDTdQTCaM75kyAtifceNn5fb8m/nT9PvdpiEtwytfPmi73NOqgP0pzQu+pt/BdnOXfpJnAt3s
	xodGIQePIXjPsqoYgue37zx9R1NwzJA4QxD559ZnAsoeab+S7W2UPvYME+6HXpt9Iip9y+hqc4iux
	gA05BO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiuq-0000000D7Pp-21ie;
	Tue, 14 Jul 2026 19:35:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiup-0000000D7OI-2cvm;
	Tue, 14 Jul 2026 19:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NDP3LAoBuDV0dcjl3fJDl8UTcbp9bRn+Gea2H63cGWk=; b=Re0inlF+GS/WQCFtpC/wBoQB8V
	809Q/WZdPPCx5sWcee5728qRiG8AZQ4wBnIEWfJEqfxl0yrLmg+xPQ2wu30A6pfwAqIYz5tv7MhMI
	Ro4gDV7/7Xq2WQcacntXNVHUecL7CEzttq17LKpTo9N2VRz1z+e08mgm2OMlIJTOcAdhvvMY9Hmxp
	sSDinGViuglQtU0ijAr/pOmMKQrvpFgkJrWcWdd5/XQArAwavN0HKs+w+kn54TAbAmVX1owVR92PY
	dgS95iJr2vi5NZ/l2fEOwv4TXkJMKWdBsGTZwSAw7eBW591Bgalo8tcWqDH/byGnSw0ikABzBPwyg
	oUw/Qd6w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjiud-0000000CobW-3r8Z;
	Tue, 14 Jul 2026 19:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057726;
	bh=XnGWSO19nxa7H3lR2hHiYjO4JN4FWtYOwARby5EoDv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SQWUQlKhXJa35D7BkJK6cOKbd2j3QSrADMgmVon67uQXN2GRsYNkSG4vJEc+SvijK
	 dj4rvAfm7vCJPZsewVioNPVQ8LQyxr3Unai9oueirbOw02KTzn5v8CpH7M+zt/rS5Z
	 vC6w04v92jwvCiMjLj69CKNl3Mccux838Q3RQh4sgVMYe6B9SERsA59oVSPZM2ThI1
	 4IUaA65MNJ8p3B8e3v0iWisKFuuwtn8o9MBT6u01rN+QgepwlDF9k9U5oLis2xJucY
	 EqapUFzOoi3dbE1HLPGbo9BCU4JELnamJi/flrl8rMN8CyBCBcYMWjJNWlcat4DONW
	 407Y7wIqLlfvg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D477417E0E6C;
	Tue, 14 Jul 2026 21:35:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F0E89480069; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:24 +0200
Subject: [PATCH v13 23/35] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-23-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=XnGWSO19nxa7H3lR2hHiYjO4JN4FWtYOwARby5EoDv8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVDAAG31sid71ysbx50MacX7tWE741gJP
 HB3v8Ea0bZu94kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaf7EP/3ioOJPL8WJRM+lHmnUUI3r36rF4wLjVpo9PqvezWDJIaeUdzuQW4u7KU7h3r60TdVd
 /YBL38ezLOAYUGH7XWUYSxdQw2NpD6PFFI8ZZKGtOfXSOrUmQo1L/zC2iAnZsx+qIB3O9ywc11j
 LnPRioBC/z8ZuUc2Mu5wluMqSpk4gQoO3BC+GHtuekeAXRJY3+DfFevIG1+38tXtiqGMvvBnjj/
 sH9khdxd9fHBCbwtiitP+Y+ZRDfByhi/d4zey7MkO/KKUnllN3ka2jpDFf/3ydeNrDvzrlha7Ke
 s6aHB7UjJdgSVDCG8jwf3KEQ+sld07H/oQ5xjxXm8Yvq3Jk+wYoH0NMMTc24OHk5U/sRZiS0HA7
 6H0csk0rmkSHI1Clq8PvjUw1BJ3oUa/DMgiHrQoIKCOPmniWoRqwL6982lNE5DNrXzGqMWhaspe
 fhUPg1b+jE3kXK6oNbVLgq4jC92CnQmBt6xPcwfKQWR+33woiOutTreffyuznMOAR/NVU6UFzQS
 LvJexD9DSMHUmc9sWhEgVpGB+AWi/oO3HcBg5eDu4r4HzzaBXq1bvT47Rvile7h2zCa9q2vxEip
 WrzCRYi14ruAVpJl0J+EBbrbQc3sQS0F3NzbaqxvHZH2ELXyM0HkVRqB0KkwoSpJejk62g3IHt3
 27PGv8hvgnmXu62ZspPw+MA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_203532_340176_66E5FB78 
X-CRM114-Status: GOOD (  10.67  )
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

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8c165bcab796..b40b5d9ce587 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1154,6 +1154,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0


