Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE6AC5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvr/xW0gPJp55FsCc7tSxN43AAHHoShgvkJBQUdWPcc=; b=yajCX6iqUhmFyt2XEhKolA3huU
	f9BR6VPZa+TsvnEvekriN2OQF/mLLBLxkVDQMzYuq8tPl1+KetRgyl+DPVYjofUWI9n62PrGLArw1
	fQhIyNvs1ekdMaeyhTmyxxdY2Z9rRB9PpIJBhnFUP+keKm+ADLQ0L0r1JzdEGCmuxnUu6ZF9qISYA
	zKVRMMVQobmBzKFBKpH2uD6xLNKyeuZyF+7jy5Mpr+bxuqdsXPYim7v2qijXgbaTV/Vw72DIYPxz+
	chZnPFBTms/M+OUof21XOeyJq3VRmcfy/faGIHeRboTa2A7YbY5BsUCqxYOr0gCD0xL8WVbygCONh
	t7ecksPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsd-0000000Cx4H-0mLk;
	Fri, 21 Aug 2026 09:49:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsR-0000000CwxS-2njx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so7706725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305770; x=1787910570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvr/xW0gPJp55FsCc7tSxN43AAHHoShgvkJBQUdWPcc=;
        b=egTp8CgfK03FWt60zi11hJwkGCZx83FLcD+6Hd8cP4pw4mAIW7QYiQAgVWP5/ccG9I
         lffSWkVRbZgtmaOQgu7YZHBWLb2t90tyvfdnAbsfJqYKUG4yGFZwck8qz0PAti7L1RP2
         CZvLK05vawsXgtDFoVe1h6VhLyv0zEIigE5kaOAEz/+LBeTsB0nCeXjKRHBFIBVkadUA
         0n6DTz7P3iMbcUTp4mIACMaSjwsOrf85xz/YOtcjuV1EPMcorzhJLYW773Z6Ax7B6/oM
         S1f7MIpIBgglhBjy1DvqJ2auL0qszkmUeqwZA9ZC19vOZzsTD1D5aEm0+H0Onxt1uliQ
         SoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305770; x=1787910570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvr/xW0gPJp55FsCc7tSxN43AAHHoShgvkJBQUdWPcc=;
        b=d1uLMbGX9BqUN3q14HboMgmpu7StXVwBuAoglDPlyFSsNE3B84D0kw4BhgVk5aRzXy
         iNdGl2XiIRPoerxrvz0fw8+yHy+F+U8QZHbwHtqDGRe8xJFERcLUbkk/GcjrQ1XfnlWb
         FbQkWpLl3c0HOOiUV5TsKZBDzJ/MCeVr4ViOzSzy+Qd29QQwqAyZ+5WN2H24Zoyq83JB
         FLpB6HZCWa+/dajkfsqMSyAffNdJEGSqj2AGPRqfdAcziWvcao57I3GPgKnCS6aRNhzK
         WT0tg2njNSahRA4e/6cIsCOg70Vh6PoFPH2I82bJAN/RfPjtKbC7HMUX6cp0YzT9a/sp
         jP7g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9mae+DRuDrgn+4CM3QJNtLyaK0Nam3mJ7zzdCIN4RAQ2V0/+RlF0W8Tx2WzDaxaw7g0SFyQUNkUgWb7lTa/BJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyPuvCpjPLWcFuZnzMj0enpo7DXamR94Ab869F3UJbCZPUEkC0v
	RkXGoA7wJ2HahfaDJr0IMhy72lymufpsQj2PNCDt56nOfMDPv42qIHaD/8KZyH22qV0=
X-Gm-Gg: AR+sD11vcaABsxkjzT/nHiBV3xR8d2HJTs7KzGZtLpqWbTklFT/XsyhQKkykqL+1BMm
	CklTP9ulwLVFLBAb3xhzyNCW+ckKg1cm4FYDcpkkff+qSK9mefxNQK914u8uHAyw9OIAe3lyoZD
	s6MKc4Ms9/U2AT7sYHqQ6LH7t9lBqLzGhtAnCq4nFg8ezZ7O9mxkiR6Ke6MRIbI/k5OxJzAo+aY
	MUtfGvo5cY9SxnrFnjNNNo0DaeD23/sffBt+Qgx3EKP/F/JovyrpNv6B2tsdkyi/WscCYKh26c4
	hD/hsPPiZSIBzjlms5ZnIUGQykraJbA+Vz7XPd3/sqjvEqO0JrUjpUam156z3KHK0y8X4iCRpOE
	g1CR1xhZ7PsowR7MJiUH9PcN8LhnPONIl+Mh1t6bCCacw9Z8ydyO1+JT9V0iApGLMpNM+7wyb/v
	rVNurmWG2IGbIkBNz8ZNfRegXnN7QdCHtTSvmBL8GC8IPAB8k3tbjXw5K8TOu39o3y
X-Received: by 2002:a05:600c:8b0f:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-499b82e8e92mr80267695e9.2.1787305769809;
        Fri, 21 Aug 2026 02:49:29 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:29 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:02 +0100
Subject: [PATCH v2 04/14] perf cs-etm: Use per-CPU queues for per-thread
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-4-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024931_966759_AE329794 
X-CRM114-Status: GOOD (  21.98  )
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

This fixes two problems, firstly per-thread mode didn't support multiple
threads well or at all because we always use queue 0 and assumed it was
for a single thread. However, Perf attaches to all child threads of one
process or allows multiple threads to be specified on the commandline.
This meant that trace before a context packet could use the wrong MMAP
for decoding, and threads running concurrently wouldn't be interleaved
properly.

The second problem is that we'd put all HW_IDs into queue 0, so if a
thread runs on multiple CPUs then it would receive multiple HW_IDs and
trigger the assert that unformatted trace should only have 1 decoder
per-CPU:

  $ perf record --per-thread -e cs_etm//u -- taskset --cpu-list 0 \
     taskset --cpu-list 1 true
  $ perf script

  perf: util/cs-etm.c:3381: cs_etm__create_queue_decoders: Assertion `decoders == 1' failed.

Fixes: 9182f04a85b2 ("perf cs-etm: Pass unformatted flag to decoder")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index d423f1cb408f..ccf886efff95 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -295,9 +295,6 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
 
 static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
 {
-	if (etm->per_thread_decoding)
-		return etm->queues.queue_array[0].priv;
-
 	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
 		return NULL;
 
@@ -1268,7 +1265,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 	queue->priv = etmq;
 	etmq->etm = etm;
 	etmq->queue_nr = queue_nr;
-	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
+	queue->cpu = queue_nr;
 	etmq->offset = 0;
 	etmq->sink_id = SINK_UNSET;
 
@@ -2160,6 +2157,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
  */
 static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 {
+	struct cs_etm_auxtrace *etm = etmq->etm;
 	int ret;
 
 	/* The current block is not finished */
@@ -2188,6 +2186,27 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	 */
 	cs_etm__flush_all_stack(etmq);
 
+	/*
+	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
+	 * different threads. When the TID from the AUX record on a CPU changes,
+	 * re-initialize the thread using the AUX record/buffer fragment TID so
+	 * we can start decoding even if the context ID packet was cropped or
+	 * they're disabled.
+	 */
+	if (etm->per_thread_decoding) {
+		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
+							CS_ETM_PER_THREAD_TRACEID);
+
+		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
+			thread__zput(tidq->frontend_thread);
+			thread__zput(tidq->decode_thread);
+			tidq->frontend_thread = machine__findnew_thread(&etm->session->machines.host,
+									-1, etmq->buffer->tid);
+			tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host,
+								      -1, etmq->buffer->tid);
+		}
+	}
+
 	return 1;
 }
 
@@ -3245,7 +3264,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
-		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
+		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, sample->cpu);
 
 		if (!etmq)
 			return -EINVAL;
@@ -3258,6 +3277,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		auxtrace_fragment.auxtrace.size = aux_size;
 		auxtrace_fragment.auxtrace.offset = aux_offset;
 		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
+		auxtrace_fragment.auxtrace.cpu = etmq->queue_nr;
 		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64

-- 
2.43.0


