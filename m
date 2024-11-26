Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81EBD6552F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9oOV6Xf/f1fBBujFiCnK10GJBxK35mB0wxBS2n5gZfU=; b=mT/1vBD1u3ightlewShVQuYdeC
	dtOBKcUJ/SbZpuNF/fIoZG/CdTdg9ye6VKbJ5ojGMqjO0AnjuD8oqn0IKLUtvX17vjDQn4IlYmHWk
	g1hc55k7YbcJDZyTAcbg+XyuOZsUT4hZ9RKvly2QIwtfOkQZh4yhGad95oi2eUcsbAbcTIbACDKR3
	JR1jHzQZGZkL0ejLwrkDlNyJRl9D4Sr/KMQKibIm5uYxEuuYLB38RoQQTKKPxueRp1hrxGinSRfka
	6eWvmLRm/QEKn18OZIkffi5bgmwxtWnmWgJANtR5wAhWXEL28HlU4YPBRz1cAGIRt1RgswQm+qq51
	/udtlLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzS3-0000000BK42-08Yq;
	Tue, 26 Nov 2024 17:34:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzR4-0000000BJzQ-2WqF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 17:33:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3823cf963f1so3710337f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 09:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732642392; x=1733247192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9oOV6Xf/f1fBBujFiCnK10GJBxK35mB0wxBS2n5gZfU=;
        b=3fJJXHR+j6jUUkm52U/jjLnKE213VdthXJdUX77+b6GttwuHSwzOxKYdO50QC/X6X6
         umO5Yx91wsbGr3vBAP/xdpQ9yVRmNIz4oxDPMKD7nhkMk0+TGSrEcebU/G2pvS3voyvg
         XhrqOwon5EfZj24nvJ8SBzvANXBMgMNq58+cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732642392; x=1733247192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oOV6Xf/f1fBBujFiCnK10GJBxK35mB0wxBS2n5gZfU=;
        b=saO7iWBjLZ50lLD0NV4i+RLTne4WwA0yAXrNqFFbP/xO8/akrdCJppQn9u1xRrD7Z3
         k+45Fx/57HDr8CMYSOG9bslmcirTgK/2Dr3BvxOZ7PYpyT20vy2AAqmmcS+coRx1vlDu
         jxx1RKTi160uWGaaUqIs9/aQVw+q3IXJefRMr95gkdluGG/LHPxkNKODfrp5va9P5uBp
         HKkxTUXJCIG6FoQocPFaW5vIrYQ0Iy8zf5vaCkDFBiKx/8xhgLhL+4LMHzEJmL3qmxWM
         BvmOn9rt8XTAlqIpKJIAq7wMa4wNIVS4yqpQfFxsm93xnezSuj+At55JczBTQW3rMMZC
         rorA==
X-Gm-Message-State: AOJu0YzQ9gZgs7iRrr5tPRRt37YZMJwkzIbVE2hyFpE0Srj9eJZ2bffq
	vzU0oBJieMqv4z80JxZo3KbrGH9hg3BXLe999GQ/hDT6KtIbcMISz3DkIOZd+Vo=
X-Gm-Gg: ASbGncuoSqk2+jk10PDyWUE3miQPoxhwJbuAwtSkCb4BAA5DSMbZE51fZeOBhKirslk
	GCBaFXkiYTVMrbXG0Z6p3FL2J9fp6Qq5DtPJv8BRZmiJsghZRFtBLxAUzxE4SBd5qsJWptXNcAp
	oZ3CUzMXYEx1PTCTYEHd0tcy/bEO+itY922cXNtwLCeOg+otn5gcPgfotRIqUI6sDudh9zxN6WD
	8xvwcIRfSS9u1X1z3P60ySZlzHruwpCFs6vwO2M3KBcPo7ab0OibQXJhC4e36XTVu/06gNB52Bd
	QzRrAO1cYa5Q/l6pAHRcDlwvm6VWgkJls52xzOo5l5hdVKs=
X-Google-Smtp-Source: AGHT+IH+jDs/Oi/Yj699wtUEbjT8GQBWJI0mOVavIZ5Y1ZVm3lZYt0A+bSeHwUyDg6sCEgug0Vl6Ag==
X-Received: by 2002:a05:6000:18ac:b0:382:4b43:c3a with SMTP id ffacd0b85a97d-38260b45e0cmr16212760f8f.2.1732642391966;
        Tue, 26 Nov 2024 09:33:11 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbe901esm14043844f8f.87.2024.11.26.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 09:33:11 -0800 (PST)
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
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Tue, 26 Nov 2024 18:33:07 +0100
Message-ID: <20241126173307.4054601-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_093314_907406_AAC2FEE7 
X-CRM114-Status: GOOD (  12.26  )
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

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
---
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fb899c99753e..681e3af7ce6e 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -859,6 +859,10 @@ &pcie1_rc {
 	num-lanes = <2>;
 	max-link-speed = <3>;
 	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
+	/* There is no on-board or external reference clock generators,
+	 * use refclk from the ACSPCIE module's PAD IO Buffers.
+	 */
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 };
 
 &ufs_wrapper {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 0da785be80ff..9f47e7672922 100644
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
+		acspcie0_proxy_ctrl: acspcie0-ctrl@18090 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x18090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -978,8 +984,8 @@ pcie1_rc: pcie@2910000 {
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


