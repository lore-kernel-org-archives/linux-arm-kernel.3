Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA912CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9jOpAJme9DuMAmtZlIRWeuJwP51wNjY5mc3K702Yvm4=; b=hQUTRGYgJG3CPjpRsh2D5qEiOS
	pwYXgRgf7NtkT7dcnqL0qd6s/xFES7RYR1jrrHbWQA0V+QMtqFvv2VTk+U00P9RB4B+6EkpZe6nuh
	lrZKUncc3rprd1CD4NNhZ1z76S8vZBIVTK78DR+O7jg/pr09Galmo2uCLCvIThlPHVxPctMEmspK/
	Jk3p6G1k+AoLeia15ubvgYeEYwhLHBmCOUTngcGiXxAb2Ok1KzGJx9E/aQOnYO+yjq0iD2Wj/xmRc
	qOsVAl4cDVXeIvKvM1nwkx+X2HAFN0vscXFA3HIkv4oZfvaapqTmdTl0KPymXjUCoLdx4Eddhzlhn
	9UAdJmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIld-00000009f0L-113g;
	Fri, 24 Oct 2025 14:27:45 +0000
Received: from smtp15.bhosted.nl ([2a02:9e0:8000::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIla-00000009ezm-2Jov
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=9jOpAJme9DuMAmtZlIRWeuJwP51wNjY5mc3K702Yvm4=;
	b=ef2wfPPe0x/vZCMzVbqoYMZ3YGbc8+qSj0ro1fh7vCLrw2Y1vwlII5SquYEZHsmveAPgiMJzrwLKq
	 msfzBRXCKNKVqrW2jJHW7TO4wn1glYLbp6MK+iH+Ak2orNOd6ycIKVWqAujuvx8UEunbaLaD0TTQPf
	 UOnZyR/cCPo4Xo5YQ2zRCHg6kCcgpNG9KV28kc+qYKk1XsRUDI4+cCCM6o5r0xhYCY5ImEwaEQLAEu
	 hItpJNfKanS5LgC3y4lfDENAG80GgpBkXZNTbXIdtTGdek9Ji/xFUNmg74kJz0JhnjxgPTuN3xrb9k
	 f68xpJkw/0hKPpxfIMDNj6rIyB98bsA==
X-MSG-ID: 95a6f307-b0e5-11f0-8e1f-00505681446f
From: Maarten Zanders <maarten@zanders.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Maarten Zanders <maarten@zanders.be>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: nxp: imx6ul: correct SAI3 interrupt line
Date: Fri, 24 Oct 2025 16:21:06 +0200
Message-ID: <20251024142106.608225-1-maarten@zanders.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_072742_724964_11430955 
X-CRM114-Status: UNSURE (   9.69  )
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

The i.MX6UL reference manual lists two possible interrupt lines for
SAI3 (56 and 57, offset +32). The current device tree entry uses
the first one (24), which prevents IRQs from being handled properly.

Use the second interrupt line (25), which does allow interrupts
to work as expected.

Fixes: 36e2edf6ac07 ("ARM: dts: imx6ul: add sai support")
Signed-off-by: Maarten Zanders <maarten@zanders.be>
Cc: stable@vger.kernel.org
---
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 6de224dd2bb9..6eb80f867f50 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -339,7 +339,7 @@ sai3: sai@2030000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6ul-sai", "fsl,imx6sx-sai";
 					reg = <0x02030000 0x4000>;
-					interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+					interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6UL_CLK_SAI3_IPG>,
 						 <&clks IMX6UL_CLK_SAI3>,
 						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
-- 
2.51.0


