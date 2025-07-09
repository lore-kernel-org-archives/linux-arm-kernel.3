Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FABC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=icRB1Heu6LyTs8cjRStqUZhxkNB1t7jz/aToG6+1RAc=; b=HRmjSBk4m7L/WOvzw/EA5LbRuv
	WGyS3xpG7yl58++yMP6Xn26QMYsJAzS7dOnR3qQ/SSFidvXg6KKF+vErAwmvnRiDt6y0Sjr+shqCh
	5NapCr96pzXzKSLpJ6KYlRkzEHtiRvPJH4brqEK/oehjMuIFwKHmLkNhh0nFV0usRT+sGNeXVhxt0
	InK40dPSFPQBXzmYHebQoKrnaCiMYKAMR0tD1DeRJC/0SJw9X031tCbZQabKWeaoc6Wa22pogR6cs
	MvkV8QkLVHvnIPBrrLRoWcU06ugvsrFoId5r2pf7WY/CUJW9L7qur744iiwc047aTIaMAS5yyrD4N
	EZ/i395A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcod-00000009yCK-1yN7;
	Wed, 09 Jul 2025 21:58:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZcj-00000009Z3O-03rS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 18:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ACA54627A;
	Wed,  9 Jul 2025 18:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1101C4CEEF;
	Wed,  9 Jul 2025 18:34:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use SZ_256K definition
Date: Wed,  9 Jul 2025 20:34:22 +0200
Message-ID: <c6a876d6c3b94c8bcb25abcfb2fa5c58d97b50fd.1752085981.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_113429_068779_55DE1C9E 
X-CRM114-Status: GOOD (  10.40  )
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

Use SZ_256K instead of calculating the same value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
index 907a4f8c5aedeeae..46654d196f8dc691 100644
--- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
@@ -81,7 +81,7 @@ void __init rcar_gen2_pm_init(void)
 
 map:
 	/* RAM for jump stub, because BAR requires 256KB aligned address */
-	if (res.start & (256 * 1024 - 1) ||
+	if (res.start & (SZ_256K - 1) ||
 	    resource_size(&res) < shmobile_boot_size) {
 		pr_err("Invalid smp-sram region\n");
 		return;
-- 
2.43.0


