Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E800CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBZGz4KeATmPHLeRyjSnXeJze/Vg583LnrtXYZk0ZO0=; b=eYjcAowCXdgvvIMV1HQ5xUlTBX
	wdc6lj2ZiPeTZILSe3C7zoty9AVP4I04kwdZ8WV9ORyV50Eb5FfGSVhauwrvfZMZcOCr5QO9kHbV7
	R5mMOaZ9KDIuxanOrS5cLcgGL/gQO8MGMc4NmVyM9Ut5piSxmamqnZTcHC30/T/6r3oPMBnotPh7L
	hM/3qa9gSmrA87x+nwpYyQvIbrHSv0csv+Q/BJaI0MnMTNKEDdMDJVzcJhdijsqcEk2I3XV94RQ6k
	Vy8CEqrF7dvyLzmBRlvBKp13vDl72iC+FRNKqjtnBkb5xBQZrBIt1cZ1HsN9qXKBU8pucOMUVQNFS
	pXtgVf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAPb-00000007NvS-24W9;
	Sat, 01 Nov 2025 12:08:51 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAHS-00000007K4l-0v2V;
	Sat, 01 Nov 2025 12:00:32 +0000
Received: from localhost.localdomain (unknown [58.61.140.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2801cc494;
	Sat, 1 Nov 2025 20:00:17 +0800 (GMT+08:00)
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
Subject: [PATCH 2/6] arm64: dts: rockchip: fixes regulator for 100ASK DshanPi A1
Date: Sat,  1 Nov 2025 20:00:06 +0800
Message-Id: <20251101120010.41729-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251101120010.41729-1-amadeus@jmu.edu.cn>
References: <20251101120010.41729-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a3f4a2ee703a2kunmfa682f8b2d3678
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTxlKVk0dT0IYTxhOShlDQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0tVSkhPWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_050026_555191_FAE2CEC1 
X-CRM114-Status: UNSURE (   8.98  )
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

Referencing the schematic [1], correct the names of the USB
regulator, remove these non-existent RTC and UFS regulators.

[1] https://dl.100ask.net/Hardware/MPU/RK3576-DshanPi-A1/DshanPi-A1-RK3576-SCH_V1.1.pdf

Fixes: d809417c5a40 ("arm64: dts: rockchip: add DTs for 100ASK DShanPi A1")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 46 ++-----------------
 1 file changed, 3 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index 9cbd3fae16ab..f8bc401e796f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -85,16 +85,6 @@ vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
 		vin-supply = <&vcc_5v0_sys>;
 	};
 
-	vcc_1v2_ufs_vccq_s0: regulator-vcc-1v2-ufs-vccq-s0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_1v2_ufs_vccq_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vcc_5v0_sys>;
-	};
-
 	vcc_1v8_s0: regulator-vcc-1v8-s0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8_s0";
@@ -105,16 +95,6 @@ vcc_1v8_s0: regulator-vcc-1v8-s0 {
 		vin-supply = <&vcc_1v8_s3>;
 	};
 
-	vcc_1v8_ufs_vccq2_s0: regulator-vcc-1v8-ufs-vccq2-s0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_1v8_ufs_vccq2_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vcc_1v8_s3>;
-	};
-
 	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_2v0_pldo_s3";
@@ -135,16 +115,6 @@ vcc_3v3_m2: regulator-vcc-3v3-m2 {
 		vin-supply = <&vcc_5v0_sys>;
 	};
 
-	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_rtc_s5";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_5v0_sys>;
-	};
-
 	vcc_3v3_s0: regulator-vcc-3v3-s0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_3v3_s0";
@@ -165,27 +135,17 @@ vcc_5v0_sys: regulator-vcc-5v0-sys {
 		vin-supply = <&vcc_in>;
 	};
 
-	vcc_5v0_typec0: regulator-vcc-5v0-typec0 {
+	vbus5v0_typec: regulator-vbus5v0-typec {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&typec5v_pwren_h>;
-		regulator-name = "vcc_5v0_typec0";
+		regulator-name = "vbus5v0_typec";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc_5v0_sys>;
 	};
-
-	vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_ufs_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_5v0_sys>;
-	};
 };
 
 &combphy0_ps {
@@ -761,7 +721,7 @@ &u2phy0 {
 };
 
 &u2phy0_otg {
-	phy-supply = <&vcc_5v0_typec0>;
+	phy-supply = <&vbus5v0_typec>;
 	status = "okay";
 };
 
-- 
2.25.1


