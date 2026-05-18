Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F10CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f75V728WWXgJ9k+dp8OnmQyD6j07xSpDflFB4j9UARE=; b=k8gj7gmks2WXEKqZqx29283h2K
	xw6eiR3B7TCFlPG7jLZTvHJZaBWxA5s758jdT8lhkh0PkVP7Iz2pkvpr1VGvh3SQUiyp+/O5kOZ8F
	AO/sfCzg1xnJnwl7fn1QRVhKb2Mv0ruI/QsagQgfcOBOtsx0GYwbQhZp9uEk6JbQuxUkDP9lxgE0t
	9VKfAlpadPD0BMI+oFrQbSEuQXAjx+cFPKTbUQUpCcuV2IGIlXyLX4CIn8UX/DNIEHpEk8BFhdHfo
	ddbcVi92SSvADcq6EtmcXYh6Rj53IsK/82JvsdNEd60m+o6VF3vtWXNzNlARB55SklDnwbmkLQVid
	ntzyUAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqQ5-0000000EHpF-45dz;
	Mon, 18 May 2026 05:21:37 +0000
Received: from [2001:4bb8:2d1:6fdb:d67d:128c:34ba:85b8] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqQ3-0000000EHd5-0y9I;
	Mon, 18 May 2026 05:21:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 13/18] raid6: update top of file comments
Date: Mon, 18 May 2026 07:17:56 +0200
Message-ID: <20260518051804.462141-14-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518051804.462141-1-hch@lst.de>
References: <20260518051804.462141-1-hch@lst.de>
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

Drop the pointless mention of the file name, and use standard formatting
for the top of file comments.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Ard Biesheuvel <ardb@kernel.org> # kunit only on arm64
---
 lib/raid/raid6/algos.c      |  8 +-------
 lib/raid/raid6/arm/neon.c   |  2 +-
 lib/raid/raid6/mktables.c   | 12 +++---------
 lib/raid/raid6/recov.c      | 14 ++++----------
 lib/raid/raid6/riscv/rvv.h  |  2 --
 lib/raid/raid6/x86/avx2.c   | 13 ++++---------
 lib/raid/raid6/x86/avx512.c | 18 ++++++------------
 lib/raid/raid6/x86/mmx.c    | 10 ++--------
 lib/raid/raid6/x86/sse1.c   | 18 ++++++------------
 lib/raid/raid6/x86/sse2.c   |  9 +--------
 10 files changed, 28 insertions(+), 78 deletions(-)

diff --git a/lib/raid/raid6/algos.c b/lib/raid/raid6/algos.c
index 43e3309b5306..a600d5853672 100644
--- a/lib/raid/raid6/algos.c
+++ b/lib/raid/raid6/algos.c
@@ -1,12 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- ------------------------------------------------------- *
- *
- *   Copyright 2002 H. Peter Anvin - All Rights Reserved
- *
- * ----------------------------------------------------------------------- */
-
 /*
- * raid6/algos.c
+ * Copyright 2002 H. Peter Anvin - All Rights Reserved
  *
  * Algorithm list and algorithm selection for RAID-6
  */
diff --git a/lib/raid/raid6/arm/neon.c b/lib/raid/raid6/arm/neon.c
index 341c61af675e..af90869aaffc 100644
--- a/lib/raid/raid6/arm/neon.c
+++ b/lib/raid/raid6/arm/neon.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * linux/lib/raid6/neon.c - RAID6 syndrome calculation using ARM NEON intrinsics
+ * RAID6 syndrome calculation using ARM NEON intrinsics
  *
  * Copyright (C) 2013 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
diff --git a/lib/raid/raid6/mktables.c b/lib/raid/raid6/mktables.c
index 97a17493bbd8..b6327b562fdb 100644
--- a/lib/raid/raid6/mktables.c
+++ b/lib/raid/raid6/mktables.c
@@ -1,15 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- ------------------------------------------------------- *
- *
- *   Copyright 2002-2007 H. Peter Anvin - All Rights Reserved
- *
- * ----------------------------------------------------------------------- */
-
 /*
- * mktables.c
+ * Copyright 2002-2007 H. Peter Anvin - All Rights Reserved
  *
- * Make RAID-6 tables.  This is a host user space program to be run at
- * compile time.
+ * Make RAID-6 tables.  This is a host user space program to be run at compile
+ * time.
  */
 
 #include <stdio.h>
diff --git a/lib/raid/raid6/recov.c b/lib/raid/raid6/recov.c
index 76eb2aef3667..3fa53bc3fde4 100644
--- a/lib/raid/raid6/recov.c
+++ b/lib/raid/raid6/recov.c
@@ -1,16 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- ------------------------------------------------------- *
- *
- *   Copyright 2002 H. Peter Anvin - All Rights Reserved
- *
- * ----------------------------------------------------------------------- */
-
 /*
- * raid6/recov.c
+ * Copyright 2002 H. Peter Anvin - All Rights Reserved
  *
- * RAID-6 data recovery in dual failure mode.  In single failure mode,
- * use the RAID-5 algorithm (or, in the case of Q failure, just reconstruct
- * the syndrome.)
+ * RAID-6 data recovery in dual failure mode.  In single failure mode, use the
+ * RAID-5 algorithm (or, in the case of Q failure, just reconstruct the
+ * syndrome.)
  */
 
 #include <linux/mm.h>
diff --git a/lib/raid/raid6/riscv/rvv.h b/lib/raid/raid6/riscv/rvv.h
index 3a7c2468b1ea..df0e3637cae8 100644
--- a/lib/raid/raid6/riscv/rvv.h
+++ b/lib/raid/raid6/riscv/rvv.h
@@ -2,8 +2,6 @@
 /*
  * Copyright 2024 Institute of Software, CAS.
  *
- * raid6/rvv.h
- *
  * Definitions for RISC-V RAID-6 code
  */
 
diff --git a/lib/raid/raid6/x86/avx2.c b/lib/raid/raid6/x86/avx2.c
index 7efd94e6a87a..7d829c669ea7 100644
--- a/lib/raid/raid6/x86/avx2.c
+++ b/lib/raid/raid6/x86/avx2.c
@@ -1,16 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- ------------------------------------------------------- *
- *
- *   Copyright (C) 2012 Intel Corporation
- *   Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
+/*
+ * Copyright (C) 2012 Intel Corporation
+ * Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
  *
- *   Based on sse2.c: Copyright 2002 H. Peter Anvin - All Rights Reserved
+ * Based on sse2.c: Copyright 2002 H. Peter Anvin - All Rights Reserved
  *
- * ----------------------------------------------------------------------- */
-
-/*
  * AVX2 implementation of RAID-6 syndrome functions
- *
  */
 
 #include <asm/cpufeature.h>
diff --git a/lib/raid/raid6/x86/avx512.c b/lib/raid/raid6/x86/avx512.c
index 0772e798b742..e671eb5bde63 100644
--- a/lib/raid/raid6/x86/avx512.c
+++ b/lib/raid/raid6/x86/avx512.c
@@ -1,20 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- --------------------------------------------------------
- *
- *   Copyright (C) 2016 Intel Corporation
+/*
+ * Copyright (C) 2016 Intel Corporation
  *
- *   Author: Gayatri Kammela <gayatri.kammela@intel.com>
- *   Author: Megha Dey <megha.dey@linux.intel.com>
+ * Author: Gayatri Kammela <gayatri.kammela@intel.com>
+ * Author: Megha Dey <megha.dey@linux.intel.com>
  *
- *   Based on avx2.c: Copyright 2012 Yuanhan Liu All Rights Reserved
- *   Based on sse2.c: Copyright 2002 H. Peter Anvin - All Rights Reserved
+ * Based on avx2.c: Copyright 2012 Yuanhan Liu All Rights Reserved
+ * Based on sse2.c: Copyright 2002 H. Peter Anvin - All Rights Reserved
  *
- * -----------------------------------------------------------------------
- */
-
-/*
  * AVX512 implementation of RAID-6 syndrome functions
- *
  */
 
 #include <asm/cpufeature.h>
diff --git a/lib/raid/raid6/x86/mmx.c b/lib/raid/raid6/x86/mmx.c
index 3228c335965a..afa82536142d 100644
--- a/lib/raid/raid6/x86/mmx.c
+++ b/lib/raid/raid6/x86/mmx.c
@@ -1,14 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- ------------------------------------------------------- *
- *
- *   Copyright 2002 H. Peter Anvin - All Rights Reserved
- *
- * ----------------------------------------------------------------------- */
-
 /*
- * raid6/mmx.c
+ * Copyright 2002 H. Peter Anvin - All Rights Reserved
  *
- * MMX implementation of RAID-6 syndrome functions
+ * MMX implementation of RAID-6 syndrome functions.
  */
 
 #include <asm/cpufeature.h>
diff --git a/lib/raid/raid6/x86/sse1.c b/lib/raid/raid6/x86/sse1.c
index 6ebdcf824e00..f4b260df522a 100644
--- a/lib/raid/raid6/x86/sse1.c
+++ b/lib/raid/raid6/x86/sse1.c
@@ -1,19 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- ------------------------------------------------------- *
- *
- *   Copyright 2002 H. Peter Anvin - All Rights Reserved
- *
- * ----------------------------------------------------------------------- */
-
 /*
- * raid6/sse1.c
+ * Copyright 2002 H. Peter Anvin - All Rights Reserved
  *
- * SSE-1/MMXEXT implementation of RAID-6 syndrome functions
+ * SSE-1/MMXEXT implementation of RAID-6 syndrome functions.
  *
- * This is really an MMX implementation, but it requires SSE-1 or
- * AMD MMXEXT for prefetch support and a few other features.  The
- * support for nontemporal memory accesses is enough to make this
- * worthwhile as a separate implementation.
+ * This is really an MMX implementation, but it requires SSE-1 or AMD MMXEXT for
+ * prefetch support and a few other features.  The support for nontemporal
+ * memory accesses is enough to make this worthwhile as a separate
+ * implementation.
  */
 
 #include <asm/cpufeature.h>
diff --git a/lib/raid/raid6/x86/sse2.c b/lib/raid/raid6/x86/sse2.c
index 7049c8512f35..43b09ce58270 100644
--- a/lib/raid/raid6/x86/sse2.c
+++ b/lib/raid/raid6/x86/sse2.c
@@ -1,15 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* -*- linux-c -*- ------------------------------------------------------- *
- *
- *   Copyright 2002 H. Peter Anvin - All Rights Reserved
- *
- * ----------------------------------------------------------------------- */
-
 /*
- * raid6/sse2.c
+ * Copyright 2002 H. Peter Anvin - All Rights Reserved
  *
  * SSE-2 implementation of RAID-6 syndrome functions
- *
  */
 
 #include <asm/cpufeature.h>
-- 
2.53.0


