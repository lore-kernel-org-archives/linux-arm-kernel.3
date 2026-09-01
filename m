Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A6C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcKnZEVsCdcfjK4xjWeTbUus+n6o+hx9e9tFs23K4+Y=; b=0FgyxghpzRaKpv6An4L5j5XLnw
	Mcg5chFPIm+mOuPWhNJapdwmERFrvgb7MZXVWV6BnTKa6bTHicAdFnTjtN2nzpRIBE+5MmtdkHSKH
	R58mxJjGNu0eWEhN/uEAa4Q5t0+7SJ5HVrxAXIwpKohY8jxIGL6yo+g7i+fRxpNyBPtGyP3CqJVlO
	6e6MaFsCUIVlne/mx7Gm5cW9mgoRoLYOYgTFmwXeMOjHlVX44aaVv+Q1lyOBN69mZXEH+MY4Pgc/d
	c9wAlYIfpeKytpFyNiE9MdQANQ3jxh2Dw7ceEGH3IsbCZcJs0BulDDyb1IK/l8c8KpAkAJIjCE/Kt
	maWwfhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QOr-0000000CUCQ-2cDo;
	Tue, 01 Sep 2026 15:27:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QOp-0000000CU8i-2C4g;
	Tue, 01 Sep 2026 15:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CBEC433C7;
	Tue,  1 Sep 2026 15:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5D97C2BCFF;
	Tue,  1 Sep 2026 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788276466;
	bh=eto8+h/MaXkAsviCHPdmpQdT7c0Kfi4t066koHw6hAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UiPHoIA8cqD2VvU+uW+MTs3MrccWyDVyvOHhj6U1ym8qGMVg4ciSqoRR/DWTU+O35
	 1ZQPo5Sl+p8n6CLwHw9OItXz550QfkHj5JNhKCd1iegE/hU8AugW2mi/LJ08EyKR7v
	 aWsAh+G52/C2dzyTJxk39/RuwFGOmaINF59F4mtFDmhPynjRyTlgOPlJgXmJNB6TWi
	 e984ZNXbmkIa++fZOH+f95p3okA6QR3khk0OVHS61hXtD6GKWOadsOmWceC/UJwiuJ
	 IhHzFQlyti+iucITO8hfgrGjZPKbpGCeh64rEy6XGWFd1VtocgHikbpIaojNvXroQo
	 zp/x9/n0IXEMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E06C624D3;
	Tue,  1 Sep 2026 15:27:46 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 01 Sep 2026 17:25:57 +0200
Subject: [PATCH v10 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-add-mcu-fan-khadas-vim4-v10-6-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
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
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9a0dx+UNA2Ttpa2JXA3PdoSsHGmck9Q4CLtFVdlXdnNc
 3c8frulo5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiInjcjw5y6K3lTNi7Sf6Pc
 u7Oy75iP5V65osVc5kI1U1JivyY8b2VkmC3f+OgiH4OMVPka742bN3hdZA1vX5m+LjcnUWTh8b6
 DDAA=
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



