Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434E2FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yci4ZwBo4D3fMmA+miyB3SnZECeUFtL4SQoC3yAlie4=; b=TKGTOo6eMibmj2hdzk7VifvYtl
	DNlXdtlIp6ESZHz42tlU30njGaATH8/M296R0agopdC24C1IC/PMYnEMalbBiuoEw3RhbamrSGm7A
	azmCobbPGg2pjpfDIl/1yoO9Uh3USI/DbQa8LjLnFdMMYkdLdx9dT+k/EgtLzohlXPBwIhLollTqi
	mx7GsTO+LqEmIdDjpBpJxckeNz0bRcFMuFuShyfYWd67ZB9sKsMrF66Byx2GMb5h0tNSbTIGPx7pw
	AdQ95UC9rKpE6gN4Y42UFRntlYTO+UPEaf2+J2cYhBja1zmAJMLTjqTEMLr6Wx0EH+Slsf2EkySND
	BOiE6Y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxi-00000000DMZ-28Bf;
	Mon, 27 Apr 2026 21:57:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxa-00000000DEg-3Zgl;
	Mon, 27 Apr 2026 21:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327064;
	bh=zhyJCoZrrjcFXrqebOcpw3bjPfuh5lPY066+qDv72rI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dYqZN9A5MNQw5/2Ml1+Wz98fulhnNPfA/3X/bpIe2n3tpwG4oaPoQJ8F016R0dChn
	 gXkO7r0qi3CoP8HJzZXbodXjZ5wnFaPwn8tMXjYJQEKyNm12I5F29kO/d5cfJmJPSk
	 og/7Z7rKEM4F8r2SS2z76BnHKgCBdGiO5vdBsqtEJQMmFq4k5auD0blWpyJWEj6S4S
	 i907OGNh7HCcaAxx89YpGKLw/2fS0XD/IOVuY7nMoSCRJeLeTro4S7h/+RUGyDXiXv
	 rRe4HZRpTkCvJe+Z+S9HiCR+oxw20JxX8MBCWN8SrqAs85x0I7cMIQu5hlVuX/LTN2
	 PmrssxhUX2PtQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DE2517E1274;
	Mon, 27 Apr 2026 23:57:44 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:20 +0300
Subject: [PATCH v2 02/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-2-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145747_037459_0AA13A45 
X-CRM114-Status: GOOD (  10.64  )
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

Additionally, remove the now unnecessary workaround of using
vcc_5v0_hdmi as hdmi-pwr-supply solely to drive the GPIO into its
default state.

Also rename the hdmi_con_en pinctrl to hdmi_tx_on_h to match the
schematic naming.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
index 749f0a54b478..4fc8496828f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
@@ -26,7 +26,6 @@ chosen {
 
 	hdmi-con {
 		compatible = "hdmi-connector";
-		hdmi-pwr-supply = <&vcc_5v0_hdmi>;
 		type = "a";
 
 		port {
@@ -138,22 +137,6 @@ regulator-state-mem {
 		};
 	};
 
-	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_con_en>;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-name = "vcc_5v0_hdmi";
-		vin-supply = <&vcc_5v0_sys>;
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
-
 	vcc_5v0_host: regulator-vcc-5v0-host {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -231,6 +214,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -655,7 +641,7 @@ &pcie0 {
 
 &pinctrl {
 	hdmi {
-		hdmi_con_en: hdmi-con-en {
+		hdmi_tx_on_h: hdmi-tx-on-h {
 			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.53.0


