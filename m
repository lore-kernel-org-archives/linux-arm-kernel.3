Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD086C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qby2WY+NNwzVKONu56demCoQrLAp5pVzeZ7hym5vwxc=; b=zP5WmUrXuuF2yJVFqDawYT+fe4
	g5ggYkqAaXfttXbp9cP6b6I7U1wkMGJxjbwWep+ZMY7dAl2gnGKd/pcxAiJ0IAHQSxde/q12ZHyCe
	T3Oygc1SfSS+pcpub9IYIyD9sZdjvmvGtLIbrNGKJnlqpLZAV4vwJpVkZfo/gW0FQGW6OwX8WXOXR
	3mu02HUH4F1E1tt6bETnq8+MXjRM+qtaUA5gY233+oR7EIXt6TvbieSLtnd26kWOmoSH0GdFUrbf1
	rCODscA0F4EFEFB+4xDMGuuhE5AaSwvRETPZnKKYBv+SVMSjd2Md35+OIU7dzjANbcxzBfg2xrNbu
	iwWGWQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEAg-000000046cU-24Jw;
	Thu, 02 Jul 2026 09:57:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEAd-000000046aD-2xZH;
	Thu, 02 Jul 2026 09:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C07543DDF;
	Thu,  2 Jul 2026 09:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 227FEC2BCFD;
	Thu,  2 Jul 2026 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782986243;
	bh=LgAbB0ZXLnx/BP4AfsepnntHvttapSIZpd8aWCrBwiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BXpmS/yGKwkIqzJOfCf/Au2SngShBQd9IciENCSqCtKuYC5ezMfGwdglEUnMDOEUs
	 lz6tLFk1Hq/5DundsZllVx976hQ8uWkj5bL/aLrnf8z2cjidfmxtmk0Py3wL+pBxod
	 /rETGmc8+Te+3PF+/To7uZzlD4wFpZssO8gL41MkocPbD/0njnryZNaGdsvASoth/b
	 ebiUa1X1e79hcdh1b2QVu35GqopAlnCkjlPa/NwJ/GqRdRP5rsGMuKjNYkEUp4pyIt
	 naoi3pNWlij3YYcQ8HpQAI9x0wrayje43P0S/TO7LWJz4E6Zo6r/8daDGb25fHL8Ez
	 kF9VTPPRZt+sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD17C43458;
	Thu,  2 Jul 2026 09:57:23 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 02 Jul 2026 11:55:59 +0200
Subject: [PATCH v8 6/8] arm64: dts: amlogic: t7: Add i2c pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-add-mcu-fan-khadas-vim4-v8-6-244feee91a36@aliel.fr>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=F350Js/5aqFj9YLCGASaC045elV+sRf2mbU4+Ox2uSQ=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ5ab6d/y22KX5pZZx/+xD4zxULHbaNDAvvjPts0a36s6s
 xx3pcV3lLIwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABNR+8rI0L6sVjKaLdihm/s9
 ++abL+dPTPv7/Fp9lMy/XUlHwu1XLmf4H/u3nWPZ8UtS3zctDt2stXLbgVyxMr41NyQZhbZ9nLd
 lDRMA
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

Add the T7 pinctrl used by the Khadas VIM4 for MCU communication.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..e96fe10b251a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,16 @@ mux {
 					};
 				};
 
+				i2c0_ao_d_pins: i2c0-ao-d {
+					mux {
+						groups = "i2c0_ao_sck_d",
+							 "i2c0_ao_sda_d";
+						function = "i2c0_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
 				pwm_a_pins: pwm-a {
 					mux {
 						groups = "pwm_a";

-- 
2.49.0



