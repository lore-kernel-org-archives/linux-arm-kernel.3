Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E51CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeoXivUMSMZOUdm9E1b1+7fzZ8rfIj1eekPuvAamVYo=; b=x6pcr1UMlUxS7uZlSE2ibleOZY
	SkEkchoD35S+cUubkt6eillHmP3IDuIG8IyEHzJnpkDOg1J5emfM23vYCXD1AudxJlooP/c8/xByF
	CEzlaOG5wrFxWNR2VovDrsrP/NS7A7cw0rMH2wC/AJ3NrQzMybXNIWxXsvsb6JbiWiMbd+rTf4NrG
	MxTbD/6iMx+z9DxxAPb03zFqWTQA4qTY6M0/kTqsM/LH1dzIhdJTn37IGv4Z1YdsKYozQSB2N6sPj
	WMVMwJOgXGuEVzw2nNMMZgmziKeqnroDOgTiOlTXH2h+T9GiOt5Q9jz9ABUr/qjyUgv2haIDw37K5
	PVh+ej0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7F3-0000000HMZm-35W9;
	Thu, 21 Aug 2025 15:30:17 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3KM-0000000GjWH-0xgU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:19:31 +0000
DKIM-Signature: a=rsa-sha256; bh=TeoXivUMSMZOUdm9E1b1+7fzZ8rfIj1eekPuvAamVYo=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1755775106; v=1; x=1756207106;
 b=asvtgowCtq20brGTP/+zGKWPSmk7nzucKC1QLpj1yp6vFIhGM+aWKw1zvSdf4LAQm/JkAIFW
 RzwUPYet8nZeVXUky2OHG8GmKHcGIAqhYQnqAdZQjMB2LZLzxCQ8iGkVeBDATkGMcMPOcv84HXB
 aTdmHAKG9BVHONsiWguJP+ra2Zg8n2QSAvdAuMcyFlmb4ADrq70gao7r5wVLlh5I+cvY1Pj6eTx
 Y8k2J606NyysMyPeWWKJzxtht+albinI9zqFZH82NwKdHKjmeALhuQMuXhdf2zomkrPHSTPT8ex
 FwiAMoC7wFqheOmCw2KAXIX1YV55tTFuVMLD7gTrKQTDQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 8a00f894; Thu, 21 Aug 2025 13:18:26 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Thu, 21 Aug 2025 13:17:46 +0200
Subject: [PATCH v2 4/4] arm64: dts: marvell: pxa1908: Add power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-pxa1908-genpd-v2-4-eba413edd526@dujemihanovic.xyz>
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
In-Reply-To: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=va+Fk/D/QIqK+E/Wc67U3aTPeSCsla0Fk/GDekTcvpo=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBnLGepcbFdqhfmViLZPVj0cq7ZL9GhW1OvV3mc8ru8/s
 mWZo09fRykLgxgXg6yYIkvuf8drvJ9Ftm7PXmYAM4eVCWQIAxenAExkz3ZGhm/V0TL3F3t622xN
 PuvnkHnqonntpp/MmxzYWtqTD0z0v8DwP8nKcda89cyF5jW5WgpuM2yN2XyW2h59VHdWzS3zR7s
 JCwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041930_423152_76F71099 
X-CRM114-Status: GOOD (  11.96  )
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

Update the APMU clock controller's compatible to allow the new power
domain driver to probe. Also add the first two power domain consumers:
IOMMU (fixes probing) and framebuffer.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v2:
- Drop power controller node
- &pd -> &apmu
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                       | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077bfafe2cc50d0e59c37685ec9c2e9..d61922f326a4654a45ab4312ea512ac1b8b01c50 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -23,6 +23,7 @@ chosen {
 		fb0: framebuffer@17177000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_DSI>;
 			width = <480>;
 			height = <800>;
 			stride = <(480 * 4)>;
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index cf2b9109688ce560eec8a1397251ead68d78a239..ae85b90eeb408a8f4014ec7b60048ae1fd3d4044 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/marvell,pxa1908.h>
+#include <dt-bindings/power/marvell,pxa1908-power.h>
 
 / {
 	model = "Marvell Armada PXA1908";
@@ -79,6 +80,7 @@ smmu: iommu@c0010000 {
 			#iommu-cells = <1>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_VPU>;
 			status = "disabled";
 		};
 
@@ -291,9 +293,10 @@ sdh2: mmc@81000 {
 			};
 
 			apmu: clock-controller@82800 {
-				compatible = "marvell,pxa1908-apmu";
+				compatible = "marvell,pxa1908-apmu", "syscon";
 				reg = <0x82800 0x400>;
 				#clock-cells = <1>;
+				#power-domain-cells = <1>;
 			};
 		};
 	};

-- 
2.50.1


