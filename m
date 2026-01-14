Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3B1D31A01
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 02:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CxhfabfqHfoy2rmwJTw/vre1f6lSY+rCie9HZX0csJo=; b=hEpjiBjnT+Q7zt/ii7Zwol5lKa
	RBzTh9/Ekl9t2keqAMXqWzvZ5Rt0EKtcU7hQLi3HjfgyYGDY3xEoFu24tsfqNYSoaKEbxP51xpj7d
	pxE8E2HG1k6neLbrgXbMTJSHjIlfGjxf1+U+KeiIjhIqvNq4IaUbtOXzqKhFDGzngNurWRwhZo4pW
	ocT/uBJqzpdpqw1QcRmXCfl/xfy8iOd7RzMUw3kK4/bvWg0qNa0Cq+Oy5oXmPQNqkKVIPlD0tEkza
	J0BABiG1F8rtLTMNIMSjAMfDX5Q2tODAL86EWESUp7v0V+YT/05orBOuYrSZ9UlGmfwZC8I7LKapA
	/KXpjtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqEK-00000007yMC-2m8c;
	Wed, 14 Jan 2026 02:03:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqEF-00000007yKi-3CqE;
	Wed, 14 Jan 2026 02:03:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45E834196A;
	Wed, 14 Jan 2026 02:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A684C116C6;
	Wed, 14 Jan 2026 02:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768356202;
	bh=yFbkxFCU7bO4mP+vJps4q8S+uY+tRboWsVAKRRqO10U=;
	h=From:To:Cc:Subject:Date:From;
	b=vGJlPSEAAmyZGYsg/593nt9m+VyBtlmeBfWJmtip63HJlieqkb2xwjVfIuDYK9xpM
	 I56+ED6npi85wQo6KJJJwRSY/ItcBqmYPev8YVZAx7RfiyXTfPWHZLs0adBg6QDsBX
	 CfgN79sAEZcgfUPLJz38HjeQ/g9J48/uVS7U2UV0lgG+s27PZ4LYQhYsydPBzSDms/
	 Iw3Z47AmkvIe+IazLnqXTbalYB5OyR14N06wKD5t61Be9YcY9C3+sTzAXZxMkI7ijM
	 lhtWyNl9S0OOa8j2CY41JRkRuzCtApo++3k3N6MJka1QbbdHCxAR16MTQ/w8XqnTLq
	 0sWJNKqnXTbZA==
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
Subject: [PATCH 1/2] ARM: dts: broadcom: bcm2835-rpi: Move the firmware node down 1 level
Date: Tue, 13 Jan 2026 19:58:09 -0600
Message-ID: <20260114015810.701076-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_180323_833103_EC8B49E7 
X-CRM114-Status: GOOD (  12.80  )
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

Commit 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non
simple-bus nodes to root level") moved the firmware nodes into the
standard /firmware. However, /firmware is intended to be just a
container for firmware nodes as it is possible to have multiple types of
firmware (e.g. SCMI, OP-TEE, etc.). Move the RPi firmware down a level.

Fixes: 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
This is only half the fix. Unfortunately, a kernel change[1] is also 
needed to make this all work. I do plan for that to go to stable. I'll 
leave it up to the Broadcom maintainers whether it's preferred to revert 
the fixed patches or apply these fixes. A 3rd option is revert for now 
and apply these DT changes some time later to give some time for stable 
updates.

Rob

[1] https://lore.kernel.org/all/20260114015158.692170-2-robh@kernel.org/

 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi | 24 +++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index 9ab70b519a63..46c91468f4c5 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -1,19 +1,21 @@
 #include <dt-bindings/power/raspberrypi-power.h>
 
 / {
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		mboxes = <&mailbox>;
+	firmware {
+		firmware: rpi-firmware {
+			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+			mboxes = <&mailbox>;
 
-		firmware_clocks: clocks {
-			compatible = "raspberrypi,firmware-clocks";
-			#clock-cells = <1>;
-		};
+			firmware_clocks: clocks {
+				compatible = "raspberrypi,firmware-clocks";
+				#clock-cells = <1>;
+			};
 
-		power: power {
-			compatible = "raspberrypi,bcm2835-power";
-			firmware = <&firmware>;
-			#power-domain-cells = <1>;
+			power: power {
+				compatible = "raspberrypi,bcm2835-power";
+				firmware = <&firmware>;
+				#power-domain-cells = <1>;
+			};
 		};
 	};
 
-- 
2.51.0


