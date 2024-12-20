Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCDRLPPWDcGti8coyNd682d20E0KhqF2o5/I2JJc2EA=; b=JOFwI1HDfZCs2PelewjdcPUwWL
	rYj28KOBWzQFPdV5F9l2dfndQ1jn39nILdz0B7KMRJlDAq2IOqkbDUWadLCH4zyFekWHWxEbxivsd
	cuMTVYg+HdGeFNypRVBwmr2gZnPWbqUybbBdOTBmAvPFKHio6jlxxNzEir+I5RJarQYB6AvuABplz
	0n7Sztf5OnEZXc1CkW+Y7nnWOyCXtM2b1H/v+Eap2W06V9tgezs0SlA+Cke46SaBO4sx/wNXTB9xu
	EAvBT40YUBMA0Imaghp3/NuP32JGOBcco7IEyyvZQokmhkC3bUypWMRIrTCDnb1WbVzgfT87KzTcn
	oxdoVtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg2q-00000005UIZ-0MzC;
	Fri, 20 Dec 2024 16:40:08 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg1f-00000005U8j-47L6;
	Fri, 20 Dec 2024 16:38:57 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id C3F4F3FDCC;
	Fri, 20 Dec 2024 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734712730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TCDRLPPWDcGti8coyNd682d20E0KhqF2o5/I2JJc2EA=;
	b=dzQevX09PCnDvB26L+eGgsTpqwknkfd01WZkbfEUIx1fEz2Droo65wE+q9pUgoK41PtWC5
	lPI8wVQHc1wo69OhuVSiz6q06hAEIZDy1VOZhWsSU6ge5th1lyTKjdZqOHWIr3zwGkNNHy
	HBXS5JpB6u4LdkdZNEbIJrHikQxqEak=
Received: from frank-u24.. (fttx-pool-157.180.224.233.bambit.de [157.180.224.233])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 0F2D0100488;
	Fri, 20 Dec 2024 16:38:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 1/2] arm64: dts: mediatek: mt7988a-bpi-r4: Add MediaTek MT6682A/RT5190A PMIC
Date: Fri, 20 Dec 2024 17:38:35 +0100
Message-ID: <20241220163838.114786-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220163838.114786-1-linux@fw-web.de>
References: <20241220163838.114786-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 896398e5-39eb-4fdc-9386-9802ef37f67a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_083856_180215_AA7C1712 
X-CRM114-Status: GOOD (  10.89  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Bananapi R4 Board contains a MT6682A pmic which is compatible to rt5190a.
Add its node to the i2 controller.

The BananaPi R4 board has a MediaTek MT6682A PMIC, a rebrand of the
Richtek RT5190A chip, connected to the I2C0 bus.

Add the relevant node and, while at it, also configure the regulators
from this PMIC that are used on this board.

Only Buck2/Buck3 voltage can be controlled by software.

BUCK4 input is 5V from BUCK1 output, and the resistor (mapped to RP30/RP31
on BPI-R4) configures BUCK4 output to 1.8V.
LDO input is 3.3V from 3.3VD, and the resistor (mapped to RP38/RP40 on
BPI-R4) configures LDO output to 1.8V.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v8:
- fixed buck4 and ldo voltage and extended commit-Message
- readded (send separately) after verifying with mtk
- left RB from angelo as this is imho only minor change
v7:
- dropped this patch due to voltage mismatch compared to schematic
v4:
- change regulator-allowed-modes of pmic as 2 items
v3:
- change commit title and text
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index d6f1fca3323c..27edc6b84f80 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
 
 #include "mt7988a.dtsi"
 
@@ -66,6 +67,55 @@ &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
 	status = "okay";
+
+	rt5190a_64: rt5190a@64 {
+		compatible = "richtek,rt5190a";
+		reg = <0x64>;
+		vin2-supply = <&rt5190_buck1>;
+		vin3-supply = <&rt5190_buck1>;
+		vin4-supply = <&rt5190_buck1>;
+
+		regulators {
+			rt5190_buck1: buck1 {
+				regulator-name = "rt5190a-buck1";
+				regulator-min-microvolt = <5090000>;
+				regulator-max-microvolt = <5090000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			buck2 {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			rt5190_buck3: buck3 {
+				regulator-name = "vproc";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+			};
+			buck4 {
+				regulator-name = "rt5190a-buck4";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			ldo {
+				regulator-name = "rt5190a-ldo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
 };
 
 &i2c2 {
-- 
2.43.0


