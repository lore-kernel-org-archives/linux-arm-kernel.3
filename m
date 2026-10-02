Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B16CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoWOPzvU6ldRwWk+a5FnLlUUmRnqWTGt/FKWcjSL1fw=; b=xKK6Ub/9OREujMcSFDg99ufFVM
	OnvRTWtby0L2+dWtKwZ2wiBVdC+CYG2xluC3yG8R8XmSQqVdassoWb0ft13hegBSeRQE2jbqTM1Of
	K8fl9HuwU1sgB3gmM7+sPB+tsgpdZ8/aD0Av5LZ88m6iHkutlDdw0TuRdkRMRPnMyDpIRoVSpo8cm
	gV8bT+/z9+L8rLmbKzQQEDxRoH0NRnPlfT+av7E3pGvKDWdY1dUapkKuEIhUi0ck9cvRi4qaImFyr
	t12Y3OoVZHLTD6G4k1c9A5TrZpfMAIc5SL22miCHqAQqw+RA48eTrTBcEVgpoTIh7p77O6AFlQczb
	LgJ2pHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi7p-0000000CHeJ-09qZ;
	Fri, 02 Oct 2026 18:36:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi7l-0000000CHcv-330n;
	Fri, 02 Oct 2026 18:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C01B260AB0;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 613B3C4AF12;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790966208;
	bh=8mabWkB1QZPyJ7jiMjDf5gavLVLq2c6UrjUxdragye4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n7Awfpu2dmdNiFu6cViMaG21x35x+yr4RpScNuFma48E99V/ZBlIUifzZ/AyLLlDQ
	 tdnP3kJFjHygH4+/wPcMn1nswygSl9PdngEVE9XhXkIaLJokRRy+h5gyZ8LDGhPdfN
	 NA1HMSWrqLi76d8UpbLDqW7KROG4p/AhzZ5wTBRNPDMmi9Yk3ZaXcfJtiNVH5jsHr4
	 GECGA2e01GwyDUPVI5D3KCTfC97UzxI8mN1cznDY9UKAxzC+YlvfxybhmrOTCOBdic
	 wc1RwY/MtvyggGGjFTTpyCptOX7BJpd5pzxfvUwQ9ZqMwXuPWL4aN/K2uiihtmwXPn
	 ucXMde+gKokug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D8ECA5FDD;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 02 Oct 2026 21:36:46 +0300
Subject: [PATCH v2 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
In-Reply-To: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2206; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=qv7t3hORjY3jRiTyrWVKO4vO2S8H8j7Lyh7tlemugqg=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn7f+5ztuZMzuk5vvpavrRqh3LenYmnpr9U+basd5J2r
 uta3ssGHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiE6cy/BWarM7zMb882Ear
 6ZTz3J+ZPv4xJbZTunWflPGeclJ8pMfw3z/Ljv8F4+3Mmq9HTQ6tu2v+KYJjxaU395Vtsma+3tJ
 uzw0A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The SPI NOR flash uses six lines, but nor_pins covers only four: data,
clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
so they keep the boot ROM setting. After a boot from SPI they are in
the nor function and the flash works. After a boot from SD with the
button under the board, they stay eMMC data lines pulled low, and
spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".

Add them as a separate group in meson-g12-common.dtsi rather than to
nor_pins: whether HOLD# and WP# reach the SoC depends on the board. The
HC4 has eMMC disabled and takes both groups.

Tested on ODROID-HC4: with BOOT_3 and BOOT_7 set back to eMMC with
pull-down and spifc rebound, the flash fails as above without this
patch and probes as a 16 MiB mtd0 with it.

Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 00609d2da674..3135566df880 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -615,6 +615,15 @@ mux {
 						};
 					};
 
+					nor_hold_wp_pins: nor-hold-wp {
+						mux {
+							groups = "nor_hold",
+							       "nor_wp";
+							function = "nor";
+							bias-disable;
+						};
+					};
+
 					pdm_din0_a_pins: pdm-din0-a {
 						mux {
 							groups = "pdm_din0_a";
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 3ece30a0a1ff..c4b93d6619f2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -126,7 +126,7 @@ &sd_emmc_c {
 
 &spifc {
 	status = "okay";
-	pinctrl-0 = <&nor_pins>;
+	pinctrl-0 = <&nor_pins>, <&nor_hold_wp_pins>;
 	pinctrl-names = "default";
 
 	flash@0 {

-- 
2.43.0



