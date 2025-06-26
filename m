Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF39C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu+/Bm5eeznbClyp+4jnLLYqEUhfAC6e/0CtxI35b0Q=; b=2yJCcZ7bMnnkw4wvLblvn3zyom
	HCLfw+MsUw6VFG2WOf5Lf/72QX2uCS9ZvRTpEdWvYgIOPLnBtaDW/QmNOuQ/qftHpAoFr4tKFpZbx
	D1OtTPIam4WvlXoY4RpQJdBlIqtBld7wgnftD8fsplnpvWblS0P1IgVyLOnf9E0XhjsD28F+wwEtT
	seXGq924KMJT7dS2gashuIBOKSyJgcqJMN4Oa0MIR+LpZ9FPF6FrhWXlSpTjZeDYrFsrduamExmKK
	hJCHpyRls1+90TD5IB40+HkGujY73nJoWiaj2DIhz/f+fwMFGy+Mngal+PlOj3Cj7pHAsRrD/fkia
	YqQeel/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkgv-0000000BNvV-1O47;
	Thu, 26 Jun 2025 11:22:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGp-0000000BCsQ-36bs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEE2A5C0780;
	Thu, 26 Jun 2025 09:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461FFC4CEEB;
	Thu, 26 Jun 2025 09:51:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a779h2: Add Gray Hawk Single support
Date: Thu, 26 Jun 2025 11:51:35 +0200
Message-ID: <d2e0e7b746063368b83148100aa553cff55b8b60.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750931027.git.geert+renesas@glider.be>
References: <cover.1750931027.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025151_822848_F3B05B5B 
X-CRM114-Status: GOOD (  13.07  )
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

The Gray Hawk Single board with R-Car V4M-7 (R8A779H2) uses an updated
version of the R-Car V4M (R8A779H0) SoC.

For now, there are no visible differences compared to the variant
equipped with an R-Car V4M (R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile            |  2 ++
 .../dts/renesas/r8a779h2-gray-hawk-single.dts   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 677ba3aa8931788a..cbd0202c4a1744e9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -105,6 +105,8 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h0-gray-hawk-single.dtb
 
+dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h2-gray-hawk-single.dtb
+
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 r8a779m1-salvator-xs-panel-aa104xd12-dtbs := r8a779m1-salvator-xs.dtb salvator-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs-panel-aa104xd12.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
new file mode 100644
index 0000000000000000..aeb32c77099ea20f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4M-7 Gray Hawk Single board
+ *
+ * Copyright (C) 2025 Glider bv
+ */
+
+/dts-v1/;
+
+#include "r8a779h2.dtsi"
+#include "gray-hawk-single.dtsi"
+
+/ {
+	model = "Renesas Gray Hawk Single board based on r8a779h2";
+	compatible = "renesas,gray-hawk-single", "renesas,r8a779h2",
+		     "renesas,r8a779h0";
+};
-- 
2.43.0


