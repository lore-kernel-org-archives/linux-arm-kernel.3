Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874FBCD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hNQa0nu5JLC2wDAZ3TFl9G1d85SJvU0L/GpOPAH2uEs=; b=ukhnL6NL+82iLWBzP3fxTWjJTQ
	qZEm/6Y9hLjOmE6munH7El1c+LlmYX2iwBgPbGWJshvDGQd+joEkQvTa1edzkvY86rDosexEW4Fmy
	4dVZR/cVrJ91wYEn1BpDhu7nyLsJrFTuOw4SjBamPr1u4QzEw5FpBrc/zs5LOCjIe9dDZ5GXJrhM7
	XfjKEfqHvP3L7v4kYYbaIyp5CJRLi0vcyJ1V4mp8OK8QYfzwMfXT7PYUiwf6fwqWjnJnDHHVuc/Kj
	GSayjOuJW4I36ibjUVfUsRU3c+XO6zIfsAgnnKKD4Ni7cy6VRHmrJwsB+Ik25dsHRopGLgQo4hv8I
	m4kn+WkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVT8P-00000000ZzY-2cbK;
	Fri, 05 Jun 2026 11:54:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVT8O-00000000ZzN-1ddD;
	Fri, 05 Jun 2026 11:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1C87441AB;
	Fri,  5 Jun 2026 11:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B32AC2BCB9;
	Fri,  5 Jun 2026 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780660483;
	bh=4quFrMpJWBka7KBZ3BJNo1AoS735u/57CPXK32qFVzo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VFGcH8okXd/OrQDwMPf5JEGiAs7tqJZDQr97c46fTNJg8jQxH0cm+S371F4wmHFuD
	 uGHZpnox6AC5tkozD8c9rl3YwxyeTsDQIjsurTvsbP3e+rMjtzhoWLbnBZrjPAYy5h
	 7eU3/3pTzvBFXs6oajovMr1EqIL7ER1iS2YfISCxumTtA6v56YxGtzNQC++ICU51iI
	 OSdlHvQ2cPYXBfdtJjBCRpdyg50vroKGRhja0SQIWZvXKteOO5o/dNK57cr07+pfy8
	 8dS08EJdwEcOYxLFRUTE2ArcpD+H7TixgjqNgeWrg/6/Jr4FTNtErPvGX0ZO6wDDhD
	 517pPIBnpVKqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BF7CD6E79;
	Fri,  5 Jun 2026 11:54:43 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Fri, 05 Jun 2026 13:54:35 +0200
Subject: [PATCH] arm64: dts: rockchip: fix regulator names on NanoPC-T6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-rk3588-dts-rockchip-nanopct6-fix-schematic-names-v1-1-15dd3b23ab1a@pardini.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UCaYhu8irhIJ1MzlqYlE0Uov
 btRl+/zeW8H5SyscGl2yPwSlTVVaE8NUPTpziihMlhje9ObDvPcnZ3DUBTzSjNF2TD5tG5Uepz
 kjUqRF1+E6rywom9HF+wwOcsDVO2Wud5+yevtz/ocH0zl24Hj+AC4kf6rlAAAAA==
X-Change-ID: 20260603-rk3588-dts-rockchip-nanopct6-fix-schematic-names-a1b8d27f82e7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4043;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=kgSZTfQ3v8bdt151HvlymrV22R4yaefcQJY9/TyNagE=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqIrkCKjjYJPyA0jamo3cGmC4t1a33loZ4y4QVl
 8IxJe1nsWOJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaiK5AhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7enpNwf7BYfuQLgrCLiVvn1YHpmkizBLJrhd1kQ
 78tWZjq4WLqeGryGR/BFiSoyZ0dsYH9tdah9Cz4MPpsLn5RvLv2rKUTRm8Ucy4kEKkijZ5aDytg
 dC7lzmx9l3iMXLbR0q80dUcn4oTRxcW4TZ8WY2MvqOccfl2C+EkQOPVhKRoEzdMCF3XbrBrnnCN
 moTgXuQQ2hDscxrEEsu+eveq2jK3jDfZwNxtmIqC8ZfW7Tv92e9Jai5hJBK5kDvoi5cnIfroKI0
 aEDi6Pp4MNYQU6NLEfnjz+FPHQOKzD4dXbouQAjB1V8hFppyve5pPhcEytS98D5oXjx1RfsrFLp
 wTJyfKLfHLw==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

Three fixed-regulator names on the NanoPC-T6 don't match the board
schematic [1].

- vcc3v3_pcie2x1l0 -> vdd_mpcie_3v3
  This GPIO-switched 3v3 regulator is labeled vcc3v3_pcie2x1l0, but
  it is wired to and consumed by &pcie2x1l1. Per the schematic,
  the GPIO PCIE_M2_1_PWREN controls the power net VDD_MPCIE_3.3V;
  rename to match.
- vdd_2v0_pldo_s3 -> vcc_2v0_pldo_s3
  Typo in the regulator-name property of RK806-1 DCDC reg7. The node
  label and the schematic power-net name both already use the vcc_
  form; only the regulator-name string had vdd_.
- vcc3v3_pcie30 -> vcc3v3_pcie_m2_0
  The GPIO-switched 3v3 feeding the M.2 M-Key (NVMe) slot is named
  after the PCIe controller it sits behind rather than the schematic
  power net. The schematic names it VCC3V3_PCIE_M2_0 (produced by an
  MP2143-based buck off VCC_5V0, enabled by PCIE_M2_0_PWREN); rename
  to match.

No functional change.

[1] https://wiki.friendlyelec.com/wiki/images/9/97/NanoPC-T6_2301_SCH.PDF

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
Align three fixed-regulator names on the NanoPC-T6 (and LTS) with
the labels used in the board schematic: the mini-PCIe 3v3 regulator
(whose current name is actively misleading), a vdd_/vcc_ typo on
RK806-1 DCDC reg7, and the M.2 M-Key 3v3 supply (named after the
PCIe controller rather than the schematic power net).

Using actual schematic names was pointed out by Sebastian during
review of an earlier (and mostly unrelated) series [1].

No functional change.

[1] https://lore.kernel.org/linux-rockchip/ah2AYT4XmYR03I7z@venus/
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 84b6b53f016ab..b44aff39cb32e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -201,25 +201,25 @@ vbus5v0_usb: regulator-vbus5v0-usb {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
+	vdd_mpcie_3v3: regulator-vdd-mpcie-3v3 {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_m2_1_pwren>;
-		regulator-name = "vcc3v3_pcie2x1l0";
+		regulator-name = "vdd_mpcie_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
+	vcc3v3_pcie_m2_0: regulator-vcc3v3-pcie-m2-0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio2 RK_PC5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_m2_0_pwren>;
-		regulator-name = "vcc3v3_pcie30";
+		regulator-name = "vcc3v3_pcie_m2_0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc5v0_sys>;
@@ -639,7 +639,7 @@ &pcie2x1l0 {
 
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc3v3_pcie2x1l0>;
+	vpcie3v3-supply = <&vdd_mpcie_3v3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_1_rst>;
 	status = "okay";
@@ -659,7 +659,7 @@ &pcie30phy {
 
 &pcie3x4 {
 	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	vpcie3v3-supply = <&vcc3v3_pcie_m2_0>;
 	status = "okay";
 };
 
@@ -965,7 +965,7 @@ vcc_2v0_pldo_s3: dcdc-reg7 {
 				regulator-min-microvolt = <2000000>;
 				regulator-max-microvolt = <2000000>;
 				regulator-ramp-delay = <12500>;
-				regulator-name = "vdd_2v0_pldo_s3";
+				regulator-name = "vcc_2v0_pldo_s3";
 
 				regulator-state-mem {
 					regulator-on-in-suspend;

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260603-rk3588-dts-rockchip-nanopct6-fix-schematic-names-a1b8d27f82e7

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



