Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1878606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cP39CnFI;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WujSAHMM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDt+JfMyIatB2cuVyOJQlWyBeYbAwPRRdrD/q2KXZik=; b=cP39CnFIsmV4ccfwmNUWcgXGk3
	7je7aci8uhLAjYsD1sHezY8iXdee4T0Sb9Tz7ev/Iygk1UH6iplN18RkUMStQiPeaiTRDqFvUpqgn
	/jfmX20CWBGYAO0CEDJ8izxE2a0QkDf+FP4HsfxRz1S4H7fYXbSRCoOAhoprKJwtvuC49u7bymBbt
	X2tczPPqXMQCsnaN4Btb4bE8FVo3rlg8c8elN2IFDSgzY1C132tKN5tf5OzAe5woo6RzIh5iLB/Av
	heqZLgICpz8MnSBKfSXrfWYYA6/TiQk3eiJ9ScHzIzOh9La+RdRQfUzRPjdPiKgFXznSu0UuBEraD
	7XWD9BeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAcS-00000009tv5-3GYe;
	Tue, 20 Oct 2026 14:15:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAcQ-00000009tuB-11nS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:15:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so31263005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792505708; x=1793110508; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDt+JfMyIatB2cuVyOJQlWyBeYbAwPRRdrD/q2KXZik=;
        b=WujSAHMMXm/VJLGDPJiYp3o7+EWYi/kOsPcdCJnvxGfLsIrTXqLtOY5at1UwuyqF9g
         st71yJxND7v93/JivzrbBhlIxJs4k5Li5WK1rWNn8HY6sq7IvfHOAfsEAfOXocKvsNyz
         eAqSDJG6hu2V1AkKIaM8QdECXZUwAfV7cgpW+JSRDQRrl0Z8wWbuIYGgner5kH/flt+z
         jttO5Kj75+twkYhLbbpFzEGtG6soRwt3pWM2EMZsbZRj7yP/dOyjstJcOwFx04AefVAD
         JziKYJBfbIkZWWDKjydwhafy92gI2XpR4/1B9mKH+WB8iYln8JwAadexB0O3jSC0AQ+x
         5Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505708; x=1793110508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDt+JfMyIatB2cuVyOJQlWyBeYbAwPRRdrD/q2KXZik=;
        b=aZyzT+NBXvwpqq4ZO3Oj7omNCoNQJ/F955kCH7yDNwwUZBmRyi+HyP4iN8rAZY+obb
         KwK0tMPu9o3hqjjTf1ciEoRmgNHWV7PyXsl4h9kQUlpW64CGr0pn8395AoJF+UabN7p9
         HbKzxAg4RBsMXiEYrk4KxXvMjpHiTjOBZWgQhqP9/cipU0S1RsFVPY+uwmJ8riRyDy2C
         qqQzQJ+tkmtWirlH6sXUUQmUPJVp4+Lfe4eJMaL1lcR8I/xbCDNTRjbU708b303VBFQJ
         +hCZinXlYusF3evrzXnbm8eiXTAe5YXTlRCP9AYg3XpaIPjNHFAK7VclwuBZDj+HD+Qp
         krow==
X-Forwarded-Encrypted: i=1; AKwUvBy+ZBE2jcuz9+BvPmEFZVGzbRaTDHoUMU1awR7DJ6wSdKXbXDd8dbEqTM4l7+C25PetYSTf6BnktOzjUT4Xb/jI@lists.infradead.org
X-Gm-Message-State: AFq9FYJ7jyJppNP7fcrtgakF5nltA+LS8fxyKD6a1PaW7WbJ3sq6kAGI
	F9bIeyPDgGVaoGPaS57hYDtoNbOmQqgK7rr8fUmM5Wc4qghQm567SeN6XD0gjM+25oo=
X-Gm-Gg: AYBFou2WkNAIQyTh/hz162LHBkyTs8QbiyZxuXJLjI5iCqPAbHXDNMLed2eIUdoIc2G
	B077yesY54xcoJ6lZAXkj05XiB1PNQUwiGU+QIvR5lVE2XE4qzJPcGfQUQ+tQVTwy4hcClb4BC7
	VV+pcChZqftcjMyd3pDsN3McAtSruzn/DR5yAPXJMxlIpAUlrkOazHFaLJ5dbYsSxZ+TOz4nBMl
	OQihyvjqhsEX66cT3aaMzWtl6+LQhCN3QLEXjVYZa6nMECvNK8sP+CxhNQJo3zWrTz8MNfCSYLL
	bp9wM604S0JKIeyBAL/omYwpidvqmInaWAgk8I1SBCf4nN/i9oGpixy0bXrcSfglwdVfkdbKfns
	WtYIvRoY1atLric/AuXbd+YSG0LATNFrpbTQk3OA287O/r1zwfbn5z0j3H/QnchAAwZnJnd9B9o
	dZA3M7rAoI6OQN6IcwEiObolsVqh8Z91OhJ0/PPzD0xuuhf2/5XZllM0w79tRAQiXzXp5uMiJ8n
	Ub7odzPY41cjjLoUatn1aKXBrD6YbR+CyIcgf0P04SS+4gln0U0C8eMjsIr
X-Received: by 2002:a05:600d:82f1:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4a1fa22013amr20185225e9.9.1792505707365;
        Tue, 20 Oct 2026 07:15:07 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d569d4sm76416965e9.10.2026.10.20.07.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:15:06 -0700 (PDT)
Message-ID: <6c0d378e-8186-4e81-a2e7-7277fbd1cf93@linaro.org>
Date: Tue, 20 Oct 2026 15:15:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/25] perf cs-etm: Unify timeless buffer decoding
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
 <20260915-arm_cs_support_aux_sample-v1-18-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-18-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_071510_575034_651EE68E 
X-CRM114-Status: GOOD (  29.76  )
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
> Per-thread and per-CPU timeless decoding use separate loops for the same
> buffer processing. Per-thread mode already collects packets in a single
> trace ID queue, so both modes can share the queue iteration.
> 
> Use cs_etm__run_timeless_decoder() for both modes, keeping the thread
> selection in the caller. Propagate packet processing and end-of-block
> errors through the common decoding path.

This is very similar to what I've done for the JIT patches. So if we've 
decided to base these patches of that one then this one won't be 
required or will look quite different. So I'll wait for the next version 
before reviewing in much more detail. The kernel changes look good though.

> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 68 ++++++++++++------------------------------------
>   1 file changed, 16 insertions(+), 52 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index baa962085dba5226d9729a0ee8039374d5fcb1a0..1a53431161e995ba6b3cfdc86e338ed26e675774 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -2681,47 +2681,9 @@ static void cs_etm__clear_all_traceid_queues(struct cs_etm_queue *etmq)
>   	}
>   }
>   
> -static int cs_etm__run_per_thread_timeless_decoder(struct cs_etm_queue *etmq)
> +static int cs_etm__run_timeless_decoder(struct cs_etm_queue *etmq)
>   {
> -	int err = 0;
> -	struct cs_etm_traceid_queue *tidq;
> -
> -	tidq = cs_etm__etmq_get_traceid_queue(etmq, CS_ETM_PER_THREAD_TRACEID);
> -	if (!tidq)
> -		return -EINVAL;
> -
> -	/* Go through each buffer in the queue and decode them one by one */
> -	while (1) {
> -		err = cs_etm__get_data_block(etmq);
> -		if (err <= 0)
> -			return err;
> -
> -		/* Run trace decoder until buffer consumed or end of trace */
> -		do {
> -			err = cs_etm__decode_data_block(etmq);
> -			if (err)
> -				return err;
> -
> -			/*
> -			 * Process each packet in this chunk, nothing to do if
> -			 * an error occurs other than hoping the next one will
> -			 * be better.
> -			 */
> -			err = cs_etm__process_traceid_queue(etmq, tidq);
> -
> -		} while (etmq->buf_len);
> -
> -		if (err == 0)
> -			/* Flush any remaining branch stack entries */
> -			err = cs_etm__end_block(etmq, tidq);
> -	}
> -
> -	return err;
> -}
> -
> -static int cs_etm__run_per_cpu_timeless_decoder(struct cs_etm_queue *etmq)
> -{
> -	int idx, err = 0;
> +	int idx, err;
>   	struct cs_etm_traceid_queue *tidq;
>   	struct int_node *inode;
>   
> @@ -2731,23 +2693,23 @@ static int cs_etm__run_per_cpu_timeless_decoder(struct cs_etm_queue *etmq)
>   		if (err <= 0)
>   			return err;
>   
> -		/* Run trace decoder until buffer consumed or end of trace */
> +		/* Run trace decoder until the input buffer is consumed. */
>   		do {
>   			err = cs_etm__decode_data_block(etmq);
>   			if (err)
>   				return err;
>   
>   			/*
> -			 * cs_etm__run_per_thread_timeless_decoder() runs on a
> -			 * single traceID queue because each TID has a separate
> -			 * buffer. But here in per-cpu mode we need to iterate
> -			 * over each channel instead.
> +			 * Per-thread decoding uses a single traceID queue;
> +			 * formatted per-CPU buffers can contain several.
>   			 */
>   			intlist__for_each_entry(inode,
>   						etmq->traceid_queues_list) {
>   				idx = (int)(intptr_t)inode->priv;
>   				tidq = etmq->traceid_queues[idx];
> -				cs_etm__process_traceid_queue(etmq, tidq);
> +				err = cs_etm__process_traceid_queue(etmq, tidq);
> +				if (err)
> +					return err;
>   			}
>   		} while (etmq->buf_len);
>   
> @@ -2760,8 +2722,6 @@ static int cs_etm__run_per_cpu_timeless_decoder(struct cs_etm_queue *etmq)
>   				return err;
>   		}
>   	}
> -
> -	return err;
>   }
>   
>   static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
> @@ -2774,6 +2734,7 @@ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
>   		struct auxtrace_queue *queue = &etm->queues.queue_array[i];
>   		struct cs_etm_queue *etmq = queue->priv;
>   		struct cs_etm_traceid_queue *tidq;
> +		int err;
>   
>   		if (!etmq)
>   			continue;
> @@ -2785,10 +2746,13 @@ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
>   			if (!tidq)
>   				continue;
>   
> -			if (tid == -1 || thread__tid(tidq->frontend_thread) == tid)
> -				cs_etm__run_per_thread_timeless_decoder(etmq);
> -		} else
> -			cs_etm__run_per_cpu_timeless_decoder(etmq);
> +			if (tid != -1 && thread__tid(tidq->frontend_thread) != tid)
> +				continue;
> +		}
> +
> +		err = cs_etm__run_timeless_decoder(etmq);
> +		if (err)
> +			return err;
>   	}
>   
>   	return 0;
> 


