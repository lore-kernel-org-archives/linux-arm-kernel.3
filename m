Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CC9F417EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aIaNNoqpUBo808GUIPnwgiIcQ4MAyKT0448mvNxy0f4=; b=lqiAO9ou1xPhcYIbTrlY40Gksh
	8dV2mpM/v9F85VZYZZd23TWrHwBhZ+SSYFvbWfrWKi0BpHkmW+tTA7qODpdPLCXRl2lfMFQkEgZaa
	H0PF6rYQyPQXXYb1QIFxjFJatFOHvvlsLNDoRvNWocIqZRORuDCLEzI9BxYKg/ma7dtwJS3nsz6h3
	Q6EXTIpWh9Eh3VG9RPGwdpEGKaIJEhl7e+M/Mp0Ec+r/IrsygXBwUdkL9iqQo3PQFXH+aaiLIOb5u
	+tHEsw2tajh1tW24CPJAoXoJ5mUg/An3AmIqgzS4OiSf3jkppMmmjAt1cGnOdI6ht/dYDV2Vx87US
	qKx9CdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc9B-00000007YBV-2Bb3;
	Mon, 09 Mar 2026 15:03:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc9A-00000007YBI-1PrE;
	Mon, 09 Mar 2026 15:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1FFB60054;
	Mon,  9 Mar 2026 15:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15C5C4CEF7;
	Mon,  9 Mar 2026 15:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773068631;
	bh=6ZPA6FHZiUtujOKfWLTrb+gxh6+jEbn32xVsTeHNfxc=;
	h=From:Date:Subject:To:Cc:From;
	b=IHIox8hgWdJ8ow3jhwl1CgFjB5lcHiMgNtROnf//3fOq8mPKSaFvaqFPoOfZDPUcW
	 NGRkkIRzsVBSRrUk0Tl4N/O8nsXIfdBectEv9CrqUfsxNR3iJJ8F++ln/11Eaz5zpt
	 +fauVQGaF7i1sWZiQaX/JC0mYRQsnRjJTo0Ca9yVBfCF1hJFjpQ3vTTDmz/4+ZKgX4
	 5mnDD62riHVPDQx5J1IlKcpLg26Ulhpy/JjORY1GqSnW1Ygj3pEbnw8LCC0UFbwgZI
	 5Vfxu/6+zwwRzbmIuFIf1xxLL80EQBfPxa/T2D7o7pqwDxDMZ3iZ6cJsQhu/VaYeCe
	 LZvoOkFawWsUQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 09 Mar 2026 16:03:35 +0100
Subject: [PATCH] arm64: dts: airoha: en7581: Add switch node to to EN7581
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-airoha-7581-dsa-switch-v1-1-448530b7f91f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOQ6EMAxA0asg12PJhGWWqyCKkNjEDYzi0YCEu
 DsR5Sv+P8A4Kxt8qgMy/9V0XQrqRwUh+WVm1FgMjlxPDb3Ra16Tx2f3qjGaR9v0FxKKTCQuCre
 BoMTfzKL7PR7G87wAPRnFv2gAAAA=
X-Change-ID: 20260309-airoha-7581-dsa-switch-ffb0f2dfe4c0
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Introduce dsa switch controller node to EN7581 SoC and EN7581
evaluation board.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 18 +++++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 88 +++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64ce1a2a5496d35b8379fb4ac27dc2..4c6fca99ae62ec8202e211e18311f2ab7e18d2e5 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -81,6 +81,18 @@ conf {
 			drive-open-drain = <1>;
 		};
 	};
+
+	mdio_pins: mdio-pins {
+		mux {
+			function = "mdio";
+			groups = "mdio";
+		};
+
+		conf {
+			pins = "gpio2";
+			output-high;
+		};
+	};
 };
 
 &pcie0 {
@@ -106,3 +118,9 @@ &eth {
 &gdm1 {
 	status = "okay";
 };
+
+&switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio_pins>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8eb6cf91343495d1fe531a868e41fb..caabb07a7f689e3ad67742f32d3575dfc45e9061 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -395,5 +395,93 @@ fixed-link {
 				};
 			};
 		};
+
+		switch: switch@1fb58000 {
+			compatible = "airoha,en7581-switch";
+			reg = <0 0x1fb58000 0 0x8000>;
+			resets = <&scuclk EN7581_GSW_RST>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_port1: port@1 {
+					reg = <1>;
+					label = "lan1";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy1>;
+				};
+
+				gsw_port2: port@2 {
+					reg = <2>;
+					label = "lan2";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy2>;
+				};
+
+				gsw_port3: port@3 {
+					reg = <3>;
+					label = "lan3";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy3>;
+				};
+
+				gsw_port4: port@4 {
+					reg = <4>;
+					label = "lan4";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy4>;
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gdm1>;
+					phy-mode = "internal";
+
+					fixed-link {
+						speed = <10000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+
+			mdio: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_phy1: ethernet-phy@1 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <9>;
+					phy-mode = "internal";
+				};
+
+				gsw_phy2: ethernet-phy@2 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <10>;
+					phy-mode = "internal";
+				};
+
+				gsw_phy3: ethernet-phy@3 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <11>;
+					phy-mode = "internal";
+				};
+
+				gsw_phy4: ethernet-phy@4 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <12>;
+					phy-mode = "internal";
+				};
+			};
+		};
 	};
 };

---
base-commit: 405c09548a695ca7be58b5b9d3ac8388630e907f
change-id: 20260309-airoha-7581-dsa-switch-ffb0f2dfe4c0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


