Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308CAD26296
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 19:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G4PXsjOGmmF0tp8XVeqAaq0yeQLCr/0MZyVOC/9kIQY=; b=MW41Jy+LgYtV0P2jU4Qnn/3WKY
	9nSMFU47MDCgdNjyVg8CQRu8sniEGXOYsuXgz5MEcDPt7huVdNzmsYdd8UtYpNty/IUgzON20ad//
	MYXjvtgvymKG6CiyRGtzPBB42IU+Ng7t39qTtj9vGjFPpEbKdPs3+yXv152y9MQDO//uv0+mqpQk3
	o0jvT+M+vXBZfgdsL3hvO8m6V4hY7ys1jN0TJvmZGdG3tZiFW7WHCoAY4IBLtNeeuNuagmmEjnORq
	+Ul9yNj+eeQuiLgwFgvGmLhQjL3MMRE5ZJNZsYkNK9QLY63k63TELVfUraATNLW6EzVOu4r/+ZC/b
	wrB4k8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHXw-00000004NwJ-232b;
	Tue, 20 Jan 2026 19:37:48 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHXs-00000004NvO-3Zxr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 19:37:46 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-122008d48e5so10412241c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 11:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768937862; x=1769542662; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G4PXsjOGmmF0tp8XVeqAaq0yeQLCr/0MZyVOC/9kIQY=;
        b=rikGWRpsbX2/AyXtFMSBpqIxt5XuyYbwPZP+Px8x3SVUCjoBaHQ8ZwvXlyomDJs1tu
         2AptiDXrheedCq7Pc663ooVC/Uik0V7fGR6xK1kwb6pV4CwYrlk7YS7ogAMZlj1KaT/y
         gqyHzcLKzz5EUYFNvTW3ow0rFZwKFbwjYvWWq2BT9msgp3TDN6WpnPMV+1735Exy7QSS
         TXw7VZUTsuQDlLQph9vA6jMPIkPAs0T4ZEa+tBnBgAAG/EZqUKzpXCj0LLix9rEsHKkJ
         2sBKDxbFzQbpztyI+XIb3oiKucJxuldZqgpgdSCa8yzgoVvWzPQs3XV6fpGAFlG6U52B
         t61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768937862; x=1769542662;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4PXsjOGmmF0tp8XVeqAaq0yeQLCr/0MZyVOC/9kIQY=;
        b=iKHgKYvUn8jrvLH/Ly8GYOFfgBmK1qxmSCPn5Ku530CsuTJ8R8xH/SOXT05mcpsNpH
         NRcyQK1ffOhu+LOFE8/pvupoVjFRBVZEgckm4Fmtu9S24zFjDRWd6No7do0GuRcsYV4L
         iUhXb9J6yxOrhzItZNTXrsz0ex1/XGZXjeQryxj69TP97oGy0447b6HlUU53Veop/75B
         V5F2TFOKsj5EMUHTyM2QJuC430aqzqXApMqz+6alrf3oFetca9Pxazw/d6sqde85povh
         ImxV7y/JAtMncKpXcXwsQ2q0ozPogHx6wnFpZ4YRY+WBAL9ciniVvswGf6TlfJql1bHV
         9GmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT8pFwYED6qEtGfP6/2GGAOZj/Wla8yOlzGkT+v+IGhT7dfBzkzvW8gsJTIF+F6v+F6oQVlp2NX30zKS0BZ8xS@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJWb9Q1uis6FBPtqLmVBWfodX7SVVI2habljXdFDp/dNrryjL
	NFyCjC1OjTUb6WTq2XLZo1nGsv3QBx1t3aHS4HWY8qKosK8Hvl171vobBqshpjkw8tQs4qLR2qU
	yDSD8ZNW0Ow==
X-Received: from dlbcj30.prod.google.com ([2002:a05:7022:699e:b0:11b:b756:3e9b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4394:b0:11c:ec20:ea1f
 with SMTP id a92af1059eb24-1246aabebb7mr2429584c88.33.1768937862357; Tue, 20
 Jan 2026 11:37:42 -0800 (PST)
Date: Tue, 20 Jan 2026 11:37:37 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260120193737.3513656-1-irogers@google.com>
Subject: [PATCH v1] perf regs: Refactor use of arch__sample_reg_masks to perf_reg_name
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_113744_964518_695259AD 
X-CRM114-Status: GOOD (  18.39  )
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

arch__sample_reg_masks isn't supported on ARM(32), csky, loongarch,
MIPS, RISC-V and s390. The table returned by the function just has the
name of a register paired with the corresponding sample_regs_user mask
value. For a given perf register we can compute the name with
perf_reg_name and the mask is just 1 left-shifted by the perf register
number. Change __parse_regs to use this method for finding registers
rather than arch__sample_reg_masks, thereby adding __parse_regs
support for ARM(32), csky, loongarch, MIPS, RISC-V and s390. As
arch__sample_reg_masks is then unused, remove the now unneeded
declarations.

Signed-off-by: Ian Rogers <irogers@google.com>
---
The idea for this patch came up in conversation with Dapeng Mi to
avoid additional functions and tables for x86 APX support:
https://lore.kernel.org/lkml/CAP-5=fWOsvAXuu8qx0tk9q8j8BoXPMJB3Gxto+iu6wf06i4cVA@mail.gmail.com/

The patch is on top of the dwfl clean up patches that switch perf
register functions to using e_machine as an argument rather than the
arch string, this means that EM_HOST can be used with perf_reg_name:
https://lore.kernel.org/lkml/20260117052849.2205545-1-irogers@google.com/
---
 tools/perf/arch/arm/util/perf_regs.c          |   9 --
 tools/perf/arch/arm64/util/machine.c          |  14 +--
 tools/perf/arch/arm64/util/perf_regs.c        |  45 +------
 tools/perf/arch/csky/util/perf_regs.c         |   9 --
 tools/perf/arch/loongarch/util/perf_regs.c    |   9 --
 tools/perf/arch/mips/util/perf_regs.c         |   9 --
 tools/perf/arch/powerpc/util/perf_regs.c      |  68 -----------
 tools/perf/arch/riscv/util/perf_regs.c        |   9 --
 tools/perf/arch/s390/util/perf_regs.c         |   9 --
 tools/perf/arch/x86/util/perf_regs.c          |  47 --------
 .../util/arm64-frame-pointer-unwind-support.c |   3 +-
 tools/perf/util/parse-regs-options.c          | 114 +++++++++++-------
 tools/perf/util/perf_regs.c                   |   9 --
 tools/perf/util/perf_regs.h                   |  12 --
 14 files changed, 79 insertions(+), 287 deletions(-)

diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/arm/util/perf_regs.c
index f94a0210c7b7..03a5bc0cf64c 100644
--- a/tools/perf/arch/arm/util/perf_regs.c
+++ b/tools/perf/arch/arm/util/perf_regs.c
@@ -2,10 +2,6 @@
 #include "perf_regs.h"
 #include "../../../util/perf_regs.h"
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
 uint64_t arch__intr_reg_mask(void)
 {
 	return PERF_REGS_MASK;
@@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64/util/machine.c
index aab1cc2bc283..80fb13c958d9 100644
--- a/tools/perf/arch/arm64/util/machine.c
+++ b/tools/perf/arch/arm64/util/machine.c
@@ -1,18 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <inttypes.h>
-#include <stdio.h>
-#include <string.h>
-#include "debug.h"
-#include "symbol.h"
-#include "callchain.h"
+#include "callchain.h" // prototype of arch__add_leaf_frame_record_opts
 #include "perf_regs.h"
 #include "record.h"
-#include "util/perf_regs.h"
+
+#define SMPL_REG_MASK(b) (1ULL << (b))
 
 void arch__add_leaf_frame_record_opts(struct record_opts *opts)
 {
-	const struct sample_reg *sample_reg_masks = arch__sample_reg_masks();
-
-	opts->sample_user_regs |= sample_reg_masks[PERF_REG_ARM64_LR].mask;
+	opts->sample_user_regs |= SMPL_REG_MASK(PERF_REG_ARM64_LR);
 }
diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm64/util/perf_regs.c
index 09308665e28a..9bb768e1bea1 100644
--- a/tools/perf/arch/arm64/util/perf_regs.c
+++ b/tools/perf/arch/arm64/util/perf_regs.c
@@ -12,48 +12,12 @@
 #include "../../../util/event.h"
 #include "../../../util/perf_regs.h"
 
+#define SMPL_REG_MASK(b) (1ULL << (b))
+
 #ifndef HWCAP_SVE
 #define HWCAP_SVE	(1 << 22)
 #endif
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG(x0, PERF_REG_ARM64_X0),
-	SMPL_REG(x1, PERF_REG_ARM64_X1),
-	SMPL_REG(x2, PERF_REG_ARM64_X2),
-	SMPL_REG(x3, PERF_REG_ARM64_X3),
-	SMPL_REG(x4, PERF_REG_ARM64_X4),
-	SMPL_REG(x5, PERF_REG_ARM64_X5),
-	SMPL_REG(x6, PERF_REG_ARM64_X6),
-	SMPL_REG(x7, PERF_REG_ARM64_X7),
-	SMPL_REG(x8, PERF_REG_ARM64_X8),
-	SMPL_REG(x9, PERF_REG_ARM64_X9),
-	SMPL_REG(x10, PERF_REG_ARM64_X10),
-	SMPL_REG(x11, PERF_REG_ARM64_X11),
-	SMPL_REG(x12, PERF_REG_ARM64_X12),
-	SMPL_REG(x13, PERF_REG_ARM64_X13),
-	SMPL_REG(x14, PERF_REG_ARM64_X14),
-	SMPL_REG(x15, PERF_REG_ARM64_X15),
-	SMPL_REG(x16, PERF_REG_ARM64_X16),
-	SMPL_REG(x17, PERF_REG_ARM64_X17),
-	SMPL_REG(x18, PERF_REG_ARM64_X18),
-	SMPL_REG(x19, PERF_REG_ARM64_X19),
-	SMPL_REG(x20, PERF_REG_ARM64_X20),
-	SMPL_REG(x21, PERF_REG_ARM64_X21),
-	SMPL_REG(x22, PERF_REG_ARM64_X22),
-	SMPL_REG(x23, PERF_REG_ARM64_X23),
-	SMPL_REG(x24, PERF_REG_ARM64_X24),
-	SMPL_REG(x25, PERF_REG_ARM64_X25),
-	SMPL_REG(x26, PERF_REG_ARM64_X26),
-	SMPL_REG(x27, PERF_REG_ARM64_X27),
-	SMPL_REG(x28, PERF_REG_ARM64_X28),
-	SMPL_REG(x29, PERF_REG_ARM64_X29),
-	SMPL_REG(lr, PERF_REG_ARM64_LR),
-	SMPL_REG(sp, PERF_REG_ARM64_SP),
-	SMPL_REG(pc, PERF_REG_ARM64_PC),
-	SMPL_REG(vg, PERF_REG_ARM64_VG),
-	SMPL_REG_END
-};
-
 /* %xNUM */
 #define SDT_OP_REGEX1  "^(x[1-2]?[0-9]|3[0-1])$"
 
@@ -175,8 +139,3 @@ uint64_t arch__user_reg_mask(void)
 	}
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/csky/util/perf_regs.c b/tools/perf/arch/csky/util/perf_regs.c
index 6b1665f41180..2cf7a54106e0 100644
--- a/tools/perf/arch/csky/util/perf_regs.c
+++ b/tools/perf/arch/csky/util/perf_regs.c
@@ -2,10 +2,6 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
 uint64_t arch__intr_reg_mask(void)
 {
 	return PERF_REGS_MASK;
@@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/loongarch/util/perf_regs.c b/tools/perf/arch/loongarch/util/perf_regs.c
index f94a0210c7b7..03a5bc0cf64c 100644
--- a/tools/perf/arch/loongarch/util/perf_regs.c
+++ b/tools/perf/arch/loongarch/util/perf_regs.c
@@ -2,10 +2,6 @@
 #include "perf_regs.h"
 #include "../../../util/perf_regs.h"
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
 uint64_t arch__intr_reg_mask(void)
 {
 	return PERF_REGS_MASK;
@@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/mips/util/perf_regs.c
index 6b1665f41180..2cf7a54106e0 100644
--- a/tools/perf/arch/mips/util/perf_regs.c
+++ b/tools/perf/arch/mips/util/perf_regs.c
@@ -2,10 +2,6 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
 uint64_t arch__intr_reg_mask(void)
 {
 	return PERF_REGS_MASK;
@@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index bd36cfd420a2..779073f7e992 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -18,69 +18,6 @@
 #define PVR_POWER10		0x0080
 #define PVR_POWER11		0x0082
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG(r0, PERF_REG_POWERPC_R0),
-	SMPL_REG(r1, PERF_REG_POWERPC_R1),
-	SMPL_REG(r2, PERF_REG_POWERPC_R2),
-	SMPL_REG(r3, PERF_REG_POWERPC_R3),
-	SMPL_REG(r4, PERF_REG_POWERPC_R4),
-	SMPL_REG(r5, PERF_REG_POWERPC_R5),
-	SMPL_REG(r6, PERF_REG_POWERPC_R6),
-	SMPL_REG(r7, PERF_REG_POWERPC_R7),
-	SMPL_REG(r8, PERF_REG_POWERPC_R8),
-	SMPL_REG(r9, PERF_REG_POWERPC_R9),
-	SMPL_REG(r10, PERF_REG_POWERPC_R10),
-	SMPL_REG(r11, PERF_REG_POWERPC_R11),
-	SMPL_REG(r12, PERF_REG_POWERPC_R12),
-	SMPL_REG(r13, PERF_REG_POWERPC_R13),
-	SMPL_REG(r14, PERF_REG_POWERPC_R14),
-	SMPL_REG(r15, PERF_REG_POWERPC_R15),
-	SMPL_REG(r16, PERF_REG_POWERPC_R16),
-	SMPL_REG(r17, PERF_REG_POWERPC_R17),
-	SMPL_REG(r18, PERF_REG_POWERPC_R18),
-	SMPL_REG(r19, PERF_REG_POWERPC_R19),
-	SMPL_REG(r20, PERF_REG_POWERPC_R20),
-	SMPL_REG(r21, PERF_REG_POWERPC_R21),
-	SMPL_REG(r22, PERF_REG_POWERPC_R22),
-	SMPL_REG(r23, PERF_REG_POWERPC_R23),
-	SMPL_REG(r24, PERF_REG_POWERPC_R24),
-	SMPL_REG(r25, PERF_REG_POWERPC_R25),
-	SMPL_REG(r26, PERF_REG_POWERPC_R26),
-	SMPL_REG(r27, PERF_REG_POWERPC_R27),
-	SMPL_REG(r28, PERF_REG_POWERPC_R28),
-	SMPL_REG(r29, PERF_REG_POWERPC_R29),
-	SMPL_REG(r30, PERF_REG_POWERPC_R30),
-	SMPL_REG(r31, PERF_REG_POWERPC_R31),
-	SMPL_REG(nip, PERF_REG_POWERPC_NIP),
-	SMPL_REG(msr, PERF_REG_POWERPC_MSR),
-	SMPL_REG(orig_r3, PERF_REG_POWERPC_ORIG_R3),
-	SMPL_REG(ctr, PERF_REG_POWERPC_CTR),
-	SMPL_REG(link, PERF_REG_POWERPC_LINK),
-	SMPL_REG(xer, PERF_REG_POWERPC_XER),
-	SMPL_REG(ccr, PERF_REG_POWERPC_CCR),
-	SMPL_REG(softe, PERF_REG_POWERPC_SOFTE),
-	SMPL_REG(trap, PERF_REG_POWERPC_TRAP),
-	SMPL_REG(dar, PERF_REG_POWERPC_DAR),
-	SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
-	SMPL_REG(sier, PERF_REG_POWERPC_SIER),
-	SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
-	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
-	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
-	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
-	SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
-	SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
-	SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
-	SMPL_REG(pmc1, PERF_REG_POWERPC_PMC1),
-	SMPL_REG(pmc2, PERF_REG_POWERPC_PMC2),
-	SMPL_REG(pmc3, PERF_REG_POWERPC_PMC3),
-	SMPL_REG(pmc4, PERF_REG_POWERPC_PMC4),
-	SMPL_REG(pmc5, PERF_REG_POWERPC_PMC5),
-	SMPL_REG(pmc6, PERF_REG_POWERPC_PMC6),
-	SMPL_REG(sdar, PERF_REG_POWERPC_SDAR),
-	SMPL_REG(siar, PERF_REG_POWERPC_SIAR),
-	SMPL_REG_END
-};
-
 /* REG or %rREG */
 #define SDT_OP_REGEX1  "^(%r)?([1-2]?[0-9]|3[0-1])$"
 
@@ -233,8 +170,3 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch/riscv/util/perf_regs.c
index 6b1665f41180..2cf7a54106e0 100644
--- a/tools/perf/arch/riscv/util/perf_regs.c
+++ b/tools/perf/arch/riscv/util/perf_regs.c
@@ -2,10 +2,6 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
 uint64_t arch__intr_reg_mask(void)
 {
 	return PERF_REGS_MASK;
@@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/s390/util/perf_regs.c
index 6b1665f41180..2cf7a54106e0 100644
--- a/tools/perf/arch/s390/util/perf_regs.c
+++ b/tools/perf/arch/s390/util/perf_regs.c
@@ -2,10 +2,6 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
 uint64_t arch__intr_reg_mask(void)
 {
 	return PERF_REGS_MASK;
@@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
-
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x86/util/perf_regs.c
index 12fd93f04802..a7ca4154fdf9 100644
--- a/tools/perf/arch/x86/util/perf_regs.c
+++ b/tools/perf/arch/x86/util/perf_regs.c
@@ -13,48 +13,6 @@
 #include "../../../util/pmu.h"
 #include "../../../util/pmus.h"
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG(AX, PERF_REG_X86_AX),
-	SMPL_REG(BX, PERF_REG_X86_BX),
-	SMPL_REG(CX, PERF_REG_X86_CX),
-	SMPL_REG(DX, PERF_REG_X86_DX),
-	SMPL_REG(SI, PERF_REG_X86_SI),
-	SMPL_REG(DI, PERF_REG_X86_DI),
-	SMPL_REG(BP, PERF_REG_X86_BP),
-	SMPL_REG(SP, PERF_REG_X86_SP),
-	SMPL_REG(IP, PERF_REG_X86_IP),
-	SMPL_REG(FLAGS, PERF_REG_X86_FLAGS),
-	SMPL_REG(CS, PERF_REG_X86_CS),
-	SMPL_REG(SS, PERF_REG_X86_SS),
-#ifdef HAVE_ARCH_X86_64_SUPPORT
-	SMPL_REG(R8, PERF_REG_X86_R8),
-	SMPL_REG(R9, PERF_REG_X86_R9),
-	SMPL_REG(R10, PERF_REG_X86_R10),
-	SMPL_REG(R11, PERF_REG_X86_R11),
-	SMPL_REG(R12, PERF_REG_X86_R12),
-	SMPL_REG(R13, PERF_REG_X86_R13),
-	SMPL_REG(R14, PERF_REG_X86_R14),
-	SMPL_REG(R15, PERF_REG_X86_R15),
-#endif
-	SMPL_REG2(XMM0, PERF_REG_X86_XMM0),
-	SMPL_REG2(XMM1, PERF_REG_X86_XMM1),
-	SMPL_REG2(XMM2, PERF_REG_X86_XMM2),
-	SMPL_REG2(XMM3, PERF_REG_X86_XMM3),
-	SMPL_REG2(XMM4, PERF_REG_X86_XMM4),
-	SMPL_REG2(XMM5, PERF_REG_X86_XMM5),
-	SMPL_REG2(XMM6, PERF_REG_X86_XMM6),
-	SMPL_REG2(XMM7, PERF_REG_X86_XMM7),
-	SMPL_REG2(XMM8, PERF_REG_X86_XMM8),
-	SMPL_REG2(XMM9, PERF_REG_X86_XMM9),
-	SMPL_REG2(XMM10, PERF_REG_X86_XMM10),
-	SMPL_REG2(XMM11, PERF_REG_X86_XMM11),
-	SMPL_REG2(XMM12, PERF_REG_X86_XMM12),
-	SMPL_REG2(XMM13, PERF_REG_X86_XMM13),
-	SMPL_REG2(XMM14, PERF_REG_X86_XMM14),
-	SMPL_REG2(XMM15, PERF_REG_X86_XMM15),
-	SMPL_REG_END
-};
-
 struct sdt_name_reg {
 	const char *sdt_name;
 	const char *uprobe_name;
@@ -276,11 +234,6 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
 	return SDT_ARG_VALID;
 }
 
-const struct sample_reg *arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
-
 uint64_t arch__intr_reg_mask(void)
 {
 	struct perf_event_attr attr = {
diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.c b/tools/perf/util/arm64-frame-pointer-unwind-support.c
index 958afe8b821e..858ce2b01812 100644
--- a/tools/perf/util/arm64-frame-pointer-unwind-support.c
+++ b/tools/perf/util/arm64-frame-pointer-unwind-support.c
@@ -2,7 +2,6 @@
 #include "arm64-frame-pointer-unwind-support.h"
 #include "callchain.h"
 #include "event.h"
-#include "perf_regs.h" // SMPL_REG_MASK
 #include "unwind.h"
 #include <string.h>
 
@@ -15,6 +14,8 @@ struct entries {
 	size_t length;
 };
 
+#define SMPL_REG_MASK(b) (1ULL << (b))
+
 static bool get_leaf_frame_caller_enabled(struct perf_sample *sample)
 {
 	struct regs_dump *regs;
diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/parse-regs-options.c
index cda1c620968e..d3a429f2477f 100644
--- a/tools/perf/util/parse-regs-options.c
+++ b/tools/perf/util/parse-regs-options.c
@@ -5,15 +5,52 @@
 #include <string.h>
 #include <stdio.h>
 #include "util/debug.h"
+#include <dwarf-regs.h>
 #include <subcmd/parse-options.h>
 #include "util/perf_regs.h"
 #include "util/parse-regs-options.h"
 
+static void list_perf_regs(FILE *fp, uint64_t mask)
+{
+	const char *last_name = NULL;
+
+	fprintf(fp, "available registers: ");
+	for (int reg = 0; reg < 64; reg++) {
+		const char *name;
+
+		if (((1ULL << reg) & mask) == 0)
+			continue;
+
+		name = perf_reg_name(reg, EM_HOST);
+		if (name && (!last_name || strcmp(last_name, name)))
+			fprintf(fp, "%s%s", reg > 0 ? " " : "", name);
+		last_name = name;
+	}
+	fputc('\n', fp);
+}
+
+static int name_to_perf_reg(const char *to_match, uint64_t mask)
+{
+	for (int reg = 0; reg < 64; reg++) {
+		const char *name;
+
+		if (((1ULL << reg) & mask) == 0)
+			continue;
+
+		name = perf_reg_name(reg, EM_HOST);
+		if (!name)
+			continue;
+
+		if (!strcasecmp(to_match, name))
+			return reg;
+	}
+	return -1;
+}
+
 static int
 __parse_regs(const struct option *opt, const char *str, int unset, bool intr)
 {
 	uint64_t *mode = (uint64_t *)opt->value;
-	const struct sample_reg *r = NULL;
 	char *s, *os = NULL, *p;
 	int ret = -1;
 	uint64_t mask;
@@ -27,50 +64,41 @@ __parse_regs(const struct option *opt, const char *str, int unset, bool intr)
 	if (*mode)
 		return -1;
 
-	if (intr)
-		mask = arch__intr_reg_mask();
-	else
-		mask = arch__user_reg_mask();
-
 	/* str may be NULL in case no arg is passed to -I */
-	if (str) {
-		/* because str is read-only */
-		s = os = strdup(str);
-		if (!s)
-			return -1;
-
-		for (;;) {
-			p = strchr(s, ',');
-			if (p)
-				*p = '\0';
-
-			if (!strcmp(s, "?")) {
-				fprintf(stderr, "available registers: ");
-				for (r = arch__sample_reg_masks(); r->name; r++) {
-					if (r->mask & mask)
-						fprintf(stderr, "%s ", r->name);
-				}
-				fputc('\n', stderr);
-				/* just printing available regs */
-				goto error;
-			}
-			for (r = arch__sample_reg_masks(); r->name; r++) {
-				if ((r->mask & mask) && !strcasecmp(s, r->name))
-					break;
-			}
-			if (!r || !r->name) {
-				ui__warning("Unknown register \"%s\", check man page or run \"perf record %s?\"\n",
-					    s, intr ? "-I" : "--user-regs=");
-				goto error;
-			}
-
-			*mode |= r->mask;
-
-			if (!p)
-				break;
-
-			s = p + 1;
+	if (!str)
+		return -1;
+
+	mask = intr ? arch__intr_reg_mask(): arch__user_reg_mask();
+
+	/* because str is read-only */
+	s = os = strdup(str);
+	if (!s)
+		return -1;
+
+	for (;;) {
+		int reg;
+
+		p = strchr(s, ',');
+		if (p)
+			*p = '\0';
+
+		if (!strcmp(s, "?")) {
+			list_perf_regs(stderr, mask);
+			goto error;
+		}
+		reg = name_to_perf_reg(s, mask);
+		if (reg < 0) {
+			ui__warning("Unknown register \"%s\", check man page or run \"perf record %s?\"\n",
+				s, intr ? "-I" : "--user-regs=");
+			goto error;
 		}
+
+		*mode |= 1ULL << reg;
+
+		if (!p)
+			break;
+
+		s = p + 1;
 	}
 	ret = 0;
 
diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index b58d59b84fb1..ec602da1aeb6 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -22,15 +22,6 @@ uint64_t __weak arch__user_reg_mask(void)
 	return 0;
 }
 
-static const struct sample_reg sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
-const struct sample_reg * __weak arch__sample_reg_masks(void)
-{
-	return sample_reg_masks;
-}
-
 const char *perf_reg_name(int id, uint16_t e_machine)
 {
 	const char *reg_name = NULL;
diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
index 7bfc6a34c02b..2c2a8de6912d 100644
--- a/tools/perf/util/perf_regs.h
+++ b/tools/perf/util/perf_regs.h
@@ -7,17 +7,6 @@
 
 struct regs_dump;
 
-struct sample_reg {
-	const char *name;
-	uint64_t mask;
-};
-
-#define SMPL_REG_MASK(b) (1ULL << (b))
-#define SMPL_REG(n, b) { .name = #n, .mask = SMPL_REG_MASK(b) }
-#define SMPL_REG2_MASK(b) (3ULL << (b))
-#define SMPL_REG2(n, b) { .name = #n, .mask = SMPL_REG2_MASK(b) }
-#define SMPL_REG_END { .name = NULL }
-
 enum {
 	SDT_ARG_VALID = 0,
 	SDT_ARG_SKIP,
@@ -26,7 +15,6 @@ enum {
 int arch_sdt_arg_parse_op(char *old_op, char **new_op);
 uint64_t arch__intr_reg_mask(void);
 uint64_t arch__user_reg_mask(void);
-const struct sample_reg *arch__sample_reg_masks(void);
 
 const char *perf_reg_name(int id, uint16_t e_machine);
 int perf_reg_value(u64 *valp, struct regs_dump *regs, int id);
-- 
2.52.0.457.g6b5491de43-goog


