Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94BFCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LsCwT3nRgsSBtQjwPLp4Kqd9pyI8P+SOpTbkZCVfBgE=; b=WZV/oIHyaJ/uJFFw6BbeilUvDn
	Sn3RNyJWnEfIYibmefMqGuTyP3PEh9uZBfX23s2OA0As0iIw3dOpjQk7Zd/qcMpWSxyv/KOiIcxae
	A9UDm9lCwcH/qisvhbiYHxDPVlB++MCJey7bjNVjepeLqNWaE6pp/OqlcJo/p2W7XIVZZ+/bWk7Jv
	iLOfNrlXHVs8KM2guOJztshv3YojDPi1CA45Nypm5JPm2c4bfZd4qH8W6CDuxJvMeRo4E7wlQ+Git
	vmw8Tl62RFsTP8t8ZvIj7DW/A0IlL/sV+2+JI44EwV48fG84nh3Lr0pkUO2QkG6haK33+oeAjKKV7
	ZKz//3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlvq-0000000CX9F-3hMA;
	Mon, 20 Oct 2025 09:11:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlvo-0000000CX83-1RNM;
	Mon, 20 Oct 2025 09:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=LsCwT3nRgsSBtQjwPLp4Kqd9pyI8P+SOpTbkZCVfBgE=; b=TUGEX9wRBGqX3UDToPHfTXcUGz
	UXkYaSBx6BXb2sRjOC/6KP2s2WITFZJErPOntwnAuf5w49HQ5wuo6QWUGxx1PLbs4NvwMU1NpG4WR
	Zz67vf9DszK150zPb38bybTKz/n8reB11UQPXKu/2Nsr0W2lurBQ6fEUD6m+tvXzB2U24JN5mnwek
	RKAbXtH54X83oNPq84ub5H9MF0lpusazMUn1u/G7E/DEOaXOzBxv4zx+TdqlKGLxVoGKDW3s4rEiQ
	fjr3AEGizGHdIN01gJIpLKyfKB3ZGgaH4wUwqWp0rwuc9NVdNJYx1z+ZRkLXF7/QGlGLyIOpZtMY5
	46RUqTxw==;
Received: from [141.76.253.240] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAlvm-0007Un-EV; Mon, 20 Oct 2025 11:11:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH] arm64: dts: rockchip: Fix indentation on rk3399 haikou demo dtso
Date: Mon, 20 Oct 2025 11:11:39 +0200
Message-ID: <20251020091139.3652738-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_021156_381467_91F0DD1F 
X-CRM114-Status: GOOD (  12.03  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The regulator-cam-dovdd-1v8 uses spaces for indentation, where it should
use tabs. Fix this.

Fixes: 066a69db9db3 ("arm64: dts: rockchip: add overlay for RK3399 Puma Haikou Video Demo adapter")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../dts/rockchip/rk3399-puma-haikou-video-demo.dtso    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 5e8f729c2cf2..141a921a06e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -45,11 +45,11 @@ cam_avdd_2v8: regulator-cam-avdd-2v8 {
 
 	cam_dovdd_1v8: regulator-cam-dovdd-1v8 {
 		compatible = "regulator-fixed";
-	        gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
-	        regulator-max-microvolt = <1800000>;
-	        regulator-min-microvolt = <1800000>;
-	        regulator-name = "cam-dovdd-1v8";
-	        vin-supply = <&vcc1v8_video>;
+		gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "cam-dovdd-1v8";
+		vin-supply = <&vcc1v8_video>;
 	};
 
 	cam_dvdd_1v2: regulator-cam-dvdd-1v2 {
-- 
2.47.2


