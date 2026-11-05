Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D38606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U+002MHA;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YLIpO1iD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=; b=U+002MHA9DwWtK
	ioyFCleFKf211mZoVsth23e4+rwvXm6xe749rESjgXfcjH4pnOpM0UdAu746qD947rT4eSX5G8v4I
	1Odo+sSN1HZvu6X4BHhzrlDj+h5e9Xqg6zOTFq90nuob55K9uwUOK4bnk8nRlal/NOWzyk7vhz7JM
	jJu2A785a72LB+Kf8L9E3Ke9fRY8KyrTPfJfIFJXiUMuZlibC/gGsUy1gvpaoEbpaZLQ2zqYUqVEF
	OkG3Me3cZkLy5mpQjFhadTuQJMF6B21wtT4JWpknVgl4YzCwP9dgefT5zYqXym/rDwNXDWMRxQydU
	pf+M90NzH8Yhd94Mo4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuK-00000008ilA-36k0;
	Thu, 05 Nov 2026 11:45:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuI-00000008ihd-0cXq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so12629015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879124; x=1794483924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
        b=YLIpO1iDg0I6rJJ0v09idnNfAxa1IVMhGyPdDhEMvThb5L25QCWypd7nvI1d+Q6gAq
         jB01+rvyUpgriDJA4Wzt7/Bp+f8Gm7UloQuYby8nGnQdrQmgh6G+jyS4vMnaxJ0awYDE
         mL+MA1RU1+4Wk3TwY5QhX5Q+dIT3OSggRFrT0kTQ6QuPE+Grue8sScU0t7t90EJKgx6i
         pzXTTazP6q/JpaTBTDjETkVKxBWEirvUQrU6V/xOeu8BLGQiUYvGuL16OTaozUTmkrHW
         eWy/gWR1JFrkGCns4R2g0YlvpLrvmd4TDLmxNxODvFvSAXQDUQkEa4hkiPy+CE5BxPxk
         7tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879124; x=1794483924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
        b=AHcBjlCLrKLZW1Hbvon7GCt5fc1g5gXnBtIXkXOvE3jM5+sTE3ZZGmhWK8CX6QVXby
         brpqhSlUhQw2MMnE5ET7mfQX83JK0m1JO78fpUwsR42uxZ+D0cAccIJQBhGP+NhavTWv
         ectWcb8BsKaI7aCrHvV2NVcjkpVM818eWCy/iSMYVw3bNGSTs6cSixk6UVK8GrR6HEC0
         qcbAfPVJLuZ5HkABwqVIACt82wXMs+WwKlEYxT3RphJylRL7Nh9SlB5NFA9MZWmM4tu6
         y5gYllS/CpONLoVMsOjMAP8KQUD2470yqF8RDzbTE8uhpZGedBoK+PSet51kAKaXei5E
         kvUQ==
X-Forwarded-Encrypted: i=1; AKwUvBztSTJwnI+beIyJMCEpY9k/IEO9hBisJJ7lhoB1VNp2PeFs/ZdwzzchZu6ARmLoXVRdyi+Pe5EeHlT0yi6RU+FJ@lists.infradead.org
X-Gm-Message-State: APuU4Z86Gzau7tEP0StzwuU2IS8SfR+1jAEhRPPK5nc0bhzyZZI4Q5T8
	AUSwB36FwtjinBhnhPhCBOut6sJ7HheNkv/RGBxddwrZwhXv6X6wfERxOBVql97b1Q4=
X-Gm-Gg: AYBFou0/V5UV1gikM6U1xlhXRHnrTUbPBWQNVpJ4LweVbgFs2h9Tze45eunj6GMDiBD
	fH/rW4XSgHmm7Xk+AsTCUN58woX0m7X/UvoB0xE9d1VenxNODDJRT2mYQegkrx8CPj9QZrKO5lE
	Jxpm6+VYvR0/IHWLNqmk8toxAsOHX/kWy1K3vBhLdJp2cKjcfYaFauXA3jAeWs2gWbVsDUkXgaE
	ibVv+qVSjjJGnefdBVb4b+5h1RSZGUELlLkELVF+JBsyVNmyHInOehvmGrlMjhNrQKf445a6gTt
	AbYVHi/jIHrzAa1GGB1tvayAavBSiJLexA5lLQ0pwa47nxu5bHKluIiwAFd1OiD0ozXUul+lW85
	IoPTIGVzzo8jFmdL/sIWk4uYYkP7YvhAf4s0SA/s5jXe1rG7gS3AF6pc9j4fJeUGQb22nU1O5Hu
	vdLwEXNR5nMXTawSqZMooUUGfmtVNEqIpllPhRQr2tcGYGFak1aHXSUJnvamtdo5rTAB/NEnr0G
	E0tMxMpe1IPYpGyHvJlasBPAjEBzI9XgIDX3p6rVnMParoryadjUam5JqXE0z5tQ7/P01YP4vQE
	m8H8h8H+/an1Z/TEkR3MiPllUI84W3Ct
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr378217845e9.29.1793879124465;
        Thu, 05 Nov 2026 03:45:24 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:52 +0000
Subject: [PATCH v4 04/19] perf cs-etm: Use per-CPU queues for per-thread
 mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-4-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034526_240901_7EAF13B2 
X-CRM114-Status: GOOD (  19.66  )
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5abdd726c6d2..966261429da6 100644
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


