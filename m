Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD33CCD3441
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mMTfDZ4nl8ekfgg7b9H2X02Eg7cD6K21MT96h6gSgM=; b=oi6lTI1ariMdDeygYzetUvLXCv
	8QxUiqZlCFm4O074CiZI9iQfQoz/UdA82sbt9yYioFGZj48OILU8q57IRql8Mo08z4JLCREJDb3J4
	LmPrpMnXura85ERt5tpo33RfRQD99knqC3NE8QGMt93v7mFCJv+1U5F8d8gdClJiyyUvhW98XqZ8D
	NyuCKl9GoUEiESTn2A2CaR7r+buacV9RqTng4dthSBorbTAPaxbobRO5m7ymRqKyZpJ+qfpV1M7fY
	EgJsml/Ht8KV89WDflogVZHAUwC/+I1AVtW/GZS7TLuRgtCIPecugrMFVt+J3AlPQsits2ylXSJqB
	6CwEi9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC6-0000000Gz5u-1KfM;
	Tue, 05 May 2026 17:04:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC3-0000000Gz1t-46VK;
	Tue, 05 May 2026 17:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7mMTfDZ4nl8ekfgg7b9H2X02Eg7cD6K21MT96h6gSgM=; b=GZ/Nl2HVVn4n+i6w+GehBF8GT+
	Yzv0L8SWm5DySUsKN/XaQsykko3r/7lYoBNPBytLFHYPfO2MCeE9PrStcWgdeY5GDSqDRbxkzBGAZ
	UtM+MdVLEaefKVVRYBJf/YChAF0D/uc+Iriz3WVFi3l2Mia9KhI3Od0bFreIoZh7oRN+AlPOSxfAa
	QTF8sRwWbNCBVN80DuP5P9fx4cBnnOMBwLgxJ6WDuJOVv0D/DG5YF9R3XUj3n/wooKwdlAkCY6PvY
	+gOUfLAythSkE0M3KAElY7xS94LcEooAD4FlBFdDpoCmEHWWAKXfyDbK7dliFYTpsYTkc5fyFmgDE
	46jZ+aWw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC1-0000000E6jE-0A1h;
	Tue, 05 May 2026 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=7mMTfDZ4nl8ekfgg7b9H2X02Eg7cD6K21MT96h6gSgM=; b=lqrs5NaiurW/3Qzu8QxAnQ4eZR
	7q8u2pxSBzFPxzE0f3Zf5vR3dU2hNLVeKug5EK4Xi52Pyl8qBj1lD/beJxEnb142Tk6qyxdzU/8g8
	t4hAq7d1ZR66opWn8q20kdcuXd8it0YlP01CfkZC/LwSzidwHl6Xv5OmaK0u9E24y3hczLfOYvILK
	gjNjA1S312f5bKTU2qg44u/bcF9z9cdXmW80FPprWCivMi40U1rSob5WHJu2E2tb/dLyG9z6++Oln
	8PaDqwxZqWSxhs37g84NqqM+NYUWoz5ufhlGY2qsbkJaKtGthFiSuKSRrcAjUJH1zKnnfuHasFDpl
	+/6HbvwQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 4/5] phy: rockchip: inno-usb2: Add clkout_ctl_phy support
Date: Tue,  5 May 2026 19:04:09 +0200
Message-ID: <20260505170410.3265305-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505170410.3265305-1-heiko@sntech.de>
References: <20260505170410.3265305-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_180421_209782_379CDA11 
X-CRM114-Status: GOOD (  17.18  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The 480m clk is controlled using regs in the PHY address space and not
in the USB GRF address space on e.g. RK3528 and RK3506.

Add a clkout_ctl_phy usb2phy_reg to handle enable/disable of the 480m
clk on these SoCs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 47 +++++++++++++++----
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7cec45192393..d8879fcd4291 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -179,6 +179,7 @@ struct rockchip_usb2phy_cfg {
 	unsigned int	num_ports;
 	int (*phy_tuning)(struct rockchip_usb2phy *rphy);
 	struct usb2phy_reg	clkout_ctl;
+	struct usb2phy_reg	clkout_ctl_phy;
 	const struct rockchip_usb2phy_port_cfg	port_cfgs[USB2PHY_NUM_PORTS];
 	const struct rockchip_chg_det_reg	chg_det;
 };
@@ -228,6 +229,7 @@ struct rockchip_usb2phy_port {
  * struct rockchip_usb2phy - usb2.0 phy driver data.
  * @dev: pointer to device.
  * @grf: General Register Files regmap.
+ * @phy_base: USB PHY regmap.
  * @clks: array of phy input clocks.
  * @clk480m: clock struct of phy output clk.
  * @clk480m_hw: clock struct of phy output clk management.
@@ -245,6 +247,7 @@ struct rockchip_usb2phy_port {
 struct rockchip_usb2phy {
 	struct device	*dev;
 	struct regmap	*grf;
+	struct regmap	*phy_base;
 	struct clk_bulk_data	*clks;
 	struct clk	*clk480m;
 	struct clk_hw	clk480m_hw;
@@ -312,15 +315,33 @@ static void rockchip_usb2phy_clk_bulk_disable(void *data)
 	clk_bulk_disable_unprepare(rphy->num_clks, rphy->clks);
 }
 
-static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
+static void
+rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
+				    const struct usb2phy_reg **clkout_ctl)
 {
 	struct rockchip_usb2phy *rphy =
 		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+
+	if (rphy->phy_cfg->clkout_ctl_phy.enable) {
+		*base = rphy->phy_base;
+		*clkout_ctl = &rphy->phy_cfg->clkout_ctl_phy;
+	} else {
+		*base = rphy->grf;
+		*clkout_ctl = &rphy->phy_cfg->clkout_ctl;
+	}
+}
+
+static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
+{
+	const struct usb2phy_reg *clkout_ctl;
+	struct regmap *base;
 	int ret;
 
+	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
+
 	/* turn on 480m clk output if it is off */
-	if (!property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl)) {
-		ret = property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, true);
+	if (!property_enabled(base, clkout_ctl)) {
+		ret = property_enable(base, clkout_ctl, true);
 		if (ret)
 			return ret;
 
@@ -333,19 +354,23 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 
 static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
 {
-	struct rockchip_usb2phy *rphy =
-		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+	const struct usb2phy_reg *clkout_ctl;
+	struct regmap *base;
+
+	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
 	/* turn off 480m clk output */
-	property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, false);
+	property_enable(base, clkout_ctl, false);
 }
 
 static int rockchip_usb2phy_clk480m_prepared(struct clk_hw *hw)
 {
-	struct rockchip_usb2phy *rphy =
-		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+	const struct usb2phy_reg *clkout_ctl;
+	struct regmap *base;
+
+	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
-	return property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl);
+	return property_enabled(base, clkout_ctl);
 }
 
 static unsigned long
@@ -1336,9 +1361,13 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 
 	if (!dev->parent || !dev->parent->of_node ||
 	    of_property_present(np, "rockchip,usbgrf")) {
+		rphy->phy_base = device_node_to_regmap(np);
+		if (IS_ERR(rphy->phy_base))
+			return PTR_ERR(rphy->phy_base);
 		rphy->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,usbgrf");
 	} else {
 		rphy->grf = syscon_node_to_regmap(dev->parent->of_node);
+		rphy->phy_base = rphy->grf;
 	}
 	if (IS_ERR(rphy->grf))
 		return PTR_ERR(rphy->grf);
-- 
2.47.3


