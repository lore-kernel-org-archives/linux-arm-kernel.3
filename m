Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF4DCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJTJITEGPdk/4GrzqRzWUaDaNlsNW/CyTKDJUYS/xvU=; b=Ka85Fca/EwIalSjk5zGV/kONAt
	rRAVqkXjX6aNzR8eMZ8pbyq7gUg04EvX7hZa+rahvd7awI16HbDY8whcPzUGSR2TSdJm50dtc+EUq
	4sNVNpuQdypI0JYQMstcZVdg5HfXs0FywDB/bMVIR+Kus3OflIDzH8SZpxLInmfq2EYMlQCU/RcQR
	tqbYeGFEMfLZBjgx3YpKE/BIdchyBzTma4q4L+R45WsDPGe205rrbzNqbrOb2rNxu6CKFEQyHUyHD
	RQ+e0NnKUeleC55gveRNZw4aUVTakTEh6MUEiuoFyety098asRLVRfhxKINKX8zvDwwhqJFZn7D8o
	n04Iu10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2BO-00000004Qp9-2LZl;
	Thu, 07 May 2026 17:06:42 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2BM-00000004QoT-1xHY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 17:06:41 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1270dcd11c1so2414739c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778173598; x=1778778398; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NJTJITEGPdk/4GrzqRzWUaDaNlsNW/CyTKDJUYS/xvU=;
        b=RZn/gzWmd/ffs6Z1vXxKBy27uiWkowl8fOZbWDb0jmPBSOaoYlB/eRnogoyDiDobYj
         W0lmCI5rzmSeGVHj7sxeeURIOy+RWFbL55ujxqc4cs1bnY3nr6o2bPwT4NkLj+2Pnnc9
         kjc8cPhLVYAzYQOu/N81gponzd2uCyuYGKIz1LHDjzvjNRFO6oAoDvPfap6jXNipoICq
         R3vPDuHpLLAZLoFjMJASGQCpsU1F8HbC8XeD1ZKUSUgme02SA6RCJy6Jp3sAfIvNAhsI
         n9Eoa3/NmX/pQJFpUZw1t+5OUbJi5ih8JEzn1hrC71wXXymS3t9fNfnbhb7xmOFWljyD
         HMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173598; x=1778778398;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJTJITEGPdk/4GrzqRzWUaDaNlsNW/CyTKDJUYS/xvU=;
        b=CVLPxKaI5LGEH8vPSbj7QR5/EQq3pwTytsrvpFAmzJUtOjWnQHghDpXmQAKIUudrqQ
         nAHa+wqNrLohbsEtV+0Q3t7NITZIMdT41ior8cn/fhIV2arj99iKdcxWd+20udtf+Zne
         D9vUtOMcmS99+c14cXGCBwLvfUdVP7dkW/vXt5A3NI2HRm4i6Hvfgy1UGoLyN+xwkK/q
         YXYOZuaQUl/Uqi4qcJW8uq5QyRB8tjZftvCUcaE3v2tsOnNEBX7d5cMl04saA526sTRx
         VFPpqIf4spS+obDgU5e6zcZh4LoQGMabe+rEicvYY1h90B6pVZhaW1ON9I55Aq9jSptP
         ZI8g==
X-Forwarded-Encrypted: i=1; AFNElJ/Ns8besXDbLQ2n1RYXuiJGSUFpbCxJS6/D6KApN0hWH4mgeGsnwdSSB2TYBsFjvcx4auq4OVL2TNxKeNOhQEyQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3VRK1qsGeQVv2Uf4dRqD0woWNAS4GjzQ9IRGSZi8sp0H3ARlT
	Rr+m24uRJHDXzhZHtYZ/S2EHjPJOmzXP9CKkLUjU4NuLWxc9T/r14JBVIA3U9CrlUPTBq3Ae/Bq
	P0AkNNa4RMw==
X-Received: from dlbrx21.prod.google.com ([2002:a05:7022:1715:b0:12f:1fa4:1a93])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2511:b0:130:6904:8c17
 with SMTP id a92af1059eb24-1319cc2a479mr4879365c88.18.1778173598210; Thu, 07
 May 2026 10:06:38 -0700 (PDT)
Date: Thu,  7 May 2026 10:06:22 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260507170622.611933-1-irogers@google.com>
Subject: [PATCH v1] perf record: Refactor ARM64 leaf caller setup out of arch
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Shimin Guo <shimin.guo@skydio.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_100640_505552_4B6E89B0 
X-CRM114-Status: GOOD (  18.93  )
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

Code in tools/perf/arch causes portability issues/opaqueness and LTO
issues due to the use of weak symbols. Move the adding of LR to the
sample_user_regs into arm64-frame-pointer-unwind-support.c conditional
on EM_HOST == EM_AARCH64 (false on all non-ARM64 builds). This also
better encapsulates the use of the sampled registers by
get_leaf_frame_caller_aarch64 and the set up by the new
add_leaf_frame_caller_opts_aarch64, exposing opportunities for
possibly sampling PC and SP to help the unwinder.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/Build                     |  1 -
 tools/perf/arch/arm64/util/machine.c                 | 12 ------------
 tools/perf/builtin-record.c                          | 11 +++++------
 tools/perf/util/arm64-frame-pointer-unwind-support.c |  6 ++++++
 tools/perf/util/arm64-frame-pointer-unwind-support.h |  2 ++
 5 files changed, 13 insertions(+), 19 deletions(-)
 delete mode 100644 tools/perf/arch/arm64/util/machine.c

diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index 4e06a08d281a..638aa6948ab5 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -5,7 +5,6 @@ perf-util-y += ../../arm/util/pmu.o
 perf-util-y += arm-spe.o
 perf-util-y += header.o
 perf-util-y += hisi-ptt.o
-perf-util-y += machine.o
 perf-util-y += mem-events.o
 perf-util-y += pmu.o
 perf-util-y += tsc.o
diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64/util/machine.c
deleted file mode 100644
index 80fb13c958d9..000000000000
--- a/tools/perf/arch/arm64/util/machine.c
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include "callchain.h" // prototype of arch__add_leaf_frame_record_opts
-#include "perf_regs.h"
-#include "record.h"
-
-#define SMPL_REG_MASK(b) (1ULL << (b))
-
-void arch__add_leaf_frame_record_opts(struct record_opts *opts)
-{
-	opts->sample_user_regs |= SMPL_REG_MASK(PERF_REG_ARM64_LR);
-}
diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 4a5eba498c02..272bba7f4b9e 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -14,6 +14,7 @@
 #include "util/parse-events.h"
 #include "util/config.h"
 
+#include "util/arm64-frame-pointer-unwind-support.h"
 #include "util/callchain.h"
 #include "util/cgroup.h"
 #include "util/header.h"
@@ -3230,10 +3231,6 @@ static int record__parse_off_cpu_thresh(const struct option *opt,
 	return 0;
 }
 
-void __weak arch__add_leaf_frame_record_opts(struct record_opts *opts __maybe_unused)
-{
-}
-
 static int parse_control_option(const struct option *opt,
 				const char *str,
 				int unset __maybe_unused)
@@ -4319,8 +4316,10 @@ int cmd_record(int argc, const char **argv)
 
 	evlist__warn_user_requested_cpus(rec->evlist, rec->opts.target.cpu_list);
 
-	if (callchain_param.enabled && callchain_param.record_mode == CALLCHAIN_FP)
-		arch__add_leaf_frame_record_opts(&rec->opts);
+	if (callchain_param.enabled && callchain_param.record_mode == CALLCHAIN_FP) {
+		if (EM_HOST == EM_AARCH64)
+			add_leaf_frame_caller_opts_aarch64(&rec->opts);
+	}
 
 	err = -ENOMEM;
 	if (evlist__create_maps(rec->evlist, &rec->opts.target) < 0) {
diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.c b/tools/perf/util/arm64-frame-pointer-unwind-support.c
index 858ce2b01812..3af8c7a466e0 100644
--- a/tools/perf/util/arm64-frame-pointer-unwind-support.c
+++ b/tools/perf/util/arm64-frame-pointer-unwind-support.c
@@ -2,6 +2,7 @@
 #include "arm64-frame-pointer-unwind-support.h"
 #include "callchain.h"
 #include "event.h"
+#include "record.h"
 #include "unwind.h"
 #include <string.h>
 
@@ -16,6 +17,11 @@ struct entries {
 
 #define SMPL_REG_MASK(b) (1ULL << (b))
 
+void add_leaf_frame_caller_opts_aarch64(struct record_opts *opts)
+{
+	opts->sample_user_regs |= SMPL_REG_MASK(PERF_REG_ARM64_LR);
+}
+
 static bool get_leaf_frame_caller_enabled(struct perf_sample *sample)
 {
 	struct regs_dump *regs;
diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.h b/tools/perf/util/arm64-frame-pointer-unwind-support.h
index 42d3a45490f5..ba35b295bfcd 100644
--- a/tools/perf/util/arm64-frame-pointer-unwind-support.h
+++ b/tools/perf/util/arm64-frame-pointer-unwind-support.h
@@ -5,8 +5,10 @@
 #include <linux/types.h>
 
 struct perf_sample;
+struct record_opts;
 struct thread;
 
+void add_leaf_frame_caller_opts_aarch64(struct record_opts *opts);
 u64 get_leaf_frame_caller_aarch64(struct perf_sample *sample, struct thread *thread, int user_idx);
 
 #endif /* __PERF_ARM_FRAME_POINTER_UNWIND_SUPPORT_H */
-- 
2.54.0.545.g6539524ca2-goog


