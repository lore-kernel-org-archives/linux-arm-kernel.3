Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0527C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKWoAB+Hv68SqtguaPfGo8heCnp03xOBT1l1Y35v0oM=; b=yFHgoT6RbbbhRcF8egi3pEzE3B
	t1aCCHHqC2oDOH7CHkNXpvoH9av9KF1GB78SdELoLKTYeML2wvX0sqsxRMbCOnSi2m5jsRH1uTfP1
	gEOxqqSQJpxXG0SW/ZyqFjoX/AeWMOBqRT4eQwCC4ukpfEtizBHsGUcbHR+c23674H1I4hUGEvZIP
	zUqbpgrniT3I8RAr3fUT6A/E/kRR7BxNQpHZRcyE/KY8BmbLIqakfUGayfUXfb9Y0jZnx9CZc/mdS
	d1UYyJnnU8RGFJ9MZWjAdwNceZXeKExQJl8E7kH/iUvQjR1iagxwUjUvSdqLl38GD++SRnNdHqLXK
	VNrLrIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodX-0000000GeEB-0MZD;
	Mon, 03 Aug 2026 09:07:07 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodS-0000000Ge9V-0WXi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:07:03 +0000
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673390NJ4181636;
	Mon, 3 Aug 2026 02:06:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=IKWoAB+Hv68SqtguaPfGo8heCnp03xOBT1l1Y
	35v0oM=; b=LLSPnSOvRa1hTtWnru+pFxFQ2BJr0nlDa/asLs89ZIfJNk8AxcOPm
	4tki/18+hUWkcKJTWlPAoXwBslEykNOvRNpJ8zqvuMn6ruypF2UWB+R/zOFgYBfO
	GJQSNcqi99kvZ+KJbtd/LdGEIgDoo9AhBuFFRU456BxMUDz0T7Y4nLrj+RNTMdwH
	Okg+fXfxdsWLOrod8AS/5toXZg9Xr/Lns05QYGDWSQbiH0TdX/xn87VbEEQMqVIx
	gaxEo5JO0oHi9PU6kcxhw82OH07+RBZ1r/RPk3vt4RtzVTPr2KOvbOKUwlPhd77L
	qn2sQvJLRZFYQfPN6OO3rDbDEqhv+KtnQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fscu0rj6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Aug 2026 02:06:48 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.45; Mon, 3 Aug
 2026 09:06:48 +0000
From: Amir Ayupov <aaupov@fb.com>
To: <linux-perf-users@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan
	<leo.yan@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim
	<namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
CC: <linux-doc@vger.kernel.org>, Mike Leach <mike.leach@arm.com>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Swapnil
 Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH 8/9] perf cs-etm: Consume branch history when attaching it to a sample
Date: Mon, 3 Aug 2026 02:06:39 -0700
Message-ID: <20260803090640.2412336-8-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260803090640.2412336-1-aaupov@fb.com>
References: <20260803090640.2412336-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::7cb7]
X-Proofpoint-ORIG-GUID: _gaIApHwxhvFH32BbfUu_MIlncnuTUoq
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a705a28 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=JX5eeHWyqfutqg6f:21 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22 a=FOH2dFAWAAAA:8
 a=oMKByweLQ60yn3b1VYsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfXybzRRewq0SPl
 AC2aaGJBgP6F4n+AKFVg/7wWR5vNnT5ONRoQ4Wooxqil++XlTwiKLLplDMlrPIZE4efBTzjCgal
 S4EpCAK7jJv0MN83hY9YjCbUfgl7bVZLiFVhsB1sG8cYmkaKm6hfpmyFUoFjpXQKEqF4tfn8dvj
 pYKxnkT09krW265lu3uQ+Jt9xUg6/GAteIaaDv9fFXfhTbMCIUhcnRSceoqrNvk3qbKAcqdWF8f
 t5E1xPlWCsbt/P/dYf+c57VJDntXTQfZwezEvwr3+ySeEsQFVbAbOZNGcbJqfZaeDTncQflHyB8
 RM20Rs4qwVZYAxOiIhRHVenI3hxlgDvSBbuvTWtqrFbXHD9vDyCSaV6Cwl3lRZbWOawCE8ARwec
 Wv46a26Oq/o5+es9y+HBmrOlEMvf7P6WlY8HjMc4G0t2zfIZU1HOWO3/mQOuRLgshPTl0JBuCKc
 DpvsdVcMQD3NkHRD2Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX3iNKszwg6Feb
 3Z9dkepwVLr8BdTb2GsakQFpE41DqV5CysmaK8gyqNQCWR/HbrzTyHypYIokli6JrSWwtN0uP+Z
 BAt7a7cNgTScsuHSLMETf01yXeEnnD4=
X-Proofpoint-GUID: _gaIApHwxhvFH32BbfUu_MIlncnuTUoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_020702_172475_499BB287 
X-CRM114-Status: GOOD (  24.12  )
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

--itrace=L attaches whatever the thread stack holds when a sample is
processed. With a duty cycled trace most samples fire while the trace is
off. Those samples have nothing newly decoded, but the thread stack still
holds the previous window, so they were being given branches that ran an
arbitrary amount of time earlier as if they immediately preceded the
sample.

The reconstruction is discarded on a trace discontinuity, but that does
not help here: the discontinuity that ends a gap is only decoded once
trace resumes, which is after the samples in the gap have been processed.

A trace window belongs to exactly one sample. With AUX pause and resume
the sample is what stops the trace, so the pairing is one to one by
construction. Take the branch history when attaching it instead of
copying it, and a later sample with nothing newly decoded then finds an
empty branch stack, which dlfilter-nonempty-brstack.so removes.

This is not a small correction. On a 12 s single-threaded capture with
pause period 100003 and resume period 8350251, of 335291 samples that
previously received branch history only 3371 were backed by trace decoded
for that sample; the other 331920 repeated an earlier window. The
proportion follows the ETM duty cycle, so it holds for any low duty cycle
configuration.

Note that thread_stack__br_sample(), used by lowercase --itrace=l, still
copies, so synthesised instruction samples keep the overlapping branch
stacks they have today.

Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 tools/perf/util/cs-etm.c       | 17 ++++++++---------
 tools/perf/util/thread-stack.c | 17 +++++++++++++++++
 tools/perf/util/thread-stack.h |  1 +
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 048ff97caa936..a3498a0a96a05 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3123,19 +3123,18 @@ static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
 		return -ENOMEM;
 
 	/*
-	 * The thread stack is emptied when the decoder reports a
-	 * discontinuity and when a queue runs out of trace, so branches from
-	 * before either of those are never reported.
-	 *
-	 * Note that a sample landing in a gap between two trace windows is
-	 * not covered by that: the discontinuity that ends the gap has not
-	 * been decoded at this point, so the preceding window is still in
-	 * the thread stack and gets attached. Filtering those out needs a
-	 * per-window end time that the decoder does not currently expose.
+	 * Take the branch history rather than copying it. The trace window
+	 * belongs to the sample that ends it, so once it has been attached a
+	 * later sample with nothing newly decoded finds an empty stack rather
+	 * than being given an earlier window's branches. That is the common
+	 * case whenever the trace is duty cycled, by AUX pause/resume or by
+	 * ETM strobing.
 	 */
 	thread_stack__br_sample_late(thread, sample->cpu, etm->br_stack,
 				     etm->br_stack_sz, sample->ip,
 				     machine__kernel_start(machine));
+	thread_stack__br_stack_consume(thread, sample->cpu);
+
 	if (etm->br_stack->nr)
 		sample->branch_stack = etm->br_stack;
 
diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
index 51eaedb47bb1d..374a291aa48fe 100644
--- a/tools/perf/util/thread-stack.c
+++ b/tools/perf/util/thread-stack.c
@@ -614,6 +614,23 @@ void thread_stack__sample_late(struct thread *thread, int cpu,
 	}
 }
 
+/*
+ * Branch history belongs to the sample that ends the trace window, so a
+ * decoder that attaches it to an existing sample should take it rather than
+ * copy it. A later sample with no newly decoded trace then finds an empty
+ * branch stack instead of the previous window's branches.
+ */
+void thread_stack__br_stack_consume(struct thread *thread, int cpu)
+{
+	struct thread_stack *ts = thread__stack(thread, cpu);
+
+	if (!ts || !ts->br_stack_rb)
+		return;
+
+	ts->br_stack_pos = 0;
+	ts->br_stack_rb->nr = 0;
+}
+
 void thread_stack__br_sample(struct thread *thread, int cpu,
 			     struct branch_stack *dst, unsigned int sz)
 {
diff --git a/tools/perf/util/thread-stack.h b/tools/perf/util/thread-stack.h
index b3cd09beb62f0..2aec292bd1bcb 100644
--- a/tools/perf/util/thread-stack.h
+++ b/tools/perf/util/thread-stack.h
@@ -88,6 +88,7 @@ void thread_stack__sample(struct thread *thread, int cpu, struct ip_callchain *c
 void thread_stack__sample_late(struct thread *thread, int cpu,
 			       struct ip_callchain *chain, size_t sz, u64 ip,
 			       u64 kernel_start);
+void thread_stack__br_stack_consume(struct thread *thread, int cpu);
 void thread_stack__br_sample(struct thread *thread, int cpu,
 			     struct branch_stack *dst, unsigned int sz);
 void thread_stack__br_sample_late(struct thread *thread, int cpu,
-- 
2.52.0


