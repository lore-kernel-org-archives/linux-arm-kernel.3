Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA17FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16dka2w72xpaD0rybXsOk7JGYtzXRUFZqFTQIBqRqj0=; b=Jd2LwSV3v0NTb0C4Q2yOKnTEEF
	YFVxy13Alph/vdjDBxXMooV6KICmsRcWzAujnM9B+PoNX99lJaUbqTDqvOkRFq/ULRHuchx3ZoddN
	t8W0a3AykCIQdRhH7EiFYVp6JwdqyBZss+5JzriKzOST1Nwe9jPBaQ+5Po2Hz58Z02F5AUvq6d9k9
	nKrVJ1SdAiK6PajxF48cLWPDnJbRC1PFfgr29in1oxVJJ0zHdMSLG59p66+MhCJu7vNVzK6qX1Do2
	jXwUwVVlfiyTO20UYWW5sNMNiSL+TXh92tUwC7Ub/Yq62RKj8dgxIf28iFdJpBQm8eyILiP0THCod
	5KwIIo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxi-00000000DMx-3QYT;
	Mon, 27 Apr 2026 21:57:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxb-00000000DEw-3tsm;
	Mon, 27 Apr 2026 21:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327065;
	bh=/vBqt9UZcZFgAFm1ZsAr9FZXZJaxsAIpfwkQQgR2SJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cdF06wVZD/rNIwL5iUuHOlH/u0AAsbFbiMf/jol7/U2i2VMxCs3608IFIPhn8oj1o
	 m7D28H23UoYGpLOURhHVM1fqJsOHruJPNqx5UGv/56gOcdMSjDZ+GwTBbeilv/x8PD
	 NDiBwzoMu5opewZayvBsgGXsj/KHxIjArPQchDqf3xr+Xy0V2VX2lxvLpjwgwvA1gq
	 fdSpk8ks3HMTh5EgUoAtcm2fho67XGD2AclqD0GP3txToU3Qv3+KWnVhzZA7W+rC2h
	 lkDWa62r2Cxw+ViuA4lAldXoAyMLR7u92mz2G7u573x0bZCI9XxM9guzjub0GzmUvv
	 wRQzt69EZzpzw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FFBE17E141F;
	Mon, 27 Apr 2026 23:57:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:21 +0300
Subject: [PATCH v2 03/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-nanopi-r76s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-3-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145748_539761_BC152FEF 
X-CRM114-Status: GOOD (  11.08  )
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

The board exposes the GPIO4_C6 pin to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

Additionally, drop the now unnecessary workaround of using vcc5v_hdmi_tx
as hdmi-pwr-supply solely to drive the GPIO into its default state.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 7ec27b05ff10..0a5cd5f6fd33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -70,7 +70,6 @@ led-2 {
 
 	hdmi-con {
 		compatible = "hdmi-connector";
-		hdmi-pwr-supply = <&vcc5v_hdmi_tx>;
 		type = "a";
 
 		port {
@@ -109,18 +108,6 @@ vcc5v_dcin: regulator-vcc5v-dcin {
 		regulator-name = "vcc5v_dcin";
 	};
 
-	vcc5v_hdmi_tx: regulator-vcc5v-hdmi-tx {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_tx_on_h>;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-name = "vcc5v_hdmi_tx";
-		vin-supply = <&vcc5v0_sys_s5>;
-	};
-
 	vcc5v0_device_s0: regulator-vcc5v0-device-s0 {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -252,6 +239,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 

-- 
2.53.0


