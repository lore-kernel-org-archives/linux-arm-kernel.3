Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2CBD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6ivyFpBCkpt9Xe3r2gQaFOEFMOMqhSgSX9rTB396Ok=; b=LkPi5wgvmyiHGzLwub2E/8Rb5U
	WL0cxc2ot2celxBX1AX16LVXimR1T9oqUQzKeASc3WaQ2c+1Q23yw7iua97pNTL3MqsIRcIAY2q6N
	J0NMRt2DKKkY+Zyd7ojxnnwdfqqhrHEj81OjVAhP23hK1veFics7Zcg3GmHXqa2u0pS+r3Olig8+z
	zGM7cFAAyQz/L0WDZObn0ucq69Hh6IDMbqaRe8yLviPCayJEIZtGrlDSWedJAjKQJ5yXiL8KTDLmQ
	0BeKMck2q2kqTKPUylcPSZmaKXPqFDefkG1VbRwJRSyTbM2hd1S7y/ioJ1Eaql1expPavMClDyXKh
	TKdUgzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9RA-00000006spO-3epc;
	Mon, 02 Dec 2024 16:38:16 +0000
Received: from weierstrass.telenet-ops.be ([195.130.137.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9JU-00000006r1u-2KKm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:30:22 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Y28Qd6F8dz4x6NQ
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 17:30:17 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by baptiste.telenet-ops.be with cmsmtp
	id jsWE2D00Q1yjZj401sWEo5; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uS-QY;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007Png-Nv;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a779g3: Add White Hawk Single support
Date: Mon,  2 Dec 2024 17:30:11 +0100
Message-Id: <66d0fe78c393e6df2775287c730464e91732ec56.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083020_725632_CF93AA22 
X-CRM114-Status: GOOD (  13.91  )
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

The White Hawk Single board with R-Car V4H ES3.0 (R8A779G3) uses an
updated version of the R-Car V4H (R8A779G0) SoC.

For now, there are no visible differences compared to the variant
equipped with an R-Car V4H ES2.0 (R8A779G2) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile             |  2 ++
 .../dts/renesas/r8a779g3-white-hawk-single.dts   | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 97228a3cb99c163d..df9ea5b2e20818f4 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -92,6 +92,8 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
 
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
+
 dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h0-gray-hawk-single.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts
new file mode 100644
index 0000000000000000..cd466d858854bf92
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H ES3.0 White Hawk Single board
+ *
+ * Copyright (C) 2024 Glider bv
+ */
+
+/dts-v1/;
+#include "r8a779g3.dtsi"
+#include "white-hawk-single.dtsi"
+
+/ {
+	model = "Renesas White Hawk Single board based on r8a779g3";
+	compatible = "renesas,white-hawk-single", "renesas,r8a779g3",
+		     "renesas,r8a779g0";
+};
-- 
2.34.1


