Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD76FFD4F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TwMlYHtn1hHdDn5Isnkx/wciN5cAnhYQxe2wbtS3FQc=; b=aRA/oP/psESQdAMcq+H1XHc6iR
	os/5XYgKCgm1ZqewVApG1dYPzQ0EOR/imW3o6hqq0KGT6FHPWbSKCxV+ouodUWcN5mu2N7kfKc1Na
	ThcNJHQvlEhDXE5QoUHhPQc9bwYjyheeKkF1W2wy3EgUJC+m1mneMGu6HP1c+rSnyK0T3snn+QKqH
	QbYbw4wxw30oLzcy53UsP5PI4jGaPjVFKBAdYiHUEaGYzWUeOPWNncgZrbmCdSkBCF3JgLWBybUeg
	nmpDjBU3IK3xt+g4Fwe+kPKxPfpzRnuk5bcyhtPFSm1EBDIcUoM3JAwxwBP9CURXg+hIg12+z6+Hj
	b8ZhhbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzhk-00000009tIb-0V1a;
	Tue, 10 Mar 2026 16:13:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzhh-00000009tIE-3TXq;
	Tue, 10 Mar 2026 16:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3905F43C29;
	Tue, 10 Mar 2026 16:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D43C19423;
	Tue, 10 Mar 2026 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773159184;
	bh=7JoHv29OolzgIEv9y1w9pxw0Mu3pZSv8a8Og/54KOU8=;
	h=From:Date:Subject:To:Cc:From;
	b=bKSxIi/X7lmJgKndZfViruyVG4pOb+ccbjYjrv4+4n31isBUZqHzcxnovHfKGGutc
	 quk6k1i/9YdDmwkWbblp/SqUD8G6u8Fyu1A7YZTBP9/GEcCPecdT33/1P3CvRyjQw3
	 34P4jzicdQuZsdbVsjwL7zGIiBMOAKtyXf4iBBfK04dMf2wgP1EwDFDaA+EYKZKzBG
	 WHCbhOUlltRgLKENSEiP2GE3jtYIs9aTYW/QX6PAw27ZdcUDwMipPgEZYZAJo7swKV
	 VQvM9ISKfXPPccuMqij55jLIbbT5UbvYFcZIJ3ARf/SBRXb4avAim3kCR5LvkOx7qf
	 yY7SX6emM95Qg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 10 Mar 2026 17:12:47 +0100
Subject: [PATCH v2] arm64: dts: airoha: en7581: Add switch node to to
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-airoha-7581-dsa-switch-v2-1-852692ba68b8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dkxbQMCV9zAsCszQiYaSKUEN4
 e5WLuDyveS/v6mIwhjVNduU4MqRw5TAnjLVezeNCDwkVlbbi851A44leAdVWRsYooP44qX3QNR
 psgNh0WuVxrMg8fsI39vEnuMS5HP8rOZn/yZXAwaKoi5z3VXUGLo9UCZ8noOMqt33/QvCpD9jv
 QAAAA==
X-Change-ID: 20260309-airoha-7581-dsa-switch-ffb0f2dfe4c0
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_091305_935957_DD32AFD3 
X-CRM114-Status: UNSURE (   9.78  )
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

Introduce dsa switch controller node to EN7581 SoC and EN7581
evaluation board.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Fix ethernet-phy node name
- Remove unnecessary phy-mode property in ethernet-phy nodes.
- Link to v1: https://lore.kernel.org/r/20260309-airoha-7581-dsa-switch-v1-1-448530b7f91f@kernel.org
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 18 +++++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 84 +++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

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
index ff6908a76e8eb6cf91343495d1fe531a868e41fb..c84c8d4a6662e24531e0c22ef3a4eb13da2d52fd 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -395,5 +395,89 @@ fixed-link {
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
+				gsw_phy1: ethernet-phy@9 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <9>;
+				};
+
+				gsw_phy2: ethernet-phy@10 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <10>;
+				};
+
+				gsw_phy3: ethernet-phy@11 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <11>;
+				};
+
+				gsw_phy4: ethernet-phy@12 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <12>;
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


