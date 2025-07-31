Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4CAC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CljKbSqbqXcN0uyINtuaw/89I9Fly/mUU91AauAJqiw=; b=KXkdzMt7YK0q1N/G5K0A6ipBE6
	JVpR/pZ3DHti41FVmwQEqg/0QLb8/A30fYGi249MD74MBuCXTJzJf7YEeJ1IyFIFBK90v2YpyNJt9
	YJMsNQPyUwV45hJx/iIYHj+ugiTQggMO7+zwPVMioVSCI8M846BYxwt1xvKZCiunJ1vuZDFmJyOyO
	QNnHUnJQj+RyZ4TgsXtSXhYX34DHSnsdRwtY6K8yYlazxLKYHZ065plOvXEPDP6DE8M39q1cqSwJN
	q2v55Y8RlEkZE9PfPu8ImxmmxErngopPuXAn4cv9yiJgZ00cVflOsHuSJ2PLIX6jF/2T+Jg3YNbnc
	idIdld9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOzk-00000003ClR-2vAQ;
	Thu, 31 Jul 2025 08:50:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOnQ-00000003B7X-4B8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:37:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CFF2A547A9;
	Thu, 31 Jul 2025 08:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1E7C4CEEF;
	Thu, 31 Jul 2025 08:37:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use SZ_256K definition
Date: Thu, 31 Jul 2025 10:37:45 +0200
Message-ID: <c54097a263eb3e451e5e223609a3630d4409dcdd.1753951039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_013753_110443_3717F214 
X-CRM114-Status: GOOD (  10.25  )
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
To be queued in renesas-devel for v6.18.

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


