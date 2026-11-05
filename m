Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE2606A90D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3wDPVyCh;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C9vbOoo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=; b=3wDPVyChlxuaEy
	iTLxmi5kEdZ0+s0l6zV3+ao4jOkKHViBpf906KY4G0XpPnZ/eUMYL3m70OwM9c/yHJfJNWKPq1bx7
	q7bdtz3IqCQZN9ES+S7xHUJ/40j/DAK8FsWCWWJMIO+0WREoAzHNKCJYGoyknMeWGbx5uiygH8Tcm
	yP0G64IfeTg3H16nwrEYgfv1pGVthR0c3oOli2/+eA2/EhW2aCVOD0VQWTZssZv0iSlRW01M+KVWc
	pOQrIEdQrZCLXw5zFrETL1a37+phh8KqA0XdhPetidXN6A+BYTni0FvQ7ypKgXHu7tJ43+usQ9xuH
	KjAsUKBE/vpkmXRpfHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuW-00000008j1x-2yre;
	Thu, 05 Nov 2026 11:45:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuM-00000008ils-2Bwb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so5932325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879128; x=1794483928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
        b=C9vbOoo92VKlfXpp1CuKKG2qh6qt/Bn0fpYWMaoyElX7b87aYZRbr0YXECiDiN7bfo
         +gxdbZAJC+6HnWtFQ3ybV85QGWbTQhhUtCuF3KQvmHApn3gi8purBDgV4yh1EpB5Nsx2
         2Rp3sXwVWRjFxJr7rXHlI0wgQRTcdibH18D7eJL5VA/8wF3thAGr/EHEYG7Sb0o1PnhJ
         vZMVG8D7gRal9X8d0pkSonVhoeS6tjnm/yd0wmKd7N4z8OI7RfmuodzLnzQNd6LGFdKR
         +coPa6PSrBXDGn+m3uC7Q/tS5zfFNajd3ZZK4fu3LIeGGHEXr00QymmljXguqzaHMo+G
         BFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879128; x=1794483928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
        b=vZ6csKCre+tafwlr5516I/sue/4Dwg4TuDncDY3rud+yJY6TmQYzLsqeO/U36DkPiD
         xL/YctGfVbSU1YWGk3BTGYfGGDI6XMXhFh74KIdqnwghPf+8nDjE7kIzSwFeH/hFZXip
         An9R9oBGJbfg2fOMoqckoOFjbcD7NN5rEUVp9O8xK4zDqpNhdpPtxYVuujWWMJbDcNsB
         Lhx69QhX0Op/DUevPZOMa4PD3pGG2co0pilEfgkb3Hzs7c3iqiXMzaOIKZYcaryz0XqW
         tJBI+P+yeEVRWolJChnl4FbJfsn1tVcp7C3qKnyxio2XKBAzep+707XYUhcMel1WT3Xq
         tQow==
X-Forwarded-Encrypted: i=1; AKwUvBwU1rQB2Osr7djQpr+Tbr5YYAr8bvtpY8bX1QcxNI7wIfT6PaKnTk/VbJY+NDT+3XWcAplWe/uzRURusGI7LpF6@lists.infradead.org
X-Gm-Message-State: APuU4Z8lZhWAf1ae7EWmrEu6ijv187sSxbKelz7so6CHkD6X46KubcUt
	WRiRgpe+qJRXPU4RNTr/baaHuin/ByCB9dgV4hR8/FOpcmiKiJDERyvFzdi5uxwavC8=
X-Gm-Gg: AYBFou20CZSia4l0AvFwYt8m6B1Gm9NWE+YgkTrE350e+TQSdU09y5CSDChPtbQHxm5
	CSfyb57AAxQrCvIXHfzP3EOkH/nbxz0dC6kVDlsdhglmPI33L1z8AXl5hAR1QwrNYjt6nyJBVqc
	QmReyVjQfXWnakkywT31HgIfMoF7BjrO2byhRZamFyriSba4XX9G8zTLdsFMaSLIv8RcQgTz4V5
	tHWBGz3v8xcYcnPKcDwmTkANyuTybx9A1/F2r9wPvQ5SB/Vy9L8/T19exmvEMPZ7G14jUQQkgsX
	oP4CDgcIGgpPIat4QTQ1D5XrS3ZnmipT++FTzKkq8va9OXQizcAgbsq7x4ByAJBwPocF03la+2C
	OFLKKwYpQMwc66iO7/lMOaweFfRKimXrrWmd4p0/lOAf930DjVYWi2HNZEwJcu48fZ/g+p0jLWA
	5NMmPJAH8NAVvPk5k/mULGdw75Z3AGQPa2TCd2JPg89Y3GMBrMWfpzBC9jkrPWI8gVHMfwA3yGB
	mgSVpQMQo8egmV0EmTkmTDL+XjSLRS6aKRvmYo0YqERLTJfR1+b4NAvQ84zpo07tNxK2E3VJrjf
	6VsKDuPbaqDccnnrSd+Waxoa/7pj7aNJ
X-Received: by 2002:a05:600c:3e8c:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b55c8743a7mr39562485e9.1.1793879128464;
        Thu, 05 Nov 2026 03:45:28 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:55 +0000
Subject: [PATCH v4 07/19] perf python: Expose sample instruction length
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-7-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034530_643346_58552753 
X-CRM114-Status: GOOD (  10.97  )
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

Expose perf_sample::insn_len as a read-only insn_len attribute.

Trace decoders supply instruction lengths on synthesized samples to
indicate whether an instruction was executed or not during a call or
exception. Let scripts read this value directly.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/perf.pyi | 1 +
 tools/perf/util/python.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 087da00728fd..525d34ed08dc 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -215,6 +215,7 @@ class sample_event(_sample_members):
     sample_data_src: int
     sample_insn_count: int
     sample_cyc_count: int
+    insn_len: int
     type: int
     raw_buf: bytes
     dso: Optional[str]
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 42c587cd54a5..a4f1e316e5b8 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -1380,6 +1380,7 @@ static PyGetSetDef pyrf_sample_event__getset[] = {
 	sample_member_def(sample_data_src, data_src, T_ULONGLONG, "event data source"),
 	sample_member_def(sample_insn_count, insn_cnt, T_ULONGLONG, "event instruction count"),
 	sample_member_def(sample_cyc_count, cyc_cnt, T_ULONGLONG, "event cycle count"),
+	sample_member_def(insn_len, insn_len, T_USHORT, "event instruction length"),
 	sample_member_def(flags, flags, T_UINT, "event flags"),
 	member_def(perf_event_header, type, T_UINT, "event type"),
 	{

-- 
2.43.0


