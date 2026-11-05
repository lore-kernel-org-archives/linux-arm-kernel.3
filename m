Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74249606A928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nLPgcXoe;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vshIp4EU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=; b=nLPgcXoen6VAbm
	V9zCJ1o5Y01+g2b6zdBo+gMpsL2/ejUx/RrtBnOduUSNiFeg/K4m+2LQk/YgHS++xgy10wjCAIkDR
	7cKa80N+oA7GcBsJ04RgNtciMpwstafWx6h2u+k/K2i96ngtODDp7xxt/vPoTr8ZmquwRrXamebqG
	syBvFCNnQQUMA2cenARKsI92Dh2kSNKxiiBwiOPHsc0ES15jVWuMNlhDZjixZ88BkTsQvZnDDdvhv
	JGrdzj5ihRhf7KkLDHgWU5CrbLd2/VI/OKf5dEnjGrlrL1lRWaqBghmCATQMUr9mBhDUvYAVd+oUG
	5czvEEu5s/j0Nq5i+row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuT-00000008iwn-1iQ2;
	Thu, 05 Nov 2026 11:45:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuL-00000008ijD-0osZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13102915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879127; x=1794483927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
        b=vshIp4EUhxMo62iRE10NiOMCL8YYct7GGiIC2avwycUWF8SMULdMSvUGssKo4zgQWD
         Y5NbWnm1ZnXUy8nbJniK3Kl1UUnPrrXOHK0EzyhwBCjGMGvWoRZCpxL2cqqMml41v8Qp
         w8P25v4v78ZxCbTaIKiLRT07BSJGOTvNsSwWn4UldGopn4yqPFIcIW4/xhZ4jPgidJ4z
         UYC8PwEaLTyG0EFNIcq9pYxLkQL+NSXJGqhLC+2tSOeCLoEXzVruTLCVIPSA98EtSGMw
         EEt5/tvsn0K25Pvnt69uI9pTmPa79us9QMo9XxtcTfGEIxAEBhxFDyFrqVG9MtKzMCiq
         +ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879127; x=1794483927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
        b=zk4Dz+cs3ZluhjOTUtPa1zpfbqOEJOc6QiTrmNqRoRHwhMf2Elc1m1yzBsJZR4nvZN
         IZ8yTQB9t7L5vl7osElMTtj/I4Qtn1WvCs55mBgoKEfTCFrV9kcMrIVgdlnhLSO+op1j
         EqHiQrM+XiZyxemXuqWGS64eqYLRCPCZBYLrrVQwDYGlfJ3cnfZXzbn5LAbPCosXLCjS
         gKoDdE20NozSU4rA9v98/z5kfgP0RuHx9Jjm1fjZIKPQWuMUzGpMI1/LShBjbV20KP36
         649+IRKk055RYdvOUuysLablyXvQ/kfSXzLbGU76rCK2Ac/VywgsK1zLrdS67xuoBEL6
         aAtw==
X-Forwarded-Encrypted: i=1; AKwUvBxK09QxuNIqezrX/RVZhYJWE37lIlnUGNLA78zkPaFnIaVyAsxFu01Enh0O+InEm+g/ytF6cQJ/TEv1aM9ViUWa@lists.infradead.org
X-Gm-Message-State: APuU4Z8y4X34uAR4N5Rag6UK3KdXnmwaTrDO/5gvLM/NdgRZGME1Dk5E
	FXBtaOm2Ve1zwYP4VHyDWAgEHUC17a1JVWmNA2LtDwcRA4xKad+Nahtpu0P/1qDfEOo=
X-Gm-Gg: AYBFou1f/ACcZPOeaFeH0C8rTiRbh3c5NafPcMCh8gOL/QZBl5Mwf9EOJ7j4+5Baz2k
	Mcy6D2gCB31voIvZGihSGfg0FAGBNaXF3eqeqAjp30cPkPcoCJ2E4Qi4kGGyo1PuIQ7iqKT+m+6
	YJx/FrlrDwkgEkJbjbdEWC3GwQL2Sl29FkPNaCt64aw8RPexx6Qc8kK+B+KEugOgpv2fg11e2O5
	AK3MNtlxmpcaQks36JSlkLIvys2gUgYJ3TG5W4mIFn7fwix6rlSQngHnML0SuhFUlhqcpRaEhsE
	bSc4X8Xukn/NMV6J4nFqz4B5EkhbxfO3qy5fK6YgKfLwH2WiOjdjwgbje25VHjYHNaHcBWoacLp
	rMKZN4P5rb5CJfXPauUVXMgMJHbO2qbflOKYoY0Unfva9IZhvXkuk4mx3Mr4NAn+ZO9q8LyJusm
	iieTMqd7tbfeshncABh/Vy3ZecrvrJbkNI5+R08kDPMXknNwT7EHpKOmn1OOE5jyVNmfodDfb8S
	I4zKONX6toTOlBdxcNR8kOvJxM04042kjfHgdrUpI+nVFXiebolbJ15XYreHabfi/mJKSH2kEb6
	E62LrRU4egTcNNwWRFsOVXJVr11Bb4CZPQ==
X-Received: by 2002:a05:600c:64c5:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4ac17a367edmr428463435e9.7.1793879127187;
        Thu, 05 Nov 2026 03:45:27 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:54 +0000
Subject: [PATCH v4 06/19] perf cs-etm: Don't drop previous target for
 kernel samples
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-6-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034529_275677_40F41DDE 
X-CRM114-Status: GOOD (  17.75  )
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
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


