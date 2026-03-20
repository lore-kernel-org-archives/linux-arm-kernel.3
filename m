Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A94109879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgfH+yyFCOpHbt5MQPBJf8EValWaB+jNhI2P53p7Z9Y=; b=TLQIqVbHxvG3+htVZCOxZmE84i
	z/hEDwKLDxyOpCklb7rwJCN0FsuQlEgQ75m8f+nl7bC6I5BLw++s1OpO6qcVhOOWgAqTUBd8/2Gsc
	Jr3msic8zNsIF2STx61sDh0iQlyxFy+YIUWlcJIfCgiD1zvDXDUQy0KX1bmFlt56in92llBdoUffz
	pF/lv9xIlm93Fk2h+k+slMciVWRp9Xna5PPS6U5GRsyTlw/mjgBQ0SkBIaGZSnMUpVqPUzwANOxHI
	Zc5n1UDnVWDs5L4/3qHBAuhoZ0dK1tJPfC6KaNIH4KmM+UOz9VN3xHpTAynYHybikV2mQWAQEsUib
	AjXzLrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c5D-0000000D40P-3cjW;
	Fri, 20 Mar 2026 15:48:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c57-0000000D3xf-3An7;
	Fri, 20 Mar 2026 15:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6123643DD4;
	Fri, 20 Mar 2026 15:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3109FC4CEF7;
	Fri, 20 Mar 2026 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774021693;
	bh=mEc+1uLjL9dycMUaTvmDCS4x7VxVivEN3IIYODxbeDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RkeiQZXch+Ei5Sa2wzijtHOrnF2ndvL+HxYvQtJB2GoEW5X1c0wUQc2t/+SD38u50
	 zD9dQxiBvQyvKLbsotmMbRL1aw/qdaYStWhUH+Z4ABLJZ2JOyK2MXXFybODkvj6r0R
	 9gd6cuUJT9KHytCa9J778lCdlRXBVNB38wWHHEVOFghDgZH4HJACEQSSfz1Io+UKjX
	 s6c8xn4p/eeU/3OOr0l6TA6soA5k+m4fJdbcQyxwgQlncidFEi617kdJdXazCgKHHU
	 oB/u6IMa5ixasMduLy7f82Mk3PaWYgQN+eMu6p+vfZcoVxrxmtpWCIvoRBRaME5jbd
	 biqVlrqsQuxpA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level
Date: Fri, 20 Mar 2026 10:48:07 -0500
Message-ID: <20260320154809.1246064-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320154809.1246064-1-robh@kernel.org>
References: <20260320154809.1246064-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_084814_487603_23198660 
X-CRM114-Status: GOOD (  11.28  )
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

The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not
be under a 'simple-bus', but at the root level.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Rebase on v7.0-rc1
 - Move "raspberrypi,bcm2835-firmware" to a child node under /firmware
---
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    | 51 +++++++++----------
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  8 +--
 2 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index 04738bf281eb..d0b7137e07d2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -44,6 +44,30 @@ power_button: power-button {
 		};
 	};
 
+	firmware {
+		firmware: rpi-firmware {
+			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+
+			mboxes = <&mailbox>;
+
+			firmware_clocks: clocks {
+				compatible = "raspberrypi,firmware-clocks";
+				#clock-cells = <1>;
+			};
+
+			reset: reset {
+				compatible = "raspberrypi,firmware-reset";
+				#reset-cells = <1>;
+			};
+
+			power: power {
+				compatible = "raspberrypi,bcm2835-power";
+				firmware = <&firmware>;
+				#power-domain-cells = <1>;
+			};
+		};
+	};
+
 	sd_io_1v8_reg: sd-io-1v8-reg {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-sd-io";
@@ -189,33 +213,6 @@ wifi: wifi@1 {
 	};
 };
 
-&soc {
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		mboxes = <&mailbox>;
-		dma-ranges;
-
-		firmware_clocks: clocks {
-			compatible = "raspberrypi,firmware-clocks";
-			#clock-cells = <1>;
-		};
-
-		reset: reset {
-			compatible = "raspberrypi,firmware-reset";
-			#reset-cells = <1>;
-		};
-	};
-
-	power: power {
-		compatible = "raspberrypi,bcm2835-power";
-		firmware = <&firmware>;
-		#power-domain-cells = <1>;
-	};
-};
-
 /* uarta communicates with the BT module */
 &uarta {
 	uart-has-rtscts;
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index d57a9b1bff70..330a121ebfcb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -508,10 +508,6 @@ axi: axi {
 			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
 			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
 
-		vc4: gpu {
-			compatible = "brcm,bcm2712-vc6";
-		};
-
 		pcie0: pcie@1000100000 {
 			compatible = "brcm,bcm2712-pcie";
 			reg = <0x10 0x00100000 0x00 0x9310>;
@@ -648,6 +644,10 @@ mip1: msi-controller@1000131000 {
 		};
 	};
 
+	vc4: gpu {
+		compatible = "brcm,bcm2712-vc6";
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
-- 
2.51.0


