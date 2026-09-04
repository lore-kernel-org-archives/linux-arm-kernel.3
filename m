Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3524EC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=; b=Nk509b6LoQ9bCPlgYzJv84oHZY
	JHlFPm0bStZON/oH4BQ50paBqlpIYJ74FZDlhag4t7Z8ELIDr0TjVJKCqGytAZXvoiReOaPhCo/Cg
	7hTSlC3X+AMv7Ma+6squ92gSi6TmA+phUDOKwo2vwVxZOADIh+hJXMwgz8Nf7DYzYKAlr/WzGVoee
	VX4WHUjRECOd85K7U+OEEbUcxXJX9KXUuuG/dCq9Gkix0Uo8CcRsvy6PxyUn4lTofdtwaNL++SEEy
	WEJKYpZiKbK2GSwNu3Rr7NCwhshOEj1SD/NrwI7cgAiJVFcHwB4ejdYZAdfVOdtK4s5nVqFdJUn5v
	IHyU6IcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZa-000000025ib-2yyX;
	Fri, 04 Sep 2026 13:03:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZY-000000025hG-1Iug
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:03:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C75D31A19AC;
	Fri,  4 Sep 2026 13:03:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B96F6057F;
	Fri,  4 Sep 2026 13:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A178F11C7AE94;
	Fri,  4 Sep 2026 15:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=;
	b=Lnoi88sEb0A6TD870U4z9+BTIX6iwzgoROcFBsgoM+el1xv0bD3XfrG3+zX7BcXSHLOt4B
	75h6eqvCqTP0ApKYsdL9h2qhXUT8RwUyKuBnYamsl1pwYApRFwjUuY5htL9exUrpsoKBiI
	t8ro0xhtzQB+U+fLCBxelVq5mQHavxAUp229yqgb900B0Twcw24h2QpdmAHVXaV8kQl9wE
	4QcLRmS2ip/ruSQGsP4DAieKSKs1RCBrIj4CcsvKGJsVehilbFLodcWxIR0Fq6AOJeW9qX
	I9Nsp7w4QiXhSRYDH+aOznNvPLeTkSACkqYWwI/eP5AKJcKLA945nb9jND80eA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:37 +0200
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add QSPI0 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060312_493715_136EFB8C 
X-CRM114-Status: UNSURE (   8.43  )
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

Describe the quad-SPI controller available on Nuvoton MA35D1. Bindings
for it have already been contributed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..9eec44128d28 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -431,5 +431,16 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		qspi0: spi@40680000 {
+			compatible = "nuvoton,ma35d1-qspi";
+			reg = <0x0 0x40680000 0x0 0x100>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk QSPI0_GATE>;
+			resets = <&sys MA35D1_RESET_QSPI0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.54.0


