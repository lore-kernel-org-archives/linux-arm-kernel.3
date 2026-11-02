Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BDA606D220
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l/MlotkA;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b9iYtpzv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=; b=l/MlotkAc/hgm+
	pGDbDxaxtVgkRbAHdtBdLI6X5XlUNpsoG+UetOOt+ba4y4dtUZ53zLv4k3ISYNBtvcwsAz/fM2z4q
	5N/vjitFhIAVEr22c4e/MzMfjRmnvRaZu1IMdW2f25BVtEa5DVrgYURQAEpkdfuguHK7OXoYd+4Dr
	4uB3fSB9YqzSdcYjjLDU/265FtAVsWPEi+1Cl7wheLkVGyK2RMGAQ/aTU0yZqYOW471d0YGsP0xNG
	tmtLYQ68N6eSAAeJxjx+pU2EKwE0pkhjkfpNqNek2FbUcj748tTa6qdWfg+ot8tRnSmyn6Ehq14m2
	08yYu4T1sk5w6IWHDOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxG-0000000GQau-1nvL;
	Mon, 02 Nov 2026 12:16:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx6-0000000GQRZ-0J9i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so24209285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621750; x=1794226550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
        b=b9iYtpzvp1Bto6afErUHrZDw5E2lwHczkX/2tyOcdXektkRATxRIUmeWz7+2foVWx5
         hz2+Q6qkaL1Xf9SYh5p5OK9LzUykODdD6HDVoknQImUrAlnIC9x777hyAEyZyXFSo7vo
         PMGQfqZUBK8n7o1Z0gskj0uXhGcC49TsS1puLAO6H49Uemh1EnVxb7eA1rxEcLeGhI1l
         vU8sOJfuIJ/ri2aawbKHeLVJzFFdrhZLaNszIM8Nepcun4BuneAruJJwpuRmsAqcg9Ri
         uV1Q5kKYzLvHHCygTulrggwiSNoFpRCGI8I07qGTwVGyowPayl9nZ7xOe3zukp2HsHNE
         h/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621750; x=1794226550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
        b=D4wUtqpTgB8WXN/LLQGzAxs+H/7Gk6h+ZxomoNkpV/zE67Ir9hRbtrbvpox770thoA
         QBq4lfs/C7dACNrCOs8xfXeYsZqLwacPK+DlkW6TItiMWUZ3+ovHGRyK69/kAWhwix/M
         5VZ8l+DT0MLEZ7JLHPwsORO4GxX+Axew4fh6rDnM4YLCXwbaV/Yo5yx9PlOg6EtcDibg
         gas4L69Gq18zzMUZwRkFmDSo/DrHh/57HNq7qWPB4UVou775VQcp7bCVIrx3qON/cQfv
         7oii/jSJofhw8yg7+Jqk/N5AMoLpxQ/QFxw9BA7ekii04VBEYBFK/IvtbnDbIY+oy+nq
         gWoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXTapeTS/Xph3txta5R+wuczkx4AefbBRVjf9Wxx9IfyFzAgbPEhexWrSWPmJaaXW0zfSSAVljYSE0QAyAR0ma@lists.infradead.org
X-Gm-Message-State: AFq9FYLVNJS+BHz4RcmII66pN+02qmQT81oLGz7C7pzB2au2zKAXSyna
	4HaGPm+dmvOucrvehgKCXkOZ2lVqwA4j+yQXWA2DSFPXVrgUbquDXSoSJsD+YZr1qSQ=
X-Gm-Gg: AYBFou2+s3hv55Tej/fh6eHbZHbXQZibHqqYVwXyAk6P4lR34Qc9I3lNilcHslnz/YI
	Ayx2s8QOGU+xP6InyqmwmQEra1E+0t3dOyFnPgPo5nAcwD67/IHigVBUFCGbiRe18DekHTthlkj
	G2KeYTYpFIaEyw0EtIpAIpcPc8QVmOriawVVQljkrBEfMZKh5yEX+g6fLe/6D6xlPibwWRECoof
	5wiQSD+HZ/qyXMlQacgLs7Wwl+V6YTqHfXvaMM3PKKOBEmv3DnCg2xXRJ7SX885T1h7thVgHMou
	ruSVYg/ED5HKQKt8eZswQaPpCUaBrbyhfOIsyF6Q7WnPoBMTKKr8JXbyyPZQMkk87Ws5XmmKD7y
	1hVLT61CMhjzVmTOmPPb619eOBoKoKDZAhi50+kUcVWBGoNhM9H2v5ZLtdUkMQ+ARVO9MnYFDIL
	tFjLmwIFBYHPjfCeI6/1w8x+u1rc5h6z00YOTkLBKizkwordmIyQ3Cm8GUYqIsg+zjaAlJlaaGq
	h3Zw6A1246FXBVb3R9by/7Rif+Xc9L2RRcHpS4UPZMs/HKGLodJg5lHfr1PkGrYSNvMZmw21F9G
	/OyZqo10W3h04lITHxDfE3vVwV3LgczI
X-Received: by 2002:a05:600c:4e90:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4ac175669e4mr220866395e9.12.1793621750147;
        Mon, 02 Nov 2026 04:15:50 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:20 +0000
Subject: [PATCH v3 06/18] perf cs-etm: Don't drop previous target for
 kernel samples
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-6-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041555_769293_769CB0BB 
X-CRM114-Status: GOOD (  18.26  )
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

The branch target of the previous sample is used as the start of the
range to disassemble, but if that sample's DSO is "[unknown]" then we'll
drop it even though it's useful information. This happens when recording
userspace only. Save the address earlier for "Trace On" samples, before
we get to the early exit condition for unknown DSOs.

In a later commit to change the default timestamp interval, trace will
be collected that triggers this issue, so fix it now.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 1812ccaf4b20..5a7daf927bea 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -52,6 +52,7 @@ DISASM_CACHE: Dict[str, List[str]] = {}
 DISASM_RE = re.compile(r"^\s*([0-9a-fA-F]+):")
 DISASM_FUNC_RE = re.compile(r"^\s*([0-9a-fA-F]+)\s.*:")
 CACHE_SIZE = 1024
+PERF_IP_FLAG_TRACE_BEGIN = 1 << 8
 class _State:
     sample_idx: int = -1
     source_file_name: Optional[str] = None
@@ -252,12 +253,12 @@ class TraceDisasm:
             print(f"Event type: {ev_name}")
             print_sample(sample)
 
-        # Initialize CPU data if it's empty, and directly return back
-        # if this is the first tracing event for this CPU. This must happen
-        # before the dso == '[unknown]' check because the initial
-        # CS_ETM_TRACE_ON sample has ip == 0 (dso == '[unknown]') and
-        # carries the starting target address in sample.sample_addr.
-        if self.cpu_data.get(f"{sample.sample_cpu}addr") is None:
+        # Initialize CPU data on the first event and whenever tracing resumes.
+        # Trace-start samples may have no source DSO map, but carry the next
+        # range's starting address in sample.sample_addr. Instruction samples
+        # in the first range also have TRACE_BEGIN set, so only check branches.
+        if (self.cpu_data.get(f"{sample.sample_cpu}addr") is None or
+                ("branches" in ev_name and sample.flags & PERF_IP_FLAG_TRACE_BEGIN)):
             self.cpu_data[f"{sample.sample_cpu}addr"] = sample.sample_addr
             return
 

-- 
2.43.0


