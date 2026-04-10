Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDDEF44847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=2HK2S+YO7fB4ujSzajjkO7eLLa83jA73mkIKAqkhMZw=; b=BZzlYSr+O151cC
	KbhU7/VG0a2dsO8gZZrGsyg6moMtSxFlZWQI1udKmr1FO19cWxSiRJps2OiByS5tLl9PBM469WWLg
	/HFOrt5DMYtHnmCWqRyfTNctZHJ+tQ+1D8l4hOcJcw3FXHemqBqwXCQYMqRnABu9s9EOwLsLePLGG
	lahUH43XXN63yq0WdVatIVJLCgqvR7MP+wNUJubuweiISI3Hz7DR9cuus+c5EFiTyBwNiTcgvJklA
	WPhMIsvynusf2QTAgwKP+pYeAz1mgRoaT6CNpy95+Jv7ImWMU0tq0KUiaHxuOBx48dDtNAWD+z79k
	r/hdi1ccjkiPJjeFimtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArY-0000000CCxA-42ke;
	Fri, 10 Apr 2026 12:21:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArO-0000000CCeW-1X8F;
	Fri, 10 Apr 2026 12:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=2HK2S+YO7fB4ujSzajjkO7eLLa83jA73mkIKAqkhMZw=; b=q138e2Fc5JfKjrJKfpR3cxnz19
	kdlwEzCE4ooxztBCiWmaF672dYjKvQkw/6pisco9RdNl6G/0/C+5edM9vlQ0A+OBzkdoip/+MQcD8
	a+dpzNlIUAXIF+p07xEb9p4T9SUdz9UFtvQYDl9PO/E2o25k8AnRRJ4Bhpzn53lwjwYbsuU9ofQcR
	zZlPO4VCw2JmramHrnvALL/vK6AveRPgvQUJBJHh56TcVgvSKc25BZm3FOdtClGpNmL+toXSxOcKl
	fnkhp9Ky+ZDTaoYHBcFClfw3prJcoAWEXghqqkcyFiNr5r+c9BbF2wtUbQWmcrudUnGF7NEpTjtmS
	Caeft/Qg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArK-0000000DRRE-2KK2;
	Fri, 10 Apr 2026 12:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E75043A9E;
	Fri, 10 Apr 2026 12:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4B2C2BC87;
	Fri, 10 Apr 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823672;
	bh=tpcbJjrROej8+Ep0S4yh9w/0viNOJRSIBsQtj9nrduE=;
	h=Date:From:To:Cc:Subject:References:From;
	b=t+6BdojJde/UDdVdrSTxElEId1Y48xNZSVlMYQlGTL0WHNGFs3HWPQxpINyMlW0Tp
	 I6cN87TfGyJy1fhgMX3eHxGWXyIRGEfK+oj+v7ZqgSkuHT9TIqDSO48kfeefrr2R+6
	 RZvls6BOQPsjm5E39PGBUAxS3ybrYUwTjTmhDryNFYGgOGgmcHGql9J5M/vSFS9Dpm
	 Ps3dk0/gjV2/aMyaPlsNujNJN/7qos+7ycvHmAQEpnPn1tOePEJ6rKipC5ku3IQ4UE
	 ud6vC+9M6N71X0VBW7hJfjso4CmI7VrrHXujC0k5eBTPHkHx5czFPyyVnepx/5Zgc1
	 GRj7R63OiiEsA==
Date: Fri, 10 Apr 2026 14:21:09 +0200
Message-ID: <20260410120319.789114053@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 33/38] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_132114_935999_81837E55 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

The only remaining usage of get_cycles() is to provide random_get_entropy().

Switch powerpc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
and providing random_get_entropy() in asm/random.h.

Remove asm/timex.h as it has no functionality anymore.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/Kconfig              |    1 +
 arch/powerpc/include/asm/random.h |   13 +++++++++++++
 arch/powerpc/include/asm/timex.h  |   21 ---------------------
 3 files changed, 14 insertions(+), 21 deletions(-)

--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -150,6 +150,7 @@ config PPC
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
--- /dev/null
+++ b/arch/powerpc/include/asm/random.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_RANDOM_H
+#define _ASM_POWERPC_RANDOM_H
+
+#include <asm/cputable.h>
+#include <asm/vdso/timebase.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	return mftb();
+}
+
+#endif	/* _ASM_POWERPC_RANDOM_H */
--- a/arch/powerpc/include/asm/timex.h
+++ b/arch/powerpc/include/asm/timex.h
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_TIMEX_H
-#define _ASM_POWERPC_TIMEX_H
-
-#ifdef __KERNEL__
-
-/*
- * PowerPC architecture timex specifications
- */
-
-#include <asm/cputable.h>
-#include <asm/vdso/timebase.h>
-
-ostatic inline cycles_t get_cycles(void)
-{
-	return mftb();
-}
-#define get_cycles get_cycles
-
-#endif	/* __KERNEL__ */
-#endif	/* _ASM_POWERPC_TIMEX_H */


