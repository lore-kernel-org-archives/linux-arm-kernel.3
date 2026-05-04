Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5033CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiHmzyW88fJUN5kddb0F8xtOq/mVaFAhAdZFfLMC+wk=; b=uJyjfJeLClIe7tUmLD3zENab86
	Gk7Gmtjb38Q9CZ4uRXPXonaS1RSa2NHIamK49YKqVceawLX5gdSJZX77cBICUSGIDSKGEpmSo4q99
	+KxT3eq5VQGiuWhy1aPRLGKZs42Sgz932pDl9pMP9GpV9uIxBdG94myOcbTxVmcpjUBKSNJF1h2Id
	JrukB2xrJ//TcwG9TWkbR/vocgR/hKZmAZxUQBLegPD2ZI6v1ieUfZ6lxklAfixOxcLv11xR+18Ke
	gf+l8jrPH/2g2DyOUMSNtgHt+iZEr6QDpXZUo2mcLvtH/T1XZr0Wtx76ZfR79CycrwE2rP8wSUrPG
	ThUrWIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyq-0000000Dymb-2qUI;
	Mon, 04 May 2026 18:25:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyZ-0000000DyHE-0VjF;
	Mon, 04 May 2026 18:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C3FC446AC;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C000C2BCB8;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919099;
	bh=4qPDy49jygT3//9CQLjty/Jo02gzR1H6Rh0ksy7xUUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fatflkkyr4qCZ5LLVtK5tIbpgLFUIz7ELnQxINcEMqoRieia5+eZxVc3+0ehlKw1M
	 0LBKpHPx9GUo3ZhwBpZObj3UfGsKZbmPTzdRBCwBZnMtJXckdRp0ieiYAeXIbIOo9e
	 ZqHWjqcPqfBrbmsBYBZk210Xk6dlzrXLAT4vfjyH6oKog44W40qFFAobQQujWH6NL6
	 rKyB/XPfDr8nBj8fKdfvyhN/4SlexammzTg9CVIiY0rybuVaxhWdcZ8SF5ZqiWn9Ev
	 EOsojhVIotfAzxkvxlYO+HD0iBHR3DgHNnrE1IKqEWkm5Hiy2uYWzNSX/sO8peXecP
	 DhLqPp3VvVHLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD26FF885A;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:25:04 +0300
Subject: [PATCH 12/13] ARM: dts: mediatek: mt6323: add support for thermal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-12-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
In-Reply-To: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=1739;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=RnX15Bbq0POSOMld8rImsDthXoY2gvxd4clxXzA+bLs=;
 b=jW2y5q+4ec0II0RivLcNCB19jAdPdayHabag4j3LyuTqfh8CcsUQSchx+QYvx94osw2zOF/wY
 JeaBhZfg5ODAnnCm2PTOt7Ne47BabO61K4FNAWW8mMO1afuvQNniTBz
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112503_401649_D95872D0 
X-CRM114-Status: GOOD (  10.78  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 thermal.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index 3fe6a5e35e70..bdfa177aa1e3 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -6,6 +6,8 @@
  *
  */
 
+#include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
+
 &pwrap {
 	pmic: mt6323 {
 		compatible = "mediatek,mt6323";
@@ -21,8 +23,16 @@ mt6323_adc: adc {
 
 		mt6323_efuse: efuse {
 			compatible = "mediatek,mt6323-efuse";
-			#address-cells = <1>;
-			#size-cells = <1>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				mt6323_thermal_calibration_data: thermal-data@14 {
+					reg = <0x14 0x4>;
+				};
+			};
 		};
 
 		mt6323_leds: leds {
@@ -276,5 +286,26 @@ power-controller {
 		rtc {
 			compatible = "mediatek,mt6323-rtc";
 		};
+
+		mt6323_thermal: thermal {
+			compatible = "mediatek,mt6323-thermal";
+			nvmem-cells = <&mt6323_thermal_calibration_data>;
+			nvmem-cell-names = "calibration-data";
+
+			io-channels = <&mt6323_adc MT6323_AUXADC_CHIP_TEMP>;
+			io-channel-names = "vts";
+			#thermal-sensor-cells = <1>;
+		};
+	};
+};
+
+/ {
+	thermal-zones {
+		pmic_vts_thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&mt6323_thermal 0>;
+		};
 	};
 };

-- 
2.53.0



