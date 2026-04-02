Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF1D39426
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GR9/A/hNZTXKhRvSR861tqyCyThHRTUkf4TwCWShFA=; b=0mHJfUH1gLQF+SPmvP1xB7OuMg
	tfFJgQux8ic4cX1NLINevshbEbPGMaHFoXX14UmLZf/WkAb0orxV6ahdH7jjRXERnDwf3FTF9mxDU
	V8joum8lyeMl19yBaT5/+n7SEDb1hxXl3h4De6XO0kYhdUZ2xM2zWUwZ3/pDam6WL7mKYtrgFV93c
	YaJxNiV2oVD5MMjYOtMf1i80o9H7Ne1ULYFZXlMcSlOOVndP+rfuQTgCiAU3v3c+KNPgDSAER9QZd
	Ra5vzs3tuEfT2zx3pLg0Ko1bbgVlg/6JvYgt1KlbbBfjEEuQKPpY8XXhMUWOdNYHNIxO2zpQYgSmU
	6l+yFptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1X-00000000KjS-1g9a;
	Thu, 02 Apr 2026 14:27:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1U-00000000KdP-0JT4;
	Thu, 02 Apr 2026 14:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6GR9/A/hNZTXKhRvSR861tqyCyThHRTUkf4TwCWShFA=; b=UnH+YmPe/c/8Y5GTMixg4i3AbC
	XeddXTRiqCShKp3D3HGYwBv0HCxw7VevLI4o2opKwChjjjaicC9XiNIAf3Try/FzHn8L9cvAvdGn7
	0bPo0ows3/v9MZ38b9ozCK5E4UHACSieCSBFxeUmZ30mNDlY1Z9pa1FRRKj7JKc3njlvARuq7oDxw
	ulCBzLQhQT49pai5gErsS1fGKjVe8Fe/HXK1ZYcbG1CE3jxBVUZbc3HiZ+rHMymJ4QyU/zsJM5Zdb
	jBAp5c5RR1ix2Iz+LjwnaSGmZ7B9Rwna5cqmjqMUuBGBzSiDSzqdyE1E3oVJ6gRWiY4w6UH+nVJHw
	MoN1w8Sw==;
Received: from courrier.aliel.fr ([65.21.61.41])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1P-00000002gCF-1lSj;
	Thu, 02 Apr 2026 14:27:51 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775140061;
	bh=tWFcpje6b/UPuUaynpp5o+HzSsytJcZL6uVNyAgG8qQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e3nfKRpvtbWCugSTlrB6xM0bW8INyyHs/BrMwxwvj/J4z3lR0Q2eLYUXWD2IuNUSK
	 HOVgt3B2pzcUh0dva3MwAO4KLyllSWp3O/zb/zoA7YZmeXJ16CpDTSMTeFOUe1PLsT
	 n1Epyb1eIrFeRfVH0d0cxPkt+J4+RkArPmDDA+kw=
Date: Thu, 02 Apr 2026 16:27:08 +0200
Subject: [PATCH 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU fan
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-add-mcu-fan-khadas-vim4-v1-8-2b12eb4ac7b0@aliel.fr>
References: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
In-Reply-To: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
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
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775140051; l=969;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=tWFcpje6b/UPuUaynpp5o+HzSsytJcZL6uVNyAgG8qQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJIY6FKnyDrhKteZ33QADvgyu5beQ9sTm3uAgCLyjMxrHiWIONoSaOlln+PPEHfSf+fIMT1xdYb
 7FkqsNbVS1A8=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_152749_537550_FE95A016 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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

Enable and configure i2c MCU node to get fan working on Khadas VIM4.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..5d7f5390f3a66 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -157,6 +157,19 @@ wifi32k: wifi32k {
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


