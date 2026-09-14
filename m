Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D98C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fEcFOKk4u49+lu8i7wUIHe8SeOyKWEe5+xW0wFXymbk=; b=XCxqW5x+Ph0mPzswaKuWcTSPRe
	fu9NF93sIwKyRm2pscOOS9aB/VMqgeCcQ43xPeGhLjBHyZJne+BHP0q0Q/jjmFfeHKzsrE8kr1OBN
	4/pqlbJUDAFYq6WGs2TM1EDyGpAkZBGzgYW/L9qPjqTBlAGCfa0EyD9+c1Ugi5biw7xfVxXDQdvYi
	AXYEYs/r9SoIQYXlwRb6E1KHBylO/FSxxR04OvuHu5b3Ps+e4opqexK7TO0IzPAfcNlA3LuZAVUyS
	HepG3DghSoCPLyQ5mWxsl2gxkgtbQDdJNP+PyS7uW1I+vtPmUhbG/x/pb7rxUmLWApIMfWPFlrEFR
	55bagZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Alo-00000004P8l-2vOD;
	Mon, 14 Sep 2026 17:47:08 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6All-00000004P7x-1fe5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 17:47:08 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 6E45B1F8D1;
	Mon, 14 Sep 2026 19:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789408018;
	bh=fEcFOKk4u49+lu8i7wUIHe8SeOyKWEe5+xW0wFXymbk=; h=From:To:Subject;
	b=p2xJk0+xjnA7FvkwtcukQ1EX2uhEWzgnkNSASC4gC+INwmUOeYdyXvTw48hW4FOT5
	 hPC1bLTQXdn1vfelAsySRSL2FmFrMJe2lW/wgis7Q2ewMZPsEK1Tecx5fpaELvzQuU
	 tvUS6i9hpngk5shrYWAC3StaFNdW6FhiXy+rqBpAqcWeCqz28qCPmuU10f1ZhZi2hu
	 q0kwKshkqkG7cR2Vuo2shrmuqFj98UgJQ0xA8BO60/bt/QTpMC4k+OWrDXarjF+UwH
	 G3tc5AWrde+lvDYm7T8zyoV0Jb63BUse6OjOiCJ7W1AMHWZihMH+eEVokBcbeia7fi
	 FbjQedu/oesfA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62p5-verdin: build zinnia dtbs
Date: Mon, 14 Sep 2026 19:46:50 +0200
Message-ID: <20260914174651.6195-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_104706_334529_FAC9C610 
X-CRM114-Status: UNSURE (   8.31  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add the zinnia dtbs to the Makefile, they were forgotten when zinnia
support was added and were therefore never built.

Fixes: 71c2a8124527 ("arm64: dts: ti: k3-am62p-verdin: Add Zinnia")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
in our OE build the dtb files are built from an explicit list, so we did not
notice ...
---
 arch/arm64/boot/dts/ti/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index fcfec8ea3165..e3ca60a30433 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -91,6 +91,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
@@ -98,6 +99,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-zinnia.dtb
 
 # Common overlays for SK-AM62* family of boards
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-ov5640.dtbo
-- 
2.47.3


