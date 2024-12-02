Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF2CD78326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OcRP67UkWqEX1kfwylj4ZfjPBj6iFSQEtH2rLKeSLI=; b=vsVBxKwhSA0LWT8kKFA5mty6Mz
	vSbd1tgGuRLbbFMSD5pkhzLMERhBGpS0k2PQTVM8FT9fOiC2bvpIc9mUFKIf1ecBAXge5PGfx86P+
	u9zYxwA8UswAw0PYyuGjoGjxWjP5pTJ9RvmRB0QjZznhVysIXu8+LoGD4h0Q3lUETR2gIi7A9pDnN
	3LfD9LccRqWGcEbLF7UuO6GeMPL1B8LdOhvk4af1rl+fgm5mHsZT4DWT7W/F1t+TLDVEsX/vYdLhu
	1+78P4aPmtmENzv7+5W+DdITdm15sF5S8nFSMWczXdlhd10bgze6lFH3Qu7tVYBGnPGVjBfoVZcnL
	ppo2pOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7e6-00000006V73-3D4U;
	Mon, 02 Dec 2024 14:43:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7UZ-00000006Sq2-19Ct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:33:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385eb7ee7e2so808393f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733150017; x=1733754817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OcRP67UkWqEX1kfwylj4ZfjPBj6iFSQEtH2rLKeSLI=;
        b=ikFxsOaRKKB8Sh4yqmIzfQIOGC1Ct7cJ2OSpWoIm+ossOfSunbB7VJIfFWaWtfGZtj
         hkZVXLE1sqKtpkGWjnOcpq024WtUlCG5XNzrNI9PoLoesWl0EydgZpF30O/7eQ//qry9
         ywfNCEMctzefO015LRHBDsEyJQt2Te/Zz4Eeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150017; x=1733754817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OcRP67UkWqEX1kfwylj4ZfjPBj6iFSQEtH2rLKeSLI=;
        b=HqZoMqFyW+KqL27Q3NgOJZzvOvo4uv+fFXCc8+ClRhVfeWlFXZDxJU1uFh1qZ7guG6
         I/BlWKEmbSKLm0kF3YlA0q+YiGgVnH4ZAinXErx6Z4tXJCU6YKhjNLHumz5A8iHQrOas
         BOs5aAr/tC89mjTMgTPhFL0Jkbw4IX7hZo438gymoRbpS5RQVXKaRN2zPb8QaAMp27Rj
         vQKK+odrgTegLnBkqvt9+8h2Bxaj2JqQk/nPzzGnKplhv6EZrUkG6bEp3OCq5/6J9+hx
         oHdT1/4cWEEj411/Eui/8+duEdRLU3V9Vmpvs6XR6/KWblWhNZMc1WHtG1yr1rroC4j3
         4Rwg==
X-Gm-Message-State: AOJu0YxVlPyuK3NkULevWPfPug84KWP7JkImJz50NJD9u4Kb7ljiTF5J
	jRZhpo8OFrP3ehv7MBfWOHJ6dB8skB66fgvMD5NAXd+w9PiUHQIgSiddNit9Ehk=
X-Gm-Gg: ASbGncsJNx3gveIJUbM048cqGbs2tqSjORQCAO9mgb3Q+q+Js+IYSc8lMdPjH0sH0pa
	kb8Jt7FSW026H2vF+zXBv9nDPcvhqK2zS7FPBBlvznteI0a0P7ppOP9ljOcLqGqgDAq6G00sWtQ
	TEdQ+2XEst9aXIWsSAEDXByzpIb/Fzk8I1zDXNfHSEfrWP/ifiUzAiM+8yq22GAo5dVW1guSh7F
	jfW2/asPUTHtfgegJ4NUEoabBskSKUclzYmXRG98bLxAeJJBpnQsEA83tcEhl8BY/+11+Puo8nl
	tQJn3ESHDyihk8wMNW36DIG6O2z5sJGzUNMD4X+RC8h5Fys=
X-Google-Smtp-Source: AGHT+IHIRiUC7pSf2CvIWjZMDX19I1R/wO3AhDavAhcZNTvCN4vMWcNnrOsyDB3TFGYdPtnX4ejb3g==
X-Received: by 2002:a5d:59ab:0:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-385f23a32e6mr4087650f8f.26.1733150017155;
        Mon, 02 Dec 2024 06:33:37 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eed2510esm4312569f8f.69.2024.12.02.06.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:33:36 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	Romain Naour <romain.naour@skf.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCHv3 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Mon,  2 Dec 2024 15:33:31 +0100
Message-ID: <20241202143331.126800-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241202143331.126800-1-romain.naour@smile.fr>
References: <20241202143331.126800-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_063339_320307_76C13991 
X-CRM114-Status: GOOD (  13.75  )
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

From: Romain Naour <romain.naour@skf.com>

Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
(CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
provide refclk through PCIe_REFCLK pins.

Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
module's PAD IO Buffers.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

v3:
 - update "acspcie0_proxy_ctrl" compatible to "ti,j721e-acspcie-proxy-ctrl"
   since this property is specific to j721e variant.

v2:
 - use generic style comments
 - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
 - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
   ACSPCIE buffer and its functionality is the same across all K3 SoCs.
   (Siddharth Vadapalli)

   "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
   J721E and all other K3 SoCs.
   For example, see:
   https://lore.kernel.org/r/20240402105708.4114146-1-s-vadapalli@ti.com/
   which introduced "ti,am62p-cpsw-mac-efuse" compatible.

   The same compatible is reused across all K3 SoCs:
   https://lore.kernel.org/r/20240628151518.40100-1-afd@ti.com/ "
---
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fb899c99753e..741ad2ba6fdb 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -859,6 +859,11 @@ &pcie1_rc {
 	num-lanes = <2>;
 	max-link-speed = <3>;
 	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
+	/*
+	 * There is no on-board or external reference clock generators,
+	 * use refclk from the ACSPCIE module's PAD IO Buffers.
+	 */
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 };
 
 &ufs_wrapper {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index af3d730154ac..32a232a90100 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-cadence.h>
 #include <dt-bindings/phy/phy-ti.h>
 #include <dt-bindings/mux/mux.h>
 
@@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
 			reg = <0x4140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		acspcie0_proxy_ctrl: syscon@18090 {
+			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
+			reg = <0x18090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 240 1>;
-		clock-names = "fck";
+		clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
-- 
2.45.0


