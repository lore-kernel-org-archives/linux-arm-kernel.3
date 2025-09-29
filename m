Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACD7CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NebEICgcieHB2jHBcum+YuQTIZi7vq36XsWvFsd7VU0=; b=H/kubEw3xdFQz7kmVGFOJ/4KHT
	SCCbaodPFhUL4q+rNsJ4Nh4fGUjq2sBtibIp7pdMM35R8F83rnrnINoKNNkVqM5eozmVhYu0GQGCx
	/qypXaJzNpg9RioRbllnV5wN7KHlRpoPeN9fatnnbMQB9Nmic8QkBhzkwiV9C3x1NpKidvWvb+B39
	xcGyLbtMIfyV/hquvlOdXi3CME4Ul23BVDX8Cd85IPJXJ+2J/IabKgfsd7flCyHDRQ+8u6IF8OH+I
	uWUp2yy/eGnAgImAEUby+NaQoenGi+Frz/LwmcFfdbKS9AKJvfkUwC32NkvOtPqMTT6dXWwSdrCsB
	onalnkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Ps-00000001cd1-1Oc9;
	Mon, 29 Sep 2025 07:35:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Pn-00000001caj-10w8;
	Mon, 29 Sep 2025 07:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC41D62314;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79224C116B1;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759131313;
	bh=8VBQdbInkyT4SO9ZYbFABhR/xaRBu7JaZ6KrCbUKrbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tmSdGKUzYR8fczBUyshYTpijLbi5HxJfpYRcuUwdk901/GJCfU/P+dkyCWFElp98g
	 Z7nL82rt4QJGF3rOuK8mRCplIzIXRqy6CsntPMGGREq3KLUHMkunDnm92MIPdXUhwD
	 67m7cFHm0BQIbmnVjr5snY4LK8156YauIM1hILdKe+gn7IEoa30zGzmXPjvOsiyPVc
	 Fw5OAu/wKd3lhg70v27e2qVmmAYomRI1FE0b9jE/1QpeUaEm/216XrcGT7CEsgABNq
	 AZuSr9TtipN7Hirz+OP/5lK0YXJl96tFHg3HWjrc13NjClCY/tsYUDcvLDuzeqXt+5
	 cfinOgOw6OyvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692A2CAC5B0;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 29 Sep 2025 00:35:12 -0700
Subject: [PATCH v4 1/4] arm64: dts: rk3399-pinephone-pro: Add
 light/proximity sensor support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250929-ppp_light_accel_mag_vol-down-v4-1-6598f22d3451@gmail.com>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
In-Reply-To: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759131312; l=2306;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=/lKiD65MbRWEXijfwwhiyC0MPS0vO7bZZUd/tftK3Ok=;
 b=Mv7RMAhsAjMFMpCjbxt8lewBE9asnKX3oaeMWL7sBzt7hMppyU5mfnZhti464TMiN9hm7Ljat
 +f9sM8uRhuRBLoBty12REVq3oa6cAf/qo1sMPKytS5CdRSZYLCcTm3+
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
~ $ hwtest # output tweaked to fit in 80 chars
Category  proximity
Model     stk3310
Path      /sys/bus/iio/devices/iio:device0
Status    working
Value     59.3 (when covered) and 2.2 (when uncovered)

Category  illuminance
Model     stk3310
Path      /sys/bus/iio/devices/iio:device0
Status    working
Value     1 (when covered) and 101 (when uncovered)

~ $ monitor-sensor
    // When the sensor is exposed, it get's fluctating values such as
    Light changed: 1.800000 (lux)
    Light changed: 1.700000 (lux)
    Light changed: 1.800000 (lux)
    Light changed: 1.700000 (lux)
    Light changed: 1.600000 (lux)
    Light changed: 1.100000 (lux)
    // When covering the sensor, it prints a low value and stops printing
    Light changed: 0.200000 (lux)

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 6f97e57f36f5599f4027a0f3db98bcbc69cef5e5..71d32c4bae0d0336ac0c912043618fc9b94919ef 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -520,6 +520,15 @@ touchscreen@14 {
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
+		pinctrl-0 = <&stk3311_int>;
+	};
 };
 
 &i2c4 {
@@ -689,6 +698,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
 		};
 	};
 
+	stk3311 {
+		stk3311_int: stk3311-int {
+			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
+		};
+	};
+
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.51.0



