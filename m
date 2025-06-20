Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC40DC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJR7m6FuaArEkYSPieCF/QiYN4u0ZRybWkkRgblwJQE=; b=GPEZaAjGxVAeE5bQSJNYXXFVM+
	/Ck4d2JtLMkkXMToG2tdM7fl6nTw1FL18+N9GKUpRkN7yF8+/R3q5XlMunIAYM+BBUiE+gU89i8hc
	pitYdJs8FHqzAcFTkMEUgye3vZRZBQZIdEF/4jbV0nIQhzfbiPduRXE2c4rmJdTSkGxosofzZmIfN
	L1y/X4765ZXECnpKJ/Gkx8Ak1Nf2Fa2IqWNNsaly3QIuKuBgfeS0va5/mfTP2+akoBBk+/7bm9vSL
	WwQPGq034M4G4hJ3zdVDX3X1UEBTYUZe5oRzzBVZXhlYi239nN9qm2VQ597li7Dv1iGC8MXQAmh8R
	ihrskgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSa9r-0000000FUH3-2mT3;
	Fri, 20 Jun 2025 11:43:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZOr-0000000FPKX-1weL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 10:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jJR7m6FuaArEkYSPieCF/QiYN4u0ZRybWkkRgblwJQE=; b=dbgCQ6Mk5LurJSQjgtCHde23q1
	DEDLmX9fl3CuqZuq5GLn+lW197AszzegDkPFYmYFoe8mOQQtYw/0AH4LS/5aOP7nLxByjeTOaj0Se
	MQjuaj0RMgKHpctysHVL47vQYYiDrZ1MI57j9OMAUuKaoddloh00Aj3qWPEwSm05R6fY07nVrfSn3
	76vaKGGUhkmSJZKNqNg96DytegVh7ZdFH53kb2yiDWV2A6PGJIQZQ1FEBazY2aC018rtsZ6ALXaLp
	CtFzpUQqL4kpxxQA1R6+zJRBrQtEmp5Irh4MY8CpoKQWAutTW+ylzc3u1gmPdCJaOJaJe4NrwYYZv
	IRMuwRnA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZOn-00000004h60-1mAk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:55:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1101400f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750416906; x=1751021706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJR7m6FuaArEkYSPieCF/QiYN4u0ZRybWkkRgblwJQE=;
        b=G42LYJWPBZTes6tHURMtAJB53JQCfXz4K8IrmLplTyViyHNTji8nQhfaqDQwIbDDAn
         qmLMvF6XaN4xBrXVjB0hBYMrpBbakZYAmjatD6wmnErdC0xKqufjeHD9nTTc951JZT6l
         pIFnNWmexOSjKqes2BP+15sm8ZTVC5Tvon6bH+yQ+vCuj6DCMcGl7oTxCFTQgEKHL7Cj
         XhbcKCLChh2JXOD24oT+acaQNk26UnJE66XxgNifllNM7KaVi2f/NxP4NkxMc2ZyOq96
         q2CxCrQZzvKT1uVHp2gk//hqgfhxOP4X788TugUvRSMb8yoBaV2ooRn6HEQI0X18yeL4
         wU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750416906; x=1751021706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJR7m6FuaArEkYSPieCF/QiYN4u0ZRybWkkRgblwJQE=;
        b=LxRSYBdqy1u/zCOqiJ4Js4/KVc9s6SvnaNmbFzAfcoIkTMiOxZE95B0jk79gWZR0A+
         sC9w6qPCUqF8rCyxaU11FHlXhyNLs8xQzA0AMLpcV43huU1aW1VwCggxbsc5kihP0MBR
         NcyxMJMpmujyztgcidNJKN/pYENm6evJ18vWoAukBQ8xKHg712j8atL80q4cmL1FoMWW
         EDO3JcjzROueBiCrrLYbqd4wwR/qZPwofEe+B9dy4pMW/rBvWL+zYSyo7Zm8kg04CIMe
         whl9OwORccFLWOHNA+ywJv+nqaz/OfRzesHHbKTaEt+06dRvsxYLMmv3n2pQWJRFv1W9
         umtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6K9lw5akeDTgZ/1sVh8BoKgq9nLVmfXwfBpkSNl3MtEvYHy0vEOK6EPQ5ncL2K8m0vY73N1K9s0WheEGKuwzB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe+ROsCvZ6HIm3xKqtvA7DuiMuZjEQyJQYNizXjm2HjHdWq7aq
	Py2J+F9a5gOBJV+w7s2YoVStt6cYJNzZuLElOF73p3nEZviYSnFD6Te5FMHkMOSoc0w=
X-Gm-Gg: ASbGncvnv5EHaP2tE3bENhWSxwreIsnSOtABiFZUpI1yod5mRGlDkVo7Xw88jkQ5SOM
	1WhyVEzOuV60maBrMJ9NEX/gBBUKyYaIjzZqT7kAhcp1hlZEsJ5eNwd0CBliDWGY6v5+zLdRmeG
	bFfu7YTYXYQtu7MGH3OjdmDxpdYT35wI7wYKL167WibOg3ByX6V6aKxg5ivUL3EYsmrhqLmodsT
	YT+0pSm8AVao2pOMl87xw2nD6fxu4jCUI43b4+TWwolmbmIiSdpYhlniXd0pzVl07IeuqKDtql6
	i4ZPxHWvr4YTPGgDbjB8fYa9Bx6smV0aBdF/+DSAGpBXy4q7SA2qXIF9mvbosdMKwyQ=
X-Google-Smtp-Source: AGHT+IGU5P55fYF+8k78k2aw4YAOudyds2cdvLpevXXeEWUDV6rw8epDKgJrfdPoNbdTLd+47jdQOg==
X-Received: by 2002:a05:6000:41f6:b0:3a4:c71a:8119 with SMTP id ffacd0b85a97d-3a6d27eed6emr1802208f8f.25.1750416906262;
        Fri, 20 Jun 2025 03:55:06 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f104bbsm1748016f8f.4.2025.06.20.03.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:55:05 -0700 (PDT)
Message-ID: <c72dd890-8f24-47e8-ab3a-13d4d71209e7@linaro.org>
Date: Fri, 20 Jun 2025 11:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] perf arm_spe: Allow parsing both data source and
 events
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-12-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-12-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_115509_715304_3F51234A 
X-CRM114-Status: GOOD (  27.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 13/06/2025 4:53 pm, Leo Yan wrote:
> Current code skips to parse events after generating data source. The
> reason is the data source packets have cache and snooping related info,
> the afterwards event packets might contain duplicate info.
> 
> This commit changes to continue parsing the events after data source
> analysis. If data source does not give out memory level and snooping
> types, then the event info is used to synthesize the related fields.
> 
> As a result, both the peer snoop option ('-d peer') and hitm options
> ('-d tot/lcl/rmt') are supported by Arm SPE in the perf c2c.
> 

Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 69 ++++++++++++++++++++++++++++-------------------
>   1 file changed, 41 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8a889f727f9cd5351b4ca027935112eddd16ea6c..8fde6f6cbce92aabf20d25b01ee2ade4aae7ea61 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -909,40 +909,54 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
>   {
>   	struct arm_spe *spe = speq->spe;
>   
> -	if (data_src->mem_op == PERF_MEM_OP_LOAD)
> -		arm_spe__synth_ld_memory_level(record, data_src);
> -	if (data_src->mem_op == PERF_MEM_OP_STORE)
> -		arm_spe__synth_st_memory_level(record, data_src);
> +	/*
> +	 * The data source packet contains more info for cache levels for
> +	 * peer snooping. So respect the memory level if has been set by
> +	 * data source parsing.
> +	 */
> +	if (!data_src->mem_lvl) {
> +		if (data_src->mem_op == PERF_MEM_OP_LOAD)
> +			arm_spe__synth_ld_memory_level(record, data_src);
> +		if (data_src->mem_op == PERF_MEM_OP_STORE)
> +			arm_spe__synth_st_memory_level(record, data_src);
> +	}
>   
>   	if (!data_src->mem_lvl) {
>   		data_src->mem_lvl = PERF_MEM_LVL_NA;
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
>   	}
>   
> -	if (record->type & ARM_SPE_DATA_SNOOPED) {
> -		if (record->type & ARM_SPE_HITM)
> -			data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> -		else
> -			data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
> -	} else {
> -		u64 *metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
> -
> -		/*
> -		 * Set NA ("Not available") mode if no meta data or the
> -		 * SNOOPED event is not supported.
> -		 */
> -		if (!metadata ||
> -		    !(metadata[ARM_SPE_CAP_EVENTS] & ARM_SPE_DATA_SNOOPED))
> -			data_src->mem_snoop = PERF_MEM_SNOOP_NA;
> -		else
> -			data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +	/*
> +	 * If 'mem_snoop' has been set by data source packet, skip to set
> +	 * it at here.
> +	 */
> +	if (!data_src->mem_snoop) {
> +		if (record->type & ARM_SPE_DATA_SNOOPED) {
> +			if (record->type & ARM_SPE_HITM)
> +				data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +			else
> +				data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
> +		} else {
> +			u64 *metadata =
> +				arm_spe__get_metadata_by_cpu(spe, speq->cpu);
> +
> +			/*
> +			 * Set NA ("Not available") mode if no meta data or the
> +			 * SNOOPED event is not supported.
> +			 */
> +			if (!metadata ||
> +			    !(metadata[ARM_SPE_CAP_EVENTS] & ARM_SPE_DATA_SNOOPED))
> +				data_src->mem_snoop = PERF_MEM_SNOOP_NA;
> +			else
> +				data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		}
>   	}
>   
>   	if (record->type & ARM_SPE_REMOTE_ACCESS)
>   		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
>   }
>   
> -static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
> +static void arm_spe__synth_ds(struct arm_spe_queue *speq,
>   			      const struct arm_spe_record *record,
>   			      union perf_mem_data_src *data_src)
>   {
> @@ -961,19 +975,18 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
>   	} else {
>   		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
>   		if (!metadata)
> -			return false;
> +			return;
>   
>   		midr = metadata[ARM_SPE_CPU_MIDR];
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(data_source_handles); i++) {
>   		if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
> -			data_source_handles[i].ds_synth(record, data_src);
> -			return true;
> +			return data_source_handles[i].ds_synth(record, data_src);
>   		}
>   	}
>   
> -	return false;
> +	return;
>   }
>   
>   static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
> @@ -992,8 +1005,8 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
>   	else
>   		return 0;
>   
> -	if (!arm_spe__synth_ds(speq, record, &data_src))
> -		arm_spe__synth_memory_level(speq, record, &data_src);
> +	arm_spe__synth_ds(speq, record, &data_src);
> +	arm_spe__synth_memory_level(speq, record, &data_src);
>   
>   	if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
>   		data_src.mem_dtlb = PERF_MEM_TLB_WK;
> 


