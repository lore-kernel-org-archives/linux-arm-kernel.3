Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF2CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsTz3yxj73PvMooWjsRyjQL/jl+71VcPQ1lJJyc5WyE=; b=nLpCiX1yBzbk8WQ9cQTkuNtusg
	KXsqU6U3v3JuRM2Qs9CjsV+hX1HP67owQXI27qmjqABdiD5trw5LLMbYLeI82kw7176sAwpeFq2gy
	HFBgVAFHtKFu3mXD4kdN8gwFsrE9rFG28RPxCmds3aWlIo9M++F9U5ONu0vEwntzklRlB5gn49P8H
	u7LC+nxdcMnrfsNXTuXA6mTJhgLw5EHHZVKzH748lIVDFLtSKTs3AS4XfHu3L3QRMagm+AO52Ey1V
	pm/2ly6g5+D64MoSFmMYfm4O7TWJYvd7EtYWzWFaAOXLEItyaBvkL/ySiY4wxppTusklno5C0bEVi
	8cSGKK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJG0-0000000AEiJ-2JTr;
	Thu, 02 Jan 2025 11:20:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJBN-0000000AE4g-3344
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FC1C5C5B12;
	Thu,  2 Jan 2025 11:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC3B4C4CEE4;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735816564;
	bh=cEnF3ovwUU25dT0wsQm5L10I978yEVeevFbc61/RQ9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pC7/Iq/hYbOMU0dmtsCyG38BVc069b6zrNQ+D4jl5WSlJN1A3z7hpRDea6DtcMl3A
	 h82NEKQ9VBXwbPH5sjh82PqtjKGzocubCEjlaojhVDzJT1F/7KBPVhbiAWMarGvE5G
	 Buw/+qvSMLSbxmQngFePpvp7q0HVK7JEZnI4ZyQCgTQYPt550RP3nbLaN3QCqUmDqR
	 2Hjdl3Qq2pq+M8q7vVOOyOfHAIS/8t+sWFqwsHBM20jW+LI/uz1TRZo76jOrjigCvM
	 jCbfgIht/5UilrbzjAadxVFrDmNf+SJRxFLEJQlBnSMmdpsgFpBZgyr7GLx7TQ99Hl
	 9SS197wW5uZ3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29EDE77194;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Thu, 02 Jan 2025 12:15:06 +0100
Subject: [PATCH v2 4/4] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 fuel gauge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-gs101_max77759_fg-v2-4-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735816515; l=1485;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=GN3EniKaEOYE0aMNRzhLT0R4oirK05MCY9w8a0rDXYc=;
 b=eMvTZq9F+2RWFQ1BgK4RRLys8hBQwJ8vxzR3brqK5tBh//epZY74AciI9nsB10bwtDs1X2cbA
 YbKhbU97pEDDbvI3SWyzXLCMXp5vg1Z6AoNRMAQDFPtFUDxrpzy1Z+z
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_031605_923712_C87D76E9 
X-CRM114-Status: GOOD (  10.97  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

Add the node for the max77759 fuel gauge as a slave of the i2c.

The todo is still applicable given there are other slaves on the
bus (pca9468, other max77759 functions and the max20339 OVP).

The fuel gauge has been tested and seems to give coherent results.
Manual activation of the charger via i2cset shows that the sign of
the current does indicate charging/discharging status.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779bd29ea3812331a7951f03b181c5fe659..6c83ee6f8a6b0327c576573d03a8d2bcc93f9e16 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "gs101-pinctrl.h"
 #include "gs101.dtsi"
 
@@ -90,6 +91,15 @@ eeprom: eeprom@50 {
 &hsi2c_12 {
 	status = "okay";
 	/* TODO: add the devices once drivers exist */
+
+	fuel-gauge@36 {
+		compatible = "maxim,max77759-fg";
+		reg = <0x36>;
+		reg-names = "m5";
+		shunt-resistor-micro-ohms = <5000>;
+		interrupt-parent = <&gpa9>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
 
 &pinctrl_far_alive {

-- 
2.47.1



