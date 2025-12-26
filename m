Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A213E776C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 03:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+YFSmLYNqmMNjpbL7uJzGFx2s4R7DhdI0tbYnt+xEo=; b=MK2RelZqWx+hcBEpD1tJHtZ/Vd
	5ZxEUXw2Ute7O1VqhHziDPhvZON0F3cEVQ1E2FNsiWWrvsh/7v9FVkLhfC1yC2Qte0kSAtrOhCmLk
	XiRiT00H7nHD9iJgVW8fjrCjYNuKz2WqjzZUhCaYfnhzl/t9zNE47WFuOxCJ5GmfDR/y5OC2Obyd/
	jAo72bXlgpf9gEZ/LwwPOB2GfM5T0YL35YepQEwfSBLbl3UOwPVBwVVmiCTTlR78S4loYiPj1NW3S
	TABQDYnDGwmpkHDowQFNTLa8xztFENfPtZ/tqK+UnonoLH72yX5CjtWxkuCL+IKc8MQ4naJ3+u4Pc
	KZPB69Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYykX-00000000sRx-06oq;
	Fri, 26 Dec 2025 03:44:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYykT-00000000sQw-3qbe;
	Fri, 26 Dec 2025 03:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E4C9600BB;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2826EC4AF09;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766720656;
	bh=EKBIi6eKC8bwV3JcDE8QBa6/BCkSbEYrwKPv7YvsO48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EtInuGZWSvVK+yJ9Qp8U4xio8i2QkgWTjC05V7VbK77C8g+b9GxdhffzUY2VS1NK7
	 j10aHPyG0f6cbK1GPaZw8oRRovPwa5vGkFABFTzLmR5QAfrYvKN2di2uj8VpCqojmZ
	 ApIT31E6CcqWeWKfgiFhuwB1XZThX0ROQ3pNoDWSE/RmaWX7N0R4Ev0hBRdUom9CoC
	 W+qNaPBR5h4BNrdMynYBCyVOgLBP1OCG0YsWbY609m3Dx4eRlNJhgddeVvrOLO49GQ
	 f1CNCXedUdzLkzBIkrIGk+2PALcC3A4Td8UWd3g0wy4QXHRR6Xg2T2q7ZnWVn7LT0Z
	 5a9sAsBZ+LfRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13690E82CA4;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 25 Dec 2025 19:43:20 -0800
Subject: [PATCH v6 2/2] arm64: dts: rockchip: Add light/proximity sensor to
 Pinephone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251225-ppp_light_accel_mag_vol-down-v6-2-8c79a4e87001@gmail.com>
References: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
In-Reply-To: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766720655; l=2096;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=73whftO4gyGNvsyeXM75XpLd8dUij1OhzKtrJMPtTnE=;
 b=2wmDdvBnsNlr47Cm6jczlYsiauKFzAVVHejv21YcBlNm2iRXcCA1OC1LsVECmlSPwBoBBgJBz
 ZmNcACNWI1KCMR5Kfs6BgJZ+zyVrwfYb4ahT3RKziGqbXEaVRs6uS/i
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
index 1d3baa557c70..e89759613b55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -520,6 +520,16 @@ touchscreen@14 {
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1440>;
 	};
+
+	light-sensor@48 {
+		compatible = "sensortek,stk3311";
+		reg = <0x48>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&light_int_l>;
+		proximity-near-level = <300>;
+	};
 };
 
 &i2c4 {
@@ -712,6 +722,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
 		};
 	};
 
+	stk3311 {
+		light_int_l: light-int-l {
+			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
+		};
+	};
+
 	wifi {
 		wifi_host_wake_l: wifi-host-wake-l {
 			rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.52.0



