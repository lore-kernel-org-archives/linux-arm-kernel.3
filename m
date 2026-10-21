Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87110606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uiq6ReDO;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I+wcU8lw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEJ2SZbhPnf8rqO4ewN7/B8xVL2Gxv0m91IYI80k11k=; b=uiq6ReDOGeIFN0SXJxKxjmGA2v
	fPh3Bcz9uJKH9D/rMYO5RT/zm41hkV4oQEUt7sBHczZw5NpC1O4tdzO32KAF12i+qhqBvWcYfiJLJ
	5thzWhK8kg8XCxJIT1Ahw6l74aGfXEBvomF95eAzbSCLweUSsUgMYvu6XDuMjGOJVSf8XPIJb3eX7
	93Zj5Y8buWj/J7jOBsDmm+k9MNwe1fDPIWg6wE8ZtjBdVFV0WV0AoXJWYIpl62aj5z8RwwustUAfT
	7DYRy8Iowt6L6zLCEKo0xkPBOPS0xOTRsEPFKMNYX39X1y73cAdeKkqFZ3snfEqNvmXU6XbWdT6nS
	qSbWt2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRu3-0000000BOtt-2nxE;
	Wed, 21 Oct 2026 08:42:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRu0-0000000BOtX-2yqV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:42:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so305535f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792572147; x=1793176947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEJ2SZbhPnf8rqO4ewN7/B8xVL2Gxv0m91IYI80k11k=;
        b=I+wcU8lwjT3tLQtQistBsWk6teipDqwLXX22F6EB1IRBBvvzuh7H7AFTrRDEI1V9RU
         Xqr2slnqksUOKmmtyL6qXVXEdcJgYMqRnlgpwKO7SCtEAyHU2D6lglYfblEQRVUEStwc
         A3RomYo34p0kcSybzRNpEeIHq7lwSvUOQW+nUhu4ZZ+bP/8u+AHV2/xMzhoQ/hXLjM5u
         wkF5ZY6ufK72gACdBb7sNoQJj1JIeBBf5vwKPcOF48+PgW6j/wox5NXqk/Jh+9JhpH8a
         2sxrih6/pXUnqkcNuDFjkTeHbPyUG3/qjydJuGp94cumXYh6pfh7f0DPJtxQynLVVoth
         RxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572147; x=1793176947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEJ2SZbhPnf8rqO4ewN7/B8xVL2Gxv0m91IYI80k11k=;
        b=ufpCyNJe16rCELekEIKkBsNZ4LIwWhhNE4kOpA6X71dvHK1Okqt0eSt0mvrku/3lZ7
         HwxlhvdT6PTxIB6qGCi3f+ySBchZuR10j+l9L7Bijy9/xdgL8fYiJSw0C/f6Oz1yS/qV
         tGLOCFs+QN0d+INXW5OxtPapJSlq5XHKGGjxT5iUgCmBPe7MIaZD65GzBHLf9n07GO1p
         orI3u634KafFOQW4jUydsxrT98i0Yt3CAGIXggzXGpOOW3DcFps16WtK335YPXndr+I6
         vnl/LGS2riG2o/QP5DHItfeVbQkJnS9ZwjQZeq5dony3BeHs9jTWHwjM3SA1Xy19uLla
         BdnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+dE8bbDB/lC85H6cdjMzA+APRkWlXKLLpslwzX9LwsbD+YpNJZXQ620+JIO/o8ZSO8KFQDMYyKkkMxPEuDaZw@lists.infradead.org
X-Gm-Message-State: AFq9FYLkPyaQG430ooyUz1/7yewVGWRfikeY/9gZqkqg6ZbcImU/ycoo
	9HBcLZMSHdzdQO5mzE3z4sZqEov8vnMTcKfEAI+AZHfvq01KSrsRpeOtsWu+f/uA1pw=
X-Gm-Gg: AYBFou0IbikNn3BiWaAWLzMKZXE5idTWBPU+iy1ZsVP4YtcR/X9UC2e85Ph3CW60kBu
	EAqCkpsLUS1rLV67PJ9N8kYXQfVY4lulHKObhQl9A5vJjayoft4uk1MQpjwtcWOyMC1OCHJoreT
	oA/aph9Xxz1CjlGZFGJ1oVRJfJiAhRAJsANv0lrziirmfsAe+LawBRCvoaZutaWVzo2laowmvGI
	Y3j3AP5wPPLS2PJ+ZiKi+sL8WI74AObRUE59YcTv0+xZUdNno8w0HzOlL55d+0nRKAtRXbgpUVJ
	o7RJCi+IObiWt1Mwnmch6wShnaaEEXv5g3UaRfrKnCMcdVBlfAErue+fp1h94LQBTRIR/xBfgmc
	vngOLwtlnEqPMzpKNDHJ+qm48IWwX9ZQCTLYbg9uCeZVMdp5TY1P/OoCDu8qlXgIBh4X7GNkDtw
	CXT8yRpfHLmMVXwEKx8k6EKr3RZT5C8LEeJC0V8SjSnYJDoip0P2LiOLkxHUYPNVRq4JkcqCx5o
	RNG23T1vJmRE2Ji7BBvUy7NVIrxzne39bWvtubUJQO91DWEwERtoXgFUqW3
X-Received: by 2002:a05:6000:1182:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e264b3eddmr1756774f8f.13.1792572146818;
        Wed, 21 Oct 2026 01:42:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm4066564f8f.8.2026.10.21.01.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:42:26 -0700 (PDT)
Message-ID: <2bc4b058-3a5b-4a9c-a469-eb8c93215594@linaro.org>
Date: Wed, 21 Oct 2026 09:42:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] perf: cs-etm: HW_ID improvements
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_014228_781983_6F3DD726 
X-CRM114-Status: GOOD (  19.78  )
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



On 02/10/2026 12:15, James Clark wrote:
> The driver might not always be able to write HW_IDs, but we don't need
> them for unformatted mode anyway, so fix that in commit ("perf cs-etm:
> Synthesize missing HW_ID mappings for raw trace").
> 
> Include some other minor improvements encountered on the way to appease
> Sashiko, like properly freeing queues and ("perf: cs-etm: Respect
> --no-itrace option") makes debugging broken Coresight perf.data files
> easier.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v3:
> - Remove old b4 prerequisite metadata that's no longer relevant.
> - Link to v2: https://patch.msgid.link/20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org
> 
> Changes in v2:
> - Drop driver changes and move to https://lore.kernel.org/linux-perf-users/20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org/T/#t
> - Don't process any HW_IDs for unformatted queues, just create decoders
>    unconditionally with trace ID 1.
> - Use zfree() instead of etmq->decoder = NULL
> - Remove dependency on "[PATCH v2 00/14] perf cs-etm: Per-thread mode
>    fixes and snapshot wrap support", it wasn't functionally dependant,
>    just touching some of the same lines.
> - Link to v1: https://patch.msgid.link/20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org
> 
> ---
> James Clark (3):
>        perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
>        perf cs-etm: Free partially created queues
>        perf: cs-etm: Respect --no-itrace option
> 
> Leo Yan (1):
>        perf cs-etm: Synthesize missing HW_ID mappings for raw trace
> 
>   tools/perf/util/auxtrace.c                      |   2 +-
>   tools/perf/util/auxtrace.h                      |   1 +
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  12 +-
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   2 +-
>   tools/perf/util/cs-etm.c                        | 184 +++++++++++++++---------
>   5 files changed, 123 insertions(+), 78 deletions(-)
> ---
> base-commit: 705da5b15ab89ba97b11eedbe507c2fd83d31cb9
> change-id: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
> 

Hi Arnaldo,

Is it ok to take this one please, Leo has left his review tags.


Thanks
James


