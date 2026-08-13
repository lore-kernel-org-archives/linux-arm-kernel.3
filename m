Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918BCC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=; b=iHoKTjvahhNDcXYWiAPQX1gkbZ
	SlRco49d5dSjMxfo23VEkRQ8ImHMIWlh/qDfMGafhiT4XgfUjfe1QanAwKREmDuz5D4TcGfqETR/o
	gz0T0yvaI23XmVNBBZgv1ChtybHgiPecC/04E0CEix+yQJumtn7IdEsf/y61L55NMqvx3rz4a38+l
	ju3br9HO0FObSQPRpi2vAGWKoSZ+aNFYDRtxCgNBcZ2UzY+lxLL61MNqQF3p8oXn8NgzLcEWu5iwv
	iCQ7dPjhF/ia2Xq4kxP+yF0OumNrBgEmSIYx0e3WaFQyK9ueERd+Rgyn/vHULFE9sEKw+OC7iziiB
	i3D0sOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPok-0000000Hb45-1Pt8;
	Thu, 13 Aug 2026 07:25:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPoh-0000000Hb32-3cCc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:25:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6DA194E411E0;
	Thu, 13 Aug 2026 07:25:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39EF5602B8;
	Thu, 13 Aug 2026 07:25:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A6A711C4DA19;
	Thu, 13 Aug 2026 09:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=;
	b=KTtQ1w1O4+fwwHoye5Cm3V72y5n24pNWTmuCLGSk3u85cxfy0gt3ipQLAa7fqSg+i/w0bE
	+v8Gti00xAJcBH/8TOXkCfSuhZ/MaZhY3ilmrn4dfIqibQhk+kxIlMu93FpVb1t+Iu0ufq
	kmoOcWkuZGEHCc+2YX6vTVbGYvp/d0c5eKqLCfW+DiL//K+im/08LT7MgMNe7J0UlVg4zs
	CXY6LX/WbtAaqqGueNW07yfJUBjHCQr7fpNg96Gev3WXvlO1nuozPe08IOApxuYd6+JXNC
	iwpZ/MhhoQ1rqm4XakjYR+6nfJJM0ZUmJVBeIWz222pzyTuWVaSfcqmSXo1/sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 09:25:06 +0200
Subject: [PATCH 1/2] arm64: dts: nuvoton: Add QSPI0 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-1-bb237fd7c3c2@bootlin.com>
References: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
In-Reply-To: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_002532_049774_5D0C8CE2 
X-CRM114-Status: UNSURE (   8.52  )
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


