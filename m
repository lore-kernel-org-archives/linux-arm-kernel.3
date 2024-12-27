Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62403E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxN3bXXBaX/Lq3wyIRYqWPp+3YjBN61bepp4p58ij9s=; b=ZzfnLAj3S6IXM8RFpDoS9zrNnb
	jLk2mxswccwZJiE+XaeI8sq5qBMoUTlKdQuhJGW2jk50lucONLeRCV8AWnKzN7YC2/MPU7Whn5Mx6
	/Z+5w9onr9VUpxKAr4lmZnoL8d/ooPFztvbLfLFizwPMi3rbzJogFoeopaTkYZQu9yJEC5/XK+88d
	zCwX142Li5YnWpIPxmarXTahpPO/bTJwDsXVfqpKTrdbKczmk0D7h5ouQJTY21p0UOg98crJwA2DW
	f3s98OmNiAUywUkdN0KeFCiE2FlY99bZX1UN8a33nWEwlQE2GQmrj3G7GLNDLwR1Ge7NSfgv4yNu4
	86+1i55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8Wl-0000000066d-2ne4;
	Fri, 27 Dec 2024 11:29:11 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8Dz-000000003FH-2AmS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 11:09:48 +0000
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id QyEttwLV8jMK7R8DytLfTQ; Fri, 27 Dec 2024 11:09:46 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8Dvtskk565gFR8DwtfGOu; Fri, 27 Dec 2024 11:09:45 +0000
X-Authority-Analysis: v=2.4 cv=Z58nH2RA c=1 sm=1 tr=0 ts=676e8af9
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=lEnXP8s9Ohb5C3ohY50A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JxN3bXXBaX/Lq3wyIRYqWPp+3YjBN61bepp4p58ij9s=; b=I9QX2yJfq5eeIpkXfuQAj3oTSq
	4eNXGJk/RwanfS3NSMaJYqYbVmYZWd4KIFnYKDVp8hTp5zguJETcLW0mAFTahdjHCol1x8TtGKkFO
	3IIJFQ84ruyIyloaUFt0S/V+fSuWB+aL3yzZtuwBfAcks+nUs4vUeBjdZ5p8vcjjrLfAvGENHJWNz
	OfDShDkmhCjk0csnKe0xAOZpn7f81u2pD9r/j2B19NmEtlz7IVUgvfulCLgzsqtSo4SD+4dYKs46G
	xHRraKUGch7qrzsvC5fijvCZLWkaOQ54uo9M7+/zMO1tMPLeHRcEZj91lh5SWUYFvFNWrX1bjq3r/
	Sac7w7mw==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8Du-000bEK-0V;
	Fri, 27 Dec 2024 16:39:42 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:38:04 +0530
Subject: [PATCH 17/22] phy: allwinner: phy-sun6i-mipi-dphy: add LVDS
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-17-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=2408;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=nGhmLXbYqR03qzpnWqYss6Ffpz+ip+uG6qlbqNTI4RI=;
 b=jrn6tfvMK61w3sgTTFVgqbnsDl8voBLuiq+w4I4k4GT50D6DwXem7WWTp7nYJlqsikuDUr5Xn
 u3DGRJaOe5oBtwaDDu6RCOpsp0RqGwuy4qxUO6CGLg7RxoBCgfmikvJ
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8Du-000bEK-0V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 499
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOwvjyQHhVowc7gw4hCiplmRXulZMGkrjNYP72j1LYsuKp686ulivbTK0eBbfnzrJBqnkKwTikuJgbl0sTm6zFzSX1svL/QrQxjTr3jEjlBHGPblvzhR
 LAPJrrT3vf9RXuNuAcr3zk1QscisutHXMSqZZt6ZeduV1qqOiiJfq6qaNvANH7nX5Z3LHRERFlw5+H7bZ6dlD+5v7Q1vVPJGNWf+rPije48F8ZMFtbRYpzel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_030947_652299_9958EE3E 
X-CRM114-Status: GOOD (  10.99  )
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

DPHY in A100/A133 supports both LVDS and DSI. Combo phy register
have BIT(2) for enabling LVDS specifically, but enabling it alone
isn't functional.

Both MIPI and LVDS needs to be enabled in the combo phy to get
the display working under LVDS mode. There is no specific enable
bit for LVDS apart from the one in combo phy. MIPI got enable
control in analog 4 register which must be disabled when using
in LVDS mode.

Introduce set_mode in phy ops to control only for MIPI DSI.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 36eab95271b2..d164b2ea5dfd 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -314,13 +314,11 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
 	/* Disable sigma-delta modulation. */
 	regmap_write(dphy->regs, SUN50I_DPHY_PLL_REG2, 0);
 
-	regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
-			   SUN6I_DPHY_ANA4_REG_EN_MIPI,
-			   SUN6I_DPHY_ANA4_REG_EN_MIPI);
-
 	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS |
 			   SUN50I_COMBO_PHY_REG0_EN_MIPI |
 			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS |
 			   SUN50I_COMBO_PHY_REG0_EN_MIPI |
 			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
 
@@ -528,6 +526,22 @@ static int sun6i_dphy_exit(struct phy *phy)
 	return 0;
 }
 
+static int sun6i_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
+
+	switch (mode) {
+	case PHY_MODE_MIPI_DPHY:
+		regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
+				   SUN6I_DPHY_ANA4_REG_EN_MIPI,
+				   SUN6I_DPHY_ANA4_REG_EN_MIPI);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
 static const struct phy_ops sun6i_dphy_ops = {
 	.configure	= sun6i_dphy_configure,
@@ -535,6 +549,7 @@ static const struct phy_ops sun6i_dphy_ops = {
 	.power_off	= sun6i_dphy_power_off,
 	.init		= sun6i_dphy_init,
 	.exit		= sun6i_dphy_exit,
+	.set_mode	= sun6i_set_mode,
 };
 
 static const struct regmap_config sun6i_dphy_regmap_config = {

-- 
2.39.5


