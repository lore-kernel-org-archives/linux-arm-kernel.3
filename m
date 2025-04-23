Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52198C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZzoNnU6a2yxot9Cx3CONPS/k4Nfm1sUyrGPDWYEUCbg=; b=ID/9eP3hjsvjBWw3Wof+B6P7kJ
	fQzXTJ7ddf+y8VNlVFCTzlMvbP4eQsCLCLgUmztev+YG03nE9Zt1/mQKnZWJteTooIrpn6YonnuyM
	hzDrNgUGHRjp/cEMEHjdyJfWt6umkgqN02ywR3EE4MP5IvwZP3svCGBCGOfJYBnKcA3Y4WQb6Ry1G
	TmHqHBPBR2cnnttrBI1bR97xqrezG7dMCDZH9OC7WFSS2dTOpa6SWIsrtAUdWkNq49EpYgIKbGac6
	olREsd5L4kWf3Jjw8W2r+aMqivNBPCgIxxevuM/giVSCEKAODYnKJ0eVdtnXTsx2oPLTNZbl5On68
	rSdETr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WtD-0000000A5VY-2hKU;
	Wed, 23 Apr 2025 09:59:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vr4-00000009pbU-1npV;
	Wed, 23 Apr 2025 08:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745398396;
	bh=KD9Cl3NthrDkg28+cyb3nHO/tjJn3qP+nuv9lHaS+YE=;
	h=From:Date:Subject:To:Cc:From;
	b=Z6ssTRoySSu3OVlfvIDl9j04yp9RSXUNLJboOF/eMsbAibPM1LQuA+fDT+Q2V4Zod
	 q4M5sddll854+FuVbxLoj+Xv+PtOPQ3uC6cUCy830q33HFbAHCZixzdCsaHryibEo6
	 sPeokSI/13wnOJjcHrbeuGy6DUPnM+lPre68C+/JZLSywXE3Nfm6Yh09hIkadQeMqe
	 Y9ZviPcZKlAQ3aPinwbetw1GLwEaXhNnti433ayGTCP5L0yjyDfxARkoMHP2s2WVVp
	 FHlLHoxznnt/c/rnAJWKsEIZVM++uc8udHSVL6fn19/R/VuzyT3nnuQhXaMLaQ+Vif
	 U75JlmtAGZX6A==
Received: from apertis-1.home (2a01cb0892F2D600c8f85cf092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 905DC17E0CAB;
	Wed, 23 Apr 2025 10:53:15 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 23 Apr 2025 10:53:13 +0200
Subject: [PATCH v2] arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP
 and sound card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-mt8395-audio-sof-v2-1-5e6dc7fba0fc@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHiqCGgC/32NTQ6CMBBGr0Jm7ZhSKKAr72FYlP7IJMCYFomG9
 O5WDuDyveR73w7RBXIRrsUOwW0UiZcM8lSAGfXycEg2M0ghlajLFue1qy4K9csSY2SPg9bSNLI
 TlfWQZ8/gPL2P5L3PPFJcOXyOh6382T+xrUSBlVBdW8vGKWtvhqdJDxz02fAMfUrpC+w9lgG0A
 AAA
X-Change-ID: 20250417-mt8395-audio-sof-baa2c62803df
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015318_654281_3A9083F8 
X-CRM114-Status: GOOD (  16.90  )
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

Add memory regions for the Audio DSP (ADSP) and Audio Front-End (AFE),
and enable both components in the device tree.

Also, define the required pin configuration and add a sound card node
configured to use the ADSP. This enables audio output through the 3.5mm
headphone jack available on the board.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
This patch series adds support for audio playback on the MT8395-based Radxa NIO 12L platform, which uses the integrated MT6359 codec via internal DAI links.

Key additions:
- Support for a new `mediatek,mt8195_mt6359` card configuration that does not rely on external codecs like rt5682.
- Proper memory region declarations and pinctrl setup for the audio front-end (AFE) and audio DSP (ADSP).
- A device tree sound node for headphone audio routing using `DL_SRC_BE` and `AIF1`.
- Enhancements to the DT bindings to document the new compatible string, missing link-name, and additional audio routes (Headphone L/R).
---
Changes in v2:
- The first five commits have already been merged into linux-next; only one remains pending.
- Improved the commit description of the former patch 6/6, now labeled as 1/1.
- Link to v1: https://lore.kernel.org/r/20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 58 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index f2eb1b683eb76f783f5a13f28a78f6e33238b5f0..329c60cc6a6be0b4be8c0b8bb033b32d35302804 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -139,9 +139,21 @@ bl31_secmon_mem: memory@54600000 {
 			no-map;
 		};
 
-		afe_mem: memory@60000000 {
+		adsp_mem: memory@60000000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0x1100000>;
+			reg = <0 0x60000000 0 0xf00000>;
+			no-map;
+		};
+
+		afe_dma_mem: memory@60f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60f00000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_dma_mem: memory@61000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x61000000 0 0x100000>;
 			no-map;
 		};
 
@@ -152,6 +164,16 @@ apu_mem: memory@62000000 {
 	};
 };
 
+&adsp {
+	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
+	status = "okay";
+};
+
+&afe {
+	memory-region = <&afe_dma_mem>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
@@ -514,6 +536,18 @@ &mt6359_vsram_others_ldo_reg {
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 
+	audio_default_pins: audio-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO70__FUNC_AUD_SYNC_MOSI>,
+				 <PINMUX_GPIO69__FUNC_AUD_CLK_MOSI>,
+				 <PINMUX_GPIO71__FUNC_AUD_DAT_MOSI0>,
+				 <PINMUX_GPIO72__FUNC_AUD_DAT_MOSI1>,
+				 <PINMUX_GPIO73__FUNC_AUD_DAT_MISO0>,
+				 <PINMUX_GPIO74__FUNC_AUD_DAT_MISO1>,
+				 <PINMUX_GPIO75__FUNC_AUD_DAT_MISO2>;
+		};
+	};
+
 	dsi0_backlight_pins: dsi0-backlight-pins {
 		pins-backlight-en {
 			pinmux = <PINMUX_GPIO107__FUNC_GPIO107>;
@@ -854,6 +888,26 @@ &scp {
 	status = "okay";
 };
 
+&sound {
+	compatible = "mediatek,mt8195_mt6359";
+	model = "mt8395-evk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_default_pins>;
+	audio-routing =
+		"Headphone", "Headphone L",
+		"Headphone", "Headphone R";
+	mediatek,adsp = <&adsp>;
+	status = "okay";
+
+	headphone-dai-link {
+		link-name = "DL_SRC_BE";
+
+		codec {
+			sound-dai = <&pmic 0>;
+		};
+	};
+};
+
 &spi1 {
 	/* Exposed at 40 pin connector */
 	pinctrl-0 = <&spi1_pins>;

---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250417-mt8395-audio-sof-baa2c62803df

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


