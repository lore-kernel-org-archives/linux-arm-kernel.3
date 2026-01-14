Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9324BD3CC87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 22:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UO1lTlHBHqizcT7vqAmlHNqbra7OZEMIRDGFzzOucyU=; b=MoR3s6gD4QxCCUu52uAl/t0cV5
	PPzlpr5uyGpol2cv599u/SmXsyfLIztH3x3xFCRpz5GbVflH66NqbMh1bSaj6IR7I4j5tGLbIeCCX
	TT0/H4KaRp0AFOoqvgPxcrRQ9u5kRQUHoYngYBo5/gH14dFtK4vIBXARUSXhMi6bkZ8n97FXxFl1N
	FNYeZvtZII8CJpNwyznUN0KGtqnvSWaz0nuoDAjdhCcQVa+17U1OiP+esE854iJTJREG9JZTEuSfq
	eMX+qphAPh4BdyxDwzg/Ye9ZuJEdRihnBfo2c6F9s3rjqLxvZAvWI2ZQTmUNGqqsmJx2Ea5nGePvk
	WIYZBwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9fS-0000000Ayla-3TPU;
	Wed, 14 Jan 2026 22:48:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9fQ-0000000Ayk4-3lI9;
	Wed, 14 Jan 2026 22:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6DED60051;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69E85C19424;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768430923;
	bh=/0rQfB4ucKcut7HcVPFuwsC0bnDDeVLeKXyt6+LIA7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gJ7mZ42yRZ4Ib1aWo+rpCfUuRvrcYM5OlD63FFbO0HY73N/0R8D+o5les48ZKcMd8
	 RanqcCANrn1eXF4WsyAEoeb1lnQd0k0DCuKIAHkJ1dVsJLqLjziV20rrfQSyVgLoI2
	 KWwmNNgitv8aRFdltrCSvVZlXGOMvbTJQbhtiSp5d4fTBfBtmVehuwH8fukhr3MV7q
	 +4pur04NXnVrWBbzlBhvJKta6NYMToB58C8oUMZJiqVK0+BFga1zDT3A2l/p08mnw0
	 qRq7PkgNIqoVtMBhc6s6YjwtAcFr8FogiRACdQf265sPaq21uFD4IKBrjHxmP0US+E
	 tiqSDcNuqr7Yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E373D3CC87;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 14 Jan 2026 23:48:37 +0100
Subject: [PATCH 2/2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-2-8b5cdf328fde@pardini.net>
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=zb/OKKB6zV/hhBZYiZyJobFT3XGfSbU/eSwN+6koa1Y=;
 b=owEBbQGS/pANAwAIATteP+Oex+3pAcsmYgBpaB1KlEhHDQdS0hwR9gCrhbZI2IMpaGlg0cHJM
 GAsqkn+BQuJATMEAAEIAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaWgdSgAKCRA7Xj/jnsft
 6VpIB/48OQIO8h534tAeCE4rHGBpxfc6elGR0Nw/+vh6ua9H1f+NS6RtkgR/249vXrgzaPpq3DN
 O+POmf+VLSS+slNDVUmwVY1ev/2W4IqGR4jsKV6IzXycKBFm72uE8/93PRbfo/Bxavpl7SZAEQX
 2dtba8pz5t7nmyldBFZ5hFXxP39+O9yUnNDGLdbMGfrL3rV7nhZzhlCj4SollYHCFPD9TBCwXwX
 1QSTbbZWo7bh9+qLJRy03C9M8V4huPEMoun8KudEzPd3SKsxy3gSGBv2RPlPDcShaBzzGdVYD5a
 3+y+BmQkwNnpgJIwCWoPrg1ytk3BRSvc8o2SCBo3KhPZ+5o3
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

The Radxa Zero2 has an FUSB302 controller on i2c3 at address 0x22 and
INT# wired to GPIOA-13.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index a37776d22b09e..125b064a15c1e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -364,12 +364,44 @@ hdmi_tx_tmds_out: endpoint {
 	};
 };
 
+/* Also exposed on the 40-pin header: SDA pin 3, SCL pin 5 */
+&i2c3 {
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	fusb302@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+
+		pinctrl-0 = <&fusb302_irq_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+
+		vbus-supply = <&ao_5v>;
+
+		status = "okay";
+	};
+};
+
 &ir {
 	status = "disabled";
 	pinctrl-0 = <&remote_input_ao_pins>;
 	pinctrl-names = "default";
 };
 
+&periphs_pinctrl {
+	fusb302_irq_pins: fusb302-irq {
+		mux {
+			groups = "GPIOA_13";
+			function = "gpio_periphs";
+			bias-pull-up;
+			output-disable;
+		};
+	};
+};
+
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";

-- 
2.52.0



