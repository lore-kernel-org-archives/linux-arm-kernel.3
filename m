Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BEACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vBlaBBnmx3kAAP6GWJUIbNgM0jex0g9du486VuC0F/4=; b=ixoLPoiInOkgBJo6TW9ClzP9XN
	Kk2+GtaDeNY+983i5rfQV9NHykZmiLzyLBK7v6aXJwLhZGygb4IEjE7MrwmX9/jE7kW06LiNAaDPZ
	hOBa3/3hFoyaBna2pFbEPO6+pMoXjkGA80QL1DkkuXNQFoE5vPkP08SOYYL5R+ljDrjlpQdCKolia
	GogBz5I2KIJVwVgWoX2Cf+vg7K2oMaYEYnaDCu5tEZAyPcqaXrqpBvjdgWexGFKm971I6fKaGHBf3
	Y427BqD3BvryEZgwCsYVITZSZM3Bnlytqa0B8uDrjDmn48ORInuKZxiW2FRqXSbYLIqd0clNpcIqt
	FOsaNfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60N1-00000001IEz-0QjS;
	Tue, 07 Oct 2025 05:36:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60Mx-00000001IEa-3JDF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:36:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1v60Mv-0002SK-Fp; Tue, 07 Oct 2025 07:36:13 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1v60Mu-002Li7-11;
	Tue, 07 Oct 2025 07:36:12 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1v60Mu-0000000C6Jh-12wQ;
	Tue, 07 Oct 2025 07:36:12 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 07 Oct 2025 07:36:02 +0200
Subject: [PATCH] ARM: dts: stm32: lxa: drop unnecessary vusb_d/a-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-lxa-usb-dt-v1-1-cacde8088bb9@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAMGm5GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNz3ZyKRN3S4iTdlBLd5NQkA0MLS2NLs1QzJaCGgqLUtMwKsGHRsbW
 1AF85bcxcAAAA
X-Change-ID: 20251007-lxa-usb-dt-ceb0189396e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_223615_884627_EFE583EE 
X-CRM114-Status: GOOD (  12.48  )
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

The LXA device trees are the only STM32MP1 device tree that specify
vusb_d/usb_a-supply and apparently not for good reason:

- vusb_d-supply (vdd_usb) is the same as the phy-supply for usbphyc_port1
- vusb_a-supply (reg18) is the same as vdda1v8-supply for usbphyc_port1

and usbphyc_port1 is linked to the usbotg_hs node via the phys property.

Specifying the regulators in the &usbotg_hs node is thus superfluous and
has been even found to be harmful in one instance:
Linux v6.10 was found to lock up every 50-125 or so reboots on the LXA
TAC when the DWC2 driver probe enables the regulators in bulk, unless
both properties were removed.

This issue was so far not reproducible on v6.17 (> 500 reboots), but as
these properties are unnecessary and different from other STM32MP1
boards, remove them anyway.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 3 ---
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
index 9eeb9d6b5eb0ed35d4a83b743e8007f19422e2ed..7d3a6a3b5d09ea06689ebca11eda48785207aa31 100644
--- a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
@@ -374,9 +374,6 @@ &usbotg_hs {
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 
-	vusb_d-supply = <&vdd_usb>;
-	vusb_a-supply = <&reg18>;
-
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index be0c355d3105b89d4374d4f6972c7927970f06b1..9179075f2ead14a4deb45fcd2cefd60ab426a8d8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -493,9 +493,6 @@ &usbotg_hs {
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 
-	vusb_d-supply = <&vdd_usb>;
-	vusb_a-supply = <&reg18>;
-
 	g-rx-fifo-size = <512>;
 	g-np-tx-fifo-size = <32>;
 	g-tx-fifo-size = <128 128 64 16 16 16 16 16>;

---
base-commit: 33f3d92bd1bee0e37d68124dd6e7df793a6af745
change-id: 20251007-lxa-usb-dt-ceb0189396e6

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


