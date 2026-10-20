Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2875606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cfQ1Wjqn;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uYfXec+J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0zAvqlmsB3t3287vk58YCfF/XdciYklX6cmGUHob6Y=; b=cfQ1WjqnhKZywGNE4/57YC5/BE
	ZVoRUMvPiVxcmLjU7YpMlvVQBvKaTgj+KRVIjcl3sp+yoxLRNfGgDI8Iu7BaNXJQuLxMfzxDtAOdD
	6aBiNrNojOsGeyB3jfjNNtu3mMRMnsl4q91Z125ZveQ9KVyBioy+MGLvyzfUb5lPIxfE+g4tblEt2
	f3eYHS1IKw7NO9Yco/rxFtq5oUmPYntPrOwceXkyW5z6oBHQ4WOwysZjNxWxQn1bVx09YvucpFAtK
	4eH5jleVoAD/d2uq+IPgyPxDSCf9PBxaWJZiZ713CLq+W8WnKlOdJb4hNzoTxcSIo4WQvi/dLSCAu
	876l0cyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9n4-00000009mQy-3inx;
	Tue, 20 Oct 2026 13:22:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9n2-00000009mQD-2qff
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:22:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32978095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792502522; x=1793107322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0zAvqlmsB3t3287vk58YCfF/XdciYklX6cmGUHob6Y=;
        b=uYfXec+JERAPWoTKOmN00BOcpBeC3c3kE0pOmZA0osYutC7rzx+9zsUpNbbyUtMp4H
         9yTSQ3/my1Q/6Nbq2YZ3KiT4DJ/rKMqD4JajQJjsmfwFolgvb4eQIBuaFkEuZxnUXLRR
         UI4sC1S9L31QKTg6Do4MI11//Wl57eAZ4qQcAayWUURV7Azgx9zZgYH3p0NQdxsTGZBi
         +UOyk9leLo9USWso5FxNHkhgUr4euHo2qcbm2jjGnG6l1RKjwmNg94naII8TR9WdtuMu
         iAMH/6WR6Wb3PcbvF/9in2xEs3GljUQpoNmCfx6B9olj8Hzz0CUYQpHNjutC/18jTxVE
         V+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502522; x=1793107322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0zAvqlmsB3t3287vk58YCfF/XdciYklX6cmGUHob6Y=;
        b=kPpjCjyTvKn4Jl2fyUftC2W5jFHHDtJCkKPk8UvNh2y+Wqfa/FKheJKtphuZKashSc
         TTtl6daogjmB7PP+DkNdUgicD8JtD3SczEVD2Ta0UQcdRwYyV9mCe1r4L5mDKRqUmCiy
         C13ONYkyy557AeeiYC5khrydoI55psDJU/tghs/imfQaWISddATAvESaoecX4gUy9ZUG
         z8rZV8sOHTob2hXJPsKZTD8tNxa8QPI/rDI4duGfT/HxNw7yXIn4g31Q+YROdciMmorK
         Qw19tPpgPPWs/F64AybsF01lVIvkV76f2ucSQ1xwAvkaVZX4lrOSENebyo/euMouzjbU
         D40w==
X-Forwarded-Encrypted: i=1; AKwUvBwvBNDK4mgbqmCJmMGN9wHK2tonrJprj022MNJB0ZDxpTn+QtQPYlC4qEIzFdMUl8Tg7siwTGOvMLxI5qU6cgPu@lists.infradead.org
X-Gm-Message-State: AFq9FYKdVhCWhtuX1TsKs9X+BtnBDBLe8GV85/JXDPS92gL6JvDY6RZL
	OxZJRnRQ6M27zwS3/n/7i9TLcoXAbo9/uj9jRVYlT+rASgpJY19y0ub0UMdevwjqlBE=
X-Gm-Gg: AYBFou3Sk3W7S1V9saESY6T+4lKDMAq7BdZT6FT2xeYW8jaAR+dHu0zAK4fujWtBqJp
	PVqw7ouspkCWNfmZuvP6bT5T/S9tcaaUgU7wquOKKqLaOMTi4/aRKaAgFTlH7QfQUYalaB22mP/
	qz7bnwJn0f50u2KeHCG3lisAj3EwtzuuuIgpZRLFfEC6LLPSn5fbhNzczLEQn0Oqv5GrtXPeVtG
	dQo1fIBzXAku70c9v/odk1N/Qh2YBbrCs2FQ8JqwkfwC4264iG0bSkSq8mwuaADErzaEk94k+os
	NXzkVsfLErZGX01wB7uauAlkA9Zo11SRXob74fgt2BMIScp9MlBKFMJLH6pT7GehQgriwaXNIIW
	+wXuRXnUPrfiwgKnB3NozV1dw9eDEBZ4qnlHtdyyYmhCwNU6LIdVPVVu0KcIQT9y9NzF5jfhtla
	xeBIFT6a70r4JoA51EH5OJgfM+njpIrDnfEmI/VjKHN0+0nJO4+CVF9Go8hTPBW8P59eGPK5Sui
	LE=
X-Received: by 2002:a5d:5f92:0:b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-48e07bb5a34mr23410881f8f.10.1792502520304;
        Tue, 20 Oct 2026 06:22:00 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d81035csm6480943f8f.15.2026.10.20.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:21:59 -0700 (PDT)
Message-ID: <89e50eff-5ebc-428a-978c-82ff1fbd3f8f@linaro.org>
Date: Tue, 20 Oct 2026 14:21:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/25] coresight: perf: Support AUX sampling with per-CPU
 sinks
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
 <20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062204_777179_0C4E4304 
X-CRM114-Status: GOOD (  30.83  )
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
> Add snapshot_aux() for per-CPU sinks with overwrite buffers. Shared
> sinks can mix trace from multiple CPUs, making them unsuitable for
> context-based profiling.
> 
> Pad missing trace with leading zeros, or zero-fill the requested AUX
> payload when a snapshot is unavailable. This ensures that the decoder
> can safely discard the zero-filled trace data.
> 
> Reuse the AUX action guard to defer concurrent stops until the snapshot
> finishes. Skip snapshots during sink interrupt handling. On copy or
> restart failure, mark the AUX output truncated so perf core disables
> the event.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 123 +++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.h |   2 +
>   2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 8020a4d8af18bb669441824cfdb687f4fa299eb4..5e90ed49562c117879780f573072e6b522d9d048 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -456,6 +456,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	if (!event_data)
>   		return NULL;
>   	INIT_WORK(&event_data->work, free_event_data);
> +	event_data->overwrite = overwrite;
>   
>   	/* First get the selected sink from user space. */
>   	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
> @@ -863,6 +864,127 @@ static void etm_event_del(struct perf_event *event, int mode)
>   	etm_event_stop(event, PERF_EF_UPDATE);
>   }
>   
> +/* A zero trace size pads the sample without accessing the AUX handle. */
> +static long etm_event_snapshot_aux_copy_data(struct perf_output_handle *aux_handle,
> +					     struct perf_output_handle *handle,
> +					     unsigned long trace_size,
> +					     unsigned long size)
> +{
> +	unsigned long pad;
> +	long ret;
> +
> +	trace_size = min(size, trace_size);
> +
> +	/* Pad the front with zeros to keep the latest trace data at the end */
> +	pad = size - trace_size;
> +	while (pad) {
> +		unsigned long chunk = min(pad, PAGE_SIZE);
> +
> +		if (perf_output_copy(handle, page_address(ZERO_PAGE(0)), chunk))
> +			return -EFAULT;
> +		pad -= chunk;
> +	}
> +
> +	/*
> +	 * Skip an empty snapshot, as equal offsets would otherwise copy the
> +	 * entire AUX ring.
> +	 */
> +	if (trace_size) {
> +		unsigned long to = aux_handle->head;
> +
> +		ret = perf_output_copy_aux(aux_handle, handle, to - trace_size, to);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return size;
> +}
> +
> +static long etm_event_snapshot_aux(struct perf_event *event,
> +				   struct perf_output_handle *handle,
> +				   unsigned long size)
> +{
> +	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
> +	struct perf_output_handle *aux_handle = &ctxt->handle;
> +	struct etm_event_data *event_data;
> +	struct coresight_device *source, *sink;
> +	struct coresight_path *path;
> +	unsigned long trace_size;
> +	long ret = 0;
> +
> +	if (!etm_event_aux_begin(event, ctxt))
> +		goto padding;
> +
> +	if (READ_ONCE(event->hw.aux_paused))
> +		goto out;
> +
> +	event_data = perf_get_aux(aux_handle);
> +	if (!event_data || !event_data->overwrite)
> +		goto out;
> +
> +	path = etm_event_get_ctxt_path(ctxt);
> +	if (!path)
> +		goto out;
> +
> +	source = coresight_get_source(path);
> +	sink = coresight_get_sink(path);
> +	if (WARN_ON_ONCE(!source || !sink))
> +		goto out;
> +
> +	if (!coresight_is_percpu_sink(sink)) {
> +		dev_err_once(&sink->dev, "AUX sampling requires a per-CPU sink\n");
> +		goto out;
> +	}
> +
> +	/* Skip snapshots that preempt the sink's interrupt handler */
> +	if (READ_ONCE(sink->in_interrupt))
> +		goto out;
> +
> +	coresight_pause_source(source);
> +	trace_size = sink_ops(sink)->update_buffer(sink, aux_handle,
> +						   event_data->snk_config);
> +	coresight_disable_path(path);
> +
> +	/*
> +	 * If the AUX handle was closed or marked truncated, the sink is
> +	 * expected to have notified perf core to disable the AUX event.
> +	 */
> +	if (!perf_get_aux(aux_handle) ||
> +	    (aux_handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
> +		goto fail;
> +
> +	ret = etm_event_snapshot_aux_copy_data(aux_handle, handle, trace_size, size);
> +	if (ret < 0)
> +		goto fail;
> +
> +	if (coresight_enable_path(path, CS_MODE_PERF))
> +		goto fail;
> +
> +	if (coresight_resume_source(source)) {
> +		coresight_disable_path(path);
> +		goto fail;
> +	}
> +
> +	goto out;
> +
> +fail:
> +	/* Set the truncated AUX flag so perf core can disable the event */
> +	if (perf_get_aux(aux_handle)) {
> +		perf_aux_output_flag(aux_handle, PERF_AUX_FLAG_TRUNCATED);
> +		perf_aux_output_end(aux_handle, 0);
> +	}
> +
> +out:
> +	etm_event_aux_end(event, ctxt);
> +
> +padding:
> +	/* Pad the buffer with zeros on an early exit */
> +	if (!ret)
> +		ret = etm_event_snapshot_aux_copy_data(NULL, handle, 0, size);
> +
> +	return ret;
> +}
> +
>   static int etm_addr_filters_validate(struct list_head *filters)
>   {
>   	bool range = false, address = false;
> @@ -1109,6 +1231,7 @@ int __init etm_perf_init(void)
>   	etm_pmu.free_aux		= etm_free_aux;
>   	etm_pmu.start			= etm_event_start;
>   	etm_pmu.stop			= etm_event_stop;
> +	etm_pmu.snapshot_aux		= etm_event_snapshot_aux;
>   	etm_pmu.add			= etm_event_add;
>   	etm_pmu.del			= etm_event_del;
>   	etm_pmu.addr_filters_sync	= etm_addr_filters_sync;
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 24d929428633f56f24a114d5bb93b8ac4799ca11..a69eb04a597efcfe630342a410cbf8fea3c4501e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -89,6 +89,7 @@ struct etm_filters {
>    * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
>    * @snk_config:		The sink configuration.
>    * @cfg_hash:		The hash id of any coresight config selected.
> + * @overwrite:		Whether the AUX buffer uses overwrite mode.
>    * @path:		An array of path, each slot for one CPU.
>    */
>   struct etm_event_data {
> @@ -97,6 +98,7 @@ struct etm_event_data {
>   	cpumask_t aux_hwid_done;
>   	void *snk_config;
>   	u32 cfg_hash;
> +	bool overwrite;
>   	struct coresight_path * __percpu *path;
>   };
>   
> 


