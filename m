Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZHQHkfgr7bbDVI5JE38O8ISSZh2WLpfe6MPtLrETzY=; b=LpVEnfr44KKWSjdvCW2RwP9Axz
	4wHcuYP4Wx4th14nG1tk5PkBVDeq9DWeQzYXj8in7mO0hCcZR7r11p88Pn7b0bKt2/Tp3SmYMNOZJ
	gJh5z9Hm0/SXOOsIqXkWYL6czd4WdjjJ0BJ7egZlZ4fKtOSm/oDk82VPOTERaxfj49yRMNv1zYiDM
	RMDF22eodxIYby8utWbkBqC3uP6SC+Tl58sLEHMxwuh9nmTydQUDy7r01t5uY0Yb/2Nx+jmADV5Et
	dKSg4LePfUC5RFob9tLncf1KPrJpPBc/a39Pi4il+RTsPkNBQyC/7M2NGRHaOPPcgC9u5n7sqc/af
	pcEJWRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRtW-0000000B987-3ajv;
	Wed, 11 Jun 2025 20:17:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPJY-0000000Aj39-23EN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46D0F5C385A;
	Wed, 11 Jun 2025 17:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61536C4CEEA;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749663159;
	bh=bRM3LfTaCoklm62WkDu5Lqp1zfV1Oa3CIVtDIVt+xks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SsO2MG/dYSTnGXSknY9EKLxp9xuOI/v4MF0ZpZlNvQqGmE0FVIAZW15Sg5940yL6c
	 3si20e1QaWSdCbUDx+Dtc8uIY8Or8d8zq0qisYomTp5UMdDkNo1lL12pChXCnPzQ0y
	 gvIc6jE5jQ1SogEr6lQj+dQVOc7CvblmeXv08ImSjP8Uzrk9oZ0U0HhtFB0ClJ0kfC
	 OQOJzAAvpk26FNUpBHnzldo8rrM850o3/Jl8fBiLb9+AxJecIvtmnQc3Z1/bPu0FLu
	 TYCx4Ch4A59dFRy9nj3xb16ODIqUoYqWhEfV5eHRNnNfHocp+b9rkttzCuoUmhhX2a
	 b/q+wPl2KuRSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C12C71143;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 11 Jun 2025 19:32:17 +0200
Subject: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
In-Reply-To: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749663157; l=9121;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=dHo4NuQQ30tCV5k9Ip37kxDFTRR/INCJCzoQsAaFR4E=;
 b=2lN4t3g1K5qrJ6Bl4nyaHiUg3pSKWm/Nb1L02Hu8I0APcDNOfKSzUlaMfn7yDT89roBWaVHfO
 W1pesjSyeFwAW+QfReL8gYKwpDkIZ62zTl628sJOlb29orWiiTVb6I/
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103240_614759_B77AF7EB 
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add device tree entries for GPUs in M-series SoCs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 198 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000.dtsi b/arch/arm64/boot/dts/apple/t6000.dtsi
index 89c3b211b116e96ee0a5ea0c923c3ab824008307..3b60842045d4c3277e9530a13ef2811774209697 100644
--- a/arch/arm64/boot/dts/apple/t6000.dtsi
+++ b/arch/arm64/boot/dts/apple/t6000.dtsi
@@ -16,3 +16,7 @@ / {
 };
 
 /delete-node/ &pmgr_south;
+
+&gpu {
+	compatible = "apple,agx-g13s", "apple,agx-g13x";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index d2cf81926f284ccf7627701cc82edff31d4d72d6..60c65ad8fabccc153aa98f4431dc11f7551eca77 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -62,3 +62,7 @@ p-core-pmu-affinity {
 		};
 	};
 };
+
+&gpu {
+	compatible = "apple,agx-g13c", "apple,agx-g13x";
+};
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4..501ca82f41827e4882683e583b6feaf25a34321d 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -300,3 +300,7 @@ &ps_gfx {
 	// On t6002, the die0 GPU power domain needs both AFR power domains
 	power-domains = <&ps_afr>, <&ps_afr_die1>;
 };
+
+&gpu {
+	compatible = "apple,agx-g13d", "apple,agx-g13x";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-common.dtsi b/arch/arm64/boot/dts/apple/t600x-common.dtsi
index 87dfc13d74171f62bf3087401918d9d41eaac560..329bd084b63e3688547166a8d0c3d9ace5d6d937 100644
--- a/arch/arm64/boot/dts/apple/t600x-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-common.dtsi
@@ -11,6 +11,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -378,4 +382,34 @@ nco_clkref: clock-ref-nco {
 		#clock-cells = <0>;
 		clock-output-names = "nco_ref";
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_handoff: uat-handoff {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_pagetables: uat-pagetables {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_ttbs: uat-ttbs {
+			reg = <0x0 0 0 0>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 110bc6719512e334e04b496fb157cb4368679957..140e0ebc0421881899f276b81f3d747ae67a8871 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -302,6 +302,34 @@ mca: mca@39b600000 {
 		#sound-dai-cells = <1>;
 	};
 
+	gpu: gpu@406400000 {
+		compatible = "apple,agx-g13x";
+		reg = <0x4 0x6400000 0 0x40000>,
+			<0x4 0x4000000 0 0x1000000>;
+		reg-names = "asc", "sgx";
+		mboxes = <&agx_mbox>;
+		power-domains = <&ps_gfx>;
+		memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+				<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+		memory-region-names = "ttbs", "pagetables", "handoff",
+				      "hw-cal-a", "hw-cal-b", "globals";
+
+		apple,firmware-compat = <0 0 0>;
+	};
+
+	agx_mbox: mbox@406408000 {
+		compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
+		reg = <0x4 0x6408000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 1059 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1060 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1061 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1062 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "send-empty", "send-not-empty",
+			"recv-empty", "recv-not-empty";
+		#mbox-cells = <0>;
+	};
+
 	pcie0_dart_0: iommu@581008000 {
 		compatible = "apple,t6000-dart";
 		reg = <0x5 0x81008000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 20faf0c0d80927b2e18dd966a61b5507b322c72f..eeaea35a89e2f2c7f8e04d95e22ed6cc0ec3d5c9 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -19,6 +19,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -351,6 +355,36 @@ nco_clkref: clock-ref-nco {
 		clock-output-names = "nco_ref";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_handoff: uat-handoff {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_pagetables: uat-pagetables {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_ttbs: uat-ttbs {
+			reg = <0x0 0 0 0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -359,6 +393,34 @@ soc {
 		ranges;
 		nonposted-mmio;
 
+		gpu: gpu@206400000 {
+			compatible = "apple,agx-g13g";
+			reg = <0x2 0x6400000 0 0x40000>,
+				<0x2 0x4000000 0 0x1000000>;
+			reg-names = "asc", "sgx";
+			mboxes = <&agx_mbox>;
+			power-domains = <&ps_gfx>;
+			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+					<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+			memory-region-names = "ttbs", "pagetables", "handoff",
+					      "hw-cal-a", "hw-cal-b", "globals";
+
+			apple,firmware-compat = <0 0 0>;
+		};
+
+		agx_mbox: mbox@206408000 {
+			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x6408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		cpufreq_e: performance-controller@210e20000 {
 			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
 			reg = <0x2 0x10e20000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..b8fcfb6d93b27d4e314e706eb1f10eb58b15462b 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -19,6 +19,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -366,6 +370,36 @@ nco_clkref: clock-ref-nco {
 		clock-output-names = "nco_ref";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_handoff: uat-handoff {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_pagetables: uat-pagetables {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_ttbs: uat-ttbs {
+			reg = <0x0 0 0 0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -374,6 +408,34 @@ soc {
 		ranges;
 		nonposted-mmio;
 
+		gpu: gpu@206400000 {
+			compatible = "apple,agx-g14g";
+			reg = <0x2 0x6400000 0 0x40000>,
+				<0x2 0x4000000 0 0x1000000>;
+			reg-names = "asc", "sgx";
+			mboxes = <&agx_mbox>;
+			power-domains = <&ps_gfx>;
+			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+					<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+			memory-region-names = "ttbs", "pagetables", "handoff",
+					      "hw-cal-a", "hw-cal-b", "globals";
+
+			apple,firmware-compat = <0 0 0>;
+		};
+
+		agx_mbox: mbox@206408000 {
+			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x6408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		cpufreq_e: cpufreq@210e20000 {
 			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
 			reg = <0x2 0x10e20000 0 0x1000>;

-- 
2.49.0



