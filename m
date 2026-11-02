Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC8606D202
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/wdcfZe;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IFYZaGDm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=; b=t/wdcfZeq84n9E
	ngXs0yciotAXln5IzQbw5KuaOtMwpSMBJXVyum/5Rt7tMOxh9/noXatIdrPWKbKcVKH4dL/bpwAdm
	R6wd0SrpF0kb17UNvMrD1h7TYWwtYMWXaotUEbyv5HMkPcjqK0Qp1Vb/YnW8+8WVWhitegAVesjdR
	XmfwLLCZz2TM4Na0z83MeKYl15bl3Z4HhBgAnDKLOl67J53wWxz0qh2qeJpqgw6mI3kUzIe+3Q+RF
	CdxdlvinBX4te1aLlXCbgRS0P7JorCxxgCcC6kW5ZSXZJ18o4Ozk7paoCel9tvhfuCB5zWqwEm+td
	HgOAnrzKNaYGwFdAf8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxG-0000000GQa8-0gQ0;
	Mon, 02 Nov 2026 12:16:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx3-0000000GQQV-1pPw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so29914095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621747; x=1794226547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
        b=IFYZaGDmmFL1H9AJCUcpPcIeWdmnVe+P79pDuATb+a5aQuIJTjwsr3Bm5jX7D1ZCRR
         2iKRTmyHArQZDEh63OAmracA7YWmRfKEt9JMczzlH2OIVgfThRcJbRJ9JjWefYfzxrWF
         VK/qZKxMqAuFhyO52HcCDiA6Epkfxkn8y6gFBxkbdUCNv9akGe7vMRapWIhwSP1Uf4pM
         ZXOGsNCJpXZuRfbXgYMoDoLVclFk1BpMcKlCR21dPooK8hgArPMAxv0lmI2J1fKse0k7
         +2TdgMjThbQygfvNxD0tvPkHBHDCRuyXNdXcwTNuT8yDAGvAWhakWi7mpoald2ja4Eqe
         RiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621747; x=1794226547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
        b=qExXDArwsmWexbj4B9pWyKKnh4B6vEbJUjXNVRT8FPwLO5hJ1Bw7NIcr1BCHUbdSL8
         nM1OXezfjM7OtHTeCqYcOpfI7C+yc2C2788cYC2/U7Sm5eINBMhqjLiuagyOmlB7cHyx
         mUludxhTYEzyZmoNWaIxSKzb1O7pM02bCFd3R1d0AQmRPURCSaP12NDLZViz/0KyaH2Z
         kZkN75S63U83lDv4raBa1FHJ6Prfuhvmk9T/2G9CGbjYy88b4v5zNM2GmihOUiQlpxCc
         nSAegA+Y7EGbWRZBT/c7jeW5QJMsunIQUvrtvIKjLcKkuPrHqZ2iSm5SykdFx+Ge0tEX
         2+3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw22ePk+ZJTs7edGSmWnkfryiz78w+vIuJCvO183nXERNAmd6oDCzdP+w0+NvUtjHAf67ZjC8JwpAoTmW8GCkPn@lists.infradead.org
X-Gm-Message-State: AFq9FYLMDjp3KzAAdUY31AGuGbc3K8dYjo/mboE5lW/zztg9COyuOP/g
	VW1Hm5AnhQvmyPlTk+7Jxl5tMNmw3i887uFHBZSc8OfHOnvgHCwTW2/+M9CXdVO8k9g=
X-Gm-Gg: AYBFou37yKKeYNig/z2hCkXqtBcDF+gxhwOZj0R4EjSSPEdyFge1dxV7GbPqFEEhWzA
	uJ5GFRvvI87qq52XiQ2h9S2hGDC0rrrJtQdIPwIBTb1NXrV+snGopQRWJKfmKfd26MwBPzuowWF
	3GQ1cbK4XAAUVryf3RaGm3kpjFK/hOhSaPSCA/eUixX5qskgw6WkOs6GMTT8AhhXd0PS7uAvVp3
	Yjz+zTzNtaZHBjxwIpqxNqdkh+mVShemiDgnx5WlL89CRTEQ/qG5jF/Ng3GNYRF2XFNOSmkE0NG
	vXAGPEeoX8lM/XIqUIQuVkZE41F/FgOoMd35gGx7BuQGavEiw5cTOrTjuLMp14LXoR9BqJ14Auk
	eelvX2eb5XY3ibld/QewQzpAv0++AulXW9JC7XbPCmGvtQNHEnNYs1WRsaG2d1lBPdmKiJv5XNF
	D/LCGYngWU+J+kslbbpuOJ4BWNZ2hv2mS8Ok0y5r8WLIxiC4NCl9LrJxgw5WkiBYMcC258UJmVl
	dDEfCAuMyXbS53sjsoCAt2qM9Y+RuoIxIzO2QJO1hCeEUOlEkwQWpS/xVBehGfENhbi2n5Lgqrx
	FsKwqZswWDosQVkCR7tAeB77JZz8fQr3
X-Received: by 2002:a05:600c:1990:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ac1923581cmr215808995e9.32.1793621747540;
        Mon, 02 Nov 2026 04:15:47 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:18 +0000
Subject: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
 mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041555_751702_CD5891FC 
X-CRM114-Status: GOOD (  20.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This makes it easier to support multiple threads without creating a
decode tree for every CPU for every thread. It also fixes the CPU field
of synthesised samples being incorrect when the CPU can't be retrieved
using the trace ID in unformatted mode.

It also simplifies by removing a special case in the decode path for
per-thread mode. Per-thread mode is now decoded in exactly the same way
as per-CPU (apart from pre-initialising the context).

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 509ec014b276..f19aa4f787fa 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -296,9 +296,6 @@ static int cs_etm__map_trace_id(struct cs_etm_queue *etmq, u8 trace_chan_id,
 
 static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
 {
-	if (etm->per_thread_decoding)
-		return etm->queues.queue_array[0].priv;
-
 	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
 		return NULL;
 
@@ -436,11 +433,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
 			return -EINVAL;
 		}
 
-		if (etm->per_thread_decoding)
-			cpu_data = etm->metadata[0];
-		else
-			cpu_data = get_cpu_data(etm, queue->cpu);
-
+		cpu_data = get_cpu_data(etm, queue->cpu);
 		if (!cpu_data) {
 			pr_err("CS_ETM: Unformatted queue missing CPU metadata\n");
 			return -EINVAL;
@@ -1301,7 +1294,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 	queue->priv = etmq;
 	etmq->etm = etm;
 	etmq->queue_nr = queue_nr;
-	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
+	queue->cpu = queue_nr;
 	etmq->offset = 0;
 	etmq->sink_id = SINK_UNSET;
 
@@ -2187,6 +2180,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
  */
 static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 {
+	struct cs_etm_auxtrace *etm = etmq->etm;
 	int ret;
 
 	/* The current block is not finished */
@@ -2215,6 +2209,29 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
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
+			tidq->frontend_thread = machine__findnew_thread(
+				&etm->session->machines.host, -1,
+				etmq->buffer->tid);
+			tidq->decode_thread = machine__findnew_thread(
+				&etm->session->machines.host, -1,
+				etmq->buffer->tid);
+		}
+	}
+
 	return 1;
 }
 
@@ -3288,7 +3305,9 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
-		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
+		/* Old per-thread files have no CPU (before v6.4) */
+		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
+		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
 
 		if (!etmq)
 			return -EINVAL;
@@ -3301,6 +3320,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		auxtrace_fragment.auxtrace.size = aux_size;
 		auxtrace_fragment.auxtrace.offset = aux_offset;
 		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
+		auxtrace_fragment.auxtrace.cpu = etmq->queue_nr;
 		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64

-- 
2.43.0


