Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC4C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DG0T/Wj5sMTIfOxlaeeF2ogFt3hSsxzPW/LXs5xqPQ=; b=5As4Hvn/z6krmK2U/HtJq4QvCP
	y2Q+p/1IC1TzbB51bEtxM05oMkLhVrx6HPWDL6byZdnaSuCmwdKU7JvIQm92qCrfEcGyeLR837QDT
	+zOOqr0oAeIPXiprz1SlhefmxM1p5eaSn9u9XFOQPIOaTWKdDky9tHrr8ab2GsodRaKAcfMeohuFb
	28Cd5+Wa/yigs/5KZpC3IKhSt6YWGsDk4PyhcWyzH+0S0gvtYIxrWm2Ef4srwiAmN2Pguv54OlVCQ
	XwZ3NPfWUnQ09NpQmf1gpByAoZDTKq9LUhh0XvWLzkpOtXdumCO7qp6Hq4ppZBqgCjj4PDRZajg4K
	7+wAF2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAhX-00000007QyO-44x5;
	Tue, 21 Jan 2025 09:37:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAdk-00000007QKq-3txB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:33:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BD6D1C000B;
	Tue, 21 Jan 2025 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737452020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DG0T/Wj5sMTIfOxlaeeF2ogFt3hSsxzPW/LXs5xqPQ=;
	b=e6q9zTHPWm5A0p2N8Vi+9PeG6Mrcf+9KHacxxOVEIguvGSzPIrBejQtRLSQ0laTKEf4VYq
	exmoU7QXVdN5b1fzIJNhLfn6NuYPrOjbuka/4g4wQ5Gu3EWsT82R+VocojSpsfQe+w6H3i
	JUmGdVmibNLtBF52JWIYf7vTyyHmz0oryQXmL1oUHiobsD/K1Nvv6Yj06oaOJ94hoQ/lVX
	ZrIJXrc+OAqCSpE0GbD28xLOad+Sk3W74G5bADTvSG4qFtM3jw8z7mVslUDj5d+5FV76Hj
	0FYNIhr1BbDgiKhrSXCdCFvU467lJQZFG6tUYmAkrr6pZpTRuDaP6bwFMnXgOw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Jan 2025 10:33:27 +0100
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-varsom6ul-concerto-dts-v1-1-eb349acf0ac6@bootlin.com>
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
In-Reply-To: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4uel6ah6eaYhdAJonWK1L0+0Gg2X3y6qTJVhE83VkzQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnj2ny5yWe8Gr+ev7YaQo/jseuSpZvTyVYPGDmY
 zTTC5H+8RGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ49p8gAKCRDRgEFAKaOo
 Nr8/D/9kpyLJTrAbVewPyScvFU2LrKc7HTd+2jRGVZe7gJW1afmheDpdJT7MQscp1K6Q+mneGG2
 11u7DG4gTqzJXCZvHH6zzTGtpwWOnssRiOvm3X7IoCfvxleDTN8kxVau7MXMhwAmFWoDgi/qny2
 dF1631wHI/jzXKZsYfWXBdeub0Wn4PCBIs6Kwg3VL86Kyl6XX1w2bXf9bFp8h+CX3GUZZqb0cf2
 RCv948y68Q1hphXsVYZ1eSd5f7Zr9zBmrYjiLac0FfWdFCdDXCBahDTIVt4sVQrGKUFC370J8kZ
 I/tzZY2RlBGwcliI30CoKOrAUTDpG5A60aLItjlD83C5XAnLbVJbnGqKLbGlOYlFIZr4gQl4KHT
 N8CRP5brr9RUbU1TmeaAtoiib5MJLX0D79fdGNnf1ToPauy5K85mQXJ7xuR2C4dQGXTc2G4uZER
 08khVztbPnHecC2jMkrGfJy1938iIfk9WxNMIWMa3eRpFFTdUC3vFuBaluXnzWnLft/sf24XfjV
 qMn61fdO6RjReFBYm6wthz8eVa65Oubv/insV/2W4UA6ry+lgcVvX/a5Whtj+JbI457CSGccpGM
 89ScBaiMESXUMUezyQiLeDGT/a+2AWIwTgcue8GGYJTLbWU9u3Nv2jcG1gGNvgWmSSp7mM8Tt2H
 S3BvEAvj9SQRCOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_013345_232136_5ACBDCEB 
X-CRM114-Status: UNSURE (   8.17  )
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

Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
Concerto carrier board.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6e0dcf4307f10040dafd96b8e12079813e414c08..5c1a27884f0d7ab0c7adc307ff502e179f85523f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -402,6 +402,12 @@ properties:
           - const: variscite,var-som-imx6q
           - const: fsl,imx6q
 
+      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+        items:
+          - const: variscite,mx6concerto
+          - const: variscite,var-som-imx6ul
+          - const: fsl,imx6ul
+
       - description: TQ-Systems TQMa6Q SoM (variant A) on MBa6x
         items:
           - const: tq,imx6q-mba6x-a

-- 
2.47.0.2.g7caf9f4c55.dirty


