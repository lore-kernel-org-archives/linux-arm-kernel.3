Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA69C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FtMafZqMPfzvDo4rR5fJSjqimAk9/WCkx9aaadGh0kk=; b=j3Ul4E9kJ0OUw0Eu2Dx2wyf6uV
	nTDonVGGYF5fRhmkiGCW2Q3jRuUpd/LO50yvIUiJ9DRhMLQZkpnZLfiWHkTFdF5IBhndlQDqIp/ut
	g7+7b8gMZQxis/IUkI3DEScgDCYpnSNJd9jiiRmCXnI4P/l+orxZFqtQS4qFKLIxU+HyCC97rX6Kb
	86aYw2qMZstYMFMBUjd59NpWAw9otDnwincnt9P7JOEwOWIB6R1tP1Mau55KWHmWLTZDhZ86Cae0l
	bd12gGkIANFNOuGS6iF4qXYsLkehhNc88gc09AEeteDubCZr1T+XuIN7kDShHb5Wy5Qqce0yhuYxt
	QMRHIONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXO2-000000065TV-2Lrj;
	Tue, 18 Mar 2025 13:53:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXKm-000000064mI-3Y5S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:50:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43943bd1409so22310475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742305819; x=1742910619; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FtMafZqMPfzvDo4rR5fJSjqimAk9/WCkx9aaadGh0kk=;
        b=K2jcv1A2EhpIKmZNO479zz5HdJSzMGyLy309o1f+0zjYK6zsYhx5iTxi5XsW57gr6g
         ZToJmwyUM4C01Mxfy8U+GNrQTsROHE5z9m+GL8/WCJsOHKTecQ13AbWR9ZV0moWMNAnK
         OmWg7tlgDAUyQKnXdByz1t4MxgX3uP43YAMqe5pA+q6fQM8VybiqtqM+Zx+7BPo6+yO0
         sJLMVhkfoNvtoxdIXL0ZIEXJi2Qpj851Xw3QUeaHVcsgNP6fUXxeDcYzB26KrH8l6hnn
         7VI9vKljBUc85h96VIATf3MyuiNhi6gi/i4WGh7PqV3h6ICnDklbOxEVwtlRA4/treFQ
         1hQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742305819; x=1742910619;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtMafZqMPfzvDo4rR5fJSjqimAk9/WCkx9aaadGh0kk=;
        b=CrbeUk1wNFWngyh0t5m1xBfwWixn2shaSLq1L2Y4WaspdbpALZQgXxGaTNcYxzyh/Y
         1iVv2N5cxUA3qCCM9wu20RQ0DSKvLsasspi4gTEAJ2n3K7aHToDerCOMbnC9Ukkipvck
         JqA37yWaTmaH6hrWe8u5CpjMw59rAkwasZZgCY+2FxjHyBBjUIC0yZqhTGJPrBgig/Lp
         aLth604VvhEKJX6Wy7pxy0ilyLwaIC2+n1zZkgtgATicf5AvCil1xgxLoawAHSFl3zQg
         HpDhedutyYq0X4aaPIv21/YsBWVdXbTi0yhvXVbpdQ9MEhtA9B33+EuE+rIPC9tlG7iQ
         cQfg==
X-Gm-Message-State: AOJu0YwGw+cp8X1sp0lSNk5LgPWGhir2MC03B47nCRU7Ga3Q4wTs3pGu
	j+sQSlvz23StXLPZVRUvV2zwpz46DcglqdpTHRdcKI/AezimxGuabrh5b8rPukhegCvADRB7MEF
	R+YkijapHuc60Ah8DJ9DfKWxif9Z6tC7D7TLr89BvoPWd6H1saM296LrfN26buxOJj/Bh5VdDIe
	hxVBAotSVImlq2SZVsUJafspb4Pvt014ZSwWqXXWEg
X-Google-Smtp-Source: AGHT+IE79FRgBeu+Pd28yFO/3OUB8VMtDSdNPY3fX6aeehx4Uy+gDWysGn6zxPBsC/G0GhgU2vzOjL3/
X-Received: from wmsp8.prod.google.com ([2002:a05:600c:1d88:b0:43c:ec26:c3a3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:524c:b0:43c:fdbe:4398
 with SMTP id 5b1f17b1804b1-43d3b951a42mr22112405e9.6.1742305818969; Tue, 18
 Mar 2025 06:50:18 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:49:50 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4397; i=ardb@kernel.org;
 h=from:subject; bh=bGzQLy9WRTnMXFtHsUDKduzSWc8UIET77tU2uFX1yJU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf1m5T81sftG7/fXia2sXW8leF8jXqom4pXSwVsTKp/HX
 JRpnOXZUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACai/Jvhf9w89z8iqTfME98z
 xk5ylD3mc6EmxO8Ev2quev7jiwbuZxgZnscWGC7o8A3RjT0d77evrmr2pab/Ux5qPdGOdrwR8Os DCwA=
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318134949.3194334-2-ardb+git@google.com>
Subject: [RFC PATCH] arm64/mm: Remove randomization of the linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_065020_894856_691AE585 
X-CRM114-Status: GOOD (  20.87  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Since commit

  97d6786e0669 ("arm64: mm: account for hotplug memory when randomizing the linear region")

the decision whether or not to randomize the placement of the system's
DRAM inside the linear map is based on the capabilities of the CPU
rather than how much memory is present at boot time. This change was
necessary because memory hotplug may result in DRAM appearing in places
that are not covered by the linear region at all (and therefore
unusable) if the decision is solely based on the memory map at boot.

In the Android GKI kernel, which requires support for memory hotplug,
and is built with a reduced virtual address space of only 39 bits wide,
randomization of the linear map never happens in practice as a result.
And even on arm64 kernels built with support for 48 bit virtual
addressing, the wider PArange of recent CPUs means that linear map
randomization is slowly becoming a feature that only works on systems
that will soon be obsolete.

So let's just remove this feature. We can always bring it back in an
improved form if there is a real need for it.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kees Cook <kees@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h     |  1 -
 arch/arm64/kernel/kaslr.c          |  2 --
 arch/arm64/kernel/pi/kaslr_early.c |  4 ----
 arch/arm64/mm/init.c               | 20 --------------------
 4 files changed, 27 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index ef3a69cc398e..80e0fd6e7651 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -51,7 +51,6 @@ PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
 PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
 #endif
 PROVIDE(__pi__ctype			= _ctype);
-PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
 
 PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
 PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index 1da3e25f9d9e..c9503ed45a6c 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -10,8 +10,6 @@
 #include <asm/cpufeature.h>
 #include <asm/memory.h>
 
-u16 __initdata memstart_offset_seed;
-
 bool __ro_after_init __kaslr_is_enabled = false;
 
 void __init kaslr_init(void)
diff --git a/arch/arm64/kernel/pi/kaslr_early.c b/arch/arm64/kernel/pi/kaslr_early.c
index 0257b43819db..e0e018046a46 100644
--- a/arch/arm64/kernel/pi/kaslr_early.c
+++ b/arch/arm64/kernel/pi/kaslr_early.c
@@ -18,8 +18,6 @@
 
 #include "pi.h"
 
-extern u16 memstart_offset_seed;
-
 static u64 __init get_kaslr_seed(void *fdt, int node)
 {
 	static char const seed_str[] __initconst = "kaslr-seed";
@@ -53,8 +51,6 @@ u64 __init kaslr_early_init(void *fdt, int chosen)
 			return 0;
 	}
 
-	memstart_offset_seed = seed & U16_MAX;
-
 	/*
 	 * OK, so we are proceeding with KASLR enabled. Calculate a suitable
 	 * kernel image offset from the seed. Let's place the kernel in the
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index ccdef53872a0..b3add829d681 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -277,26 +277,6 @@ void __init arm64_memblock_init(void)
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
-		extern u16 memstart_offset_seed;
-		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
-		int parange = cpuid_feature_extract_unsigned_field(
-					mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
-		s64 range = linear_region_size -
-			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
-
-		/*
-		 * If the size of the linear region exceeds, by a sufficient
-		 * margin, the size of the region that the physical memory can
-		 * span, randomize the linear region as well.
-		 */
-		if (memstart_offset_seed > 0 && range >= (s64)ARM64_MEMSTART_ALIGN) {
-			range /= ARM64_MEMSTART_ALIGN;
-			memstart_addr -= ARM64_MEMSTART_ALIGN *
-					 ((range * memstart_offset_seed) >> 16);
-		}
-	}
-
 	/*
 	 * Register the kernel text, kernel data, initrd, and initial
 	 * pagetables with memblock.
-- 
2.49.0.rc1.451.g8f38331e32-goog


