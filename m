Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594EE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dzZoHm6u;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cT+DaFnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=; b=dzZoHm6uUNFEGi
	OrkEQu6l+7ng/gV0sTHcD1DWKJi5xr749O9QL3lkcQBqtRkfAUdmkDAYJGKlQELBRMn4e5O4djk/h
	MzOHWUYmK0TcZt1m9aoIlfe0XwUUCCloOUuu9+KWS4XrGEdCQ4DMDszejc8CIFIUVKHvLxQk8HL3A
	gKrAk9S/qBxbekPlDudrHR++7PqNRyVrFmijAzPamZjG9fqUkA8hBS4Fptrx3BuhQu7y8j+N4RrBL
	/KS9Oz1jvxrphUY9q+ce4cNezYd3dHRlBytqoSKxN4jsiMCzKzwzjB3F45Wwiah3Dp3NW59LnFa2S
	TCskIwQ4COtIl8QUFH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxG-0000000GQbr-2g11;
	Mon, 02 Nov 2026 12:16:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxA-0000000GQRw-2fUR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22305925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621755; x=1794226555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
        b=cT+DaFnB93bPNsV2CBID7iY7dolePh/g+BzqKHJ4vthF07q8LkfE+NVeLhnc2UVbfX
         PXQbsF97g5ail6Rkzss0XT+/XjW2xppuGnO9FssghZLHTZJN05MOxab0jXsMHQHtfmx3
         Ifvdd/i4FMUjd5xdaWV+4DQ5LtJHC2lCKq4lvvCXoD6CPylo6yW4Z7zAGBe9rrc7vwxU
         Lwfq/dRqSX/fyllqjVSoNXICgM9PedfyqdCLgdeGL0lasdtwVaZ2tKI8CtKJrz1kw4Dj
         0+NmY6EDLMs+OHgqpa61ruzxi9GpvvE4ngXIyqBXeu2K9Mt3lhdC2VBbzTF23ZsjzC8i
         SUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621755; x=1794226555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
        b=aINruDXweSClmIZ5mDYhBJ/G5WqzaV5GyvYA4Z1flkfs95BlnimKJi4hUFd3mUwr9Z
         gmT4cdXDgxw56JKYxRdZvh4qGlTvAKNaotc2WjB+lNVniXsFYd+OJjxfFBiWN3k8rG4A
         pr2Csm/KJNKOT+nWYsmTm7Wf0g9EEOpYbBtiKhsNWuO/ISrbTWY8pVYvMMc79ArENW7N
         01YeCH9rAqmOSDWch3ob/26OJluHQSnoWerW9uSu36efeN+jLFtbx3gJ+V6IFfBCcrki
         SWm1OMC/Lt9z1TsWKNVxzWGgeAn2JsL9VaEotmx3/xdEFCmUaKqaAV4aOMGd6LKZGond
         sMqQ==
X-Forwarded-Encrypted: i=1; AKwUvByON+QPoEogq+sZ/YRnTHPErO3Qz2Ko9WY60dsaYxMZbz0CIUVRsZ7lW2/XENyCLQevjVwtxzwDbja/fk4+LmMQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2mCsdNOCwF8whgz1eqULEZ1hyw/VyWU1WMvBhvUNU8AW9kk6P
	q9Z3HZBeyCy5Ll9WLqphwLymc6Zb6syxjW/RHkEMQJY1AP+wh8ajME3V8KzpBSqPqlk=
X-Gm-Gg: AYBFou2h50ij/r8xjprXVlZwIR6hEFSU6uUFGR88VA8XAbySynPtuaAWB6IASO76N8a
	7XiDEcGFn9GbHNw20OnKddHm7J9ruCLK06DH9t1g4yFOaYI3Q3nvVs/Srco0hMXU2SK8T1bTu6M
	516/ZdjUx5azn8jqhC/0m9FS836CZ2oWn+yelD1qnEsyTifK4HN9rJo+1u7U57C2A0ZCkniLk4u
	8iWYa6CoYdBdhOp7uXgib7MNluex7nY9uVHKI0rWOmNYyzwGP9Btzv43FMkVDX4nKm/2OjixD7D
	RdvOpTR6r209jo3Qxog46Jmh6FzaXTd3GyduIrzwTAy5+9ZQrb0kbLHTcgSBCAw1fURMi+SWbQ3
	j/TzrJLlbYrdHkC9QCWUor94/0uffYhyPr5Fmxmnz1xDI+qDS0BQSP2KzrfyuEqI57jHceupj5Y
	bO11JBVy8EiDiI7hi8tGPQX0P2s/N7sgrD/kmJedGy5fJ7yDq8IMLvqVMEOTd5KFmrhCVOTKmvr
	GIDdWiABVfcChJsdhUG46nBxtqQ13y5fVTVrN1hf+R81h/k4DL+Wq8BSO3QLZ/anzZzMGDSUkYK
	qYMl4jxlj0kYF5tlq7gAMEtVpqRG88Mc
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4ac17752ee4mr210928905e9.16.1793621755020;
        Mon, 02 Nov 2026 04:15:55 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:23 +0000
Subject: [PATCH v3 09/18] perf cs-etm: Increase default timestamp
 generation period
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-9-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041556_701859_62AE91CF 
X-CRM114-Status: GOOD (  16.11  )
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

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 47b4e386cc53..5e7d09b7170c 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -70,6 +70,9 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* Default timestamp period of 256 cycles (2 ^ (9 - 1) = 256). */
+#define DEFAULT_TS	9
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -458,7 +461,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		 * Timestamps are required to interleave samples from different
 		 * CPUs.
 		 */
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
 	} else {
@@ -481,7 +484,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");

-- 
2.43.0


