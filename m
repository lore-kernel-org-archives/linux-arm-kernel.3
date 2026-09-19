Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79473C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1XPu1uv2XN4GeouRZ21yi4ZrmJuvnU82qGpPwwAmL+w=; b=XUNhTTEysCUMwEj8tZvW71tDVn
	oBqX6RVhEUdeASCPX1X0SXx8K/wMgVjPaZaPHtSobDk+FpfB191SYalmV7u5zaO1TZLYp0Tvn52mO
	q9nCttp/uAboRhj1h4Tev9S0OGz39tbLnTSjx6CxvMd/ePyhVLsoi4EC3a0S2u/ki0OeiF0rBPOiZ
	ptr/zOluVPFs5Q0bDEbxGsRTA76LH8pmbaGRiYUdJCqbXKvbsxm848tr+eszZVpktlmL2KTDDa0zy
	Q9N5AhbMrJbxvS4aUXpYW451EZ1aPtWCTwDk58tKpa8spp3c6baVbUDwYlM1IJCOC9tu7iP285m7t
	YaleQygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jV1-0000000FoEl-3uyZ;
	Sat, 19 Sep 2026 01:04:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jV0-0000000FoEf-3R1e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 01:04:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3058341E5D;
	Sat, 19 Sep 2026 01:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01E85C2BCB8;
	Sat, 19 Sep 2026 01:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789779854;
	bh=zslnNGNE5oa1grAjofOIMGeW6YrhIrAopuyB/35qdhE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kAUqVxDV4KC57L6Qzn1/MygVZzfUlgPc+sl8BOQQ4S0tr5NB2PaZfleh8zu0xnkuT
	 dvhW2UlKx7PZD6MrAIPSOuT/W7tCddcU8/mic25Cm0j/u6DjvPVqjo5LNgO9HdOSMi
	 kfo+4ury7+Z566I+j10fkekNAlKJtdIzqfPH3UwLNlBdJ8bIEDu5uAAIbCR0Jd9lVC
	 VBxkwaiq8H+zHHMbaUzUkqq0Dhp4OxNCmh30akt/6stLwJUPwbZui4VyyhceUGbeTC
	 tS5biRGomkaR3LY2Tdab4vDSYJ+ogucspzn2rSwdjSTLR4WpcGe0Avh4fgG6A3STpk
	 CXiInDd3ET8OQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5BDC982DE;
	Sat, 19 Sep 2026 01:04:13 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sat, 19 Sep 2026 01:04:10 +0000
Subject: [PATCH v3] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260919-max77759-charger-dts-v3-1-78b68fbf7d4a@google.com>
X-B4-Tracking: v=1; b=H4sIAInfrWoC/43NwQ7CIAyA4VcxnK3ZCozhyfcwHpBVRuKGgYXML
 Ht32W6e9Pi36deFJYqeEjsfFhYp++TDWIIfD8z2ZnQEvivNsMKmQhQwmFkpJTWUdXQUoZsSIBe
 ac92SUpaV01ekh5939nor3fs0hfjev+R6m/4Acw013IXgUkhbCWMuLgT3pJMNA9vEjP8oWBTdc
 myksS01/EtZ1/UDH3S0sP8AAAA=
X-Change-ID: 20260224-max77759-charger-dts-23493398e77c
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789779853; l=2698;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=H3o0xNkJTaPRJts1fDtzq2bsFqrsr68JNgCV5PXC4hE=;
 b=WDzv0jaKgpSBLo/lEduuK+4j/pX+X87tGgx6bpqVRhUSPl1/NMl8e1FF7uY8ghZGnB15jdeUE
 wRo9yz4Y3bnC57nOsWQmWSHaS5w6zxRHV/l4ri4qmMYDTx/WYIwLL2f
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
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
it supplies vbus to the typec device when operating in source mode.

Additionally, describe the charging path as well. The pmic draws its
input from the Type-C port and in turn charges the battery that the
fuel gauge measures, which gives the full ladder:

  usb-typec@25  ->  pmic@66  ->  fuel-gauge@36

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes in v3:
- Additionally describe the charging path from max77759_pmic to the
  fuel-gauge.
- Dropped André's Reviewed-by, as the patch grew a property.
- Link to v2: https://lore.kernel.org/r/20260224-max77759-charger-dts-v2-1-983265ac8e63@google.com

Changes in v2:
- Added a line between property and child node as per DTS coding std.
  (Krzysztof Kozlowski)
- Added the "power-supplies" property immediately after the prev
  property without leaving a line space.
- Link to v1: https://lore.kernel.org/r/20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index a12f2b88d72d..c366df36380b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -646,12 +646,13 @@ &hsi2c_12 {
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
@@ -738,9 +739,10 @@ fuel-gauge@36 {
 		interrupts-extended = <&gpa9 3 IRQ_TYPE_LEVEL_LOW>;
 
 		shunt-resistor-micro-ohms = <5000>;
+		power-supplies = <&max77759_pmic>;
 	};
 
-	pmic@66 {
+	max77759_pmic: pmic@66 {
 		compatible = "maxim,max77759";
 		reg = <0x66>;
 
@@ -750,6 +752,11 @@ pmic@66 {
 
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
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20260224-max77759-charger-dts-23493398e77c

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



