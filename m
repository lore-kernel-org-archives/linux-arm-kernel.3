Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C4606A85F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WK0uSCHH;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZI7dU4Nj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LP2+jNQLCb5xh+brHIuOLBJSHrucCoRef9UR8kyeTQk=; b=WK0uSCHHVHkkoP
	oxcI2UAlXjSmFNHOKt7bklWrYTAAbkEheGIvB21Jt5Lz0CnIG67ynKFNkdkzfjz5Q0Ei6vFzEtgil
	aU5++izQEmFXNQU1X3ucAFW7CuukgkY1HLNWxMuwiI+ivAYHIYkmlEzgn6lZ9TDHxMBGPJVoTA4SV
	JQPnZFkbbdHo9c0Q9gKYliLi3c1fzf8FV/cVnbVT76tlfT2MYwYga9QbuEW9tq3cUfemsRG9mfs2L
	iMvDpMelGc6tlj+yL14E0GdE6LO3FcfT4zXQ+YLigNph4QRbfPo4xh9TPYw7clq3Ij11sdefkEK1P
	FIH+/WfUfhkY4edh7LUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxG-0000000GQc7-3PiB;
	Mon, 02 Nov 2026 12:16:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxC-0000000GQUT-0xDl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so22298435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621756; x=1794226556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LP2+jNQLCb5xh+brHIuOLBJSHrucCoRef9UR8kyeTQk=;
        b=ZI7dU4Nj1eKL6YdEaUGG8xK7ioxM6wPHR4lo9BBeH+EJP0N0CSkvTW21eZoHBo2iNM
         JGImoX8LnA5UuTGRx/1PDFrGPEr5Kgn9sgWN6lxRk9HwM60Lay2fdsLxzucxYykgSZmB
         TzIWsFgxx54KB0ofsQoPKW7PNmtIN/0fPD1WdkGHYGc8vyNyle39itxH9ZdV1luFe1ZM
         Fblwn5aT85CfaHAhqItxo4c09PJzOIgw3hqIvg9zE3I5feneSWBBVs2Vq9dRPwWaF7W7
         kIcjpV+FoLhInPSu8gpcVJSqW58w6SMIEf/9KuRbSDM5Sy4NKP/qiNUva/afyZCc438e
         f31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621756; x=1794226556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP2+jNQLCb5xh+brHIuOLBJSHrucCoRef9UR8kyeTQk=;
        b=yPmuKso2oQwR9iCubE4WAsmRTYal/O2cShqzEwx0Gs9NsV7ub2gtZ2gLukvvd1lpcL
         dcRKvd93kFuRnImIKWCGHx0aPaj99LqmO+akfWjZjxsnrV2PKpiFn42eVoUMDbm5/fTW
         mhfkyFFUtLuYqotzZgCKq2VhpD5mApT2LTi6JY4SEBIDPi3VrFood2e5mVAYF9IaU3zl
         UNvo9BOAcaMkZToB7ggD/iqTTB+ApyKLOr0w8J+Qfz6SeghCThM0HxRMQy/xUi9aXPJm
         wXs0YOffhSk/KA8oOTRaDPGup+kF/VvHcr7bU8xYptlIEXB8GVj/adRefBrYdk7+glsf
         LVng==
X-Forwarded-Encrypted: i=1; AKwUvBwLzkRRvWacKBROi9A1RSXw3sX3UAM2k1OhHn8JGr8tv+YXqSMivI5exxEYWKlqqqiFml0kSDzdF/zCT6S9sCBh@lists.infradead.org
X-Gm-Message-State: APuU4Z/jeb1MoXPWPy/H7d3JUGgDqI3ZnkJsxuETYxAU6lhyo21VYJl6
	1xQ+IYl5XnHr3Zq/Atz80nKM6M955WlwIGAFgipnOC15AcK6bvCZLYWduqzz3R5wggc=
X-Gm-Gg: AYBFou04/6u4YlKajlfBCaMCpTTK4DvZWK6168rLLhJ8Ow4g8vvw5zXj0lPYOUxwSSs
	JzCiOYh2upGDtxOBHQwJ1+kX2sQm4wpvUzhp2cFsuf2YGIsS7toIoqhLSHNiVRnDv0eXHaZsMIK
	pifgTX14yYfcpx7WeU4ETDUk6VFyJrcVlJ4UVxODoTxGwzuXdxfKbRIPTON01wYBb6RqLVbFRS0
	iEquNpXIMUBOgTFxHokX3GjhjEEGux8DMAYvVfP4cCGwxNRSotG/Xik+dYeM62EG7wBiHLd0OZQ
	Sp3cCM/kuvb/4O0ylrlP8mkyYmMrwOqV6Gx3GvM++D88haR1Jwqie82YBa/ZB9QPx/gFvVM1s5X
	V5S+EAFojfG6Dkm+E797k9q8x4XzEy5g6K4oNg5cpbYDkNIwSZFf4twle9mlMImIO7G09MsqUqX
	NbITIKbKGeK9pIEwBdTSLGkOcpHxwCz+EYmpEFGWGqs1obTMoyNKTWpJWC2UaohuINsnqHNAJF7
	xuWL0XUpdXk4U0ItSSEWfZnpWo4MDlypDBFJraq7QGiCCyJgWfWVmforrBz6cPLjZycJXzDwhx3
	quPwYZez+FMhYYFOtRnnz3hFanMCDFXPf9riKcLL9xkS9zgcB2/shg==
X-Received: by 2002:a05:600c:c48e:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ac16bc4829mr232542735e9.10.1793621756359;
        Mon, 02 Nov 2026 04:15:56 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:24 +0000
Subject: [PATCH v3 10/18] perf auxtrace: Turn Intel BTS snapshot search
 into a generic one
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-10-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041558_340399_4AAF76C3 
X-CRM114-Status: GOOD (  30.31  )
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

Currently each auxtrace user has to implement both the snapshot search
and the logic to fixup the 'head' and 'old' values after finding a wrap.
IntelPT and BTS have the same fixup logic but different wrap searches.
BTS and Arm SPE have the same search but SPE modifies head differently
(although it probably shouldn’t), and Arm Coresight doesn't have a
search at all, but later it will want the same search and fixup logic.

Add auxtrace_record__default_find_snapshot() as a generic
find_snapshot() implementation that tracers can use without
reimplementing it. It's based on intel_bts_find_snapshot() and the
search includes the caching from it. Split the pointer fixup into
auxtrace_record__snapshot_fixup() so that tracers with their own search,
like Intel PT, can still share it.

No functional changes intended apart from changing the pr_debug3()s
to print hex to match __auxtrace_mmap__read() and no longer leaking
snapshot_refs when expanding the array length.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-bts.c | 115 +--------------------------------
 tools/perf/util/auxtrace.c           | 122 ++++++++++++++++++++++++++++++++++-
 tools/perf/util/auxtrace.h           |  14 ++++
 3 files changed, 137 insertions(+), 114 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-bts.c b/tools/perf/arch/x86/util/intel-bts.c
index d44d568a6d21..2f810ff62a03 100644
--- a/tools/perf/arch/x86/util/intel-bts.c
+++ b/tools/perf/arch/x86/util/intel-bts.c
@@ -34,20 +34,12 @@
 #define KiB_MASK(x) (KiB(x) - 1)
 #define MiB_MASK(x) (MiB(x) - 1)
 
-struct intel_bts_snapshot_ref {
-	void	*ref_buf;
-	size_t	ref_offset;
-	bool	wrapped;
-};
-
 struct intel_bts_recording {
 	struct auxtrace_record		itr;
 	struct perf_pmu			*intel_bts_pmu;
 	struct evlist		*evlist;
 	bool				snapshot_mode;
 	size_t				snapshot_size;
-	int				snapshot_ref_cnt;
-	struct intel_bts_snapshot_ref	*snapshot_refs;
 };
 
 struct branch {
@@ -280,46 +272,11 @@ static u64 intel_bts_reference(struct auxtrace_record *itr __maybe_unused)
 	return rdtsc();
 }
 
-static int intel_bts_alloc_snapshot_refs(struct intel_bts_recording *btsr,
-					 int idx)
-{
-	const size_t sz = sizeof(struct intel_bts_snapshot_ref);
-	int cnt = btsr->snapshot_ref_cnt, new_cnt = cnt * 2;
-	struct intel_bts_snapshot_ref *refs;
-
-	if (!new_cnt)
-		new_cnt = 16;
-
-	while (new_cnt <= idx)
-		new_cnt *= 2;
-
-	refs = calloc(new_cnt, sz);
-	if (!refs)
-		return -ENOMEM;
-
-	memcpy(refs, btsr->snapshot_refs, cnt * sz);
-
-	btsr->snapshot_refs = refs;
-	btsr->snapshot_ref_cnt = new_cnt;
-
-	return 0;
-}
-
-static void intel_bts_free_snapshot_refs(struct intel_bts_recording *btsr)
-{
-	int i;
-
-	for (i = 0; i < btsr->snapshot_ref_cnt; i++)
-		zfree(&btsr->snapshot_refs[i].ref_buf);
-	zfree(&btsr->snapshot_refs);
-}
-
 static void intel_bts_recording_free(struct auxtrace_record *itr)
 {
 	struct intel_bts_recording *btsr =
 			container_of(itr, struct intel_bts_recording, itr);
 
-	intel_bts_free_snapshot_refs(btsr);
 	free(btsr);
 }
 
@@ -349,75 +306,6 @@ static int intel_bts_snapshot_finish(struct auxtrace_record *itr)
 	return -EINVAL;
 }
 
-static bool intel_bts_first_wrap(u64 *data, size_t buf_size)
-{
-	int i, a, b;
-
-	b = buf_size >> 3;
-	a = b - 512;
-	if (a < 0)
-		a = 0;
-
-	for (i = a; i < b; i++) {
-		if (data[i])
-			return true;
-	}
-
-	return false;
-}
-
-static int intel_bts_find_snapshot(struct auxtrace_record *itr, int idx,
-				   struct auxtrace_mmap *mm, unsigned char *data,
-				   u64 *head, u64 *old)
-{
-	struct intel_bts_recording *btsr =
-			container_of(itr, struct intel_bts_recording, itr);
-	bool wrapped;
-	int err;
-
-	pr_debug3("%s: mmap index %d old head %zu new head %zu\n",
-		  __func__, idx, (size_t)*old, (size_t)*head);
-
-	if (idx >= btsr->snapshot_ref_cnt) {
-		err = intel_bts_alloc_snapshot_refs(btsr, idx);
-		if (err)
-			goto out_err;
-	}
-
-	wrapped = btsr->snapshot_refs[idx].wrapped;
-	if (!wrapped && intel_bts_first_wrap((u64 *)data, mm->len)) {
-		btsr->snapshot_refs[idx].wrapped = true;
-		wrapped = true;
-	}
-
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
-
-	return 0;
-
-out_err:
-	pr_err("%s: failed, error %d\n", __func__, err);
-	return err;
-}
-
 struct auxtrace_record *intel_bts_recording_init(int *err)
 {
 	struct perf_pmu *intel_bts_pmu = perf_pmus__find(INTEL_BTS_PMU_NAME);
@@ -444,7 +332,8 @@ struct auxtrace_record *intel_bts_recording_init(int *err)
 	btsr->itr.free = intel_bts_recording_free;
 	btsr->itr.snapshot_start = intel_bts_snapshot_start;
 	btsr->itr.snapshot_finish = intel_bts_snapshot_finish;
-	btsr->itr.find_snapshot = intel_bts_find_snapshot;
+	btsr->itr.find_snapshot = auxtrace_record__default_find_snapshot;
+	btsr->itr.snapshot_search_bytes = 4096;
 	btsr->itr.parse_snapshot_options = intel_bts_parse_snapshot_options;
 	btsr->itr.reference = intel_bts_reference;
 	btsr->itr.read_finish = auxtrace_record__read_finish;
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8bb491d389a2..c613efd83223 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/perf_event.h>
 #include <linux/types.h>
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/log2.h>
 #include <linux/string.h>
@@ -603,8 +604,10 @@ int auxtrace_record__info_fill(struct auxtrace_record *itr,
 
 void auxtrace_record__free(struct auxtrace_record *itr)
 {
-	if (itr)
+	if (itr) {
+		zfree(&itr->snapshot_wrapped);
 		itr->free(itr);
+	}
 }
 
 int auxtrace_record__snapshot_start(struct auxtrace_record *itr)
@@ -630,6 +633,123 @@ int auxtrace_record__find_snapshot(struct auxtrace_record *itr, int idx,
 	return 0;
 }
 
+static int auxtrace_alloc_wrap_bitmap(struct auxtrace_record *itr, int idx)
+{
+	int len = itr->snapshot_wrapped_len;
+	unsigned long *new_bitmap;
+	int new_len = len * 2;
+
+	if (!new_len)
+		new_len = BITS_PER_LONG;
+
+	while (new_len <= idx)
+		new_len *= 2;
+
+	new_bitmap = realloc(itr->snapshot_wrapped, bitmap_size(new_len));
+	if (!new_bitmap)
+		return -ENOMEM;
+
+	itr->snapshot_wrapped = new_bitmap;
+	bitmap_clear(itr->snapshot_wrapped, len, new_len - len);
+	itr->snapshot_wrapped_len = new_len;
+
+	return 0;
+}
+
+/*
+ * Returns 1 if non zero data exists within
+ * auxtrace_record::snapshot_search_bytes of the end of the buffer. The result
+ * is cached for each buffer idx so the search is not repeated.
+ *
+ * Writes at the end mean a high chance that trace would have continued past
+ * this search area and wrapped to the beginning. It's not a perfect heuristic,
+ * but it's only to avoid saving mostly empty buffers into the file. A false
+ * positive results in saving up to snapshot_search_bytes zeros before the
+ * actual data, which a decoder should be able to skip over.
+ */
+static int auxtrace_snapshot_has_wrapped(struct auxtrace_record *itr, int idx,
+					 unsigned char *data, size_t buf_size)
+{
+	u64 *wide_data = (u64 *)data;
+	s64 i, a, b;
+
+	if (idx >= itr->snapshot_wrapped_len) {
+		int err = auxtrace_alloc_wrap_bitmap(itr, idx);
+
+		if (err)
+			return err;
+	}
+
+	if (test_bit(idx, itr->snapshot_wrapped))
+		return 1;
+
+	b = buf_size / sizeof(u64);
+	a = b - (itr->snapshot_search_bytes / sizeof(u64));
+	if (a < 0)
+		a = 0;
+
+	for (i = a; i < b; i++) {
+		if (wide_data[i]) {
+			__set_bit(idx, itr->snapshot_wrapped);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * In full trace mode 'head' continually increases.  However in snapshot mode
+ * 'head' is an offset within the buffer.  Here 'old' and 'head' are adjusted to
+ * match the full trace case which expects that 'old' is always less than
+ * 'head'. 'wrapped' is the result of the auxtrace_record::find_snapshot()
+ * implementation's search.
+ */
+void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
+				     u64 *head, u64 *old)
+{
+	if (wrapped) {
+		*old = *head;
+		*head += mm->len;
+	} else {
+		if (mm->mask)
+			*old &= mm->mask;
+		else
+			*old %= mm->len;
+		if (*old > *head)
+			*head += mm->len;
+	}
+
+	pr_debug3("%s: wrap-around %sdetected, adjusted old head 0x%"PRIx64" adjusted new head 0x%"PRIx64"\n",
+		  __func__, wrapped ? "" : "not ", *old, *head);
+}
+
+/*
+ * Generic auxtrace_record::find_snapshot() implementation. Searches the last
+ * auxtrace_record::snapshot_search_bytes of the buffer for data to determine
+ * whether it has wrapped, then fixes up 'head' and 'old' accordingly.
+ */
+int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
+					   struct auxtrace_mmap *mm,
+					   unsigned char *data, u64 *head,
+					   u64 *old)
+{
+	int wrapped;
+
+	pr_debug3("%s: mmap index %d old head 0x%"PRIx64" new head 0x%"PRIx64"\n",
+		  __func__, idx, *old, *head);
+
+	wrapped = auxtrace_snapshot_has_wrapped(itr, idx, data, mm->len);
+	if (wrapped < 0) {
+		pr_err("%s: failed, error %d\n", __func__, wrapped);
+		return wrapped;
+	}
+
+	auxtrace_record__snapshot_fixup(mm, wrapped, head, old);
+
+	return 0;
+}
+
 int auxtrace_record__options(struct auxtrace_record *itr,
 			     struct evlist *evlist,
 			     struct record_opts *opts)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index c29a8444f08e..9d86f8366ad7 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -388,6 +388,11 @@ struct auxtrace_mmap_params {
  * @default_aux_sample_size: default sample size for --aux sample option
  * @pmu: associated pmu
  * @evlist: selected events list
+ * @snapshot_wrapped_len: number of bits in @snapshot_wrapped
+ * @snapshot_wrapped: bitmap indicating if each aux buffer has wrapped
+ * @snapshot_search_bytes: number of bytes at the end of the buffer that
+ *			   auxtrace_record__default_find_snapshot() searches
+ *			   for data to determine if a wrap has occurred
  */
 struct auxtrace_record {
 	int (*recording_options)(struct auxtrace_record *itr,
@@ -413,6 +418,9 @@ struct auxtrace_record {
 	unsigned int alignment;
 	unsigned int default_aux_sample_size;
 	struct evlist *evlist;
+	int snapshot_wrapped_len;
+	unsigned long *snapshot_wrapped;
+	int snapshot_search_bytes;
 };
 
 /**
@@ -595,6 +603,12 @@ int auxtrace_record__snapshot_finish(struct auxtrace_record *itr, bool on_exit);
 int auxtrace_record__find_snapshot(struct auxtrace_record *itr, int idx,
 				   struct auxtrace_mmap *mm,
 				   unsigned char *data, u64 *head, u64 *old);
+int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
+					   struct auxtrace_mmap *mm,
+					   unsigned char *data, u64 *head,
+					   u64 *old);
+void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
+				     u64 *head, u64 *old);
 u64 auxtrace_record__reference(struct auxtrace_record *itr);
 int auxtrace_record__read_finish(struct auxtrace_record *itr, int idx);
 

-- 
2.43.0


