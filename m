Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223E7C88E46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na/2rYNgfL/MRfIqXZK6/glLsxTXAzc7q+o5/lZOkao=; b=B21NRyqI3/1xQjSjjQx9OuSHEQ
	0XLGh89FQ3XXCOCproBFGewnIIlTBcYvFsUrHwWz/P7hJRZ9tr2FpOtx6mA8pDFyomHV1QwRu6WXG
	twTaDSRyotDOUS3mDbb2S7jOCQEmnwU6fCqAgbsg6tgZW8I+egVU/e/IxczADieDrTqmbNwSO++Yb
	W6jup+eF0L8ZUN3HXJbEb+d3Igwfl93BRhxbA9uWec9GZRQ3Ln1PRZGKDC1rKR4qxbNPwIfRu4X0z
	pboE3l6Zq1BtDSAVuKhgIwOfGKcdHX25RQ9hgHS2Q1KWesIzwTgR2lGlNBshWieSpi552gq3aZjRl
	JZhNpw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l44-0000000FIr9-3CiZ;
	Thu, 10 Sep 2026 20:08:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l43-0000000FIpu-1jFl;
	Thu, 10 Sep 2026 20:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91D9B44510;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6944DC2BCFC;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789070886;
	bh=5wu60YY8hr70mVzYt0XxCakhALGBCi7sv7iUpB7mlwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LA0yt3dX7JMw75UJYa2witcIKJ/M4BNcZqgMMhQI3VyLTbBc8ZtVVYgirCW3q0mUv
	 mOi8TNWQRsbF9m7xwoxtAGFR7C2Ow4tGu/sL9HVEcY77EXlonXEWm3rdv6nvyz74pe
	 UTTXfDLUTXVatCHle3FHFYt2JC9cIhNz2nuWG00Dr+v78bJvwTawPRwFUtsTYgXoAu
	 dn1E1neOjYRabT9LUli6IG5tiWFQP+UNeDlJToU+SwCWlMU2DIpug93O/XZRVHPVi8
	 7nUnaZ6EV4X5e7s8vv1XvWVXmhtGlaaQUIul/0dtNu3KpMK1GjISuaiLZPgTZLrqB/
	 ZQBH/OhiKJVaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFEAC88E47;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Thu, 10 Sep 2026 22:07:53 +0200
Subject: [PATCH v5 3/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on ROCK 5 family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-3-c1b9e5f10cd6@pardini.net>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=ffaFeWf1v4NEL+Sxh8Gv2aKFIyBgC3G4Y4ipl5QLt2k=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqow4krHHkgKTxlAbASVrEcoNm9tETmIBoOeDz8
 ntOML6LmuSJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaqMOJBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7enWIwf8C1uWYC4gsRWUikmFyCTT3IuXmIY7pF+
 4NXwMX/u4dIkzRUjax1zKu2SQXojs0XEzomBqjaYNisF1dy6v0mzB73QqHGVhrzK0btB/yAwgm4
 5PnF6A2vvle8UMBRCeOfwoory3AIsjoRoZ73ySkR4AI2N9sfL4sKsfIU3l2bENkmCtuPW/dOwFv
 FAS8HmjAWRAoQMnSGYDzisxKyMv+d4bo/gqL/GqefTNLOzopY3096BQpXbQoyYI6q5HqjtQ3IvJ
 8F3zI1IxBBRZ566rK33Xw11jQIbB4MC9z1dm2VnP8R0Bjb2K67FxzY5oIC36q+SlBYVLfrlmzU8
 9/4l9MlNv7w==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

The Radxa ROCK 5B / 5B+ / 5T all carry on-board Realtek RTL8125 NICs.

Describe the fixed function nodes and attach ethernet0/ethernet1 aliases,
so that U-Boot's fdt_fixup_ethernet() can fill in the MAC from its
ethaddr/eth1addr env, for stable MACs across boots that both U-Boot
and the kernel agree on.

The RTL8125 on pcie2x1l2 is shared by all three variants. The ROCK 5T
additionally describes pcie2x1l1 with its second RTL8125.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts        | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 13aaf63ad0936..fd0520b47ddb8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -10,6 +10,7 @@
 
 / {
 	aliases {
+		ethernet0 = &rtl_eth0;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		mmc2 = &sdio;
@@ -488,6 +489,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x41 0x4f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 425036146b6d9..b1a3e4b2165f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -8,6 +8,10 @@ / {
 	model = "Radxa ROCK 5T";
 	compatible = "radxa,rock-5t", "rockchip,rk3588";
 
+	aliases {
+		ethernet1 = &rtl_eth1;
+	};
+
 	analog-sound {
 		compatible = "audio-graph-card";
 		label = "rk3588-es8316";
@@ -76,6 +80,20 @@ &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l1>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x300000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x31 0x3f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.55.0



