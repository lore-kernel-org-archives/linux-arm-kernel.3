Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7421E94110
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FVwWeVuQuojBBIt0GbiNzCrl8hYjdxZkoliVMSaEEag=; b=tHXFUpQpViTuVfPwo0JuiXPhhu
	oK2KX0SzxNTmBw+Qvap9TcRBPuZphUXJH/qGb15wo0sUsEIuVxVgcErfj3g/gR/bm9RNz3HuJyr40
	wnNF/k+PBdn5QflPDMrSWyMS4KJ1lIFeZgdqmY4o9fWr4xIRuJRIKsE+OQeFGfgxvc6IV1ujWnOIk
	Bro3AlfKRvtUSjKn4Q7k8Yfsf5FB0Dmsj4xDMGg+NYEZ9Btw0iSApxMw2ItAPSEe20GnqsicVCjuC
	pI0SZpln+/OKEdEz8jED23wqiggvhiaYBB6hVGH1Fy5yOIuxX9SHRdcXuhTYIER2rhxMcp1vReech
	ZZTDUvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaSeo-00000004RLH-1tn2;
	Tue, 30 Dec 2025 05:52:34 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaSel-00000004RKy-3Yoy;
	Tue, 30 Dec 2025 05:52:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	patches@armlinux.org.uk,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: omap1: drop unused Kconfig symbol
Date: Mon, 29 Dec 2025 21:52:30 -0800
Message-ID: <20251230055230.3212260-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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

"select ARCH_HAS_HOLES_MEMORYMODEL" was mistakenly merged here
due to a botched rebase (says Arnd [1]).

Drop that line since that symbol is not used anywhere else in the
kernel source tree.

[1] https://lore.kernel.org/all/5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com/
Fixes: 7036440eab3e ("ARM: omap1: enable multiplatform")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
KernelVersion: 6.19-rc1

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: patches@armlinux.org.uk
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>

 arch/arm/mach-omap1/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/arch/arm/mach-omap1/Kconfig
+++ linux-next-20251219/arch/arm/mach-omap1/Kconfig
@@ -4,7 +4,6 @@ menuconfig ARCH_OMAP1
 	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5
 	depends on CPU_LITTLE_ENDIAN
 	depends on ATAGS
-	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select FORCE_PCI if PCCARD

