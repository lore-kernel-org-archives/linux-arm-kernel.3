Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD66AED7B9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jQkdskgRrF8zrq5o/00r4ATyHGOzB5Y2YhWM/kDmg0=; b=hOfeV6IxHKp0FPoihwapwkQYWz
	92LSRXx+lFGIoljz1hAKlu0ZWqYVLMK5M4/vxkjbZV2An3kQGTVo7xvw/PH26Y9Siduur4hOEmP0e
	WnEe94GN+P4V5PUNcLg+5n1gHtGf5fgkYrvjYYOoqIA08e80uG46a/Qrq1FNAOhhUF0v8olQddD97
	E5+Sr1Zep14bvhlh+281GRJBeiysqi9XRosUjsN2eUWnwvjYMFaL4TEwlc2GpD2dwlqGw2YcJS3Pf
	CHzDoeDngODuMC3EhWir3/mnmq+fKElZEqRP9p6y4CO0yWfY836vctnmDtxIjVEe/OJANXtT9oRR0
	qaZcRmoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5e-0000000H9XB-0jhb;
	Tue, 14 Apr 2026 10:33:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5a-0000000H9TL-0giu;
	Tue, 14 Apr 2026 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162826;
	bh=CAqKslDgGQDwmsCSssQ8gblfhCs2M1I9GlCASlmmWMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=akO65PxoL3q6PT4lIksNUy3k/SSlt08kGpGR+2+IDM9YokDklRgowkyCKthMo2SBS
	 pxhHVGWVyNqbK69IGirjoYoyyoIrMizQqhz/4tc6KHsHOfiLvCi1sd4igIvUs/NwOE
	 +hhJ2dlABLabyv/ncDdEIiy0sLrYL2RsUdooDt8FJEQsEqUnL+LCv70s9LDp3eVrMc
	 tKNFeTvvqoe8K/grIcty03FEPFEhCdGCAEUIQYySH0rfLFfYQE70Q5MFPFqG5YYEyB
	 Uh3vkYVUciifoFjD5mUjGLK11hkqU3q0ziJZPTVJ1S/q3z5YU5KvYm+ArWyO8jlr6G
	 mZZ/id9quznFQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09D8617E0ED3;
	Tue, 14 Apr 2026 12:33:45 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 12:33:31 +0200
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8390-genio-common: add MT6319
 PMIC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-1-3b8313e5ca8d@collabora.com>
References: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
In-Reply-To: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=2053;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CAqKslDgGQDwmsCSssQ8gblfhCs2M1I9GlCASlmmWMI=;
 b=IcS0geLyZmB8n7o7xyEhFAwKS/pmr5gwNUvxjZvCd9dEoaiD/Y/RegGvDdI/d9UH2dZK/Y9G9
 UZuv5P0O+drD7pOqalaa1N7MxsGZxRlSxhSDhpxLKq3sbgqdPNxw3OP
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033350_358227_7F82B9CB 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

Mediatek Genio 510 and 700-EVK boards integrate a MT6319 PMIC, powered
by the board system power rail (VSYS) and connected to the SPMI
interface. It provides buck regulators for CPU core power supplies in
particular.

Add the needed nodes in the board common dtsi to enable its support.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 2062506f6cc5..aab474d6c5f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1364,6 +1364,50 @@ &spi2 {
 	status = "okay";
 };
 
+&spmi {
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	pmic@6 {
+		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+
+		pvdd1-supply = <&reg_vsys>;
+		pvdd2-supply = <&reg_vsys>;
+		pvdd3-supply = <&reg_vsys>;
+		pvdd4-supply = <&reg_vsys>;
+
+		regulators {
+			mt6319_vbuck1: vbuck1 {
+				regulator-name = "dvdd_proc_b";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+
+			vbuck3 {
+				regulator-name = "avdd2_emi";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+
+			vbuck4 {
+				regulator-name = "avddq_emi";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
2.53.0


