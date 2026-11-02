Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F42606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qvvr7mDk;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ahRbmrNv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+5OEi4AFHAPS6IUP4LkrtQ2C4AGOARjvYXHgM+3nAC0=; b=Qvvr7mDkdh3zBC
	7+xn3F4kLRB4ot02d/zhSRV24InGdlisC46z1xVNYLsLLhzpnUC2sUC16HNp4URI9M3inf+xHHi/N
	MR/sOnKpkABg0Tg1nNnHPpVTxOySeKA8ozJMnOaYSgsWpmGg18o+noznXRet1SjPPL85sIxhr2jhb
	iK72HllkD2VoLVT0EmNZetWqZBB7zDlssiAn2cIRLKc4AgYQMGuoC/F7ls8PE3SXX2plXSa2/kN9R
	bNTcEKVHje9KU4SWb53BbVqJtcsTtvNXZi4S/Dy/BaCc6EZSSXKI7+MqEmlLxT7sCauLMQ5j0z0nN
	3bJ+f//VtapOy87YnY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxP-0000000GQuQ-48eF;
	Mon, 02 Nov 2026 12:16:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxI-0000000GQdR-3s6q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a214af2076so22144295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621763; x=1794226563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5OEi4AFHAPS6IUP4LkrtQ2C4AGOARjvYXHgM+3nAC0=;
        b=ahRbmrNvcVa/lE0inAj9ztm7JrrJvbyedQjvxJRs6i6xdRcDBlnSYJvKlPHStkA8cI
         lDfKF0eAOg7YIfvuzAxo/khD8K9z28RckXAsHNuwZ7fO1kPCC2ZaNk9KWDZKjQ5HzXSa
         PbmwAmD9qeFm5SaUEYQw4Yl0gKe6Rbaj+WQPLudl+Bfa8EelfXVVf4BSwl9QLb/xJyIR
         LmoNky3JGbq0w6i0KUBs8xoVjVrbpfh1WV4oK+MZ4D7nNPxfp0bCwdpvFpMvvWaC863l
         SXHF7j5aRkWVLn5vwJi4dnK3lSGKNsLhCrYEpjtPzipKKdCCEfoW3lCRatD+af3Nia21
         nx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621763; x=1794226563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5OEi4AFHAPS6IUP4LkrtQ2C4AGOARjvYXHgM+3nAC0=;
        b=ZWUV7oZizlwbcFNAsYCjLC9aRI1W3PXuv+v0DcsHUgn5eX5UGBx5AuitJ1Rmq5fhIg
         zv6V6VlaN0YfNsJoe3Yqg/pBy8ystfLFCNZUoqeBbm3MCQjRFtvnJzRjg8yR/KuCb7gc
         0fdbk9SnxubAbGZfCfOJZAL6J8t74O7erfMnpiVso5ON4+nDFCiJKgccCzPx+VW9oYKh
         OJQV1zP/C5hno8aHvODbrTiiHm9qtjthgqwlN9AyzkLvN5VV0yrY97XQceA6sChJwbJI
         IkP7KtL/ka/E0UuQTkgm9sFsG2CbxR/Ys6fbeDQq8YDr3+mb2LO+H04BFy+kuKZtQBwr
         233Q==
X-Forwarded-Encrypted: i=1; AKwUvBzF1POcOybyS0wP8m7TTs5U8IAyk260H38L2GqACaXf9ELm6GXqgLPb1qL6TZxMLvW4OiQrWC+9djniDVkAB3W2@lists.infradead.org
X-Gm-Message-State: AFq9FYK6hBA/bu6oSmRzWQ8/Ftlr5/sVhmVY516UkX4/95P73OR91o2z
	gf1DicvDgVyw4TExBNdZmisZ3A5k82VEDrBq+g1NCtDmFNK2H6SE9tLKiBKl7a0Gja8=
X-Gm-Gg: AYBFou02t6pRPYDQJFF07VGIbLkjyEWHbDsWBROpdklrEQkpDLJkqzZhF28/ad0M3+N
	zkCs+poEZiMk6f9RO7DVQJF50XoETBoImCiEvgLYY4VvAOZEqKDLkBkL6RrrpdAXh9CBBuW4+j9
	mjIwI66JHeOV3xrHBu3OQYRr/RkMaB/3ST4baVOzCvJmhFuR4sswxwTyK2v2r/zAInXo1zdXbd3
	iW3fIeh1PTLqVlQojEg1e9vgDB4RaUYBV3k26/qkpcIf2Jc2i11FyFKzjSZ+m8ONREenQnPvbLR
	/T5xci/C2dCM1iT+AkhfBtbZdb/H2HTELOJundkfqRBFm7GW3nqqTiLtiiEeBOcLGsv7OehH2uV
	ZauYvU2zTK/TjOsLcUV5FSptSTZS46N6NfZ0VavNZQL36+Pxc8bGoXM2eyHxxkdYgR2xLq4kTqA
	sP0k1l2+f/e/IRPQnNxeroFfAzu0fgwQFrgv45mEqbVKeYISwVzOE5Y6rPBQvqrR3xM0Akby6sP
	0O3J/EJ376SgqV/d3gah9ky2EeCjJr92tEBOyQbI3Cl+FhmN52kEvfd0mdTH5rHYyeEy/27bcRL
	f1tbczQoplHil6/Y8QP1sO7Cj/Z2EU7NPKQ4IGkN986A407NkP/Ixa4=
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr227993145e9.32.1793621762952;
        Mon, 02 Nov 2026 04:16:02 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:02 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:29 +0000
Subject: [PATCH v3 15/18] perf auxtrace: cs-etm: Capture wrapped snapshots
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-15-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041605_316984_20F67EFF 
X-CRM114-Status: GOOD (  24.80  )
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

find_snapshot() isn't implemented for Coresight, so when a wrap occurs
we only save from offset 0 to current head, modulo buffer size, rather
than capturing the whole buffer. Coresight drivers currently use a
monotonic head pointer even in snapshot mode, which gives a lot more
information for taking snapshots than a wrapped pointer. It means we
don't need to search for data at the end of the buffer to guess if a
wrap has occurred, and we can go back to saving partial buffers after a
wrap by checking if the next size to take is less than the buffer
size.

The drivers will always be able to generate a monotonic head because
TRBE has a bytes written counter, so even if we stop generating an AUX
record on every overflow, we can check if the counter indicated an
overwrite and offset head by a whole buffer size if it wrapped. This
forces userspace to read the whole buffer rather than between last and
current head. ETR and other sinks use software double buffering, so can
continue as they are.

Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
A monotonic head can't be auto-detected in the default find_snapshot()
by checking if head > buffer size, because before the first wrap a
monotonic head looks the same as a wrapped one. The search would then
falsely detect a wrap when head is near the end of the buffer, and the
wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
driver's head. With a wrapped head that doesn't matter because only the
offset within the buffer is used, but with a monotonic head the next
snapshot would either save already saved data again or drop up to a
buffer's worth of new data.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c                  |  1 +
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
 tools/perf/util/auxtrace.c                         | 23 ++++++++++++++++++++++
 tools/perf/util/auxtrace.h                         |  4 ++++
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 5e7d09b7170c..84a5d7392a5f 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -922,6 +922,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 	ptr->itr.info_fill		= cs_etm_info_fill;
 	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
 	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
+	ptr->itr.find_snapshot		= auxtrace_record__monotonic_find_snapshot;
 	ptr->itr.reference		= cs_etm_reference;
 	ptr->itr.free			= cs_etm_recording_free;
 	ptr->itr.read_finish		= auxtrace_record__read_finish;
diff --git a/tools/perf/tests/shell/coresight/raw_dump_stress.sh b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
index bea70d825596..c9459ded4cbe 100755
--- a/tools/perf/tests/shell/coresight/raw_dump_stress.sh
+++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
@@ -48,11 +48,6 @@ read -r size offset last_idx <<< "$(awk '
 # everything was dumped. Allow 48 bytes difference to cover 3 frames: current
 # frame length, a partial frame and a final empty one, all of which aren't
 # dumped.
-#
-# TODO: for a single snapshot, offset should always be zero. However, we
-# currently output AUX records in snapshot mode when we shouldn't, which
-# increments the offset. Allow for that until it's fixed so we can test raw
-# dumping.
 decode_size=$((1 + last_idx - offset))
 if [ "$decode_size" -gt "$((size - 48))" ] && [ "$decode_size" -le "$((size))" ]; then
 	echo "PASS: AUXTRACE buffer length matches dumped packet index"
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index c613efd83223..3aabf2f4bd47 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -750,6 +750,29 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 	return 0;
 }
 
+/*
+ * auxtrace_record::find_snapshot() implementation for drivers that don't wrap
+ * 'head' in snapshot mode, so it's already monotonic like in full trace mode.
+ * No search is needed, only force a full buffer read if more than a buffer's
+ * worth of data was written since the last read.
+ */
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr __maybe_unused,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data __maybe_unused,
+					     u64 *head, u64 *old)
+{
+	pr_debug3("%s: mmap index %d old head 0x%"PRIx64" new head 0x%"PRIx64"\n",
+		  __func__, idx, *old, *head);
+
+	if (*head - *old > mm->len) {
+		*old = *head - mm->len;
+		pr_debug3("%s: wrap-around detected, adjusted old head 0x%"PRIx64"\n",
+			  __func__, *old);
+	}
+
+	return 0;
+}
+
 int auxtrace_record__options(struct auxtrace_record *itr,
 			     struct evlist *evlist,
 			     struct record_opts *opts)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 9d86f8366ad7..980acb2dc687 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -607,6 +607,10 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 					   struct auxtrace_mmap *mm,
 					   unsigned char *data, u64 *head,
 					   u64 *old);
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data, u64 *head,
+					     u64 *old);
 void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
 				     u64 *head, u64 *old);
 u64 auxtrace_record__reference(struct auxtrace_record *itr);

-- 
2.43.0


