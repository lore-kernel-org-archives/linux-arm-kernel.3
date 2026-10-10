Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658CCCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 21:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=17FVK7eWRz1B7G+1EdaPpVfzeueR60tmjILNCItwc8k=; b=1d97L3qTevKa7NvICwYT5Wh8t+
	/G7XJUHYqUKLSF0M4fxf9RTK59o2lIy7Il6P7y3y7jTprvzsgN2PPI6BtLaXBsQ0PkfRC1C/ptc2q
	MoP4QvNPTxZjuSfD11begLiWHnaC7PvZ5D56SW6aWPVTx+kVMzQhkhVnnc0oA2f95iv+xEzS0WdlU
	gWTjQ7hppKNIgiQ6HWGG4xeGYv2pyA+ZREWyzeJThWewBkeZA6hE2aMmXXJ41HnrRh+Q2lhLwEAOX
	07aZRgqGDgVrPol1XcUp8lG2lG01rS5Lfq8LQxst3d0MxQ6RyYgaCenqVe9NcEzFn0COVkupaZBwF
	vVNWVz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFf05-00000008TEg-2tyR;
	Sat, 10 Oct 2026 21:53:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFf04-00000008TDe-0wUS;
	Sat, 10 Oct 2026 21:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C6F540A55;
	Sat, 10 Oct 2026 21:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C1FCC2BCB9;
	Sat, 10 Oct 2026 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791669183;
	bh=SB4ZAuEiQKRXeywG/ez21/G2gN88L39KmM6wGar9fao=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EprNz6NOKutoSUawMRz+SITbTbEiRm31R1ihhg3H2XwxlDF3CKXwoTz2NbX/K3XTV
	 XG7gUu2kelfn5BuJ8NK15TrfBgatr730n7+7xmAqjiteYB5yrmQWYcZsaKLGGl1Fl+
	 1vfLhGAuJwoAtTlJh4I4JBMlxszOn0A155T926lQh7IdzAKBLNCHivxs7AxVhEIJwv
	 5MpbEJx1+UuxyRBMYXoHRRzuFSWXu4uId1I+AMSPr+WGf2kEnhQ3htbvfRX0wlD6gP
	 cZwyT8qfg5vIcp0KS/AKE2G5VQVjZobxWdahsgBuuC/013flJbvRk4Tzl5zPeo4WbZ
	 SUMy/ebzYm0DA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2ADCA9ECA;
	Sat, 10 Oct 2026 21:53:03 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 11 Oct 2026 00:53:01 +0300
Subject: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
X-B4-Tracking: v=1; b=H4sIALyzymoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MD3SQT3YzUnMz8YjMT3fSCUl0jizQTY0vj1KRUU3MloK6CotS0zAq
 widGxtbUAwYhAdmEAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=QC0ldbg5vEEp/9pOfxvQQHo+177uJ6uj3YQwTElyKdA=;
 b=kA0DAAoWMpeVi+pfeQMByyZiAGrKs76jR2bGxizOiVPl+2Tkq9d9BhPKXJXtt97sdU9l4TP3Q
 Yh1BAAWCgAdFiEEkMIo2mik1f1PSDfgMpeVi+pfeQMFAmrKs74ACgkQMpeVi+pfeQOp0AEAlPVZ
 fa0yZOz1Z8GnX32xqyA7QSrRld40rIphRKp9DroA/0OkglmIjvWGiZ1QMVZ5LC3vUV3Xuj7CFVE
 rOCLpC+UO
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

The GPU core of Helios64 is supplied by U12, a Silergy SYR838 on i2c0
at 0x41, with its VSEL pin on GPU_SLEEP_H (GPIO1_B6). Describe it as
silergy,syr828, the way vdd_cpu_b (a SYR837) is described as
silergy,syr827, and enable the GPU.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Schematic, sheet 7:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Tested on mainline: panfrost probes, devfreq moves vdd_gpu from 825 mV
at 200 MHz to 1100 mV at 800 MHz, glmark2-es2-wayland under headless
weston scores 548-577 in three runs. Two of them logged one panfrost
job timeout each; the Armbian DT gave none in three runs.
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..1f50982291bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -339,6 +339,11 @@ &gmac {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-rising-time-ns = <168>;
@@ -453,6 +458,25 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
+
+	vdd_gpu: regulator@41 {
+		compatible = "silergy,syr828";
+		reg = <0x41>;
+		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel2_pin>;
+		regulator-name = "vdd_gpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
+		regulator-ramp-delay = <1000>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
 };
 
 &i2c2 {
@@ -538,6 +562,10 @@ pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		vsel2_pin: vsel2-pin {
+			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
 	};
 
 	power {

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261010-b4-helios64-gpu-28f4393ebe57

Best regards,
-- 
Igor Velkov <iav@iav.lv>



