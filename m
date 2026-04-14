Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E8BF9D0C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwRbuwQEQ1h0sG5vG0YnaM9lv8WKlbnk6SnRdTaA4QM=; b=AM0SvKoE+V8FI/LisdZmJ5WRhA
	mgYwO1XEnR1723nt36sBE05KTqSMU7UtKaoGm0AAE4uSGbrMsG1H8ahxgdXkw+py/URFRnHFOqowL
	NzcpDpe5S/7egHmDzQMcQJiu1BSObNZV35cbyLpxEPJ6M+6g3H+6Y3JTUV+4MFH/+9khjbjenG5nz
	8l+7DEW67hCWnJ8ebewbqEtpG8jYZ+Ptp4NsiCFomVAl1ayLBbhkx7w0qkm73wplpr1GWlFzUjK9W
	eJ2rsPm8xD8P39IotDULthFqP/IJNwRTWQbPi8HRPl0RECFIWL19zOLuW2IOGCBIuFwvOaYADZ8Qj
	g0a3qM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcD0-0000000HFid-3UNS;
	Tue, 14 Apr 2026 11:45:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcCv-0000000HFco-23rw;
	Tue, 14 Apr 2026 11:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776167127;
	bh=09+/PNoK8kcy3tykKGdhLQqIcG+vb4KRNjnvsVv0LZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nG/iCYRXf1WPLsrtsN9qfatEPYqVnMt33MFRH0S3mefMWqy/TRiwAI7IabAHel0m6
	 W2gmWxzULrYr93JzLIXR5dD83HM/Zxo5nD5IJtmmLU/8eFt6Y465zMCtTnu98c8GUl
	 hvibRgHkhoQFPcKyr7F0hVRspj30X6NVEyRaVSSGWgC/TuKJ/WeM3Y8iszkjytB8Vn
	 Qd0GHqjgoJDiBfh6rGzlTMmAonmmvnmaH/pLzTInU/RNqU9aGvB5rkqBUv+JwWr3qx
	 ccyp2b9JIvMHaqywnDi19PM6tDHu+DhSnGfxun8Uz/wFrpTIPinfEARaPNnGRRb1do
	 JPBWOK8pLbOgw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 838C417E1388;
	Tue, 14 Apr 2026 13:45:26 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 13:44:12 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-genio-common: add MT6360
 PMIC supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g1200-pmic-cleanup-v1-3-2a7193ed4e93@collabora.com>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776167122; l=1642;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=09+/PNoK8kcy3tykKGdhLQqIcG+vb4KRNjnvsVv0LZQ=;
 b=a4SI+ENVQILnLG7y6zfEQXevW4hMFOBxcQWmPneL4RxKKk+7c3dV/57nLiM+3mzCDzy4vmQGe
 6NI93vDFxSaAlLm7jols83aN2HOqnTZqT8/znfI95TdY64KyS/Mzi/Y
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_044529_777172_374B713B 
X-CRM114-Status: GOOD (  10.33  )
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

The Mediatek Genio 1200-EVK board has a MT6360 PMIC, powered by the
board system power rail (VSYS) and an additional system power rail
(VSYS_BUCK).
In the board devicetree, the power supply inputs for its buck and ldo
regulators are either incorrect (LDO_VIN3) or missing (LDO_VIN1/2,
BUCK_VIN1/2).

So, add VSYS_BUCK regulator node and the proper supply inputs for this
PMIC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 01e153137a6f..21dbcabe5e72 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -209,6 +209,14 @@ reg_vsys: regulator-vsys {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_vsys_buck: regulator-vsys-buck {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_buck";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&reg_vsys>;
+	};
 };
 
 &adsp {
@@ -486,7 +494,11 @@ otg_vbus_regulator: usb-otg-vbus-regulator {
 
 		regulator {
 			compatible = "mediatek,mt6360-regulator";
-			LDO_VIN3-supply = <&mt6360_buck2>;
+			BUCK1_VIN-supply = <&reg_vsys>;
+			BUCK2_VIN-supply = <&reg_vsys>;
+			LDO_VIN1-supply = <&reg_vsys_buck>;
+			LDO_VIN2-supply = <&reg_vsys_buck>;
+			LDO_VIN3-supply = <&reg_vsys>;
 
 			mt6360_buck1: buck1 {
 				regulator-name = "emi_vdd2";

-- 
2.53.0


