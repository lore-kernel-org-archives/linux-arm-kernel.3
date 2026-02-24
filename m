Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2AEEFB7F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vrQ0mwshRBYab2r4k57mA3X9nwlqOpIBe6PLaoR3Y5Q=; b=uy6dQG5gjX+ln7Ui2tRKfWZMZz
	ho+bxOiZO++mfuIMFNDt8cjLE6sCM0mAh5fcjZ2QiVGxcEaHhQzWltE428pJq5en61A69hoyr7Ou+
	gBywq0Y6KYcoiMGx+diGQ8/SOx/LjqZufj2IWuPTT+PhRJoEUj9iZxtVZtu8aU7Pa9GfiSJZ1M5iZ
	PpdmtrkiFfGRwcSzsBkaOG5rZqkEwNe680Cz2TJHM7NLgAovmtBLgS/X7m3cnRQvmc+l765qjcz9O
	hU2ds5Sch8KOeeZ55QP0+ZrIJQKx5Mrj6QiKKGVg879fw7OAShasNgea0izZiG39po+3C6j3RMGYc
	/ibEIapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukb1-00000001S2t-1Fy9;
	Tue, 24 Feb 2026 05:04:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukay-00000001S2U-1upC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEF95434EC;
	Tue, 24 Feb 2026 05:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86453C116D0;
	Tue, 24 Feb 2026 05:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771909467;
	bh=Px7YCJTLYs5dcI6uV0LeqCWSBT3HnluSpU++9H1U5Kc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=aR8C5yu4fQlNa6mCDKDrzfbVSB6C/hW3Aq2SI2ihLNqaXRnq7HSEVBlPxTLG91ip1
	 6dlYSey7wVC7CT3l0GutzT/NNWvrFa2JcNZ44mRCxlamuiLfA8JnHIWioPHCkIFCee
	 vqL6AM4Dk0XZKu+dhoIM3Ta5Ly0W/I7jfBEbDicla2CP3bDONhKQsUmVj+cAHbJdf7
	 RgRXMRloIs2O7h2XX5FM9jlsPoGQ+GSLuAoJjlvPmJKYy6X+P9HGEp4/D112S8O4Or
	 2yStczOqr5Be1pDupQdmuwsYMZ0HfipxNQcjoT36o0N1fbedlpmn7FPyY9wy0uT2jo
	 wX8kWGfy+gcvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAEDEFB7FA;
	Tue, 24 Feb 2026 05:04:27 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 24 Feb 2026 05:03:47 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com>
X-B4-Tracking: v=1; b=H4sIADIxnWkC/x2Myw5AQAwAf0V61oQuav2KOAhFDx7pikjEv9s4T
 iYzDwQxlQBN8oDJpUH3LUKeJjAs/TYL6hgZKKMqIypw7W9mLj1GbbMYjmdAcoV3ztfCPEBMD5N
 J73/bdu/7Aa9c1r1mAAAA
X-Change-ID: 20260224-max77759-charger-dts-23493398e77c
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771909466; l=1720;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=3jPKBl5MYkX7r6yLANmNLU9+YkyAc1+ak/0AsjI+qS4=;
 b=xTODcHq7YQIqPLOpbsQ57wvld95whooxac8lki1NNt9ZVz3sztOBRGNt96j+7mATnfkIxwmBB
 zEKUbhMJFStA6yMbG41n30f/UvvXDg+G1wf+8YOhqtJBep5TAgogwgd
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_210428_563417_29B2FAB0 
X-CRM114-Status: GOOD (  11.46  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Add power supply and regulator properties to the MAX77759 pmic. The
usb-typec device will reference the regulator provided by the pmic as
it supplies vbus to the typec device when operating in power source mode.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
This patch depends on the patchset [1].
[1] https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e9c@google.com/
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..2cc00d34dda8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -142,12 +142,13 @@ &hsi2c_12 {
 	status = "okay";
 	/* TODO: add the devices once drivers exist */
 
-	usb-typec@25 {
+	maxtcpci: usb-typec@25 {
 		compatible = "maxim,max77759-tcpci", "maxim,max33359";
 		reg = <0x25>;
 		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&typec_int>;
 		pinctrl-names = "default";
+		vbus-supply = <&chgin_otg_reg>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -236,6 +237,11 @@ pmic@66 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		power-supplies = <&maxtcpci>;
+		chgin_otg_reg: chgin-otg-regulator {
+			regulator-name = "chgin-otg";
+		};
+
 		gpio {
 			compatible = "maxim,max77759-gpio";
 

---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260224-max77759-charger-dts-23493398e77c

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



