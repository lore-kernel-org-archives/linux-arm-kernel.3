Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1980C982D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcKnZEVsCdcfjK4xjWeTbUus+n6o+hx9e9tFs23K4+Y=; b=pCZFFwCzc1ApXkMTfqgb2eYdAH
	GERMT1kZZX3X8/JlgpZKZxX18iOG/QFhHQ446wt75nyS+AO43SdGa7KWe2EbJuS3m5OgoQ8+2FYKz
	ffe1+ZkHXp1CkrQ2qn7PiNnrueGj9RvO99Ikph2xCtHxbzMPmEwELBWOmU/Z5664ePl1c0CYFfLuS
	0+5aH2fHrNKKbndH6IIcfVPRx05zjwvwgdwzTUKtquiV6DyFNdmFbcOju2SJlb3g2kziMuTTjFAgC
	la+Zyfy6erGwLp2N0DH63oODiTPDTK7WadTnbl6hzerBSwpPsOzq/YxVBgqJkJlEyALVRRGP3mk9D
	txGm+UgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x773J-0000000ApTe-3qgA;
	Thu, 17 Sep 2026 08:01:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7730-0000000ApE9-0zqm;
	Thu, 17 Sep 2026 08:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EC0344797;
	Thu, 17 Sep 2026 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55E25C2BD05;
	Thu, 17 Sep 2026 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789632045;
	bh=eto8+h/MaXkAsviCHPdmpQdT7c0Kfi4t066koHw6hAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aLYkHTsHZXIDsir866SV6YWty1ZgyZIGhcp+9Ub6n3FayyM7guGMhDZJ6ZcHCVYM4
	 PpiQH0/ymoHlf67jrt06SSJe1Z7srO5I7vizPoc0Eu5gDXmNUTFs2lvBt2qC8Vgabd
	 j+OumI+rxNdG6fdzgvFqhr6A2W7SWFMFlhiKKhrNnSrTvm7HuVKlC0VrGN4GUca4IN
	 lzFCM2GtqVb8l2mgzzwLJwwZt8eeAh9HhMKveIQlx0n60ISE9g8Y3cPkCkv95UKrad
	 IKonTTwrDnpYG4Lz0he/YC9ZaAQn4vbyQ31U5KpASBxYhujul2fhNM0F1xmAEF+SC8
	 WwMlH0GoFGR0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389CFC982D0;
	Thu, 17 Sep 2026 08:00:45 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 17 Sep 2026 09:59:05 +0200
Subject: [PATCH v12 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add-mcu-fan-khadas-vim4-v12-6-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 mfd@lists.linux.dev, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Z7uWC5BzI9Wq+imS2bvYjb9eymbusN6NdD/vEPC6HdE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bqeYqHb2Qe4D9/hil7ZZOBFKt54vSIIMXClw8iSn1dJ
 NodZiV3lLIwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABM53cTI8Nbl6P2Xqx4eK/22
 IDZ4gy67df2pmt2Pf+6/cS7TbvW0oxkM/xM0A50duCT034TmRzE52/O6n/AP2LggT8ktVeXY3Sh
 WFgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Enable and configure i2c MCU node to get fan working on Khadas VIM4.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c41525a34b721..7d95aadcf6a66 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -167,6 +167,19 @@ xtal: xtal-clk {
 	};
 };
 
+&i2c_m_ao_a {
+	status = "okay";
+	pinctrl-0 = <&i2c0_ao_d_pins>;
+	pinctrl-names = "default";
+
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,vim4-mcu";
+		reg = <0x18>;
+		fan-supply = <&vcc5v>;
+		#cooling-cells = <2>;
+	};
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_pins>;

-- 
2.49.0



