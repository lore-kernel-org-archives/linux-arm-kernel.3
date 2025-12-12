Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16036D59D8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9I0U4y4DaicuIQNn0HQmkNYSq+VO2DdEV6v0+vdOhg=; b=3W62xre1OOPF2nfWfuX5gIKPkm
	T1nLOW/+JZbkV21zztJBU8CwNz7Cy6BrfWULKs3znEKgr8qXdRchPQmpugA+iUN1hnnGK5vQXqPNb
	DREPmQvwFshkhRqdkq+ah2MMaZa5BcMcqLqF4IYQXLOkiHoel6nEJ8p8hqta4f7SnccZqauNwdaZ1
	LYWUXaVLBuYb4NoRZmVq6wR314dvmCyYzrskEO2C3Zx15ETu7NVside8W4mSwyzQ5gnVNUzvhymSx
	0agJZyMLfvjMnRIocNOU1Nux6x++WltXqJOE5js2HOtKbM6CGpe+QJsfpiL/69R8t/zHp1mrDg0VM
	7CKBx3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9pD-000000013Yq-1xf1;
	Fri, 12 Dec 2025 20:33:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9pB-000000013Xd-28Wc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF6C0601B4;
	Fri, 12 Dec 2025 20:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECF5C4AF09;
	Fri, 12 Dec 2025 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571592;
	bh=Za+VH2mP6LlOpJnVFFFMobdkQoGnZuDcZFwmn6Mewrs=;
	h=From:To:Cc:Subject:Date:From;
	b=s7opl20V4g4vLQe7GHBlFzJlRwQMLfPrq7gSBYz98f5JPyTeULtjuzQdCms2YU02C
	 dwTEZXOZnzQg8+N4G3TLaHm27atzDK7F7xLJvfpID42qTp79nzEzNzh6LzkiouJAd5
	 fFkya8SSznQj6KjRFkCxph4AakRGXI+GgSlXNb26rQNhvE7pxJM74M7vABhCNFAgjQ
	 QZGWIy4IO6rmBuf0i6/ga4SLrzQ2/MVo3c9r0zY4EniH4KAzLMcQ/qwzH+betxRWEl
	 cmgL1BanKl8m09g4ObViOSQx5yKadzIwdKHOR8h7u0XP9EklkWc/rafBB5DT6yAiAp
	 3JPsCR34+eiCA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: samsung: Drop s3c6400.dtsi
Date: Fri, 12 Dec 2025 14:32:13 -0600
Message-ID: <20251212203226.458694-7-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This .dtsi file is not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/samsung/s3c6400.dtsi | 38 --------------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 arch/arm/boot/dts/samsung/s3c6400.dtsi

diff --git a/arch/arm/boot/dts/samsung/s3c6400.dtsi b/arch/arm/boot/dts/samsung/s3c6400.dtsi
deleted file mode 100644
index 7cc785a63866..000000000000
--- a/arch/arm/boot/dts/samsung/s3c6400.dtsi
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Samsung's S3C6400 SoC device tree source
- *
- * Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
- *
- * Samsung's S3C6400 SoC device nodes are listed in this file. S3C6400
- * based board files can include this file and provide values for board specific
- * bindings.
- *
- * Note: This file does not include device nodes for all the controllers in
- * S3C6400 SoC. As device tree coverage for S3C6400 increases, additional
- * nodes can be added to this file.
- */
-
-#include "s3c64xx.dtsi"
-
-/ {
-	compatible = "samsung,s3c6400";
-};
-
-&vic0 {
-	valid-mask = <0xfffffe1f>;
-	valid-wakeup-mask = <0x00200004>;
-};
-
-&vic1 {
-	valid-mask = <0xffffffff>;
-	valid-wakeup-mask = <0x53020000>;
-};
-
-&soc {
-	clocks: clock-controller@7e00f000 {
-		compatible = "samsung,s3c6400-clock";
-		reg = <0x7e00f000 0x1000>;
-		#clock-cells = <1>;
-	};
-};
-- 
2.51.0


