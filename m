Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A953606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XOAXzgb3;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FtpjgxS/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2uaYBqUftcRpD2L16JDkdO6wqmonuMoZFfOWWQv7Gg=; b=XOAXzgb3rqfqE3bwuq+cCoN4ki
	veTv/P4v3px3dcYw5W2/8HlLnAZkccNl5Pcl0Ky/LNcPXOwpf/WLpNK8bintZiGxQET0blJh8aOhP
	SYuDkGMvGMGEWMwmRtVjXEQULZIU0ivyV0rp0UHMr730fcZdejd70t0B1CyZOx4409xtZkb8UgU+t
	deiyp+Be6yWOKjS+EgpFglMv8f7zU7EYCvfWtVktalV7b0Y3IjFctbFLR0rlo4qnmlXy4HRgx3n/9
	xy27NRYOkTlL4raLf+3rX4ye43ylBKyb0WXTZ80VpaT/H1abgQGAcGI3XGF2E2COc+IzmbgWe9vUb
	LVNNUuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9ov-00000009meP-2Kqt;
	Tue, 20 Oct 2026 13:24:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9os-00000009mdn-2o3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:23:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so8081245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792502637; x=1793107437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2uaYBqUftcRpD2L16JDkdO6wqmonuMoZFfOWWQv7Gg=;
        b=FtpjgxS/D6KpCnmG4vh/1YtlcaWdwbG2EPB3tOQkkgYF7eADboEWXGvT1B4S9w3rr9
         mNsW+hUruFkXkepR731JxzHag1qYW+sfdyg+gxuHALndhGNUOYaPAHgRdon5FsqC2FAL
         n8AoZ1PdeD50eAp6eLCern/Lmh//zVwCfDeNVEHAnn0sttNP4d+V/JMekWf3FWa2EPDN
         khC/wfT+2FAjaLmnmgw813S7yP0pFlzZLDhnQ7jvtL6U3kc1dm0tnRn7EwjhsOUm+DOH
         dYxjejmHWZeut/Jk+4aYdKq9AMh6VFqK9zllccz9XTFxwSiushBcLqTOkVFy4bPrZ5w5
         quGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502637; x=1793107437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2uaYBqUftcRpD2L16JDkdO6wqmonuMoZFfOWWQv7Gg=;
        b=OCaB3LKDTAyHnyVqDLt+yRaERUtJYktwJdiylxN+/9CrSrooIIrrinWlgrbFMiyMkF
         3b93MXO5yQPu1oqIUMMlNB9bdQFA7c5IrSoSt0h8jMRZhW998f3c7VxLCtIWSvQ42i0i
         KlriOidXskhLdKjXFtQsBtAEoPFkee8Vb5JsO+kIz6sh34AQbSq+vF6zaH65zhKGvNz0
         C2m8GIsiHujZLlobSFdJ/zl1eQKNCXkbNe5moNGoRWa5/gTWKqcL2to0Hz372IPmnqhv
         4qH6DNxiH3pjvZNPBI3G6ucujIL+voQh3RgoNjVGMUSZzsoWjlkFftXwu5iqIKVnZfsE
         BPjQ==
X-Forwarded-Encrypted: i=1; AKwUvByeawPeSXIYa7BWWw5w2tXDReQ1wWKyddy9llxFqbpgPgd3hrAPMVbFTweYtycmszGOdAr5TStsnc0dzOmNoFMj@lists.infradead.org
X-Gm-Message-State: AFq9FYJEws2tIprCVCNCG4OGDL5edsvuzsihIXhSBPVC5wo0VmPU6kyY
	2ZNELlQPCxzyw3NOFOvZKNfiib0YxDfuUKQCvgxBeL7i0VVoXOdttYdOPWVpSqohFmM=
X-Gm-Gg: AYBFou05zQ/qqnuTggIU9B+jjFfiyFPDjVEsUsUcG1pbZSy0LfZTiJ0XUFUtpG77xma
	Os1ritVavVQKpTv0MLXijV3Ma7zFCXl7p3RgV/JTyZnaomiMlbkMFhU+bslr9udYYKRiFVjBSPr
	6A/i6aC8fPFDQ2tkomvU/yDCw9a/SaehfBNA/Ax/Pmy7DuhOYn+cElB/WpLDlrWQ1GaOARRBfZE
	SpVlJcrU24ieeVG3/PhLLa3Axu/NmtI7GG4EHt5yZL8PXCN4j3v9G4Hh7yX/vDSxHbgX8pd2Nqu
	5CDVfTStk7lnuiW+pX8FtViBAdxBmAGfKrVrNkC7xXAmkD7etHk7BzWEUEg50JdQlf+Cg8hfdLG
	KZN9EAlkT8ljDzv3EtVic/UWJDsR5XBNLNHcSzxZ8mU1DPNTV9Kcx7LO1Q7CZjugWN8dKeIK9pZ
	km9IwOU/tR8tJiaccBD9jzV5cXTZlIE7+9oJnGMuYh/nhLk0ThXLvhe2Fcnu9NmLd5eTZ41WbY/
	w481IvZkiG2BvA=
X-Received: by 2002:a05:600c:638e:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a1f4d7afcdmr43701515e9.7.1792502636695;
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce2b8bsm74994275e9.15.2026.10.20.06.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
Message-ID: <69dcbd3f-25bd-465e-a173-2729095f2dda@linaro.org>
Date: Tue, 20 Oct 2026 14:23:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/25] perf cs-etm: Allow history collection for samples
 with zero IP
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
 <20260915-arm_cs_support_aux_sample-v1-17-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-17-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062358_732194_E1850C67 
X-CRM114-Status: GOOD (  19.94  )
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
> Perf clears the IP of a user-only PMU sample when its interrupt skids
> into the kernel. The timestamp and TID remain valid, but the zero-IP
> check prevents --itrace=L from attaching decoded branch history.
> 
> Remove the IP check and keep matching samples to trace by time and
> thread.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 00407a80933e1c0b76260aed5894dece50b9aecd..baa962085dba5226d9729a0ee8039374d5fcb1a0 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -3097,6 +3097,8 @@ static int cs_etm__br_stack_init(struct cs_etm_auxtrace *etm,
>   /*
>    * Add decoded branch history to an existing sample. The sample keeps its own
>    * ip, callchain and event identity; only an absent branch stack is filled in.
> + * A user-only PMU sample can have a zero IP when the interrupt skids into
> + * the kernel; its thread and trace window still identify valid history.
>    */
>   static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
>   				  struct perf_session *session,
> @@ -3107,7 +3109,7 @@ static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
>   	int err;
>   
>   	if (!etm->synth_opts.add_last_branch || sample->branch_stack ||
> -	    !sample->ip || !sample->time || sample->time == (u64)-1)
> +	    !sample->time || sample->time == (u64)-1)
>   		return 0;
>   
>   	/* Adding branch history to existing samples supports the host only */
> 

Looks like we can fix this up in Amir's patch that introduced it when I 
post it as part of the JIT stuff. Then this commit can be dropped.


