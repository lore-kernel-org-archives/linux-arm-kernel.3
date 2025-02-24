Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7928C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j/wogxQyMqJOZw/cKqplRsJOzCs4dyC1i7ioo6SpAes=; b=WhNImyrfcrto9WoGg+kgxQdQAP
	bTbTzKQ0Umd3HmmqNiWeOCGv31L/RwtOdoXI77J6OYEE7hVM8j2FNqXuleO6F19ytdPgIItTQirfX
	EmbhuzA7SysIc5dmY5vdfPH6aGLsARMIMQPbLrjVj/2Ie33buULckKZHUd5LPfxWaB10ZxQnpq5Ft
	jhw7PypMqNanDHtkzSpaXqOEe9RrLLG2PRLgqSl/mIHxZTBZfBldz/yFbnsSgBeRZs/aqiMybxCsW
	jhIQW281uXLLW8psRP5Uk4pq9wxm0iebLz5fxPrjF2KHJEKd7TGYXFl7Ixil/+2j62kOTGFDb+wbc
	hJi2JXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYdy-0000000Duif-2dXX;
	Mon, 24 Feb 2025 13:37:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYcT-0000000DuTt-0y8k;
	Mon, 24 Feb 2025 13:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740404135;
	bh=0+SnZnG6TPNZQrP0m+qSvmgEgFuRVE60uINmRg9g9ys=;
	h=From:Date:Subject:To:Cc:From;
	b=oLsQveRHjmirSaFKKszubQA9tkVE/oUsNKA5b30Trd7O6jr6D2lnx/wesfMVSc/1/
	 i7k2Y9EeoyAyvoJ6sGrnTIn08ORB8AxtTCXUc8wvDhyzSHrhQShLl5d9hZFCL0mzyr
	 rNawY1es6aW9/OTWn+bfqugTlh/rFFAu70LsLPOnmOAE5U6lDtHpXHCmocMNOGKAeV
	 pXyEkkClcxDNRQfDt/v13C98BjFeTurk2SYasjFNXz/6R6qq4W+tJCjzKN3EwakbZR
	 B3loXNBZw4G9rNWoo7EwWjUtWKgqEHvaSa6xnGp8mL1J2EtSJWeWm5knLhei+SKpFB
	 Q3r7EyBi/Kd8Q==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB2D317E00EC;
	Mon, 24 Feb 2025 14:35:34 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 24 Feb 2025 14:34:14 +0100
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Add display
 on DSI0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-mt8395-genio-1200-evk-enable-dsi-panel-v1-1-74f31cf48a43@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFV1vGcC/5WPwW6DMAyGXwXlPKMkQJeiadp7VD2Y4FFrIe4SW
 lWq+u4LZdcddvxs+f9+31WmxJRVX91VoitnlljAvFTKnzBOBDwWVlbbTlurYV5cs+9gosgCxmo
 NdP0CijgEgjEznDFSANKvjrzFEcmrEnZO9Mm3p+hw3DjR96X4lm2oBswEXuaZl76KdFvg19mu9
 zPljM82ffW2LUxjVr+ru12zb8HAWjfIxILenzhKPVJINEX58BICDpKwLoL3v/Kcactrtnat3Zn
 /5B0fjx+6rlVPSQEAAA==
X-Change-ID: 20250220-mt8395-genio-1200-evk-enable-dsi-panel-e078ec2adaec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740404134; l=5964;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=0+SnZnG6TPNZQrP0m+qSvmgEgFuRVE60uINmRg9g9ys=;
 b=AAKAfD3Q5a6mZsY6njOsoX7F6kFlJNNhLg8r85Kp3C0zppdAJKg05NDGDW0Z4EhhS98Zn2sOa
 /fF61134ShmCZ8XUb+WNZO3QgPIwZ7trOPgtIKu0Mi+txdegTGpvZEV
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_053537_430043_8603E515 
X-CRM114-Status: GOOD (  12.30  )
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

This board has a Startek KD070FHFID078 MIPI-DSI panel on the DSI0
connector, so add and configure the pipeline connecting VDOSYS0
components to DSI0, with the needed pinctrl and display nodes in
devicetree.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
I've tested this patch on a Mediatek Genio 1200 EVK P1V2 board,
with a kernel based on linux-next (tag: next-20250224) plus the
following patchsets:
- MediaTek MT8195/MT8395 Display Controller Graph [1]
- Add driver for Himax HX8279 DriverIC panels [2]

[1] https://lore.kernel.org/all/20250213112008.56394-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/all/20250218143952.84261-1-angelogioacchino.delregno@collabora.com/
---
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 125 +++++++++++++++++++--
 1 file changed, 118 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 5950194c9ccb2520d826c4d26f6dc0958a5a17fa..2679727bcf07d6b7d5e8aae5b717c2f31bad7947 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -91,13 +91,12 @@ apu_mem: memory@62000000 {
 		};
 	};
 
-	backlight_lcd0: backlight-lcd0 {
+	backlight_lcm0: backlight-lcm0 {
 		compatible = "pwm-backlight";
-		pwms = <&disp_pwm0 0 500000>;
-		enable-gpios = <&pio 47 GPIO_ACTIVE_HIGH>;
 		brightness-levels = <0 1023>;
-		num-interpolated-steps = <1023>;
 		default-brightness-level = <576>;
+		num-interpolated-steps = <1023>;
+		pwms = <&disp_pwm0 0 500000>;
 	};
 
 	backlight_lcd1: backlight-lcd1 {
@@ -150,6 +149,24 @@ button-volume-up {
 		};
 	};
 
+	lcm0_iovcc: regulator-vio18-lcm0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vio18_lcm0";
+		enable-active-high;
+		gpio = <&pio 47 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi0_vreg_en_pins>;
+		vin-supply = <&mt6360_ldo2>;
+	};
+
+	lcm0_vddp: regulator-vsys-lcm0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_lcm0";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&mt6360_ldo1>;
+	};
+
 	wifi_fixed_3v3: regulator-2 {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3";
@@ -163,14 +180,65 @@ wifi_fixed_3v3: regulator-2 {
 
 &disp_pwm0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pwm0_default_pins>;
+	pinctrl-0 = <&disp_pwm0_pins>;
 	status = "okay";
 };
 
+&dither0_in {
+	remote-endpoint = <&gamma0_out>;
+};
+
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
 &dmic_codec {
 	wakeup-delay-ms = <200>;
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid078", "himax,hx8279";
+		reg = <0>;
+		backlight = <&backlight_lcm0>;
+		enable-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 108 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&lcm0_iovcc>;
+		vdd-supply = <&lcm0_vddp>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_default_pins>;
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi0_in: endpoint {
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
+		};
+	};
+};
+
 &eth {
 	phy-mode ="rgmii-rxid";
 	phy-handle = <&eth_phy0>;
@@ -194,6 +262,10 @@ eth_phy0: ethernet-phy@1 {
 	};
 };
 
+&gamma0_out {
+	remote-endpoint = <&dither0_in>;
+};
+
 &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
 	status = "okay";
@@ -346,6 +418,10 @@ &mfg1 {
 	domain-supply = <&mt6359_vsram_others_ldo_reg>;
 };
 
+&mipi_tx0 {
+	status = "okay";
+};
+
 &mmc0 {
 	status = "okay";
 	pinctrl-names = "default", "state_uhs";
@@ -428,6 +504,10 @@ &mt6359codec {
 	mediatek,mic-type-2 = <1>; /* ACC */
 };
 
+&ovl0_in {
+	remote-endpoint = <&vdosys0_ep_main>;
+};
+
 &pcie0 {
 	pinctrl-names = "default", "idle";
 	pinctrl-0 = <&pcie0_default_pins>;
@@ -705,6 +785,25 @@ pins {
 		};
 	};
 
+	dsi0_vreg_en_pins: dsi0-vreg-en-pins {
+		pins-pwr-en {
+			pinmux = <PINMUX_GPIO47__FUNC_GPIO47>;
+			output-low;
+		};
+	};
+
+	panel_default_pins: panel-default-pins {
+		pins-rst {
+			pinmux = <PINMUX_GPIO108__FUNC_GPIO108>;
+			output-high;
+		};
+
+		pins-en {
+			pinmux = <PINMUX_GPIO48__FUNC_GPIO48>;
+			output-low;
+		};
+	};
+
 	pcie0_default_pins: pcie0-default-pins {
 		pins {
 			pinmux = <PINMUX_GPIO19__FUNC_WAKEN>,
@@ -731,8 +830,8 @@ pins {
 		};
 	};
 
-	pwm0_default_pins: pwm0-default-pins {
-		pins-cmd-dat {
+	disp_pwm0_pins: disp-pwm0-pins {
+		pins-disp-pwm {
 			pinmux = <PINMUX_GPIO97__FUNC_DISP_PWM0>;
 		};
 	};
@@ -912,6 +1011,18 @@ &ssusb3 {
 	status = "okay";
 };
 
+&vdosys0 {
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdosys0_ep_main: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&ovl0_in>;
+		};
+	};
+};
+
 &xhci0 {
 	status = "okay";
 };

---
base-commit: 907011b922144e5818f97d7c5a8d9a3c95a336b1
change-id: 20250220-mt8395-genio-1200-evk-enable-dsi-panel-e078ec2adaec
prerequisite-message-id: <20250213112008.56394-1-angelogioacchino.delregno@collabora.com>
prerequisite-patch-id: dd6662f92d7c58415b7e6ae2c576705457a1d4e2
prerequisite-patch-id: a86d97f71944c3c7a59376b02bda0901a33ee462
prerequisite-patch-id: 144478e815c29b03a11e4618bdd537d3576fcb59
prerequisite-message-id: <20250218143952.84261-1-angelogioacchino.delregno@collabora.com>
prerequisite-patch-id: 72961446cc5b827faac095c2d11121d045f93398
prerequisite-patch-id: 8c71dca8b54f1619d13aea34dca06c357abe8511

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


