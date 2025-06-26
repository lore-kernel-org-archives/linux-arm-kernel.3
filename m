Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEFBC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lAvuAYfKpWElLEBOqzaPO52M88kYirjUKl/plxrEag=; b=0AKnZNVIvDUtROw5w3Vqfmc5HH
	JDhqhrZ3kt00FEmDWtIFhZgtDSw+6YVQvQ1+1PXvs5UoEpbEu6EDdUEIBlwnMet3kZz6LDz8MMqAP
	f6wf0Ali4pUVSn1f000KMrsRRKjMKfwyVXRn/hc3EYNXdnogufQyuYdMfpM0z1+SAHoyqq+a8tSJ0
	Zz7IHZbheIc/cSPnuULyyvBuBF1gh6UM1eIOe9YW+/fiGJl0bwxjGuWlq4tm9GLq145UKRIDXZMeT
	PKLsreafokyYIJk0MWc2XYDo+RqmE2SGOkxgMTZakYmTPIL9hXrzVd1Eg7v46XLykTkvCy5cd9ysU
	VNoHMAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkgu-0000000BNvP-3N1C;
	Thu, 26 Jun 2025 11:22:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGn-0000000BCqR-2XDA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:51:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFD2C5C07A1;
	Thu, 26 Jun 2025 09:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE40AC4CEF2;
	Thu, 26 Jun 2025 09:51:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Tam Nguyen <tam.nguyen.xa@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] arm64: dts: renesas: Add Renesas R8A779H2 SoC support
Date: Thu, 26 Jun 2025 11:51:34 +0200
Message-ID: <294ca4211c5a73942dc2ca04ae6d3c384d534f2b.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750931027.git.geert+renesas@glider.be>
References: <cover.1750931027.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025149_687602_35C7B430 
X-CRM114-Status: GOOD (  12.84  )
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

From: Tam Nguyen <tam.nguyen.xa@renesas.com>

Add support for the Renesas R-Car V4M-7 (R8A779H2) SoC, which is
an updated version of the R-Car V4M (R8A779H0) SoC.

Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h2.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779h2.dtsi b/arch/arm64/boot/dts/renesas/r8a779h2.dtsi
new file mode 100644
index 0000000000000000..2707d2d367661994
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779h2.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4M-7 (R8A779H2) SoC
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include "r8a779h0.dtsi"
+
+/ {
+	compatible = "renesas,r8a779h2", "renesas,r8a779h0";
+};
-- 
2.43.0


