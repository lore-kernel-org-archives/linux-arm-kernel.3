Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04322C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bVhv8GwGk8CIFpdcPFaOIkXwLDr45OhvMxx7zHDmZDQ=; b=pXfT3dU6dmtmsxZ9USx0uliXmI
	81ntgsj/Bv++Y209cqn0HlJWWNA3dREr8ZQM4jrWOKqw6XbJ9GqJem+kda2HHreO2GA+sChVYtQFp
	+HZi2Knl3+z01GJUp8MpJ73CAaa+2BSghCtwplCTGHPHHbAtz4+5c3knlERMohaeMmeTEhVXKQWcl
	fdQB6phFa4GYc1XpXD3KSObVq3gZIkV5IrofzWZ70EfDhQkCzNqtK2hUOxY5MzvG6KviXbPNELpew
	shY/yJKes74Y4UHpBAZ6Aoi8KKlvwQxSoHga/qlj+w66gqW+O8oxkqey40Robn3ciuxqy1paybv0D
	bxrIXOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOxH-00000003Ccu-3htq;
	Thu, 31 Jul 2025 08:48:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOmh-00000003B3a-0MHt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FB1D5C567F;
	Thu, 31 Jul 2025 08:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D6DC4CEF5;
	Thu, 31 Jul 2025 08:37:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Fix misplaced article
Date: Thu, 31 Jul 2025 10:36:59 +0200
Message-ID: <280176885acf46d117a0ab9a02c314e2b5cf250f.1753950938.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_013707_168698_A3DDA786 
X-CRM114-Status: GOOD (  10.96  )
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

Move the article "the" before the full name of the board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.18.

 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index d2586d278769e279..f6f2cb7d2d25be5a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for Yuridenki-Shokai the Kakip board
+ * Device Tree Source for the Yuridenki-Shokai Kakip board
  *
  * Copyright (C) 2024 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
  */
-- 
2.43.0


