Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590E9E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 23:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=30+U/96mvL8LCRxwo1qdrVfds9s4Wy5c8NIcySQynDw=; b=XsCk6Or9VnBXBpH8OPDq49jXqH
	tmj9O0haaXH2Ho1wQSQZKXPd9GZPpq4a7a5Q7VkcByR92eThKBevq7eNBo0C1JQxrrxn4egnuC0hs
	jd944BW+xRzWAU5idOMx/XE81OErU3yUlexE6vBpySV3EVykgJRh6B0tOKbW4UQD9W5LiHHvsxoTk
	knlEp/9Yofh4kvOUCDgTxTp3qB0kX93lURPechWt3C9bIaS4jEQljod1QzvLdhOXs7oXxtvwoRJUF
	eJvNhI/HMSkZrVjp5MKJXpdwX1D5ig/dRmrqn9OZr9aMeasx5SmNObfqN0p4Eu+3grfVAuKhNtuEP
	HklsVEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0BZ-000000036OF-1QrJ;
	Sun, 28 Dec 2025 23:28:29 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0BX-000000036Nz-3vIW;
	Sun, 28 Dec 2025 23:28:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	openbmc@lists.ozlabs.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] arm: npcm: drop unused Kconfig ERRATA symbol
Date: Sun, 28 Dec 2025 15:28:27 -0800
Message-ID: <20251228232827.2638379-1-rdunlap@infradead.org>
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

The code for this errata was not merged. See
https://lore.kernel.org/linux-arm-kernel/CAL_JsqK--G_7nO_UQ6jyomA1Sq6GUKtXVZpBF0dXjYA2iE047w@mail.gmail.com/

Fixes: 7bffa14c9aed ("arm: npcm: add basic support for Nuvoton BMCs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
KernelVersion: 6.19-rc3

Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: openbmc@lists.ozlabs.org
Cc: Russell King <linux@armlinux.org.uk>

 arch/arm/mach-npcm/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/arch/arm/mach-npcm/Kconfig
+++ linux-next-20251219/arch/arm/mach-npcm/Kconfig
@@ -30,7 +30,6 @@ config ARCH_NPCM7XX
 	select ARM_ERRATA_764369 if SMP
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_754322
-	select ARM_ERRATA_794072
 	select PL310_ERRATA_588369
 	select PL310_ERRATA_727915
 	select MFD_SYSCON

