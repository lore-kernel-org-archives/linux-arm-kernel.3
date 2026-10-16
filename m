Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DADCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 05:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJ1pb/+SG1NnSbHAwzEHbYxvZ8v+WNe7B7g9BKpOR5U=; b=aXgmGL1k5DMj8hMfpAHM084/u0
	Y8UDRGGEchHRbyKVtJMZCutPfHjlYZKDw1rgreeSqldpewmyXyN4BaHd5vYsUOZ/1mLFNnNLnpSBt
	1/5HXDBi9CgFExxK4UuMhHMj9Ry+xoljH7MKondMsM3GPMWjkTHbMmWei/vxJ2GIJP9XFZ2TQRILo
	HV8ZoYFD28iRPZ8i+FDNPakaxfavzn9p2gTezF/7znX6HN4lmSG/hccYsLn1YX/cYA0V8o+Tq6Uw+
	01BZdxqnPMZCOFJnQiBZeTc0EZ+tW6l6S0ebzXfF323armLRJYu8tkLdUWftcpNkic0Uq9Rhww5my
	5SizAfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaaV-000000022Ac-0sic;
	Fri, 16 Oct 2026 05:34:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaaT-000000022AA-49yX;
	Fri, 16 Oct 2026 05:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FA4343E51;
	Fri, 16 Oct 2026 05:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDFF6C2BCF5;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792128876;
	bh=ZxsOdDqyqZ5PUwyuJkILZgVHvyQRAaYr9E2FOh0uF/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BO6uPG7yJFjXa+CepEYqALNbN8AC4h7DoYqHd/+IgkbCqNp0WBv7JGw67kK1c/ZF4
	 ExcMAgsH67HZg8t69fRURcAMqm4AWCIgjRp5y8FkpoBV1oM11AnvJEcd/esFzkrfT4
	 UBDNnRC/6y1PvjomtS90pFTnpEH3pJhays7HN0oX8uOCj+WBZFbFqYm8eu3VZlZ6j0
	 1uwOY6ON7B7IDtBh4lw8YeP0rV3kc/oR6n/fSnPSWftEGMq1ydpReKPyRRM2spmmDa
	 O8R+ofqJl7i9JL5zRlwhqcbMTuYkYEsx9YEiOeZhm+rzGgqBlAAFsYpanbL2npeHEk
	 E2YJRFG2Ogp4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBDDCC6B38;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 16 Oct 2026 08:34:33 +0300
Subject: [PATCH 1/2] arm64: dts: rockchip: Describe more of the power tree
 on Kobol Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-helios64-power-tree-v1-1-31d6c8dc5092@iav.lv>
References: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
In-Reply-To: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3722; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=8ZjlctZruWiHyaCJNzcvo71K9qLA5V8M8d4dh5Ckn8g=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkXt2fdmxnxeLKiXNIWuwOPLnT9kJh0ud/Mv8FixdlGw
 YPpCUbvOkpZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBE9G4wMmxoy/xw2qI804Rl
 RtSPJXLFz8QTWp4X/1w9J+rZhry1WtcY/pf839Zewv7msmGI7CyGA2ZPr7A05ex4ke775OefqQ+
 eWzMBAA==
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

Add the regulators that the Helios64 schematic shows and the device
tree does not describe yet:

- RK808 DCDC_REG3 vcc_ddr_s3, LDO_REG6 vcc1v5_s3 and SWITCH_REG1
  vcc3v3_sys_s0 (sheet 6),
- the fixed 0.9 V regulator vcc0v9_s3, fed from vcc3v3_sys_s3 (sheet 8),
- the hard disk supplies vcc5v0_hdd and vcc12v_hdd, fed from
  vcc12v_dcin_bkup (sheets 4 and 9).

The hdd_a_power and hdd_b_power switches each take both vcc5v0_hdd and
vcc12v_hdd (sheet 5). A regulator has one vin-supply, so the two disk
supplies stay without a consumer.

Link: https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..cf247d6c6212 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -178,6 +178,16 @@ usblan_power: regulator-usblan-power {
 		vin-supply = <&vcc5v0_usb>;
 	};
 
+	vcc0v9_s3: regulator-vcc0v9-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc0v9_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc3v3_sys_s3>;
+	};
+
 	vcc1v8_sys_s0: regulator-vcc1v8-sys-s0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc1v8_sys_s0";
@@ -215,6 +225,16 @@ regulator-state-mem {
 		};
 	};
 
+	vcc5v0_hdd: regulator-vcc5v0-hdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_hdd";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin_bkup>;
+	};
+
 	vcc5v0_perdev: regulator-vcc5v0-perdev {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_perdev";
@@ -271,6 +291,16 @@ vcc12v_dcin_bkup: regulator-vcc12v-dcin-bkup {
 		regulator-max-microvolt = <12000000>;
 		vin-supply = <&vcc12v_dcin>;
 	};
+
+	vcc12v_hdd: regulator-vcc12v-hdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_hdd";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&vcc12v_dcin_bkup>;
+	};
 };
 
 /*
@@ -383,6 +413,16 @@ regulator-state-mem {
 				};
 			};
 
+			vcc_ddr_s3: DCDC_REG3 {
+				regulator-name = "vcc_ddr_s3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
 			vcc1v8_sys_s3: DCDC_REG4 {
 				regulator-name = "vcc1v8_sys_s3";
 				regulator-always-on;
@@ -422,6 +462,19 @@ regulator-state-mem {
 				};
 			};
 
+			vcc1v5_s3: LDO_REG6 {
+				regulator-name = "vcc1v5_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1500000>;
+				};
+			};
+
 			vcc3v0_s3: LDO_REG8 {
 				regulator-name = "vcc3v0_s3";
 				regulator-always-on;
@@ -434,6 +487,16 @@ regulator-state-mem {
 					regulator-suspend-microvolt = <3000000>;
 				};
 			};
+
+			vcc3v3_sys_s0: SWITCH_REG1 {
+				regulator-name = "vcc3v3_sys_s0";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
 		};
 	};
 

-- 
2.43.0



