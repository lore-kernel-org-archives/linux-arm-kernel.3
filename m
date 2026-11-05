Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6B6073AA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=op9G+0pY;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GVOjKhtr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=; b=op9G+0pYC29kz2
	16vxGw7tQ4W1ax1R5aApvesKm2yJkx4oWRr5eebLjLTxC8menHwGsEeh7c/jbbPibocAS6uAmgk5z
	lLScTb+4wqPlaQvsuO3wYv5vgsfoGuockheA/tieROMauSnFPTSqXg74orP7Pf0md9e2lHWuI0PZB
	CbWiItTwxy8otdTTHi2jzimt1vrJejFqGVfXWfUWiPNlesn5SM3YLfylTAREIh9z5VeqZhikKmMeX
	gt6QgLXCTVuKosWFte1RJA84Wd+L+3lkfs8/prI/JiXaUaYRwMHQnoLhhuvkX066sAS640ZX5N9BY
	pO5ggMzXLp+qHoSaMy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuK-00000008iks-2Z3I;
	Thu, 05 Nov 2026 11:45:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuH-00000008ih3-0YaM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11580845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879123; x=1794483923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
        b=GVOjKhtrhq7XeStOU6nyHVnTF6E06bfSHeaUgiBmH5ijPHEmu+l36A9/9zrYGJ4g21
         VQEmk6SNLideH5uxJUkXKV9twpE9raC4c5BB2nY/Q/jw8m0oplKMhY8FVo+Hb1sUMmWv
         RiJl9PVPoXvPPxOHYf1NBf0nwJSLdAw2z0GNqryfsCR3TCbfI7QBCVj6o68nUBFdR6rV
         TBeFesqkT4M/3y+1pi9hx/yjywAYPKUaFPFp0c8b0PFi7afJTtiHIXFuH+Er+RSQXGBV
         +4V+yrkxx7PhGTOITCb95w4YPzWAQ4M+jpWOGZpZSNDAMchIGwjh1OZ0BsKx2D8nqyIq
         afDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879123; x=1794483923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
        b=sJ1BkKFqBoEHkbtt2J9itEQ9Ti4uDF0NsW+hLwazhvN/acXHl8ypk64jq3+CWv/a6a
         0v74oc8JPaN59Px0bKIKW+swBAG5bbcA63Y0cd9uwrQNcqQRovvrPGsC2C+QU8ZHiy1V
         P8kFUbrwn0YRtCYty87H8wVR++kEgFdBCAi+YzONz3QhOkIrQep1w0THn5Jnsl00pGl5
         f18PTgTTQhRhSB6QkmBMEucZqfKlqLSkDQVBtRux92bYHaRrKwMpiNUV91eA+1zQhtSz
         EabwrZ2rp3XPGv9VHJHMia8Bx0hFSD/koMLcQpBPUzDN9YIEaJO+xUjgWbaWUxAa2LVG
         f6bQ==
X-Forwarded-Encrypted: i=1; AKwUvBw42CHpMVOEAPDi3IjzmBMQl2qA2LZM1Fulr04iI9+HWZ7cKAg6KK8nFXjGowOoBOqRVBUGIneVACeBwEJBdDdP@lists.infradead.org
X-Gm-Message-State: APuU4Z+s0WsMtOVqpv3v6U3F5aW891fnVuzdpj38OjEnTuygKRAfHgrB
	fIQWPAYhaJW9Ly4/FK3MUgaqlZqngZ/Qtfn6HfaSd7uHyoDLtl9UA0f2KfMARJnBnHk=
X-Gm-Gg: AYBFou08tCudnRB2xDvB6mhkOM29OmK/FBHV1Y6SeE/O18eGdikEtSrX9J3joXxD+Oi
	Ad92b9jflIWAk5AmjSCuboau+4PNT117+n6nHtSqzO3WjbFxn/jFyc7PI5QXdjFRiuHoMipZAVa
	bJPhgnGd9hRWj3jExmp6y+T79/WEPYMbiNSgqIGeHtQN/dQHugpGYfn4kGoPmu8dlnW5vrDzuQc
	JXt+lFItDMNMuRyR3le62L0EjxnMqRSQTasGtLKon1QHpEL5+bdm+bBQFSupZUmV11BFIrRcitc
	lzuDTn1O/Z5gp+rDG84ecHjoJowVp5K2AjqSA5FtGWyWK6DW8tsT+scSAjkQCXEEZBz4jiKq9LY
	QTFV86ESpcaR7Pcnhe7L0+pet9cLJLITX7FqxmJ3n6WCOLkBQ58hlR0ZP9pA6JavrokWFuzuCvA
	Elb0qf+sFF9aML1KtbrpE5SQdKikDbI28tJwqhz2z7rC+65AbgMsKRmouniIZURCQo92eQE0HJl
	/0VnQfGUOL+Fb/r6N4jg5wn2h4BX1sQD1TUVL/W1a3058v9dLvdneEwMjmQzM4vQBOxWxwylPwh
	yFIQmMTkATEHkzpGfgNCVxCnqCF1Fn6W
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr401140925e9.18.1793879123196;
        Thu, 05 Nov 2026 03:45:23 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:51 +0000
Subject: [PATCH v4 03/19] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-3-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034525_207529_39703B72 
X-CRM114-Status: GOOD (  16.64  )
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

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..47b4e386cc53 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,26 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
-	/*
-	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
-	 * when a context switch happened.
-	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
+		/*
+		 * Timestamps are required to interleave samples from different
+		 * CPUs.
+		 */
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
+	} else {
+		/*
+		 * Disable periodic timestamps but generate timestamps for trace
+		 * synchronization. Even in per-thread mode with a single
+		 * process we still need to correlate trace to a specific mmap
+		 * around execs, which can be done with only timestamps of trace
+		 * synchronization.
+		 *
+		 * Use MAX to support the kernel widening the field in the
+		 * future.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0


