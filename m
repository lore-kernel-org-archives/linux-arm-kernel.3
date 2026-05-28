Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FECD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHNBcfJMcJ3ZKl1i01/oPW7Q+AvyTAwOeBXjepY6MK4=; b=RYbQSJzenqbCs6acDUaT3BpAwI
	OW9Lh+vVteQSKJmytq6t/hzBcptz69NPG27beHsMOYyU/d4Ed3QsiVQu1fLGAGXrAXhYT/rKurO2F
	/zg8pKGanLiR9OPuBDlO3mJNlL25Yx1ow5jL6xwcEn93t92w+95JTBdb/FYXwe0xgNE4k4Tpqmuvs
	0HRHUhyJruAfA8rOe2PuVoCBSaFgYYoXZ673/aO4IhJvsPjR0DI0zoTIgtwtHBiydwQjSrxQ9SSNW
	Sd0Ba+PxM/Mp0AEUEaBAhaaSwkc/CAegUcJSmP/8BMtJEuvMWiuKLOJB0woqdYP03dPxqAQJ55VHG
	9TN00EYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFq-00000005kDS-0KS8;
	Thu, 28 May 2026 12:54:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFd-00000005k8P-2JWN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:54:19 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 741918E0;
	Thu, 28 May 2026 14:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972834;
	bh=N8Ms7YOn2QGbjugFPA+v2r5GXvn1LfJmcXoB+uWICwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iF7PR6ZQ8QJn8Hu3ZZAWmfFaFjSCLiL6APBTb7cwWTlmYORcvTeUwwxT5Erg7CHj8
	 mNa9t3qXgJqlyt8/iQD11ubJD7mJ30nKmSG1HOIzjTE+tMCIpHtpHm2dv11UONWanm
	 4enypFlR3vS0BhYMxjAn8S18iITTOvcIMOD/k7Ps=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:43 +0300
Subject: [PATCH 2/6] arm64: dts: ti: k3-am62*: Rename 'clock-controller' to
 'clock'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-2-a54ac5c8d081@ideasonboard.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=N8Ms7YOn2QGbjugFPA+v2r5GXvn1LfJmcXoB+uWICwg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDrxycB6BmSQ73NfGywRkMJaWPk95dIft+pl0
 pC3j6SSW3CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68QAKCRD6PaqMvJYe
 9S57D/41uTXC6qUiMePqkwVikrfRbAWayLx4/hlL1jjsnHqPWf5jtuFBB7RGmpb67dfu9eNrowO
 JQVZ0M8Ru6vcwdmggb3Kzc3saLgWRUmfwwUoqfxGwSusXp55BwUs87h8LQybFE3der5/RmD5Ekg
 l/hNikkF5Q/VaWtWWjmcwVFqby3gv16fWwfcJOLzQppsJ08ZegKgwFkrm2pfdc9BlvtPXhqCUd5
 kJQkBuN8SDfJ1fsFPOLAEcZZiovQ3sO8XoPCVfb89KhYwHzU8R3uXpSaihqw6OJWgmMhbxIDT8b
 2tiWKvUq4m1vZ5qje38Y0bVTBcrGIUKHpINvQFw+vPtbohPEHJpQ2R+t3tGaHQloimVLyBWFKQZ
 eOTXwUJUWEZJKCVpuq3qLLnRrOB+kozfzA+B/AB8Ikd4yvuG3MJ+x0TJcFnTHh5NO4720+iA8v2
 v1gplCnM9t3WRqBgUHpFPSBetPc/stl5WDGHu3PXu1Mo81pVxJojFolgFc05deC8OKeK7NnIFeq
 aWyNOR6OT52eDzN6h3AnYXAUAqDVo8RgZnPlSh4WkjyIdVqhNqNqUTjrAghRIWj6S410M+i1fUa
 bp3qJNHuR36cGy/icGjPLttMb4eelGV0mrYIayPsQTvZAhiIt7EW/A92pN7K789wr0ao8VH7gxL
 bX65LPwyI3ib8Eg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_055417_745636_2EC03EFD 
X-CRM114-Status: GOOD (  10.12  )
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

Multiple dtsi files have clock nodes with 'clock-controller' names.
Rename them to 'clock' to be more in line with the fact that it's just a
single clock.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index c5ee263d34a6..228f8c3e8bf6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -59,7 +59,7 @@ epwm_tbclk: clock-controller@4130 {
 			#clock-cells = <1>;
 		};
 
-		audio_refclk0: clock-controller@82e0 {
+		audio_refclk0: clock@82e0 {
 			compatible = "ti,am62-audio-refclk";
 			reg = <0x82e0 0x4>;
 			clocks = <&k3_clks 157 0>;
@@ -68,7 +68,7 @@ audio_refclk0: clock-controller@82e0 {
 			#clock-cells = <0>;
 		};
 
-		audio_refclk1: clock-controller@82e4 {
+		audio_refclk1: clock@82e4 {
 			compatible = "ti,am62-audio-refclk";
 			reg = <0x82e4 0x4>;
 			clocks = <&k3_clks 157 10>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e..9287d7be7cc8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -60,7 +60,7 @@ epwm_tbclk: clock-controller@4130 {
 			#clock-cells = <1>;
 		};
 
-		audio_refclk0: clock-controller@82e0 {
+		audio_refclk0: clock@82e0 {
 			compatible = "ti,am62-audio-refclk";
 			reg = <0x82e0 0x4>;
 			clocks = <&k3_clks 157 0>;
@@ -69,7 +69,7 @@ audio_refclk0: clock-controller@82e0 {
 			#clock-cells = <0>;
 		};
 
-		audio_refclk1: clock-controller@82e4 {
+		audio_refclk1: clock@82e4 {
 			compatible = "ti,am62-audio-refclk";
 			reg = <0x82e4 0x4>;
 			clocks = <&k3_clks 157 10>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d..7c2f03780885 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -46,7 +46,7 @@ main_conf: bus@100000 {
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x20000>;
 
-		audio_refclk0: clock-controller@82e0 {
+		audio_refclk0: clock@82e0 {
 			compatible = "ti,am62-audio-refclk";
 			reg = <0x82e0 0x4>;
 			clocks = <&k3_clks 157 0>;
@@ -55,7 +55,7 @@ audio_refclk0: clock-controller@82e0 {
 			#clock-cells = <0>;
 		};
 
-		audio_refclk1: clock-controller@82e4 {
+		audio_refclk1: clock@82e4 {
 			compatible = "ti,am62-audio-refclk";
 			reg = <0x82e4 0x4>;
 			clocks = <&k3_clks 157 18>;

-- 
2.43.0


