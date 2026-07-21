Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A0C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W4rBkBK95ZJGVsiJi8HyhTmrnCVIinrUkr1vptPQojM=; b=vLmafs8AhJptLHFbg5Ht99ge/w
	HHtCrI/a/PpScI+xL0ne8EAm+Bc3py5E0hAMuCorS7cqV1LgN3QN5XMJ3Gumzvttd67yZ8M92/ir5
	f7vMuIrcZBKFeFMvg/O4Wb4dio8JvlD+EuFExALQN/xE89R8+BpG9dYcGpP10JtPTEjj5z1YyCYbE
	fxfqUH/XS0RvnA5NFGv0WDllTKL6a9hCecwsUMa4fjk5KBdvTPtm67H/7iSStJD2XK4vjiAR/EEH4
	0hMGHMM6ghbsrMiAn250LsKKzr0X7ImS9QRtg3nCl/hudzin/I6hzpcMYNdQ/Jfr5c6aQHhDuBtu7
	wBRqfwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBgg-00000009gUL-2zAQ;
	Tue, 21 Jul 2026 14:43:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBgf-00000009gU5-08jS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:43:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B5C760A5D;
	Tue, 21 Jul 2026 14:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D251F00A3D;
	Tue, 21 Jul 2026 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784644992;
	bh=W4rBkBK95ZJGVsiJi8HyhTmrnCVIinrUkr1vptPQojM=;
	h=Subject:To:Cc:From:Date;
	b=y+MuLHVjUHUO36lbJXyK2J1xuI48Dyby42harp47+j4eGJjzwm94qW9WwSad7QFuW
	 nUHgJlVxR4WUiC76kABMPFbAzpJ6j4e92YYddUwYF3sLG1uLkzucpODoUnJwSYXy3F
	 B+KN68AwDvBjS3qBZHAJO0IvLj4Vuc/KkR4Ub76Q=
Subject: Patch "perf arm-spe: Use old behavior when opening old SPE files" has been added to the 6.12-stable tree
To: Julio.Suarez@arm.com,Kiel.Friedt@arm.com,Ryan.Roberts@arm.com,bwicaksono@nvidia.com,gregkh@linuxfoundation.org,james.clark@linaro.org,john.g.garry@oracle.com,leo.yan@arm.com,linux-arm-kernel@lists.infradead.org,mike.leach@linaro.org,namhyung@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 21 Jul 2026 16:42:11 +0200
Message-ID: <2026072111-progeny-perfected-c5e4@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    perf arm-spe: Use old behavior when opening old SPE files

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-arm-spe-use-old-behavior-when-opening-old-spe-files.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ba993e5ada1ddce7a71140dc85ef65bc2cd981bc Mon Sep 17 00:00:00 2001
From: James Clark <james.clark@linaro.org>
Date: Tue, 29 Oct 2024 14:37:33 +0000
Subject: perf arm-spe: Use old behavior when opening old SPE files

From: James Clark <james.clark@linaro.org>

commit ba993e5ada1ddce7a71140dc85ef65bc2cd981bc upstream.

Since the linked commit, we stopped interpreting data source if the
perf.data file doesn't have the new metadata version. This means that
perf c2c will show no samples in this case.

Keep the old behavior so old files can be opened, but also still show
the new warning that updating might improve the decoding.

Also re-write the warning to be more concise and specific to a user.

Fixes: ba5e7169e548 ("perf arm-spe: Use metadata to decide the data source feature")
Signed-off-by: James Clark <james.clark@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Cc: Julio.Suarez@arm.com
Cc: Kiel.Friedt@arm.com
Cc: Ryan.Roberts@arm.com
Cc: Will Deacon <will@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: John Garry <john.g.garry@oracle.com>
Link: https://lore.kernel.org/r/20241029143734.291638-1-james.clark@linaro.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/arm-spe.c |   50 ++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -655,37 +655,35 @@ static bool arm_spe__is_common_ds_encodi
 	u64 *metadata = NULL;
 	u64 midr = 0;
 
-	/*
-	 * Metadata version 1 doesn't contain any info for MIDR.
-	 * Simply return false in this case.
-	 */
+	/* Metadata version 1 assumes all CPUs are the same (old behavior) */
 	if (spe->metadata_ver == 1) {
-		pr_warning_once("The data file contains metadata version 1, "
-				"which is absent the info for data source. "
-				"Please upgrade the tool to record data.\n");
-		return false;
-	}
-
-	/* CPU ID is -1 for per-thread mode */
-	if (speq->cpu < 0) {
-		/*
-		 * On the heterogeneous system, due to CPU ID is -1,
-		 * cannot confirm the data source packet is supported.
-		 */
-		if (!spe->is_homogeneous)
-			return false;
+		const char *cpuid;
 
-		/* In homogeneous system, simply use CPU0's metadata */
-		if (spe->metadata)
-			metadata = spe->metadata[0];
+		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
+		cpuid = perf_env__cpuid(spe->session->evlist->env);
+		midr = strtol(cpuid, NULL, 16);
 	} else {
-		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-	}
+		/* CPU ID is -1 for per-thread mode */
+		if (speq->cpu < 0) {
+			/*
+			 * On the heterogeneous system, due to CPU ID is -1,
+			 * cannot confirm the data source packet is supported.
+			 */
+			if (!spe->is_homogeneous)
+				return false;
+
+			/* In homogeneous system, simply use CPU0's metadata */
+			if (spe->metadata)
+				metadata = spe->metadata[0];
+		} else {
+			metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+		}
 
-	if (!metadata)
-		return false;
+		if (!metadata)
+			return false;
 
-	midr = metadata[ARM_SPE_CPU_MIDR];
+		midr = metadata[ARM_SPE_CPU_MIDR];
+	}
 
 	is_in_cpu_list = is_midr_in_range_list(midr, common_ds_encoding_cpus);
 	if (is_in_cpu_list)


Patches currently in stable-queue which might be from james.clark@linaro.org are

queue-6.12/perf-arm-spe-use-arm_spe_op_branch_eret-when-synthes.patch
queue-6.12/perf-arm-spe-correctly-set-sample-flags.patch
queue-6.12/perf-cs-etm-queue-context-packets-for-frontend.patch
queue-6.12/perf-arm-spe-add-branch-stack.patch
queue-6.12/perf-arm-spe-use-metadata-to-decide-the-data-source-.patch
queue-6.12/perf-pmu-skip-test-on-arm64-when-slots-is-zero.patch
queue-6.12/perf-sched-add-missing-mmap2-handler-in-timehist.patch
queue-6.12/perf-synthetic-events-fix-stale-build-id-in-module-mmap2-records.patch
queue-6.12/perf-inject-add-convert-callchain-option.patch
queue-6.12/perf-build-id-ensure-snprintf-string-is-empty-when-size-is-0.patch
queue-6.12/perf-debuginfo-fix-libdw-api-contract-violations.patch
queue-6.12/coresight-etm4x-correct-trcvmidcctlr1-save-and-resto.patch
queue-6.12/perf-event-fix-size-of-synthesized-sample-with-branc.patch
queue-6.12/perf-remove-redundant-kernel.h-include.patch
queue-6.12/perf-fix-off-by-one-stack-buffer-overflow-in-kallsym.patch
queue-6.12/perf-inject-with-convert-callchain-ignore-the-dummy-event-for-dwarf-stacks.patch
queue-6.12/perf-maps-add-maps__mutate_mapping.patch
queue-6.12/perf-arm-spe-use-old-behavior-when-opening-old-spe-files.patch

