Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4812CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztBuToGrJQHMolrJiOAslht6TwnPK1aFvQOEX5n81KI=; b=qTPUzzS6G6yl2GaCbRWYci08f4
	STh4E+77qZtue2OB5WH5sdoDON52ED1jsZmPZsYRbLaqekjN1aOiXPzF9QRvjlSz7j+d0M8jaIvxD
	1eLXPMBkI7SoLab9s1zwEQ/7x3MPHt8+jEDAESNPz/JRTZrWPOjjWL4fMUB6fZlvFEkaBIeGYJJEW
	E97b27O7B3DufXa6FhXSV4tqfm7KnsVdyH100arwY8N0LWxIF4Y/RQDyictNxiDayIdE/GfEplT/9
	rAEBCI9oQLXl6I430c2V4MlynDns8xLzw4x1Jex8QtIsKlnV5R/pn+KOTMHIsQAxYrNdxguOsCP4p
	+Ksz29Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3w-000000042ie-2J72;
	Wed, 13 May 2026 23:32:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3s-000000042bi-0VpT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 23:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ztBuToGrJQHMolrJiOAslht6TwnPK1aFvQOEX5n81KI=; b=jfc3H2SD+OL3PcYzfnfBWDXg9M
	dJxTFGN1BEKSwygMOjYR26M4VcqxL00dYLVAALTiJjXUFQeud8kYnHfzS/BG6vAMnSsEOys8ZR93D
	aTREEwKUj+g9DWYMXUXytnm+BUn3c9YxdRMEPjSe+MM+mVIYZz5U9qKtI/5wtl0lxcsZzIyUi3qH6
	JJraDn2q/VdJtwL2QpqQw3p7qBBqaCy6Cu+mP1YgfMzAYsozKKxWTuBhGnsfPsIWPSUHKhjuWinzp
	BLWYiw4ro2FE5+MHn00Y2DY8+sMg/oG963ctnfChbzordP5yB8ybpQA+thJZIxB0Q3PaULGycvSvv
	e0f+Ae1w==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3o-00000001kRg-0Po8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:32:18 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c16233ee11so9917941eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778715134; x=1779319934; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ztBuToGrJQHMolrJiOAslht6TwnPK1aFvQOEX5n81KI=;
        b=pm6I/ddI6wWGPdZsaUGF4d6ya1LB9GetNoLyEGl1CQtrZf/EMJacHxuLAksB24YcxT
         8DCQ8/lVSzcn7wuYuptp171QPkXTiUc3qFkUPVA3DyQrDnSUASibJPFDq0EwT9z1Y6Ft
         WGNl8fAWYWnhtRdOIF2G44woOTgv/bIt4LB/h5Ofm7XxPj9Mxr5u35k/tZ4huqFv2Myr
         V2PXkgtDyq+aSKS7GzJmfy3iqQYPiEJ7/TExnuTtaCRE25TzFmJ8qm1IIV8OeSWdCYZ3
         g6GiwIUM3ATsktAsxxPVwJgzr0NaoNeYpEg+XmB2Hv+dh2bmHfY5PPsEurIGcIF4Gec0
         1Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715134; x=1779319934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztBuToGrJQHMolrJiOAslht6TwnPK1aFvQOEX5n81KI=;
        b=PT9p/X0ulVQwwuaiwwJYBUBDV8Ftxzao3rA5bNi1X6EEtMeRtH8MFW7K0lEmSH1n6E
         kjxOWM3jjuO/FOqSDzzliPcVTJplcgEvURy3E0P7vhhq67OYgRU0a1HnYQW0cKAwy3qf
         ZYUV7t3C3SjQbbWe5w175E3DlX3TXMbEvaaI5gmRIwpmbhh4Y35uWQBRubDR4GjK0u/j
         3/yphbdqBHrbLOkT8s8DSQcHZQX4YtUYSCxf/ecxYuGpr3384Tebsay0+HTeDGNjnQxR
         Yp1/6lxryH/84dGckeyXh4jNLT2qIqeg2EraFZuziEaOY9EOSNmJ9Rjt2KaW+ewDOXPO
         UlRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pB/5j7+Suiado5ues+fYIkU5NjPHsV8E1ltbf6o94rKauvx4BEj9fCzoMF0WHlwB1MpXi8whfuk1rA5x2qmop@lists.infradead.org
X-Gm-Message-State: AOJu0YzxkjPUVAZQ46X3lsXMd2U78VS0g6SiBjW86Yh2HJQYreJi0oMv
	Pqty+1oR43vByoC64NtVEYXlwJMr3gVW0gS1v22Y4lWrHLK3VDGZlijVvcQdfcuYvgIeR0vADvd
	IMYiLIv0UQw==
X-Received: from dybgs18.prod.google.com ([2002:a05:7301:2092:b0:2d9:3459:1de6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1296:b0:2c4:dd55:ffc1
 with SMTP id 5a478bee46e88-30117c7e420mr2958936eec.2.1778715133812; Wed, 13
 May 2026 16:32:13 -0700 (PDT)
Date: Wed, 13 May 2026 16:31:49 -0700
In-Reply-To: <20260513233151.572332-1-irogers@google.com>
Mime-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513233151.572332-6-irogers@google.com>
Subject: [PATCH v5 5/7] perf unwind-libunwind: Move flush/finish access out of local
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: 9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_003216_628261_00B8BBF5 
X-CRM114-Status: GOOD (  14.87  )
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

Flush and finish access are relatively simple calls into libunwind,
move them out struct unwind_libunwind_ops. So that the correct version
can be called, add an e_machine variable to maps. This size regression
will go away when the unwind_libunwind_ops no longer need stashing in
the maps. To set the e_machine up pass it into unwind__prepare_access,
which no longer needs to determine the unwind operations based on a
map dso because of this. This also means the maps copying code can
call unwind__prepare_access once for the e_machine rather than once
per map.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../perf/util/libunwind-arch/libunwind-arch.c | 82 +++++++++++++++++++
 .../perf/util/libunwind-arch/libunwind-arch.h | 24 ++++++
 .../perf/util/libunwind-arch/libunwind-arm.c  | 19 +++++
 .../util/libunwind-arch/libunwind-arm64.c     | 20 +++++
 .../perf/util/libunwind-arch/libunwind-i386.c | 15 ++++
 .../util/libunwind-arch/libunwind-loongarch.c | 15 ++++
 .../perf/util/libunwind-arch/libunwind-mips.c | 15 ++++
 .../util/libunwind-arch/libunwind-ppc32.c     | 15 ++++
 .../util/libunwind-arch/libunwind-ppc64.c     | 15 ++++
 .../perf/util/libunwind-arch/libunwind-s390.c | 15 ++++
 .../util/libunwind-arch/libunwind-x86_64.c    | 15 ++++
 tools/perf/util/maps.c                        | 36 +++++---
 tools/perf/util/maps.h                        |  2 +
 tools/perf/util/thread.c                      | 32 ++------
 tools/perf/util/unwind-libunwind-local.c      | 12 ---
 tools/perf/util/unwind-libunwind.c            | 59 ++++++-------
 tools/perf/util/unwind.h                      |  8 +-
 17 files changed, 309 insertions(+), 90 deletions(-)

diff --git a/tools/perf/util/libunwind-arch/libunwind-arch.c b/tools/perf/util/libunwind-arch/libunwind-arch.c
index 5439bf90d161..9692e6c81492 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arch.c
+++ b/tools/perf/util/libunwind-arch/libunwind-arch.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include <elf.h>
 #include <errno.h>
 
@@ -30,3 +31,84 @@ int get_perf_regnum_for_unw_regnum(unsigned int e_machine, int unw_regnum)
 		return -EINVAL;
 	}
 }
+
+
+void libunwind_arch__flush_access(struct maps *maps)
+{
+	unsigned int e_machine = maps__e_machine(maps);
+
+	switch (e_machine) {
+	case EM_NONE:
+		break;  // No libunwind info on the maps.
+	case EM_ARM:
+		__libunwind_arch__flush_access_arm(maps);
+		break;
+	case EM_AARCH64:
+		__libunwind_arch__flush_access_arm64(maps);
+		break;
+	case EM_LOONGARCH:
+		__libunwind_arch__flush_access_loongarch(maps);
+		break;
+	case EM_MIPS:
+		__libunwind_arch__flush_access_mips(maps);
+		break;
+	case EM_PPC:
+		__libunwind_arch__flush_access_ppc32(maps);
+		break;
+	case EM_PPC64:
+		__libunwind_arch__flush_access_ppc64(maps);
+		break;
+	case EM_S390:
+		__libunwind_arch__flush_access_s390(maps);
+		break;
+	case EM_386:
+		__libunwind_arch__flush_access_i386(maps);
+		break;
+	case EM_X86_64:
+		__libunwind_arch__flush_access_x86_64(maps);
+		break;
+	default:
+		pr_err("ELF MACHINE %x is not supported.\n", e_machine);
+		break;
+	}
+}
+
+void libunwind_arch__finish_access(struct maps *maps)
+{
+	unsigned int e_machine = maps__e_machine(maps);
+
+	switch (e_machine) {
+	case EM_NONE:
+		break;  // No libunwind info on the maps.
+	case EM_ARM:
+		__libunwind_arch__finish_access_arm(maps);
+		break;
+	case EM_AARCH64:
+		__libunwind_arch__finish_access_arm64(maps);
+		break;
+	case EM_LOONGARCH:
+		__libunwind_arch__finish_access_loongarch(maps);
+		break;
+	case EM_MIPS:
+		__libunwind_arch__finish_access_mips(maps);
+		break;
+	case EM_PPC:
+		__libunwind_arch__finish_access_ppc32(maps);
+		break;
+	case EM_PPC64:
+		__libunwind_arch__finish_access_ppc64(maps);
+		break;
+	case EM_S390:
+		__libunwind_arch__finish_access_s390(maps);
+		break;
+	case EM_386:
+		__libunwind_arch__finish_access_i386(maps);
+		break;
+	case EM_X86_64:
+		__libunwind_arch__finish_access_x86_64(maps);
+		break;
+	default:
+		pr_err("ELF MACHINE %x is not supported.\n", e_machine);
+		break;
+	}
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-arch.h b/tools/perf/util/libunwind-arch/libunwind-arch.h
index e1009c6cb965..c00277a5e914 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arch.h
+++ b/tools/perf/util/libunwind-arch/libunwind-arch.h
@@ -2,6 +2,8 @@
 #ifndef __LIBUNWIND_ARCH_H
 #define __LIBUNWIND_ARCH_H
 
+struct maps;
+
 int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum);
 int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum);
 int __get_perf_regnum_for_unw_regnum_loongarch(int unw_regnum);
@@ -13,4 +15,26 @@ int __get_perf_regnum_for_unw_regnum_i386(int unw_regnum);
 int __get_perf_regnum_for_unw_regnum_x86_64(int unw_regnum);
 int get_perf_regnum_for_unw_regnum(unsigned int e_machine, int unw_regnum);
 
+void __libunwind_arch__flush_access_arm(struct maps *maps);
+void __libunwind_arch__flush_access_arm64(struct maps *maps);
+void __libunwind_arch__flush_access_loongarch(struct maps *maps);
+void __libunwind_arch__flush_access_mips(struct maps *maps);
+void __libunwind_arch__flush_access_ppc32(struct maps *maps);
+void __libunwind_arch__flush_access_ppc64(struct maps *maps);
+void __libunwind_arch__flush_access_s390(struct maps *maps);
+void __libunwind_arch__flush_access_i386(struct maps *maps);
+void __libunwind_arch__flush_access_x86_64(struct maps *maps);
+void libunwind_arch__flush_access(struct maps *maps);
+
+void __libunwind_arch__finish_access_arm(struct maps *maps);
+void __libunwind_arch__finish_access_arm64(struct maps *maps);
+void __libunwind_arch__finish_access_loongarch(struct maps *maps);
+void __libunwind_arch__finish_access_mips(struct maps *maps);
+void __libunwind_arch__finish_access_ppc32(struct maps *maps);
+void __libunwind_arch__finish_access_ppc64(struct maps *maps);
+void __libunwind_arch__finish_access_s390(struct maps *maps);
+void __libunwind_arch__finish_access_i386(struct maps *maps);
+void __libunwind_arch__finish_access_x86_64(struct maps *maps);
+void libunwind_arch__finish_access(struct maps *maps);
+
 #endif /* __LIBUNWIND_ARCH_H */
diff --git a/tools/perf/util/libunwind-arch/libunwind-arm.c b/tools/perf/util/libunwind-arch/libunwind-arm.c
index 6740ee55b043..bbaf01406c52 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arm.c
+++ b/tools/perf/util/libunwind-arch/libunwind-arm.c
@@ -1,10 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/arm/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
 
+#ifdef HAVE_LIBUNWIND_ARM_SUPPORT
+#include <libunwind-arm.h>
+#endif
+
 int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum)
 {
 	if (unw_regnum < 0 || unw_regnum >= PERF_REG_ARM_MAX) {
@@ -13,3 +18,17 @@ int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum)
 	}
 	return unw_regnum;
 }
+
+void __libunwind_arch__flush_access_arm(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_ARM_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_arm(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_ARM_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-arm64.c b/tools/perf/util/libunwind-arch/libunwind-arm64.c
index 53b1877dfa04..8ba510089736 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arm64.c
+++ b/tools/perf/util/libunwind-arch/libunwind-arm64.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
 #include <errno.h>
 
+#ifdef HAVE_LIBUNWIND_AARCH64_SUPPORT
+#include <libunwind-aarch64.h>
+#endif
+
 int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum)
 {
 	if (unw_regnum < 0 || unw_regnum >= PERF_REG_ARM64_EXTENDED_MAX) {
@@ -12,3 +18,17 @@ int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum)
 	}
 	return unw_regnum;
 }
+
+void __libunwind_arch__flush_access_arm64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_AARCH64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_arm64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_AARCH64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-i386.c b/tools/perf/util/libunwind-arch/libunwind-i386.c
index a41f7c3c2fa5..383f0a44d290 100644
--- a/tools/perf/util/libunwind-arch/libunwind-i386.c
+++ b/tools/perf/util/libunwind-arch/libunwind-i386.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/x86/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <linux/kernel.h>
@@ -41,3 +42,17 @@ int __get_perf_regnum_for_unw_regnum_i386(int unw_regnum __maybe_unused)
 	return perf_i386_regnums[unw_regnum];
 #endif // HAVE_LIBUNWIND_X86_SUPPORT
 }
+
+void __libunwind_arch__flush_access_i386(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_i386(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-loongarch.c b/tools/perf/util/libunwind-arch/libunwind-loongarch.c
index 0431757505f9..7ff459849930 100644
--- a/tools/perf/util/libunwind-arch/libunwind-loongarch.c
+++ b/tools/perf/util/libunwind-arch/libunwind-loongarch.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/loongarch/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -25,3 +26,17 @@ int __get_perf_regnum_for_unw_regnum_loongarch(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
 }
+
+void __libunwind_arch__flush_access_loongarch(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_loongarch(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-mips.c b/tools/perf/util/libunwind-arch/libunwind-mips.c
index 01a506c8079c..1fa81742ff4a 100644
--- a/tools/perf/util/libunwind-arch/libunwind-mips.c
+++ b/tools/perf/util/libunwind-arch/libunwind-mips.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/mips/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -27,3 +28,17 @@ int __get_perf_regnum_for_unw_regnum_mips(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_MIPS_SUPPORT
 }
+
+void __libunwind_arch__flush_access_mips(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_MIPS_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_mips(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_MIPS_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc32.c b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
index bcdeed34d0a8..f45e61555c8c 100644
--- a/tools/perf/util/libunwind-arch/libunwind-ppc32.c
+++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -29,3 +30,17 @@ int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_PPC32_SUPPORT
 }
+
+void __libunwind_arch__flush_access_ppc32(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC32_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_ppc32(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC32_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc64.c b/tools/perf/util/libunwind-arch/libunwind-ppc64.c
index c508dc89615b..9d7321214fac 100644
--- a/tools/perf/util/libunwind-arch/libunwind-ppc64.c
+++ b/tools/perf/util/libunwind-arch/libunwind-ppc64.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -31,3 +32,17 @@ int __get_perf_regnum_for_unw_regnum_ppc64(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_PPC64_SUPPORT
 }
+
+void __libunwind_arch__flush_access_ppc64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_ppc64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-s390.c b/tools/perf/util/libunwind-arch/libunwind-s390.c
index 7088991015e6..ab296931dbbc 100644
--- a/tools/perf/util/libunwind-arch/libunwind-s390.c
+++ b/tools/perf/util/libunwind-arch/libunwind-s390.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/s390/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -27,3 +28,17 @@ int __get_perf_regnum_for_unw_regnum_s390(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_S390X_SUPPORT
 }
+
+void __libunwind_arch__flush_access_s390(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_S390X_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_s390(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_S390X_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-x86_64.c b/tools/perf/util/libunwind-arch/libunwind-x86_64.c
index 82dfb2c7152a..2caca0b7b384 100644
--- a/tools/perf/util/libunwind-arch/libunwind-x86_64.c
+++ b/tools/perf/util/libunwind-arch/libunwind-x86_64.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/x86/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <linux/kernel.h>
@@ -50,3 +51,17 @@ int __get_perf_regnum_for_unw_regnum_x86_64(int unw_regnum __maybe_unused)
 	return perf_x86_64_regnums[unw_regnum];
 #endif // HAVE_LIBUNWIND_X86_64_SUPPORT
 }
+
+void __libunwind_arch__flush_access_x86_64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_x86_64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 81a97ac34077..27924c70e0e1 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -40,6 +40,7 @@ DECLARE_RC_STRUCT(maps) {
 #ifdef HAVE_LIBUNWIND_SUPPORT
 	void		*addr_space;
 	const struct unwind_libunwind_ops *unwind_libunwind_ops;
+	uint16_t	 e_machine;
 #endif
 #ifdef HAVE_LIBDW_SUPPORT
 	void		*libdw_addr_space_dwfl;
@@ -206,6 +207,16 @@ void maps__set_unwind_libunwind_ops(struct maps *maps, const struct unwind_libun
 {
 	RC_CHK_ACCESS(maps)->unwind_libunwind_ops = ops;
 }
+
+uint16_t maps__e_machine(const struct maps *maps)
+{
+	return RC_CHK_ACCESS(maps)->e_machine;
+}
+
+void maps__set_e_machine(struct maps *maps, uint16_t e_machine)
+{
+	RC_CHK_ACCESS(maps)->e_machine = e_machine;
+}
 #endif
 #ifdef HAVE_LIBDW_SUPPORT
 void *maps__libdw_addr_space_dwfl(const struct maps *maps)
@@ -1039,6 +1050,14 @@ int maps__copy_from(struct maps *dest, struct maps *parent)
 	down_write(maps__lock(dest));
 	down_read(maps__lock(parent));
 
+#ifdef HAVE_LIBUNWIND_SUPPORT
+	err = unwind__prepare_access(dest, maps__e_machine(parent));
+	if (err) {
+		up_read(maps__lock(parent));
+		up_write(maps__lock(dest));
+		return err;
+	}
+#endif
 	parent_maps_by_address = maps__maps_by_address(parent);
 	n = maps__nr_maps(parent);
 	if (maps__nr_maps(dest) == 0) {
@@ -1068,14 +1087,11 @@ int maps__copy_from(struct maps *dest, struct maps *parent)
 			if (!new)
 				err = -ENOMEM;
 			else {
-				err = unwind__prepare_access(dest, new, NULL);
-				if (!err) {
-					dest_maps_by_address[i] = new;
-					map__set_kmap_maps(new, dest);
-					if (dest_maps_by_name)
-						dest_maps_by_name[i] = map__get(new);
-					RC_CHK_ACCESS(dest)->nr_maps = i + 1;
-				}
+				dest_maps_by_address[i] = new;
+				map__set_kmap_maps(new, dest);
+				if (dest_maps_by_name)
+					dest_maps_by_name[i] = map__get(new);
+				RC_CHK_ACCESS(dest)->nr_maps = i + 1;
 			}
 			if (err)
 				map__put(new);
@@ -1093,9 +1109,7 @@ int maps__copy_from(struct maps *dest, struct maps *parent)
 			if (!new)
 				err = -ENOMEM;
 			else {
-				err = unwind__prepare_access(dest, new, NULL);
-				if (!err)
-					err = __maps__insert(dest, new);
+				err = __maps__insert(dest, new);
 			}
 			map__put(new);
 		}
diff --git a/tools/perf/util/maps.h b/tools/perf/util/maps.h
index 20c52084ba9e..6469f62c41a8 100644
--- a/tools/perf/util/maps.h
+++ b/tools/perf/util/maps.h
@@ -51,6 +51,8 @@ void *maps__addr_space(const struct maps *maps);
 void maps__set_addr_space(struct maps *maps, void *addr_space);
 const struct unwind_libunwind_ops *maps__unwind_libunwind_ops(const struct maps *maps);
 void maps__set_unwind_libunwind_ops(struct maps *maps, const struct unwind_libunwind_ops *ops);
+uint16_t maps__e_machine(const struct maps *maps);
+void maps__set_e_machine(struct maps *maps, uint16_t e_machine);
 #endif
 #ifdef HAVE_LIBDW_SUPPORT
 void *maps__libdw_addr_space_dwfl(const struct maps *maps);
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 22be77225bb0..aac9cb75dcf4 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -358,41 +358,21 @@ size_t thread__fprintf(struct thread *thread, FILE *fp)
 int thread__insert_map(struct thread *thread, struct map *map)
 {
 	int ret;
+	uint16_t e_machine;
 
-	ret = unwind__prepare_access(thread__maps(thread), map, NULL);
+	ret = maps__fixup_overlap_and_insert(thread__maps(thread), map);
 	if (ret)
 		return ret;
 
-	return maps__fixup_overlap_and_insert(thread__maps(thread), map);
-}
-
-struct thread__prepare_access_maps_cb_args {
-	int err;
-	struct maps *maps;
-};
-
-static int thread__prepare_access_maps_cb(struct map *map, void *data)
-{
-	bool initialized = false;
-	struct thread__prepare_access_maps_cb_args *args = data;
-
-	args->err = unwind__prepare_access(args->maps, map, &initialized);
-
-	return (args->err || initialized) ? 1 : 0;
+	e_machine = thread__e_machine(thread, /*machine=*/NULL, /*e_flags=*/NULL);
+	return unwind__prepare_access(thread__maps(thread), e_machine);
 }
 
 static int thread__prepare_access(struct thread *thread)
 {
-	struct thread__prepare_access_maps_cb_args args = {
-		.err = 0,
-	};
-
-	if (dwarf_callchain_users) {
-		args.maps = thread__maps(thread);
-		maps__for_each_map(thread__maps(thread), thread__prepare_access_maps_cb, &args);
-	}
+	uint16_t e_machine = thread__e_machine(thread, /*machine=*/NULL, /*e_flags=*/NULL);
 
-	return args.err;
+	return unwind__prepare_access(thread__maps(thread), e_machine);
 }
 
 static int thread__clone_maps(struct thread *thread, struct thread *parent, bool do_maps_clone)
diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
index adc6e82b5f27..a9af2839e828 100644
--- a/tools/perf/util/unwind-libunwind-local.c
+++ b/tools/perf/util/unwind-libunwind-local.c
@@ -721,16 +721,6 @@ static int _unwind__prepare_access(struct maps *maps)
 	return 0;
 }
 
-static void _unwind__flush_access(struct maps *maps)
-{
-	unw_flush_cache(maps__addr_space(maps), 0, 0);
-}
-
-static void _unwind__finish_access(struct maps *maps)
-{
-	unw_destroy_addr_space(maps__addr_space(maps));
-}
-
 static int get_entries(struct unwind_info *ui, unwind_entry_cb_t cb,
 		       void *arg, int max_stack)
 {
@@ -835,8 +825,6 @@ static int _unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 static struct unwind_libunwind_ops
 _unwind_libunwind_ops = {
 	.prepare_access = _unwind__prepare_access,
-	.flush_access   = _unwind__flush_access,
-	.finish_access  = _unwind__finish_access,
 	.get_entries    = _unwind__get_entries,
 };
 
diff --git a/tools/perf/util/unwind-libunwind.c b/tools/perf/util/unwind-libunwind.c
index a0016b897dae..00be1286b799 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -7,76 +7,63 @@
 #include "debug.h"
 #include "env.h"
 #include "callchain.h"
+#include "libunwind-arch/libunwind-arch.h"
+#include <dwarf-regs.h>
+#include <elf.h>
 
 struct unwind_libunwind_ops __weak *local_unwind_libunwind_ops;
 struct unwind_libunwind_ops __weak *x86_32_unwind_libunwind_ops;
 struct unwind_libunwind_ops __weak *arm64_unwind_libunwind_ops;
 
-int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized)
+int unwind__prepare_access(struct maps *maps, uint16_t e_machine)
 {
-	const char *arch;
-	enum dso_type dso_type;
 	struct unwind_libunwind_ops *ops = local_unwind_libunwind_ops;
-	struct dso *dso = map__dso(map);
-	struct machine *machine;
-	int err;
 
 	if (!dwarf_callchain_users)
 		return 0;
 
 	if (maps__addr_space(maps)) {
-		pr_debug("unwind: thread map already set, dso=%s\n", dso__name(dso));
-		if (initialized)
-			*initialized = true;
+		pr_debug3("unwind: thread map already set\n");
 		return 0;
 	}
 
-	machine = maps__machine(maps);
-	/* env->arch is NULL for live-mode (i.e. perf top) */
-	if (!machine->env || !machine->env->arch)
-		goto out_register;
-
-	dso_type = dso__type(dso, machine);
-	if (dso_type == DSO__TYPE_UNKNOWN)
+	if (e_machine == EM_NONE)
 		return 0;
 
-	arch = perf_env__arch(machine->env);
-
-	if (!strcmp(arch, "x86")) {
-		if (dso_type != DSO__TYPE_64BIT)
+	if (e_machine != EM_HOST) {
+		/* If not live/local mode. */
+		switch (e_machine) {
+		case EM_386:
 			ops = x86_32_unwind_libunwind_ops;
-	} else if (!strcmp(arch, "arm64") || !strcmp(arch, "arm")) {
-		if (dso_type == DSO__TYPE_64BIT)
+			break;
+		case EM_AARCH64:
 			ops = arm64_unwind_libunwind_ops;
+			break;
+		default:
+			pr_warning_once("unwind: ELF machine type %d is not supported\n",
+					e_machine);
+			return 0;
+		}
 	}
 
 	if (!ops) {
-		pr_warning_once("unwind: target platform=%s is not supported\n", arch);
+		pr_warning_once("unwind: target platform is not supported\n");
 		return 0;
 	}
-out_register:
 	maps__set_unwind_libunwind_ops(maps, ops);
+	maps__set_e_machine(maps, e_machine);
 
-	err = maps__unwind_libunwind_ops(maps)->prepare_access(maps);
-	if (initialized)
-		*initialized = err ? false : true;
-	return err;
+	return ops->prepare_access(maps);
 }
 
 void unwind__flush_access(struct maps *maps)
 {
-	const struct unwind_libunwind_ops *ops = maps__unwind_libunwind_ops(maps);
-
-	if (ops)
-		ops->flush_access(maps);
+	libunwind_arch__flush_access(maps);
 }
 
 void unwind__finish_access(struct maps *maps)
 {
-	const struct unwind_libunwind_ops *ops = maps__unwind_libunwind_ops(maps);
-
-	if (ops)
-		ops->finish_access(maps);
+	libunwind_arch__finish_access(maps);
 }
 
 int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index fd33d779f03d..8e1d1e10f2c4 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -2,6 +2,7 @@
 #ifndef __UNWIND_H
 #define __UNWIND_H
 
+#include <stdint.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
 #include "map_symbol.h"
@@ -20,8 +21,6 @@ typedef int (*unwind_entry_cb_t)(struct unwind_entry *entry, void *arg);
 
 struct unwind_libunwind_ops {
 	int (*prepare_access)(struct maps *maps);
-	void (*flush_access)(struct maps *maps);
-	void (*finish_access)(struct maps *maps);
 	int (*get_entries)(unwind_entry_cb_t cb, void *arg,
 			   struct thread *thread,
 			   struct perf_sample *data, int max_stack, bool best_effort);
@@ -64,7 +63,7 @@ int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			   struct thread *thread,
 			   struct perf_sample *data, int max_stack,
 			   bool best_effort);
-int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized);
+int unwind__prepare_access(struct maps *maps, uint16_t e_machine);
 void unwind__flush_access(struct maps *maps);
 void unwind__finish_access(struct maps *maps);
 #else
@@ -81,8 +80,7 @@ static inline int libunwind__get_entries(unwind_entry_cb_t cb __maybe_unused,
 }
 
 static inline int unwind__prepare_access(struct maps *maps __maybe_unused,
-					 struct map *map __maybe_unused,
-					 bool *initialized __maybe_unused)
+					 uint16_t e_machine __maybe_unused)
 {
 	return 0;
 }
-- 
2.54.0.563.g4f69b47b94-goog


