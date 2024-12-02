Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF19DD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a6vmUeswzVAQ51jmQq8Woa6+yUAVVB9Y7Qxo+YMtm4=; b=yYWcqzKMtZSfE5h6z7vIm84wv0
	wCwLJbnxE3IqEnEy+CWSDE3HQM1CvbgcELB48ASOPStVCSVTnqmF/s9jumrxpATP9gEyZZNTYBGmW
	jTdRNPi9RR9rdbukjOIA3gxKaJJ4mw/s49q2ukT/2N5l9Hly2uMtT6iyFAFwZZKLtLImZt9g6yxgx
	HoNIm+NabmF+8Y5rotjDooNnnyT+L418z3PUDykjsSjzGfZzyPqPfGobf8t2jm0PMotT982uFOGVO
	wJAXWqQlnpMjdOeZNEEZBYnZmKnfcLjaUoxJexcqGk9OTiWvEUkMoFCKQ7DPcc4l9AGkWJAA3SmYa
	nyNYHJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9T6-00000006t74-08F3;
	Mon, 02 Dec 2024 16:40:16 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9JU-00000006r0U-30QT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:30:22 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by michel.telenet-ops.be with cmsmtp
	id jsWE2D00f1yjZj406sWEEV; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uN-P5;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007Pna-Mp;
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
Subject: [PATCH 4/5] arm64: dts: renesas: Add R8A779G3 SoC support
Date: Mon,  2 Dec 2024 17:30:10 +0100
Message-Id: <978c41f932aa2dccd46ad91fc1ddfabacd1c254c.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083020_890002_A2304674 
X-CRM114-Status: GOOD (  12.82  )
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

Add support for the Renesas R-Car V4H ES3.0 (R8A779G3) SoC, which is an
updated version of the R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g3.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3.dtsi b/arch/arm64/boot/dts/renesas/r8a779g3.dtsi
new file mode 100644
index 0000000000000000..0295858a02602295
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H (R8A779G3) SoC
+ *
+ * Copyright (C) 2024 Glider bv
+ */
+
+#include "r8a779g0.dtsi"
+
+/ {
+	compatible = "renesas,r8a779g3", "renesas,r8a779g0";
+};
-- 
2.34.1


