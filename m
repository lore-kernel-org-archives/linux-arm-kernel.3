Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2158AC982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chajH5Uyn12dUr684RYX8s7Kwwsu5KwSPvmKiPCpDUw=; b=fUcbdogo2EujQJs7BSiOvPmAEV
	tH4+Vr6eIop92cnYyLdeH1aRLAD2Jzdsv2cFFFFpUQNtJn69lgyslDqNImJRokXs/gIRxNmtatTWX
	2rx11KmfARA/Og8bzLCEgOMxJwBojoKhqQfH0YnWIyesfN8nqMX1AG1cDQhfuy4mBn3BJn752ym+A
	zblvcbb01D08Zm4UGuVQ4J0jVAqXyKreXrRquYOKECJVlOzhWQofCknExXu58m8VBzCi93FtV7BW7
	XoTG9qR2MzKntfzKBLtiT4deqytEDS/vngxVZSucTqzgdbftoWpI8aisz830qLyL7f/hRyXYsrQ3m
	CS/q2a1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQd-00000007Il0-2rmO;
	Tue, 15 Sep 2026 15:50:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPz-00000007ICy-1WKU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=chajH5Uyn12dUr684RYX8s7Kwwsu5KwSPvmKiPCpDUw=; b=Z9YhMw50zlwAJGeQhVsQTYWiJl
	zEyHafxYwKcje8IgmhLG38HnoGTN9gTSoeRYETL8vstjZpL9pytmqz2X3zfvbGSnowxRWGElzUgT0
	ClxbxGCnioHepNZ6O+IxpRiF0FrVc+bfoLOCDXHuPKE0s4AGYrm51OfpjlroeG14NovAOUHP1X56I
	fVE079ayqd1RS2Vb19ETWRLjak1xro3Kq/0FVuWwyuKfFu9Ri2lSGi9UXdnKQMT+xItR0S4GT2AKm
	IYR2+TFgLdfMqVpTib83PWbKtg2O2in3bvAEs4Sc8c9yZDE+noEKA8ajVvtPBLe2wjEM1JsDsPODi
	OIR1IczQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VPv-00000006yY4-0Jjh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C7D61570;
	Tue, 15 Sep 2026 08:49:50 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A550C3F882;
	Tue, 15 Sep 2026 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487394; bh=M6nqCi/crONOiSQCUR9ebCZXN0BqQCYtCGnaHG7Fm3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cdLyKYlvjIsbO9h1g6r+fzgWKXudScU1Iv6uZNOzp5LiiEcQ9yWuWy8SLNVqbjv0m
	 BUEZXeRpsQ+417PqpCq3LKpipFp5gyocY3Z/TnIkoG1CXDM65LoVk7FslnE9w3P4J/
	 /2aV+o3o0tnBrwYuHzpVOtmMF22ZmhMtumh49vfM=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:05 +0100
Subject: [PATCH 19/25] perf cs-etm: Propagate errors from trace queue
 flushing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-19-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487341; l=3038;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=M6nqCi/crONOiSQCUR9ebCZXN0BqQCYtCGnaHG7Fm3U=;
 b=G4NLdPyQpLVOuFsk9+NyG+u9mJpgzbism1K/8D1yQs6qhKsCfH9hrgv5/wL71KrEZ/fCx2dph
 A/NmBRW20ARCjHe9BeGmMlW8B4U8qU0zu9kzPllQ32ZilECj7YlyCnc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_164955_358744_DB364711 
X-CRM114-Status: GOOD (  16.01  )
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

cs_etm__flush() can fail while synthesizing or delivering a sample at a
trace discontinuity. cs_etm__process_traceid_queue() ignores the result
and continues even though the packet swap and thread stack flush may
not have completed.

The timestamped decoder also loses errors when it processes packets
left at the end of an AUX buffer: cs_etm__clear_all_traceid_queues()
discards the result from each trace ID queue and allows decoding to
fetch the next buffer.

Check the discontinuity flush result, make
cs_etm__clear_all_traceid_queues() return the first queue-processing
error, and propagate that error through
cs_etm__process_timestamped_queues(). This stops decoding on failure
and reports the error to the caller, including sample delivery errors
from a perf script dlfilter.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 1a53431161e995ba6b3cfdc86e338ed26e675774..8340b8a16fed363795fc78ffbc419661a61442a3 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2644,10 +2644,13 @@ static int cs_etm__process_traceid_queue(struct cs_etm_queue *etmq,
 			break;
 		case CS_ETM_DISCONTINUITY:
 			/*
-			 * Discontinuity in trace, flush
-			 * previous branch stack
+			 * Flush the previous branch stack at a discontinuity.
+			 * Propagate sample delivery errors, which can occur before
+			 * the packet swap and thread stack flush are complete.
 			 */
-			cs_etm__flush(etmq, tidq);
+			ret = cs_etm__flush(etmq, tidq);
+			if (ret)
+				goto out;
 			break;
 		case CS_ETM_EMPTY:
 			/*
@@ -2665,9 +2668,9 @@ static int cs_etm__process_traceid_queue(struct cs_etm_queue *etmq,
 	return ret;
 }
 
-static void cs_etm__clear_all_traceid_queues(struct cs_etm_queue *etmq)
+static int cs_etm__clear_all_traceid_queues(struct cs_etm_queue *etmq)
 {
-	int idx;
+	int idx, ret;
 	struct int_node *inode;
 	struct cs_etm_traceid_queue *tidq;
 	struct intlist *traceid_queues_list = etmq->traceid_queues_list;
@@ -2676,9 +2679,12 @@ static void cs_etm__clear_all_traceid_queues(struct cs_etm_queue *etmq)
 		idx = (int)(intptr_t)inode->priv;
 		tidq = etmq->traceid_queues[idx];
 
-		/* Ignore return value */
-		cs_etm__process_traceid_queue(etmq, tidq);
+		ret = cs_etm__process_traceid_queue(etmq, tidq);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static int cs_etm__run_timeless_decoder(struct cs_etm_queue *etmq)
@@ -2893,7 +2899,9 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm,
 			 * process in this auxtrace_buffer.  As such empty and
 			 * flush all traceID queues.
 			 */
-			cs_etm__clear_all_traceid_queues(etmq);
+			ret = cs_etm__clear_all_traceid_queues(etmq);
+			if (ret)
+				goto out;
 
 			/* Fetch another auxtrace_buffer for this etmq */
 			goto refetch;

-- 
2.34.1


