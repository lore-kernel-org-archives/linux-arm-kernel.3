Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0870F43688
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX+qS3Zr2z5W6fTu85+YP7abth8NQ765OMYJCeRCXfs=; b=U242aN0SnGnFiwDGoKoz+Kp6xa
	9N2f32y5ZRXTUttYbhK5IriusKpWeyAPnWo+91Eu56ceMPfin9IACVCprRYkr+V+YXR9IenbFeguY
	L3K6yYVyr+rwcENyUzHMEA5Lwg4KXHaJ3XIsrwHgYmHl/c5ZpcMxxUDEgLySBjbYKyfkpD4YIoTmW
	bxa0gd9qGO8mkUJpLKZzG2nKkUhvXpjhGLIJxAhpwDMAul7uUi7k+9uF62NZo4fxjfJ73sQ5F5TK5
	rM6Fvlx3GVf3AZ1BFYXGCo+htiFop2DVZwbEKohTtYKzpLqLWPEux+ONESBNIHHbJymP9Dplwzzxb
	R0WW7HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSC-00000003l16-2PlX;
	Fri, 17 Apr 2026 09:25:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfRs-00000003kbt-3mKE;
	Fri, 17 Apr 2026 09:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417912;
	bh=mlqIEopefDt9DLJ3QmuEh2a4QEM5ojLoa61J/yBARMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S+Pi/iFV/k6L1vqAds+YHDLPuHGizUnlQTg8tjsP5/RrL0AMRgCxC924awepwgAKD
	 bjW5IclAYH2aIXFREa6V0lvShP+WG8v3RmPbshVh3EJs29cctadbcjxJ6/HUj97W1B
	 wSPaPG4pxLZIcXMdYAzPUGps7MBMxkSqjPcTSWP7qx9ga6plKfcHUyOYTdY/hUXuXs
	 scNjvzyQD6Tk5ZQYPhqWAJ/n7n5KPV18UVKybDucmk/dtcF6R/c1ILck7+5AUiQ3Ig
	 FIyyZU8SuOGwObycuvalQ1eVHJap2mB6gO0tz2Eh4cR09vydi/sqJv7GC5lYvN78XY
	 jn59EesUJ5uPA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA9C517E1396;
	Fri, 17 Apr 2026 11:25:11 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:39 +0300
Subject: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-5-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022517_091438_B18C038E 
X-CRM114-Status: GOOD (  11.05  )
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

The board exposes the GPIO4_C6 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property and drop the line from the vcc_5v0_hdmi regulator to allow
adjusting the bias when transitioning between TMDS and FRL operating
modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
index 749f0a54b478..93ae37699366 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
@@ -140,10 +140,7 @@ regulator-state-mem {
 
 	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
 		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_con_en>;
+		regulator-always-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc_5v0_hdmi";
@@ -231,6 +228,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -655,7 +654,7 @@ &pcie0 {
 
 &pinctrl {
 	hdmi {
-		hdmi_con_en: hdmi-con-en {
+		hdmi_frl_en: hdmi-frl-en {
 			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.53.0


