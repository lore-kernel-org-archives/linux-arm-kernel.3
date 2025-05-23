Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA03C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 05:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrwPW16gI1QhEkuIodQ7vBYATpIK0goPSTt0gdeuJsA=; b=wH8yRwJwRwbYT6F9ElpzFuOOG4
	zU2KDuIA0XPoEMx2zhWohmV7rPADcvegHypvUa1vEXr5qKAJN3tasip/sw+IwMHRgxn222DSUynrR
	Mw2Dd54ZSwYgYe4QQ7R4i3qc38tsfnu99H/WQhzav+aDeWj6qBxKgQj9XxIRjOiNm7I/LuLyFsOb9
	RheV5PL4zpUCvMiF1pSKozsk2+g4En6bysJ1K+3llS4vJ3CXuihK/QfNgm4qUyNtldf5lMzIZs3ut
	j6n1q4Hfb/9k02gX8+jt73/YOLvI+11tGtXZhDtkVfCYaCrHfAyABMBKNnK5ObkkoZNqThP8CiA78
	xz6ugiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKY5-00000002xj6-1DRC;
	Fri, 23 May 2025 05:02:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKCL-00000002uBc-3QXh;
	Fri, 23 May 2025 04:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TrwPW16gI1QhEkuIodQ7vBYATpIK0goPSTt0gdeuJsA=; b=rC3h1IWBCu3VseEFJ2OVK6ttHI
	99Vky9JKvyt/4uu9a7J9d+5IRsiLneBPoL6Dvpcw7d1sWvTn+H73MCudqHVOAbvOPZUTqedcAEbEG
	v4O4u+PtFoYlSoGb3jHtJfmJOWvuqS7GZEI9wR1vN3EBQVz36a0+62qgbOqPbKBVbEdoSscFpB3pN
	jk1yDTzHN01I1PpYVhy7+yzlljb3uux/kR3D56+7AgeFfYRzdI08L/2N95VB0V0xwWLgGy4qq19TA
	GxJN2oNPWbR3PYElYpyvphWX9ja/0Th/qPV/sMdU9mLhFAM7lH/Zj8n+PZQrX+QLIOOmNsE+C4dka
	4maSx4Yg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIKCC-000000017tk-3BQv;
	Fri, 23 May 2025 04:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72AFB4A96B;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AFFC4CEF7;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975181;
	bh=iIpy4amE1B5BG/MZ7yXJlvvMYB45pyKPopqbUBpww1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HV5smsW43Wblu3m/90Z637zq9GffyBGUQm2lcmxUfUaR4zx1tdFjg1IjBqTG1DSkY
	 WEc692tI4XPAArmlbU5ttf0ws3mGJ3n5WGEPBjCDQd1zpB7O2Qk+muLgGDg/AjoyRH
	 pHwV/rss0oksLyip+O+6bxr2uBHEA0KnenL/hBRpM5/zt0Vf86uDjR9hrsYTFhxONV
	 Y5DuYaBXSlULt7Sjin5UKE5ok0tFkNc+Yr8kPcVVChr4jWfJ6jlSH4RL2qtd03lBiw
	 /GiRIjYMDHZiO+8lBSUiysUXMFIK7BDjrbWbrnItcAgxNL4FI1C+4YKBbM47WE+vjz
	 LZlja9YXJ7h4g==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 10/14] loongarch: Handle KCOV __init vs inline mismatches
Date: Thu, 22 May 2025 21:39:20 -0700
Message-Id: <20250523043935.2009972-10-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=kees@kernel.org; h=from:subject; bh=iIpy4amE1B5BG/MZ7yXJlvvMYB45pyKPopqbUBpww1w=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v3+VfPjOsGqOxm/1bvmH5mG/Ft0U++yRurxzx1V/U zZvk/rWjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAyAQ35zcDFKQATaW1g+Ml48vdNhQVZP3ef 1vDeKb/8WEj5y1q51xFz4zb0fft1+b4Pwz+7by/d73JzG/y39znK9F1H85Za25GAJ4ue8zB4rrl /awETAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_053950_696170_4541C08F 
X-CRM114-Status: GOOD (  12.10  )
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

When KCOV is enabled all functions get instrumented, unless
the __no_sanitize_coverage attribute is used. To prepare for
__no_sanitize_coverage being applied to __init functions, we have to
handle differences in how GCC's inline optimizations get resolved. For
loongarch this exposed several places where __init annotations were
missing but ended up being "accidentally correct". Fix these cases and
force one function to be inline with __always_inline.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: <loongarch@lists.linux.dev>
---
 arch/loongarch/include/asm/smp.h | 2 +-
 arch/loongarch/kernel/time.c     | 2 +-
 arch/loongarch/mm/ioremap.c      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index ad0bd234a0f1..88e19d8a11f4 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -39,7 +39,7 @@ int loongson_cpu_disable(void);
 void loongson_cpu_die(unsigned int cpu);
 #endif
 
-static inline void plat_smp_setup(void)
+static __always_inline void plat_smp_setup(void)
 {
 	loongson_smp_setup();
 }
diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index bc75a3a69fc8..367906b10f81 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -102,7 +102,7 @@ static int constant_timer_next_event(unsigned long delta, struct clock_event_dev
 	return 0;
 }
 
-static unsigned long __init get_loops_per_jiffy(void)
+static unsigned long get_loops_per_jiffy(void)
 {
 	unsigned long lpj = (unsigned long)const_clock_freq;
 
diff --git a/arch/loongarch/mm/ioremap.c b/arch/loongarch/mm/ioremap.c
index 70ca73019811..df949a3d0f34 100644
--- a/arch/loongarch/mm/ioremap.c
+++ b/arch/loongarch/mm/ioremap.c
@@ -16,12 +16,12 @@ void __init early_iounmap(void __iomem *addr, unsigned long size)
 
 }
 
-void *early_memremap_ro(resource_size_t phys_addr, unsigned long size)
+void * __init early_memremap_ro(resource_size_t phys_addr, unsigned long size)
 {
 	return early_memremap(phys_addr, size);
 }
 
-void *early_memremap_prot(resource_size_t phys_addr, unsigned long size,
+void * __init early_memremap_prot(resource_size_t phys_addr, unsigned long size,
 		    unsigned long prot_val)
 {
 	return early_memremap(phys_addr, size);
-- 
2.34.1


