Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E5606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ya7oOass;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oCSd0d5e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xvvqzujp+UcUXklzEphgGnO39VToizQWS1KqHHoKSVA=; b=Ya7oOasszLDSjB
	2aBwyQMvEiNffGlXyt4GtW91FlwDu3gCFgYAeCodERsKawnrtF4BGMq3SUL5ZG1REHYy8IKZbecHx
	3PHdu8OG153+fWMdBLmThrj+QtFeEjcsZhOAe6xFNo4eb2+24FGqMRWibjU/Q9TEGsCSSG8FrP4xK
	KUgt26xUFWGruuj5QmGOuDFvKelohgZAaCS+dz7wTOIqK44QubOsyFLy9u7xo6kppY2+X4pQy4EV7
	NSabytjZT8MlXgkmflEwr5bJIGl2+vZdxZ0KY+VqT7ovpHWVtiMc9cRFEo6toTZweQ6sb1F3DbcQS
	RoUYXu62pU111qZaszHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC1a-0000000G6AH-3Ahd;
	Fri, 23 Oct 2026 09:57:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC1Y-0000000G69l-2SNa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:57:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso6282395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792749438; x=1793354238; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvvqzujp+UcUXklzEphgGnO39VToizQWS1KqHHoKSVA=;
        b=oCSd0d5e+/QzBvbrKtYb0QZX4H4wgwAue/yT3hq15vEhPU8hZi2Oo/wqHH4UPA4RRi
         0LNu8KxTOu0Rfo6i9NNbPfokW7wylGLD8QaqCXCyF6TYAcm2U7u0TL7O2+cNRl6X1/J1
         nSmX+FZY0UolUwIacB7aaF6Mv7aAQJD1LtYTekmrj0O5fccyhGZauOnrvhZ6bQHkPtGM
         k+EYpB8Mff31PRcxNbLIoLmx2I2tRsthvcDSBi1SFRwcKYIzbbX71moPdHJI7CJr59UE
         OffQAt9AFgB810eLZzmpg11ZjpGBN/gkHzgbuY1DzUhmN6f0CxZs5Lt7zYhVbqimGE/M
         5V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749438; x=1793354238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvvqzujp+UcUXklzEphgGnO39VToizQWS1KqHHoKSVA=;
        b=ilQPjquQOtX/rqNCJWG7yxRo+3Kevs++zyIXy4S0Tspfn+Z7VB75gQUAqSqfY9uX+i
         1aeT5my5Ap9NJOPBaABETC3D8QPmHom6Z8kPh1ZTPG8JwF0V9WXSnpHKZqZE5Uqer8u2
         Ol4s+rxR2gLTedQ19rc04y5Igfy0eolY2Z9gLFKfFSACyJLXyKxYdtvLajchB9XPAW0F
         CdMiAGplgle3yN9wxMA5wZ8Tffl4/4Ywh+OEkzgw1GsbZQaEwbgvcC1HJ6mtCFyfz/oM
         R3o0hCtsz7nZc22cdkNh+uGkipQyJI0lBv7gcgYVtMMeiy0cGr8XMm9kek4h6tMKMVTW
         5/kg==
X-Forwarded-Encrypted: i=1; AKwUvBwaMosRIRplZEKwyDyefIWQGgtsBPiQ6g6LpHXlQ5plULjKBp1/C66VYifVruAVy6WmgmYiquHa2R6/CGC08yuC@lists.infradead.org
X-Gm-Message-State: AFq9FYLTZN7CJOOc0Nb3O2KBxCd+45ul6zfmNuw1KWnkh+AzuLDCl82+
	be6IDMdFvbNf1SMlUivXv7SHqdQ9lqbSMxFm6gi/TpPqq0aXnZyUcEHM0Fop3RC6aeY=
X-Gm-Gg: AYBFou1ExVRU86wdlQ9pAKmkO8tq2gogkU2YLQBxivUMETEPRfKEhRIIevFft42wf5K
	UtK/vAvQIL64Sxcw7oxOeUoJRmPw2B2gRgQhCz9Ox/o64R7FxpoN2Ujt2ZO1iBFkB7j53oyxfgH
	pB3XuP5ewq0L/J3BWFzM+UjNyIUDCDD2PsrgjHNIF4Jc5wCUhviAAJ8ngXODRGVsUZUnr+21WiL
	/0orIbYlt5kbCJTnvlImZHzNMAki5HFUg+ouSMuiHF/BQYhkB4nFRaul0Jrt9SSkd02sWeFfr1r
	W1Y17zHZAmgvO9K/28JwDQyChO1BNJ7rpjPL3EcykdYUZ9Nzl9+Bu7qEKQmarm7aBUfUxyj9iIs
	eUYzv4r25vDCkJ9Dz+i+pusWAv1atVH1sZNbbC+bifW85qrzqApCy+OoyWPHh+/oyx7tmvqHWY3
	ml8I2YdtqGvYG7uPZjX1pKNsS7vHf75WDdJNHmxnu9d7c8RqA0hapmcVw49gOZL9fhBaWQroaQo
	JNzb4tGczrBDuvT7ED5l8/n2GGWz7fU2irdYCVdiNr6iSWKEb8Mxx9px1v+
X-Received: by 2002:a05:600c:8b38:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a211cbaf90mr26505825e9.20.1792749438440;
        Fri, 23 Oct 2026 02:57:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2153c14c6sm21226225e9.1.2026.10.23.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:57:17 -0700 (PDT)
Message-ID: <8a8c036e-a78b-449d-9f02-8b9b4767dfe7@linaro.org>
Date: Fri, 23 Oct 2026 10:57:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Amir Ayupov <aaupov@fb.com>, Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261012230527.750567-4-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_025720_675760_7BA8CDFB 
X-CRM114-Status: GOOD (  32.92  )
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



On 13/10/2026 00:05, Amir Ayupov wrote:
> Some CPUs count the trace unit's external outputs as the PMU common
> events TRCEXTOUT0-3 (0x4010-0x4013), which lets a configuration drive a
> PMU event from trace unit events. Other CPUs, Neoverse N1 for example,
> have no such events, and a feature relying on them would silently do
> nothing there.
> 
> Detect at probe, on the trace unit's CPU, which outputs the PMU counts:
> the trace unit has an external output for each of its events
> (TRCIDR0.NUMEVENT), and from PMUv3p1, PMCEID0_EL0[63:32] reports which of
> the common events 0x4000-0x401f are implemented. Per the ETE
> specification, an implemented TRCEXTOUTn event counts external output n;
> only whether that output is also an external input is IMPLEMENTATION
> DEFINED.
> 
> Add a capability match flag for each output,
> CS_CFG_MATCH_CAP_PMU_EXTOUT(n), set it on ETMs whose PMU counts that
> output, and show it in the feature's configfs 'matches' attribute. With
> capabilities matched separately from the device class, a feature that
> requires one only loads on those ETMs.
> 
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../hwtracing/coresight/coresight-config.h    |  4 +++
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |  5 ++-
>   .../coresight/coresight-etm4x-core.c          | 32 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-etm4x.h |  3 ++
>   .../coresight/coresight-syscfg-configfs.c     |  7 ++++
>   5 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index af6ef96b9ae01..10e95f5ecc8d9 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -35,6 +35,10 @@
>    * a device that matches one of its classes and has all of its capabilities.
>    */
>   #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
>   
>   /* flags defining device instance matching - used in config match desc data. */
>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index e1a59b4345052..09a7a6b86968c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -174,9 +174,12 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
>   
>   int etm4_cscfg_register(struct coresight_device *csdev)
>   {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct cscfg_csdev_feat_ops ops;
> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>   
>   	ops.load_feat = &etm4_cfg_load_feature;
> +	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
>   
> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> +	return cscfg_register_csdev(csdev, match_flags, &ops);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2247ad55d4442..1e78774025d13 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -30,6 +30,7 @@
>   #include <linux/uaccess.h>
>   #include <linux/perf_event.h>
>   #include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/property.h>
> @@ -1368,6 +1369,35 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
>   	}
>   }
>   
> +/*
> + * Find the external outputs of this trace unit that the PMU counts as the
> + * common events TRCEXTOUT0-3. The trace unit has an external output for each
> + * of its events, and PMCEID0_EL0[63:32] reports the common events
> + * 0x4000-0x401f from PMUv3p1.
> + *
> + * Must run on the CPU that owns the trace unit.
> + */
> +static u8 etm4_pmu_extout(struct etmv4_drvdata *drvdata)
> +{
> +	int pmuver = read_pmuver();
> +	u64 pmceid;
> +	u8 extout = 0;
> +	int n;
> +
> +	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
> +		return 0;
> +
> +	pmceid = read_pmceid0() >> 32;
> +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
> +	for (n = 0; n <= drvdata->nr_event; n++) {
> +		if (pmceid & BIT_ULL(ARMV8_PMUV3_PERFCTR_TRCEXTOUT0 + n -
> +				     ARMV8_PMUV3_EXT_COMMON_EVENT_BASE))
> +			extout |= BIT(n);
> +	}

Maybe an pmuv3_event_implemented() function in arm_pmuv3.c would be a 
better fit for this. It can do something like:

   if (event > ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)
      return (event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE) & pmceid_IDhi;
   else
      return event & pmceid_IDlo;

etc.



> +
> +	return extout;
> +}
> +
>   static void etm4_init_arch_data(void *info)
>   {
>   	u32 etmidr0;
> @@ -1522,6 +1552,8 @@ static void etm4_init_arch_data(void *info)
>   	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>   	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
>   
> +	drvdata->pmu_extout = etm4_pmu_extout(drvdata);
> +
>   	coresight_clear_self_claim_tag_unlocked(csa);
>   	etm4_cs_lock(drvdata, csa);
>   	cpu_detect_trace_filtering(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index df9e0748d71ec..11d95a4518b88 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -979,6 +979,8 @@ struct etmv4_save_state {
>    * @nrseqstate: The number of sequencer states that are implemented.
>    * @nr_seq_ctrls: The number of sequence state transition control registers.
>    * @nr_event:	Indicates how many events the trace unit support.
> + * @pmu_extout:	Bitmap of the external outputs n that the PMU counts as
> + *		TRCEXTOUTn.
>    * @nr_resource:The number of resource selection pairs available for tracing.
>    * @nr_ss_cmp:	Number of single-shot comparator controls that are available.
>    * @trcid:	value of the current ID for this component.
> @@ -1045,6 +1047,7 @@ struct etmv4_drvdata {
>   	u8				nrseqstate;
>   	u8				nr_seq_ctrls;
>   	u8				nr_event;
> +	u8				pmu_extout;
>   	u8				nr_resource;
>   	u8				nr_ss_cmp;
>   	u8				trcid;
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> index 2b40e556be872..7893d40f2e9ea 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> @@ -243,6 +243,7 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
>   							struct cscfg_fs_feature, group);
>   	u32 match_flags = fs_feat->feat_desc->match_flags;
>   	int used = 0;
> +	int n;
>   
>   	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ALL)
>   		used = scnprintf(page, PAGE_SIZE, "SRC_ALL ");
> @@ -250,6 +251,12 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
>   	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
>   		used += scnprintf(page + used, PAGE_SIZE - used, "SRC_ETMV4 ");
>   
> +	for (n = 0; n < CS_CFG_MATCH_CAP_PMU_EXTOUT_NR; n++) {
> +		if (match_flags & CS_CFG_MATCH_CAP_PMU_EXTOUT(n))
> +			used += scnprintf(page + used, PAGE_SIZE - used,
> +					  "PMU_EXTOUT%d ", n);
> +	}
> +
>   	used += scnprintf(page + used, PAGE_SIZE - used, "\n");
>   	return used;
>   }


