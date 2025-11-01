Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D287ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQMzqPf3OY/KX7hxpJYfv8hl2WAvVg/eLbORJ2SUHvc=; b=saYs+1XBT+lhZl3yaEogD/v9jY
	NgtcnSk9Y7xud40IMopCAsk1L+SGqTW+i2Wyx68txQNxxRG//V5fqT3813tkg0rgNLHXxfWGe9Mb8
	ICcnV3h57FoRnlCyzaoYAi37Mwg7zolTluGJrNDyS9+vmJPqaYr1d9Q4DBh035etaKNFBEx2HAXry
	Jl91DKM9Fz2GqRDPKLzBfglHfUY75JuOmNHFoadpoP3BhjvDq9IdOPIUDRaO4//GSQvQeGUhSvKIJ
	1BmFkmvoyJqA3uR6t/Nrr4VR7EtOcN9Md1PgsXuco3hqxVObuNj6rfO86tbiFJ6yudGtdsr7THQms
	v08ifwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAPZ-00000007NtW-48RB;
	Sat, 01 Nov 2025 12:08:50 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAHS-00000007K5u-0kYe;
	Sat, 01 Nov 2025 12:00:32 +0000
Received: from localhost.localdomain (unknown [58.61.140.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2801cc497;
	Sat, 1 Nov 2025 20:00:20 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Hsun Lai <i@chainsx.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: rockchip: fixes ethernet for 100ASK DshanPi A1
Date: Sat,  1 Nov 2025 20:00:07 +0800
Message-Id: <20251101120010.41729-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251101120010.41729-1-amadeus@jmu.edu.cn>
References: <20251101120010.41729-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a3f4a3aaa03a2kunmfa682f8b2d3699
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGE5NVkpLTUJKGUxCTUMfQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0tVSkhPWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_050026_554900_BE80F26E 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Currently, Ethernet is unusable due to an incorrect PHY address.
This commit fixes this, removes the incorrect 25M clock pinctrl,
and adds the missing PHY supply.

Fixes: d809417c5a40 ("arm64: dts: rockchip: add DTs for 100ASK DShanPi A1")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../dts/rockchip/rk3576-100ask-dshanpi-a1.dts     | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index f8bc401e796f..425a78db9522 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -192,6 +192,7 @@ &gmac0 {
 	clock_in_out = "output";
 	phy-mode = "rgmii-id";
 	phy-handle = <&rgmii_phy0>;
+	phy-supply = <&vcc_3v3_s0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth0m0_miim
 		     &eth0m0_tx_bus2
@@ -205,13 +206,13 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-mode = "rgmii-id";
 	phy-handle = <&rgmii_phy1>;
+	phy-supply = <&vcc_3v3_s0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth1m0_miim
 		     &eth1m0_tx_bus2
 		     &eth1m0_rx_bus2
 		     &eth1m0_rgmii_clk
-		     &eth1m0_rgmii_bus
-		     &ethm0_clk1_25m_out>;
+		     &eth1m0_rgmii_bus>;
 	status = "okay";
 };
 
@@ -618,10 +619,9 @@ es8388: audio-codec@10 {
 };
 
 &mdio0 {
-	rgmii_phy0: phy@1 {
+	rgmii_phy0: phy@0 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x1>;
-		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		reg = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac0_rst>;
 		reset-assert-us = <20000>;
@@ -631,10 +631,9 @@ rgmii_phy0: phy@1 {
 };
 
 &mdio1 {
-	rgmii_phy1: phy@1 {
+	rgmii_phy1: phy@0 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x1>;
-		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
+		reg = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_rst>;
 		reset-assert-us = <20000>;
-- 
2.25.1


