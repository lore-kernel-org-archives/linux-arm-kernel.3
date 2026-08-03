Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E421C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lOMyDzCSwZWKg7uFx3vnVZinKnCcqtGHVq4Cb2ttXc=; b=IFCHMwzluuv0nm/J+5sth6OlLY
	XztmxWBzGaNUCvtSZoJK7ZYD/JvXtet5auRqqP+jvqgcrl10oJJIVOUHFfaTxcrdq/cUNPdu6jXgh
	RZw0WJek7eBN7nEQWOgGNg0hYPeaqxsfg9aDYit+2rDKPJZavJ9d4tJ/reJoNMSdp+vzBzGw4ndlz
	N8+HwocZM0/oU0jG14Y/MvfbqE/5MFBD3P4OdeubfVgqzbeNgAhWHaIJk8EmtP/0GzYrB+GgHuCtz
	JPVtzc0R0h23b+y/fFClpzcO2qgPhfpJaxQ/L0exrTtb7BjDVYvE7FYYGUa6Zet4N+7UIfnFHm4g0
	JPCvWxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodZ-0000000GeHG-0vdc;
	Mon, 03 Aug 2026 09:07:09 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodW-0000000GeD1-1Fxj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:07:07 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6734sMrV4069467;
	Mon, 3 Aug 2026 02:06:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=2lOMyDzCSwZWKg7uFx3vnVZinKnCcqtGHVq4C
	b2ttXc=; b=Ce02WSQhk5oKB0AgWj5bgeqncNv38xkO0zghJF7FI4tqPqbBWFkH9
	prnVnkkQ1lM0J6ZpTnwZiTN9+lDzsY/hkRGerZNA/HAZKIs7NAouh+lYT55PhIKK
	NDjQun+b3Ds5x+QzR8S/yYAwNZnkMxCMkmGsNKcclyG7hmMNDmIAZytmVGnOBXK8
	VnLw5nBF65DaekOfMKFBYSlcCCtZGZxgbofz/jjWGAq9ylN2rlnyIEzvMGN9fuPJ
	/UEbKZuj2e0Umiul0kMw/2lOFwImqXHI0TbQnyxAvH8xiKKLS7D67KXyKZ+jmPIm
	E4XvH3VvY55UzGtBKvMdrqyRAOj8z6ZBw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fsc41rnw4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Aug 2026 02:06:46 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.45; Mon, 3 Aug
 2026 09:06:45 +0000
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
Subject: [PATCH 5/9] perf cs-etm: Split up cs_etm__process_timestamped_queues()
Date: Mon, 3 Aug 2026 02:06:36 -0700
Message-ID: <20260803090640.2412336-5-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260803090640.2412336-1-aaupov@fb.com>
References: <20260803090640.2412336-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1c::1b]
X-Proofpoint-GUID: GTZ6Ve85zsefTd_VsdcGO-lxhPjScmGA
X-Proofpoint-ORIG-GUID: GTZ6Ve85zsefTd_VsdcGO-lxhPjScmGA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX45UxcL7EUIGU
 irgQotk1RAi0Nu3nfhe09PyXJwmBmsGkVF64Fpd8fLONEFK0EOOGAABetYMFyCwP5y02ikPE9s1
 uXsY1KFgySn4MJ7J0RcgJoefCMM91RTSiL2rDFUYM8GVcQckEGgmMTTdo1yU3Wh4adWW+Ihexje
 597qmj53PelOyw2B5Bl9O80nWTfPLCoB0tE4nlVOMcSO08voN0Zbwc3WH6q/8duSNF0Rzr4e+MU
 TvMUQXEo37ee4b0XLSodgfglW6wkYn3WRrwRmm5lCIy67r5pRTT2AWK3Isx+5t1LbrLUHAY2c2V
 Ga5QoUIYk5Dd5KQ5vwEw7H1otZaRIM1booqPf4NqV9FslIJ94NZUX2Swg0fh9kaCw146FrVr+wr
 FoMJZYajaSAmz9M4akPgcK7dLGqaYyaB4pwBLazBKQ0cBHgxtEO9BwaZ1jsrvG2l2TPHy4blrdT
 sNHMU/3qbUcRkBzK8Ow==
X-Authority-Analysis: v=2.4 cv=A7Fc+aWG c=1 sm=1 tr=0 ts=6a705a26 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=FOH2dFAWAAAA:8 a=nEhC7NrZ7_LQuKocUF8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX/V4tq3+1Wduv
 6cmJavzYOgVpfQ9CDML+NYkO0zPJDWhoVXGL8IbVSO9Hp/X2qw4AsO8Yg2ES4RFAXXj9nokKkre
 UinP7UUDqhBxBsM2z+DwNIyLXOKoVFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_020706_363410_98143CF6 
X-CRM114-Status: GOOD (  23.79  )
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

cs_etm__process_timestamped_queues() currently does three things: it seeds
the auxtrace heap with one entry per queue, it decodes until the heap is
empty, and it then walks every traceID queue to flush whatever is left in
the branch stacks. That is fine while the only caller is
cs_etm__flush_events(), which runs once, but it does not survive the
function being called repeatedly.

Seeding cannot be repeated because a queue that still holds a heap slot
would be seeded again, adding duplicate entries and growing the heap
without bound. Flushing cannot be repeated either, because ending a block
finalises state that later trace still needs.

Move both out. Seeding becomes cs_etm__update_queues(), gated on
queues.new_data so it only runs when new AUX data has been queued, with
etmq->on_heap tracking whether a queue currently occupies a heap slot;
this mirrors intel_pt_update_queues() and intel_pt_queue::on_heap.
Flushing becomes cs_etm__flush_timestamped_queues(). What remains is the
decode loop on its own, which a later patch can then drive incrementally.

No functional change: the sole caller performs the same three steps in the
same order.

Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 tools/perf/util/cs-etm.c | 71 ++++++++++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 114b3cd2da495..4d895f11deb7f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -136,9 +136,13 @@ struct cs_etm_queue {
 	 */
 	struct intlist *own_traceid_list;
 	u32 sink_id;
+	/* Whether this queue currently occupies a slot in etm->heap */
+	bool on_heap;
 };
 
+static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
 static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm);
+static int cs_etm__flush_timestamped_queues(struct cs_etm_auxtrace *etm);
 static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
 					   pid_t tid);
 static int cs_etm__get_data_block(struct cs_etm_queue *etmq);
@@ -939,6 +943,8 @@ static int cs_etm__flush_events(struct perf_session *session,
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
+	int ret;
+
 	if (dump_trace)
 		return 0;
 
@@ -953,7 +959,15 @@ static int cs_etm__flush_events(struct perf_session *session,
 		return cs_etm__process_timeless_queues(etm, -1);
 	}
 
-	return cs_etm__process_timestamped_queues(etm);
+	ret = cs_etm__update_queues(etm);
+	if (ret)
+		return ret;
+
+	ret = cs_etm__process_timestamped_queues(etm);
+	if (ret)
+		return ret;
+
+	return cs_etm__flush_timestamped_queues(etm);
 }
 
 static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
@@ -1330,6 +1344,8 @@ static int cs_etm__queue_first_cs_timestamp(struct cs_etm_auxtrace *etm,
 	 */
 	cs_queue_nr = TO_CS_QUEUE_NR(queue_nr, trace_chan_id);
 	ret = auxtrace_heap__add(&etm->heap, cs_queue_nr, cs_timestamp);
+	if (!ret)
+		etmq->on_heap = true;
 out:
 	return ret;
 }
@@ -2767,23 +2783,30 @@ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
 	return 0;
 }
 
-static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
+/*
+ * Seed the heap with one entry from each queue that is not already
+ * represented in it, so that decoding proceeds in time order across all
+ * queues. Only queues that have newly queued data need to be considered.
+ */
+static int cs_etm__update_queues(struct cs_etm_auxtrace *etm)
 {
 	int ret = 0;
-	unsigned int cs_queue_nr, queue_nr, i;
-	u8 trace_chan_id;
-	u64 cs_timestamp;
-	struct auxtrace_queue *queue;
+	unsigned int i;
 	struct cs_etm_queue *etmq;
-	struct cs_etm_traceid_queue *tidq;
+
+	if (!etm->queues.new_data)
+		return 0;
+
+	etm->queues.new_data = false;
 
 	/*
 	 * Pre-populate the heap with one entry from each queue so that we can
-	 * start processing in time order across all queues.
+	 * start processing in time order across all queues. Skip queues that
+	 * already occupy a heap slot, otherwise they would be added twice.
 	 */
 	for (i = 0; i < etm->queues.nr_queues; i++) {
 		etmq = etm->queues.queue_array[i].priv;
-		if (!etmq)
+		if (!etmq || etmq->on_heap)
 			continue;
 
 		ret = cs_etm__queue_first_cs_timestamp(etm, etmq, i);
@@ -2791,6 +2814,19 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
 			return ret;
 	}
 
+	return ret;
+}
+
+static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
+{
+	int ret = 0;
+	unsigned int cs_queue_nr, queue_nr;
+	u8 trace_chan_id;
+	u64 cs_timestamp;
+	struct auxtrace_queue *queue;
+	struct cs_etm_queue *etmq;
+	struct cs_etm_traceid_queue *tidq;
+
 	while (1) {
 		if (!etm->heap.heap_cnt)
 			break;
@@ -2807,6 +2843,7 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
 		 * to process it.
 		 */
 		auxtrace_heap__pop(&etm->heap);
+		etmq->on_heap = false;
 
 		tidq  = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
 		if (!tidq) {
@@ -2874,7 +2911,21 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
 		 */
 		cs_queue_nr = TO_CS_QUEUE_NR(queue_nr, trace_chan_id);
 		ret = auxtrace_heap__add(&etm->heap, cs_queue_nr, cs_timestamp);
+		if (ret)
+			goto out;
+		etmq->on_heap = true;
 	}
+out:
+	return ret;
+}
+
+/* Flush any branch stack entries left over once all trace is decoded */
+static int cs_etm__flush_timestamped_queues(struct cs_etm_auxtrace *etm)
+{
+	int ret = 0;
+	unsigned int i;
+	struct cs_etm_queue *etmq;
+	struct cs_etm_traceid_queue *tidq;
 
 	for (i = 0; i < etm->queues.nr_queues; i++) {
 		struct int_node *inode;
@@ -2893,7 +2944,7 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
 				return ret;
 		}
 	}
-out:
+
 	return ret;
 }
 
-- 
2.52.0


