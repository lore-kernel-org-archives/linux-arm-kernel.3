Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64736606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZaRBMml;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PGUP8HD9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKN2Kpy24qYXb++X9M24Ji7pq7TM4o+Umqf1AAgxfzE=; b=wZaRBMmlMWTP8P/6U9VNio/2Qf
	oRX6I0/J86BCTHll4i+m7jms+G/IiQAmmCM5jbAgk0RE369GjLogT7cfeL93JGeFOD2FVC1lpMQVp
	c8MhmZVdM5p2P8P67/mzA1EW9pWzI3c6UT1YnAW1izc/Z6cogTbZOJV+jGo7UezZvxko6mCEDXGjQ
	1VfKoVD3t04ysIVR9TF3ff4RtUQxPO3KJggvfdgYfyqm7+gkZJP3L8rrr9KYhLW6QvQb6lBIi9bbY
	oc193X6biJKtrZlAnTwsao5GKUCNFEUMSSWB4ziFPnyC5Tlhcb3UtPbw++sTfKsvAbgdj6rL8IGhU
	gWiBshDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAnA-00000009w0M-463q;
	Tue, 20 Oct 2026 14:26:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAn8-00000009vzu-2AJc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:26:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c411e139259so303800966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792506373; x=1793111173; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKN2Kpy24qYXb++X9M24Ji7pq7TM4o+Umqf1AAgxfzE=;
        b=PGUP8HD9DJBV06m/8OSu7LGEW96hrp4eQ3YbXMGjXqBDGHEhK45E935W7041TL3DCH
         A7ErNaO1PteDdOV+j7wzeDR9jDjZjOPJJNlFCuJUiMv1Lj8XZ+4ylKqoo07U6wy9Pixe
         QYUYvYBvsTjCOBUK6R9oqzAqgtCbKay/t00U8pWBqcYcDmMDbR9VqI+RabRdslyUT7OT
         iKs0rfyHgirS3+8kJZHl8MRqOjSXT6sWsv0DPwsPXzXH2ANRyiAjIRqKFPtnPv5n9qWn
         vr09RPhfsGP/TqF8FNEtqQUAJUn68XgF+8iKlTB88DcC2KzUFBUxgWbqx5PJvhQ9lTCi
         2ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506373; x=1793111173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKN2Kpy24qYXb++X9M24Ji7pq7TM4o+Umqf1AAgxfzE=;
        b=0VvQE3MYsvraIE6GlxHBvlC4rDIF5n8PUh2f05v5dxy7fGiYVxl3d+5gXID0Toz6wi
         ZbKcRWBDs5qndZ9+98Fc9q/5ueak+28bBSzw9eC9Nr+ZqRB2tjmyy7JtxoXeqZpyNQnz
         7fOC98m4DMVNIWUfdyUma0bKw0cpm61L01wFJ1QFpOwJvw5El8BiPFzwiV6+pXA7HDsC
         kUkLfVbGUuiQYZbLK9hRuw2Gh89DpblDQQGKRcdwBXfwE9Al2rhu3Jn7TOOPBpsnyg9Y
         vZwI3upoAq0oX5tWDOwTy84NgjV8eOqylMOrDnO0VZE0PYBQFjjfEEWbxVr6NyPxnl03
         CP7g==
X-Forwarded-Encrypted: i=1; AKwUvByfEwXHtTXi7rg9AbPKbQi+IjhuQYwFVkUIfntR8VUsf1Qsj43GZqBW2wqfqsFjPxUT73sS3GAynq0jhc/P4AaD@lists.infradead.org
X-Gm-Message-State: AFq9FYLsmTIxKwNr+L8+RfmwMoXJxghT8nTDLsx4Ft4taUGEXGHSL6nf
	GSPpg7jg22dtvry0CQfFQFQclSC5pjBmr2Gr4CD02mAH20aldK61NZ3HgopaJJDkXgU=
X-Gm-Gg: AYBFou271WuuDQtW6VTX0x+Iy4+Bggvl474YVTwvGiKlAiHqJ1Sla2HwoJ89P7Gb6Bv
	uyyMhcnJT0gBq6IGr9LHODMwSMzvKTR8G0YZ2NN4o62asvhnCsMsmouDTwKyKzz1zejkHwW6YHz
	c37b5ZrdCU59TrV3kNQV5wsg5X9Z9NR2htU4tDGvlJlGH9oAiGVvRRYyQuXUmRS40+fLqoQkXQ/
	BDdXp/KOlPejZntN4RZ6TCXi91nzPk+Rr+t25ZahpKk9jnCRS1tqNzAJMxCRTE4GtbjbbwxptY9
	czBYASxVL0pghi4AfBFR6E70KlyfdYLRI7FIfrwQeZhA23CK3ETMEcD+co0Hdb0wUC6IryDYDlV
	VfOwvwm+gK3lkqsgc4eod6sGRH3ipvvcdcjZ7rJosWyJL849RhPE5U8+s8jI+ltoCaS5SF7CQw/
	4awHdhsdG68CGEWvbzpkA2Qm+QzuCITXmUbn1zXWaTlaauIf1FQpey8ASXM3JnVHhWtQn1xf6tU
	MkF
X-Received: by 2002:a17:906:f5a8:b0:c38:ee33:2931 with SMTP id a640c23a62f3a-c419f709659mr789055466b.37.1792506372574;
        Tue, 20 Oct 2026 07:26:12 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810035sm6911288f8f.13.2026.10.20.07.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:26:12 -0700 (PDT)
Message-ID: <52dc152f-5417-4af4-b084-5ca5f821a6f4@linaro.org>
Date: Tue, 20 Oct 2026 15:26:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/25] Documentation: coresight: Document AUX sample
 decoding
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-25-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-25-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_072614_598907_24DE4598 
X-CRM114-Status: GOOD (  31.12  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 15/09/2026 16:49, Leo Yan wrote:
> Describe recording AUX trace in PMU samples and generating callchains
> and branch stacks with --itrace=G and --itrace=L.
> 
> Explain the default decoding behavior, preservation of recorded stacks,
> context ID requirements and decoding limitations.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   Documentation/trace/coresight/coresight-perf.rst | 39 ++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
> index c0c82b3d26ea88dad7143afdb047c4d8f502b4a6..59eda2a5b6473ed1cb6bade5d281a12bdde76bb0 100644
> --- a/Documentation/trace/coresight/coresight-perf.rst
> +++ b/Documentation/trace/coresight/coresight-perf.rst
> @@ -171,6 +171,45 @@ no branch history at all, for example samples from a thread that was never
>   traced, or samples recorded before the first or after the last trace window.
>   It is built and installed with perf's other dlfilters.
>   
> +Decode branch stack and callchain from AUX samples
> +--------------------------------------------------
> +
> +With a kernel that supports CoreSight AUX sampling, record an AUX trace
> +window inside each cycle sample::
> +
> +  perf record --aux-sample=8192 -e '{cs_etm//u,cycles/period=100003/u}' \
> +        -- ./workload
> +  perf script --itrace=G16L64 -F comm,pid,tid,cpu,event,ip,brstack
> +
> +``G16`` adds a reconstructed callchain and ``L64`` adds up to 64 branches.
> +Either option can be used alone. Existing callchains and branch stacks are
> +preserved. Without an explicit ``--itrace`` option, both are enabled for AUX
> +samples. Decoded history is available in ``perf script`` and ``perf report``.
> +
> +AUX sampling supports unformatted, per-CPU sink (TRBE) trace. Each sample

Minor nit, but "per-CPU" in this context might be confusing for users. I 
know we've used "percpu_sink" in the driver (unrelated, but maybe 
"single_source" would be better there anyway), but from the point of 
view of userspace, "per-CPU" and "per-thread" would be related to how 
the event is opened. Which doesn't affect aux sampling.

> +selects its CPU's decoder and starts a fresh trace window. The window already
> +belongs to the sample, so ETM timestamps are not required for attribution.
> +Samples without decodable history receive no reconstructed stack. CPU-wide
> +recordings must enable context IDs to distinguish tasks within a window; the
> +default recording setup enables them.
> +
> +Callchains cover only calls visible in the captured window; callers before
> +the first synchronization point cannot be recovered.
> +
> +When kernel tracing is enabled, AUX samples can include PMU interrupt-handler
> +execution before the trace source is paused. The late-sample helpers trim
> +this using instruction addresses, which may not uniquely identify the sample
> +boundary for kernel samples.
> +
> +Formatted sinks such as ETR are not supported. They can collect trace from
> +sources on multiple CPUs in a shared buffer, mixing execution from unrelated
> +threads into the AUX sample. Context IDs can distinguish these threads, but
> +trace from other CPUs can consume the limited sample window, leaving little
> +history for the sampled thread.

This isn't really an issue if you are only tracing a single process 
regardless of shared sinks. As the aux sampling driver implementation is 
quite tied to the sink, it only makes sense to say we didn't implement 
it because we think the main users only want TRBE, and it's extra 
complexity to do it for ETR. But that doesn't really seem necessary to 
mention here.

TRBE also supports multiple threads anyway, because you haven't put a 
hard limitation on using --per-thread.


> +
> +Guest samples, synthesizing instruction events, and saving reconstructed

I don't think guest is working anyway even without aux sampling. There 
is some structure left in the code for if we ever decide to support it. 
But I don't think we should mention or do anything special for guest in 
relation to aux sampling.

> +callchains with ``perf inject`` are also unsupported.
> +
>   Perf test - Verify kernel and userspace perf CoreSight work
>   -----------------------------------------------------------
>   
> 


