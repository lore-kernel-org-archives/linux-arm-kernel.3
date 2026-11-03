Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WHQmauCA;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OGecyuYW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ySKYasBAII9CIYefFSpb/rg/yMp8IEyXS3kf72/gGBA=; b=WHQmauCAaYV2O5
	BRceFbQm9a1y1xBLgfld0RZPq5vXvstgevn4y7YYDvhZzh8EKQcu3jR6q0OYTZFv3zBFGl6y3NivX
	1ICA7dN9Ub5kWIx/LRH/PA9MKgQtaPTfIxrL5Qm84+MipmORVfXf37S4QowlbgSyTKCR+BVYBEtTJ
	2CYxRqBTgLWRa6pNrNUKgRACQKk273IZAtOVvHeMcKmsQT69/+S6aMxj+ZBFC3oF1efGoll+32VLI
	DItmuxuDiZ4Xk8xPUTWs0x0misVEM0wvQqDb/n8WWNipFrM8TzIJOnUwgYNML8f7Aidn4EOu+GQXg
	7sLSVAy0vJKWsBeu37iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODIJ-00000002KMz-2Nm4;
	Tue, 03 Nov 2026 12:07:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODIG-00000002KMX-3n5r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:07:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2461905f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793707631; x=1794312431; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySKYasBAII9CIYefFSpb/rg/yMp8IEyXS3kf72/gGBA=;
        b=OGecyuYWy0dT2RoaMlJzPpiG3p3SICSzD7kBizjtdg8tARKQblkwbP/Rlrj6OIA5YX
         o1vVo49OzWTAyqz8zQjGS1uX+Votte8Cw3Xkyip1wC52RMB+XuqlAKn/zljTm4VG1Cmr
         IsUjfDiLX0hJroWAgtTc1sCqx5Ga/gm5ctAWM4prAfhxcf29CYwxhjFhwat+09VYK3nP
         4oaacH9shEKFMjhb52XjoA3MkuGng/VPS1V0PNh9qgbb708peFOzTRnmhCQGEhX2xPME
         lv75dHDdWJV84YJSBA/p+5ivY3zpcDgL8yBppKn4GxzOqgdHhNgvWZhR+Tn2FgtaFITo
         s04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707631; x=1794312431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySKYasBAII9CIYefFSpb/rg/yMp8IEyXS3kf72/gGBA=;
        b=yB5NeNFbecPtdtFHmf47uVMjGXH+58yJRa93wvXMyxH24Fv0Lz10iqpA26wOOyG0/L
         jJvry5R6SGazWtH2RER+11HMbLAuk2Nj9TWFn8PbRfTrnZ3b84idqxxxFBzokG/lwlmR
         lvsBSX0+8FE+6bnG7k1gKSibzY4uxCc9WeYLpu3DMsIas2KJGee0jYz1qVqR9YpGh9bK
         dSFZKSJeKxAWD+isydEa25y9kh13k1ooVXwuaT6iXH0VEnVnwBWHEC3YA4Gdi1JxmwF+
         OgaMUJu7NqWibsqdGohXivJO9ikps2WwNFcQI6cl12efbLhqOeKnqLYf1SG0+Oot9rsi
         OEYA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ7BgWPP8iwzk/L5zS6QTWFw3vGKvG6NyYWYwlxWr9sZx0g3OY6pwj0JEnYCZ88iQAyTDqkaS2nGpC8lWQq/cf@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ep8mPMQY60XmHq++yzEjnEq90g992kdtpEPQ0i650F2sGTUAu
	7s31GA2mSM4JbxgC/VQNdBmY+aXTJruI20KVa9mIpBPJ2gow9Merwe+HHFO59j4uwO0=
X-Gm-Gg: AYBFou02bR+Hq0b/ROh1JUq2x3YnJuafm0iUNF7AmHvxsroB1grD0uJEb+piV4VBxSo
	8m3nzHLXvw6bxhIkoru1GUegUQKpj0/so0hzEwvx9lMNVTA7pWK8WSsK6VL9dhKH3NAT+1C7BMT
	ey72Shc2uyZhULDHYNE3QW9rZVyTOtMPOjJK355ShRwrSUyz0wzH/rHqUk5B7K/TppQ4PhfuGOs
	BnYXrAdZvTptraN4V1n0Ly8SSV//tDjAqmDoEBtMWLZMepvJDQhajM27Cs53EbOXXJ1OvnHVVRh
	qrGv5QD+yARmB1g9ycas7sIq3zPffzLc9Pd+ODd4EW46VyRCFoIsK5FIxDRgB+dY/GJgqgwqezc
	n4oiQJwbdCtNLyuLy46oNLiHTrVD/dOyoi30gF5vDmfbYCgUKVJQnAL9NdkfTpYfZEZoMXgQ2On
	mcX2KT0ZjEIKw7A5TJeraF31icbOzNwly+fKJx60bovaO9bP8z7TRRd9CHaFe1wraVYe6qyMFe6
	tQ4JPFXJODKKTlRcG6NGDwyVKApkCuIkDEn2/9LxrCUU8A8uESZH8po4Tb07FRV/pWTvJidEqu9
	JMok9Achb1ZPQ99F7nP9H7B+A3i3Bzm/
X-Received: by 2002:a05:6000:4311:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-48e6e2ff167mr26869683f8f.34.1793707630565;
        Tue, 03 Nov 2026 04:07:10 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm23904045f8f.41.2026.11.03.04.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:07:10 -0800 (PST)
Message-ID: <a188c604-46c0-48fb-9cbd-9eacad88b5c9@linaro.org>
Date: Tue, 3 Nov 2026 12:07:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf vendor events arm64 AmpereOneX: Deprecate
 BPU_FLUSH_MEM_FAULT
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>
References: <42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com>
 <20261103112609.3772250-1-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261103112609.3772250-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_040712_995895_327F3FBB 
X-CRM114-Status: GOOD (  28.98  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 03/11/2026 11:26, TAKANO Mitsuhiro wrote:
> AmpereOne named event 0x121 BPU_FLUSH_MEM_FAULT until
> commit 10a149e4b4a9 ("perf vendor events arm64 AmpereOne: Rename
> BPU_FLUSH_MEM_FAULT to GPC_FLUSH_MEM_FAULT") renamed it.  The next patch
> in that series, 16438b652b46, added the AmpereOneX tables with the old
> name in memory.json, so 0x121 carries two names: GPC_FLUSH_MEM_FAULT in
> core-imp-def.json and BPU_FLUSH_MEM_FAULT in memory.json, and the
> default perf list output shows both.  The old name has been in every
> release since v6.8, so deleting it would break scripts that use it.
> 
> Mark the entry deprecated instead of deleting it, as Ian Rogers asked:
> perf list then shows 0x121 once while those scripts keep working.  The
> x86 tables use the same wording, and
> commit eda39f98bbc5 ("perf vendor events amd: Reintroduce deprecated
> Zen 5 core events") brought back deprecated AMD events for the same
> reason.  The flag is only read when listing; the entry still registers
> event=0x121, so perf stat -e bpu_flush_mem_fault resolves as before, and
> regenerating the tables changes nothing but that flag.
> perf list --deprecated still prints the name in the text output; the
> JSON path does not consult the flag, so perf list -j cannot show it.
> No metric expression and no other file refers to either name.
> 
> The duplicate came in because jevents checks repeated names, not event
> codes, and one encoding carrying several names is legitimate, so nothing
> is added for that here.  No AmpereOneX machine was available, so the
> listing was not run on hardware; Ilkka Koskinen, who added both tables,
> tried v1 and v2 and reports that they behave as expected, and his
> Acked-by is for this variant.  The JSON edit and this changelog were
> written with an LLM assistant, Hermes Agent, working from the code and
> the thread; the checks above were run here.
> 
> Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
> Suggested-by: Ian Rogers <irogers@google.com>
> Link: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com
> Link: https://lore.kernel.org/CAP-5=fX+2eRGCHcU43sqU=gi9iKvxqyS6ipwRSnvFcap3D+QzQ@mail.gmail.com
> Link: https://lore.kernel.org/42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com
> Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
> v2: keep the entry and mark it deprecated instead of deleting it,
>      as Ian Rogers suggested, and word both descriptions the way
>      the x86 tables do.  Ilkka Koskinen Acked-by v1 and asked for it
>      to be carried over to v2; the description wording was added on
>      top of that, as said in this thread.
> v1: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com
> 
>   .../perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
> index 6c06bc928415..114f95e41e0d 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
> @@ -35,9 +35,10 @@
>           "ArchStdEvent": "MEM_ACCESS_CHECKED_WR"
>       },
>       {
> -        "PublicDescription": "Flushes due to memory hazards",
> +        "PublicDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT Flushes due to memory hazards",

Extremely minor nit, but there should be a full stop before 'Flushes'. 
But if marking it deprecated makes it not show in Perf list, then it 
doesn't make a difference.

Reviewed-by: James Clark <james.clark@linaro.org>

>           "EventCode": "0x121",
>           "EventName": "BPU_FLUSH_MEM_FAULT",
> -        "BriefDescription": "Flushes due to memory hazards"
> +        "BriefDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT",
> +        "Deprecated": "1"
>       }
>   ]
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4


