Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94831C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSigklk0YY/8y8Y825wPuagaBgws2jxeudbXBTBNYx8=; b=e3/kVtu4mydCQVpoCVti+ZBCZK
	vMAI8cDJnIpWSaiw9BvN84mbwmAhbbWmzw1PpHYuyfwOF6Faug1wOcoAD4IFbXJ7Lp4qlWwdgWeEI
	U5pZrfcMgyTgCd/47UD8tHK4Vsm9kKj+GyQNhSbzWbNwHA0xT5/2icf9tXwHNETtSOOvFePndBY2x
	kJf41X8cNwY5xl2g6krMRpH28dMvKWNM2E87Nc7Yu+yIFacOfeBtJNdNVNhZgSr73snrBg2dNuCvJ
	3kj7rgxaraX0t83cVqmILqWFsyG7UmadERqectXgPydxHRyNlTsHvdZA40xG2rzgxcsdHQLKdfSfl
	ZAIjiGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtj-0000000Cy1n-1TlC;
	Fri, 21 Aug 2026 09:50:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLti-0000000Cxzz-1zzJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Aug 2026 09:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tSigklk0YY/8y8Y825wPuagaBgws2jxeudbXBTBNYx8=; b=mpMKmFO9f+qIY0zLNyi+SP1f8M
	7E2IZDDQtXN1J9A/jZh2C9QaO6gtu+FqklsmISS6HbMVwbxV8v2M0jZ4MlS0zFb6TV1Y+ucBGFb7e
	7vOth0Kc4PEViycBQwierp/b2ovFcF4xDtLHct7nvHJUWBdYUrdVLlF5+/aJ9AW6fwjusVrjCf5lT
	kBpb/MinNQBI/awosv0AlVC3YsRoBNFy2vHOfFtdVi/fRI1CBy+HxG5MxkOnhBxHcLMSn4gVcaxwq
	bQk2F7YM4HTYhAU5uc9jujmPm6udxDKvt8kImekjNLQ3RFafea4zJmTYa+x8fSrHQtosAW6DG8aQX
	Kq8B35vA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxLtf-00000003eWP-2F6N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:50:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47fd66a094eso273218f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305846; x=1787910646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSigklk0YY/8y8Y825wPuagaBgws2jxeudbXBTBNYx8=;
        b=aGh9AxNB5S7hARZ3emok+4DZjZNp3etti9+GvG8NQtoB0IDKTPVixYX37dUpWb31GX
         AHElkh7/a8VOCCfFtwJZVeJZb75CLX/xNPTipJRtcKYIrTJEb7f6GNMTqKrQsvnh35RB
         UbOuUgi2QpOiF0feBAvRp9kUzbZQKxDYCVbTR+JAGh9Ardg7SV8MlsW4CW5qIxJb6hD6
         My5KqD88g9qefQfaz/zU1PgvV2DPWIM2Nd1XTPcn8yQyukYzCmepXs/e00VEUM6Ew8sQ
         V3guE7ZNgsnfv51tfewNrmXjRvBOw7BFBPoF1SAYeU8j36jKzd3/8F/4t2Mij1/1Hj53
         pnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305846; x=1787910646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSigklk0YY/8y8Y825wPuagaBgws2jxeudbXBTBNYx8=;
        b=dqOJ5CQhI05IhZSTn7m+QjyTkrKxjUp4a3zCc3J/dWweaXBxK1tYPEGpgLuR7h9mBz
         Mv7awsyDlKlr4NHhegmXrqC7Lf86CiYwdvX1w21fF45SY8ikEWVJFZLn8TQv6o1LwMHn
         Re0Bh8e3bKTsfFG7oZZ0u96bgij0zl9qHrcYfK6wr7CUa3G5bvrAns4rpGyvtyH0lWTb
         B9Tlx95J61c6rQB0vr52QP0dtQjVsnfyQnepny7mVfJ+68NagrwZFIkf8iTHed+E8f73
         16yOnB4Em7KXJ0GzXhGs0xh0fLE5FjXvo7dws81D8PGCHq4hv52xgPfBAbqYFgg2dwLT
         AwXg==
X-Forwarded-Encrypted: i=1; AHgh+RqYXqr2P6iPEECWOxIhZDaF9t1bXApGQK+EuKU1Vr0bA5hYMP/0WLDrYl+v1UMcUZbuHuKMBvRMUOSbGfAIGWGY@lists.infradead.org
X-Gm-Message-State: AFuF++mnvQNbgFqUc4vV5IS3TKQ6ig+L9KWWpjDSKDr9dSr6tVM067vw
	tcGAtt1GgMxdk73w8b3cpXEZKmn0iW75u+iPOXbnn0UIxec/RCnVRlwWuxVjkEcYK9E=
X-Gm-Gg: AR+sD127roJlcimBSJZQns7L0WTaX+2skhJzeAJ64PYPvY6x823aDqPoAw4aHLNgH0M
	nju7surGL7l5Gi0UaKB4VQU+3dlLtwfAkEM/SScTE5LFJayI+Gtbd+07xqHI+QQoKvhAtbM3CFX
	9WJc6Ty8x0cFr36KFTV2x1YrzRoKbRaFSm8WgTvuWc4R8+Hi3CdpHcTNpx9PK5q2NuolTd7YzRS
	vJPqLafyvdI41RLIxqc+nhGku4r44U2YQi6wmsuz9W+Ai9W2guPpPtWYJYxoRMKoKobiHDUrDFw
	klHdVKg32GqxCG99JA0lXKf1lbNB809pr9pcOxYSDHAJv28lTzNJVuw9lAbMkE4Xvp+HJkC+ltf
	+/h5ILsMbL5cG6K+RI5A8/XXs0nlWUbNJCaQoL1bl9RxZWJvMeZuu3cRIBYd43eYZdEQwIoC7E8
	DxBJPctEXYnugZyn7LMEaVmUKDWLkMiyi5Us8QOtrb9lHLCFOJX5Q9n20yKdDlRxTv
X-Received: by 2002:adf:e193:0:b0:47f:e760:e5b9 with SMTP id ffacd0b85a97d-482c0ba3a3amr7830202f8f.18.1787305846313;
        Fri, 21 Aug 2026 02:50:46 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm14474284f8f.26.2026.08.21.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:50:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:50:32 +0100
Subject: [PATCH 4/6] perf: cs-etm: Respect --no-itrace option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-hw_id-output-failure-v1-4-9d532ddabcc3@linaro.org>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_105047_759810_BCA02373 
X-CRM114-Status: GOOD (  22.26  )
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

If there is a bug in decoding then Perf will exit early and you can't
investigate by using the raw dump mode. Make the --no-itrace option stop
Coresight decoding after printing the aux header so decode errors don't
stop the rest of the samples being printed.

pmu_type and evsel_is_auxtrace need to be set so that the
unleader_auxtrace() behavior is the same as without --no-itrace.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/auxtrace.c |  2 +-
 tools/perf/util/auxtrace.h |  1 +
 tools/perf/util/cs-etm.c   | 66 +++++++++++++++++++++++++---------------------
 3 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index e3c770b46e94..caa53056d349 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -123,7 +123,7 @@ static int evlist__regroup(struct evlist *evlist, struct evsel *leader, struct e
 	return 0;
 }
 
-static bool auxtrace__dont_decode(struct perf_session *session)
+bool auxtrace__dont_decode(struct perf_session *session)
 {
 	return !session->itrace_synth_opts ||
 	       session->itrace_synth_opts->dont_decode;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 971b817d3396..47fb97136836 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -651,6 +651,7 @@ void auxtrace__free(struct perf_session *session);
 bool auxtrace__evsel_is_auxtrace(struct perf_session *session,
 				 struct evsel *evsel);
 u64 auxtrace_synth_id_range_start(struct evsel *evsel);
+bool auxtrace__dont_decode(struct perf_session *session);
 
 #define ITRACE_HELP \
 "				i[period]:    		synthesize instructions events\n" \
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index dd15e91b7b38..22884c9fdff8 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -969,7 +969,7 @@ static int cs_etm__flush_events(struct perf_session *session,
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	if (dump_trace)
+	if (dump_trace || auxtrace__dont_decode(session))
 		return 0;
 
 	if (!tool->ordered_events)
@@ -3040,7 +3040,7 @@ static int cs_etm__process_event(struct perf_session *session,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
 
-	if (dump_trace)
+	if (dump_trace || auxtrace__dont_decode(session))
 		return 0;
 
 	if (!tool->ordered_events) {
@@ -3603,27 +3603,49 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	int err = 0;
 	int aux_hw_id_found;
 	int i;
-	u64 *ptr = NULL;
+	u64 *ptr = (u64 *) auxtrace_info->priv;
 	u64 **metadata = NULL;
 
-	/* First the global part */
-	ptr = (u64 *) auxtrace_info->priv;
-	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
+	etm = zalloc(sizeof(*etm));
+	if (!etm)
+		return -ENOMEM;
+
+	session->auxtrace = &etm->auxtrace;
+	etm->auxtrace.free = cs_etm__free;
+	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
+	etm->auxtrace.process_event = cs_etm__process_event;
+	etm->auxtrace.process_auxtrace_event = cs_etm__process_auxtrace_event;
+	etm->auxtrace.flush_events = cs_etm__flush_events;
+	etm->auxtrace.free_events = cs_etm__free_events;
+	etm->pmu_type = (unsigned int) ((ptr[CS_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
+
+	/*
+	 * Don't go further than the minimum required to identify this event as
+	 * auxtrace with cs_etm__evsel_is_auxtrace() so unleader_auxtrace()
+	 * works.
+	 */
+	if (auxtrace__dont_decode(session))
+		return 0;
 
 	/*
 	 * Bound num_cpu by the event size: the global header consumes
 	 * CS_ETM_HEADER_SIZE bytes, and each CPU needs at least one u64
 	 * metadata entry after that.
 	 */
+	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
 	priv_size = total_size - event_header_size - INFO_HEADER_SIZE -
 		    CS_ETM_HEADER_SIZE;
 	if (num_cpu <= 0 || priv_size <= 0 ||
-	    num_cpu > priv_size / (int)sizeof(u64))
-		return -EINVAL;
+	    num_cpu > priv_size / (int)sizeof(u64)) {
+		err = -EINVAL;
+		goto err_free_etm;
+	}
 
 	metadata = zalloc(sizeof(*metadata) * num_cpu);
-	if (!metadata)
-		return -ENOMEM;
+	if (!metadata) {
+		err = -ENOMEM;
+		goto err_free_etm;
+	}
 
 	/* Start parsing after the common part of the header */
 	i = CS_HEADER_VERSION_MAX;
@@ -3682,13 +3704,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 		goto err_free_metadata;
 	}
 
-	etm = zalloc(sizeof(*etm));
-
-	if (!etm) {
-		err = -ENOMEM;
-		goto err_free_metadata;
-	}
-
 	/*
 	 * As all the ETMs run at the same exception level, the system should
 	 * have the same PID format crossing CPUs.  So cache the PID format
@@ -3698,7 +3713,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 
 	err = auxtrace_queues__init_nr(&etm->queues, max_cpu + 1);
 	if (err)
-		goto err_free_etm;
+		goto err_free_metadata;
 
 	for (unsigned int j = 0; j < etm->queues.nr_queues; ++j) {
 		err = cs_etm__setup_queue(etm, &etm->queues.queue_array[j], j);
@@ -3736,7 +3751,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	etm->session = session;
 
 	etm->num_cpu = num_cpu;
-	etm->pmu_type = (unsigned int) ((ptr[CS_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
 	etm->snapshot_mode = (ptr[CS_ETM_SNAPSHOT] != 0);
 	etm->metadata = metadata;
 	etm->auxtrace_type = auxtrace_info->type;
@@ -3763,14 +3777,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 			    "you can specify the itrace option 'T' for timestamp decoding\n"
 			    "if the Coresight timestamp on the platform is same with the kernel time.\n\n");
 
-	etm->auxtrace.process_event = cs_etm__process_event;
-	etm->auxtrace.process_auxtrace_event = cs_etm__process_auxtrace_event;
-	etm->auxtrace.flush_events = cs_etm__flush_events;
-	etm->auxtrace.free_events = cs_etm__free_events;
-	etm->auxtrace.free = cs_etm__free;
-	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
-	session->auxtrace = &etm->auxtrace;
-
 	cs_etm__setup_timeless_decoding(etm);
 
 	etm->tc.time_shift = tc->time_shift;
@@ -3853,13 +3859,13 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 
 err_free_queues:
 	cs_etm__free_queues(etm);
-	session->auxtrace = NULL;
-err_free_etm:
-	zfree(&etm);
 err_free_metadata:
 	/* No need to check @metadata[j], free(NULL) is supported */
 	for (int j = 0; j < num_cpu; j++)
 		zfree(&metadata[j]);
 	zfree(&metadata);
+err_free_etm:
+	session->auxtrace = NULL;
+	zfree(&etm);
 	return err;
 }

-- 
2.43.0


