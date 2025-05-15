Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0014C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eh0T96wKLgktaTelEG6ObfX69/VBJPDNHXqrV4gX0fw=; b=02eevJmLbdTeRLW2GE1iMDhovY
	27cKnUstLQbQVFCgZ0/Wj0hXiFokvXUIikmz6B5jL+LB473+WOk3CXA9S7y/DbtiWtHdn9pddtyWP
	1f4zQ4gAhmvQLliUcQC5sKjYeYfSN0oDZuc0ooJZV39LD5+8jUN3/DLYDnLFPQb7tM0xZ6YgxDU/o
	uFuClHZGVo9FHih6y3mOiUpdJppJIHROJwYWUwasK6BAXJw1HbfDAmCkwRVBZqLMrBO/Fe5SaCQwz
	9xi1ESD7lrSiVOI5GocI7OE95eucCCvqIMLELX9qEIhXuxMxORuhC3h53D2Y1349V3lomcRsDWRrP
	tqPYGw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVtC-00000000IlZ-3nrA;
	Thu, 15 May 2025 10:32:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVRp-00000000FOf-32cP;
	Thu, 15 May 2025 10:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747303455;
	bh=9y501ufUEZ0yQlM0egGSuDc18JW9Heg3tMa9gB6YWUM=;
	h=From:Date:Subject:To:Cc:From;
	b=NDC2IyK/TQNv0WwhDvWj4oxYM3AL9dmvJBhmjUPn381v4BfG61N2xSirwAZqjnnSI
	 wszjaCKVB2opyqF6BDHSbVESDLDxZJ9MnuplSfzhQPx//Ofx9dwQBsC2+uzpIH3pf9
	 k/pny/o17CdjkwZVSwEnjLphMYZROlwp0nni/NNbyTZvIfDGARxLBC8ftZzdjbofm2
	 JR6f4O3ZtE2s3r2K6LLjtpf/oAyE/8QzHhyL6R04kfnzvsJyk3WG1ajCFV0cpsfJYM
	 33hOf4gg0Y3cOm36K2IKOmKDkJT4tSteEEJwb0i9Teu8sC4HfyJwoesnbbFhcSCpWH
	 ECJbUkpx9BVsw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2275317E01FD;
	Thu, 15 May 2025 12:04:15 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 15 May 2025 12:04:11 +0200
Subject: [PATCH] arm64: dts: mt8365-evk: Add goodix touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-mt8365-evk-enable-touchscreen-v1-1-7ba3c87b2a71@collabora.com>
X-B4-Tracking: v=1; b=H4sIABq8JWgC/y2NQQqDMBQFrxL+uh80GhGvUlzE+FJDa2yTKIJ49
 4ba5cxi5qCI4BCpEwcFbC66xWcob4LMpP0D7MbMJAupClVWPKe2ahRjezK8Hl7gtKxmiiYAnrV
 slDR2tK0C5cY7wLr917/3Fwd81rxJl6RBR7BZ5tmlTnjsif+rmvrz/AKeNjh/oAAAAA==
X-Change-ID: 20250513-mt8365-evk-enable-touchscreen-a2652cfdf85e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747303455; l=2499;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9y501ufUEZ0yQlM0egGSuDc18JW9Heg3tMa9gB6YWUM=;
 b=ABT1kxQ2/Bxc9QowYRZKtUgQi3TrLS9pcrXkEjcgctmKc588DxeIVkj7SrSvJRZ9KnxTQciDq
 yWpVrSDDURKBNzLJnGYaIsEHq/AqDlEpXsGvm72+ULnp90y6Qmcpc0b
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_030417_917227_5718179B 
X-CRM114-Status: GOOD (  10.68  )
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

The Mediatek Genio 350-EVK board has on the DSI0 connector a StarTek
KD070FHFID015 display panel that uses a Goodix GT9271 I2C capacitive
touch controller.

The mt8365-evk devicetree already have the display panel support but
lacks the touchscreen support, so add it.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Tested on a Mediatek Genio 350-EVK board with a kernel
based on linux-next (tag: next-20250514).
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 1f8584bd66c33744c3a2f29ae9bb19c934588ce0..ea75f87acf746d61a982dadf0d96cff9076c06a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -69,6 +69,21 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0xc0000000>;
 	};
 
+	reg_vsys: regulator-vsys {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	touch0_fixed_3v3: regulator-5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vio33_tp";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vsys>;
+	};
+
 	usb_otg_vbus: regulator-0 {
 		compatible = "regulator-fixed";
 		regulator-name = "otg_vbus";
@@ -324,6 +339,18 @@ hdmi_connector_out: endpoint@0 {
 			};
 		};
 	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+		interrupts-extended = <&pio 78 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&pio 78 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 79 GPIO_ACTIVE_LOW>;
+		AVDD28-supply = <&touch0_fixed_3v3>;
+		VDDIO-supply = <&mt6357_vrf12_reg>;
+	};
 };
 
 &mmc0 {
@@ -650,6 +677,19 @@ cmd-dat-pins {
 		};
 	};
 
+	touch_pins: touch-pins {
+		ctp-int1-pins {
+			pinmux = <MT8365_PIN_78_CMHSYNC__FUNC_GPIO78>;
+			input-enable;
+			bias-disable;
+		};
+
+		rst-pins {
+			pinmux = <MT8365_PIN_79_CMVSYNC__FUNC_GPIO79>;
+			output-low;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

---
base-commit: ccb396cc1664a9a367831fb43de67776547354f4
change-id: 20250513-mt8365-evk-enable-touchscreen-a2652cfdf85e

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


