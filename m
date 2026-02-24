Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C3CF55425
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 23:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TtQHbqJRklCVAmhB7N8xw3UA9FUVEr0xDfYbPAalLb4=; b=r1H2naquextdxEsiZ/t1GFXKme
	RAKD9WxxyW+D2wvimTEIIdtAFJ+ffYrAnPx0DGrY4hvMzivoBcz+EGVGjvJRiB64PtCPKcDsq9R93
	fzCFkkQmd+Er3MamFx7KOL9PAiOt5bGF2KpWdm+So99ViR4BMem8eIG2BuerjnVlfGiVaU+JsxTPk
	+QzxOnC6tLkHon/nTWE9IlZkt2Zo95Wb3o4JYwnN0O+wyzVwWGwggfZRyuiONI/+MyAIM1rcfSgmw
	OFmmpAqqAZ3Jq46bwq5pJAVZ8obd90g07pdb+/Q6ZnULJtWkk5s6eq43ZjVa5xYOuYtHuqw71m09x
	cgqkpgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1rT-00000002wDy-2oV5;
	Tue, 24 Feb 2026 23:30:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1rP-00000002wDZ-1aNR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 23:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7892F41697;
	Tue, 24 Feb 2026 23:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42786C116D0;
	Tue, 24 Feb 2026 23:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771975833;
	bh=ADR9CvrvUzc0kTvJQ47ZqNuoTDTeK64MKM9SscoqhvY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QDFfRfnFqEQ18E8DB2gcLKi7UVqZJraqiwjo4axwGgTLIerU0ht6DhKZ/B99VTqBk
	 MiV8xEbyiaLI9R1nX756iZsGKu5ovYqRMJ/FnSu7igmNX0qwySJDGu5HCQs3eMYYJF
	 EaKk2ccH/hT1oGdXcYgEoPsbO87WHdJrwvvdcSzYG83YxlU+pHfBiV2hscnjARUawJ
	 YOLnHSFVAWgg7S6X90qU1sC2ZDRvKnERxARbg0P51slifQDVkxsycoAbeAKm2dPBGC
	 H/LnQXGeiO8XUQMRbuTjmHqHc8Q+xwsMq2syOZ4OxUVtZO03X/F2WjsGeVpt01mJf8
	 6gITkWyv3tc7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE4AF55433;
	Tue, 24 Feb 2026 23:30:33 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 24 Feb 2026 23:30:09 +0000
Subject: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-max77759-charger-dts-v2-1-983265ac8e63@google.com>
X-B4-Tracking: v=1; b=H4sIAIA0nmkC/4WNTQ6CMBSEr0Le2mf6a60r72FY1PIsTYSSlhAM4
 e5WLuDym8l8s0GhHKnArdkg0xJLTGMFcWrA924MhLGrDIKJCxNC4eBWY4y2WOscKGM3FxRSWSn
 tlYzxUKdTpldcD+2jrdzHMqf8OV4W/kv/CBeOHJ9KSa20Z8q5e0gpvOns0wDtvu9f3olMZLkAA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771975832; l=2045;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=88wsB5MWvHCzIwGqyj8+p1i8avmUTsCvuP3h53Fmyv8=;
 b=dh7Wzn/BI6+sbCg7HzZuAnFKztyTTZjpc3QWBJVkfFGIWyd3aWswVHKJHeGu12064DZor3HAs
 Wq9qT3xRmsMCcFk2m99357uGLp58VjOtJ3IF0y9YaqYq9U8GL3xE4W9
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_153035_484841_68D23F5C 
X-CRM114-Status: GOOD (  12.15  )
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
Changes in v2:
- Added a line between property and child node as per DTS coding std.
  (Krzysztof Kozlowski)
- Added the "power-supplies" property immediately after the prev
  property without leaving a line space.
- Link to v1: https://lore.kernel.org/r/20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..14c1518bef81 100644
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
@@ -235,6 +236,11 @@ pmic@66 {
 
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		power-supplies = <&maxtcpci>;
+
+		chgin_otg_reg: chgin-otg-regulator {
+			regulator-name = "chgin-otg";
+		};
 
 		gpio {
 			compatible = "maxim,max77759-gpio";

---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260224-max77759-charger-dts-23493398e77c

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



