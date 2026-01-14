Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38224D31A03
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 02:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCpI65D0oblMDdNasvMDjX3qFjKZIlGsxI1HoIxu/T8=; b=gdo6H4MUpOJl90WA9I9v0WNXrW
	deUpJiCkXNZdLVqvsBxlA28vyA08u8UinY6RmIIu0PqLfI7V4h0Km8Wlr9hcLTvM3G0bMZvR/l+Q8
	SJxV3FPE6Np45z+aPA5eRkZiYnYhEMvX+BROmB+boYn4NErvxDKkEY3cBLpRXhSvp1T05fjNWyqzG
	R9X1nMQwc0v4BJD02s0YhrgrDxA/mesano1Y1wOYIuwjSR3B12a5LmOv9IvM+cZPpyoTYbxh7Ihqe
	Kj+5fQ3TTmQ7A8uD6EsuoeGtUV3IygrdX3DrOXP0ojl8t4wZyHtesBwoesMtnq2PILubMLxhjjl+p
	Bsc8dJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqEI-00000007yLh-052I;
	Wed, 14 Jan 2026 02:03:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqEG-00000007yL1-3WKR;
	Wed, 14 Jan 2026 02:03:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA8C760122;
	Wed, 14 Jan 2026 02:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86671C116C6;
	Wed, 14 Jan 2026 02:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768356203;
	bh=32z61EwVy0hrXyNqeVcLqxmPEJiKUI6PlPU8CzBJ0gQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pkC3qizkvBKVLsXkBC2Nqg8A2AdpTfYiAYfPJok5SmrgXNQjIY2Qb4D/tWLp3OQFL
	 YUIbd67xQ2c6KYE+TQcLV0z1NKv27tgCUUeesJbGu8oqDJUm9vAgJp/LoO1GlEhpB/
	 UaIekOfvzdryNHy3aMM9S7pm2mAooUSjeHOxQy6yHczrqAkI/xt5CJL+tKKxFRCet8
	 yALYGxHVHc4ygTWDzsByMcFH+6vSASrujB8+jKyEI7pZCDgUbmkG8c/hMDdsxlAKeS
	 nTaRmIINM/Z1bOqZAXGs2bRqVWVMg9HUcHaCL1+dI4CworIM02YajqyY2JkhHYslNZ
	 nziJam/1sYVgg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: broadcom: bcm2712-rpi: Move the firmware node down 1 level
Date: Tue, 13 Jan 2026 19:58:10 -0600
Message-ID: <20260114015810.701076-3-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260114015810.701076-2-robh@kernel.org>
References: <20260114015810.701076-2-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit b32673d226c9 ("arm64: dts: broadcom: bcm2712: Move non simple-bus
nodes to root level") moved the firmware nodes into the standard
/firmware. However, /firmware is intended to be just a container for
firmware nodes as it is possible to have multiple types of firmware
(e.g. SCMI, OP-TEE, etc.). Move the RPi firmware down a level.

Fixes: b32673d226c9 ("arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index 7d4742ebe247..d0b7137e07d2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -44,25 +44,27 @@ power_button: power-button {
 		};
 	};
 
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-
-		mboxes = <&mailbox>;
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
-
-		power: power {
-			compatible = "raspberrypi,bcm2835-power";
-			firmware = <&firmware>;
-			#power-domain-cells = <1>;
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
 		};
 	};
 
-- 
2.51.0


