Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29951CFD370
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 03:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dDfF/zn3iW8j0WREsPSzpD0bH+LNJIHxQWQ+MWSBE8=; b=JA90GQ2NV7XN6korsv/DlIi9sK
	eM0E1amUyOFyEu2lJ0VXrEPcXDwCEQ0HxMXH8n6P351EEbJkEGvDq66WuNhfnNFdMFAPqAjYXjzEe
	LGA1v0cl4NO3X74VEey1favls5y4eMPWHejaGPKv6xxhc8o1swMmj10gY4qM2HYFU9n/IgqNHJ9xg
	IP25P6sjcPRvakFhr1y16UawZTUBuxr6w61tY6gKeiR2cpqoIz5dJj+ukCeM7IsVIpj5DxnbB/Vs0
	ydgzURT7GJmrsTVaTaUPVE66ee2wgMeLck/O3R43R+s3VXeR+Cb8h5e37S4ZhQxERVkunMmrfdhXp
	3ppYPQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1A-0000000ChDe-2kho;
	Tue, 25 Nov 2025 03:47:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk18-0000000ChCA-253J;
	Tue, 25 Nov 2025 03:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0D8B60185;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B8DDC116C6;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764042421;
	bh=4J3g5j51PBpP7n9+7mbzEOrB/xPKifWDPpyCNDHAijs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cgz7ubkiHQB+YPvJjBzXk4y4/EV4gcWAmbVLc9+A7mGlbLiAsHv00zS3SGuF2N9aF
	 VyqXCQ6D7dw8cIQZaSQ4sG7u0t/E2pWBSYUP+Z8h/+drd8hCqLZ3+45dRJXZLSiuFh
	 39gpW9CIX1/DW3yOiLAg4Dq8t93re1FqQqsdJ5XPGRSxLxnmqestJ4CyQt/DmxiEYg
	 IOkTImNfBARJIkn887xFp6rMYtXOabmoRctYC5YcEEIw4BKmhOuAFLTNJF1KSQ51vh
	 gG6qbhc6zS9xJf/GEr5dcms/AuZFvYUOk7foWfB2Z4IJKAJabJKIocxwHDmV9Z9kUq
	 JdlA1ROCY5/Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408A2CFD315;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Nov 2025 19:47:00 -0800
Subject: [PATCH v5 1/4] arm64: dts: rockchip: Add light/proximity sensor to
 Pinephone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251124-ppp_light_accel_mag_vol-down-v5-1-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764042420; l=2100;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=P3jxHkWmNKoMTa/ZH2mI0b285/Gcq9KBGUYb5ASdyDI=;
 b=ePPb+2twvyymvlXtx7y6tuGBD2TrnI06XJtJAi3RUVXg/E81weVnx5FMV9z0bHTAH20GUuxG9
 lLv17Ls0n5dAqqvlqB7pJBDa+PTWHU6QL7vHzdUvjEfz7SL7brgj+V+
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ondrej Jirman <megi@xff.cz>

Pinephone Pro uses STK3311 according to the schematics.

Tests:
~ $ monitor-sensor --light
    // When the sensor is exposed, it get's fluctating values such as
    Light changed: 1.800000 (lux)
    Light changed: 1.700000 (lux)
    Light changed: 1.800000 (lux)
    Light changed: 1.700000 (lux)
    Light changed: 1.600000 (lux)
    Light changed: 1.100000 (lux)
    // When covering the sensor, it prints a low value and stops printing
    Light changed: 0.200000 (lux)

~ $ monitor-sensor --proximity
    // When it goes away from an object
    Proximity value changed: 0
    // When it comes near an object
    Proximity value changed: 1

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 6f97e57f36f5..2d2858ee149e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -520,6 +520,16 @@ touchscreen@14 {
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1440>;
 	};
+
+	light-sensor@48 {
+		compatible = "sensortek,stk3311";
+		proximity-near-level = <300>;
+		reg = <0x48>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&light_int_l>;
+	};
 };
 
 &i2c4 {
@@ -689,6 +699,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
 		};
 	};
 
+	stk3311 {
+		light_int_l: light-int-l {
+			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
+		};
+	};
+
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.52.0



