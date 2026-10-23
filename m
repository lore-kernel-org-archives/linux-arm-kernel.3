Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EED5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jw5AEYur;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gJ3svSrj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=; b=jw5AEYurTV89/m
	Azc2esXAPan+N2w/7EQVCFbAQP59CBZ2/UIdT31+CqrWvCb0xqQaIQ1G44aNiYrjR68TQePv3SVIz
	eqIF0jWhbs0ZRA3Uy2uctsKerhwyMxhV5v8oi0AbPEu+hlII/grt4URNaAzA5y4SES3Mo/4ZXmo//
	A1ImSbdhVyjtziyGMSNCGXEcdoxIWSLyIVh/X8z3EYVICIXghFCbsg0kHuUyWKWcJfUV1SScu74cH
	qoUCo3Ake0zY0Kor1tHXNp2EbvdilsbQ5v8Mpd0DApYHE3UhFJTPQpyRlAYfK71Nii9jMq4X1Swsl
	1OhYe9tRQNMdRQLNRV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBuE-0000000G51J-2SaO;
	Fri, 23 Oct 2026 09:49:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBuB-0000000G50X-3Hyu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:49:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso5096075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792748982; x=1793353782; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
        b=gJ3svSrjMUQPzM/qELoqK57wgCVA4d0BVGa4M7jcdJLJBk6sFbktSlos6VAb2/rXm7
         teUU2wm/55wQcEfHDg7ztZms00fVq80DK4Ex7QjeZRb9rbHzjQ91WeX3FIeBvpxFHMBz
         qCOJrs/aFuJo1Vu/A40LfadOcDshf3OeUK3KU9+VvrBA5D3TboHZtsCelb3iBqQs6FWR
         z8MNlEbjrH6rCgByFSVH3tmxnWRLuJXaij26X5h2zlU1JfiqU+DF9GS8WujZAjQDTwOX
         IuoVSuJmHhu2urilFncSpSCQ40RCDqjD6eJ0WIwPsotwagFqegYvS9MSg9z9Mc0Aaccp
         ZCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748982; x=1793353782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
        b=g3/1vMR9I46szzuegdXTZrRInXg44jEKUmYDPhOXrgDE9oqBWYbSkNDjo8v1ONA2Tn
         QGY3mIPge1aWX0+GRizDciwyvEtxR0jmBnOkp5sh2GXIl6GZOKoVNinurL6kI9QCchAm
         kZ4s6SmEGIzCRchramm7q51FAiL6wtGUoI6O2S0xT4WOeCrMVxgwnpL7ynw5XRpnB1Nn
         jMw5sCZExPbmWSkrajR3YNZ74ESk66TvNN8Homl8kn5vW1xrdo+yUgWiQ4e/Y2XIFT+b
         7ecnvQBw0WO0STkGraT35gAi25P6OoKRmkBzPlZVfCD7VNCsl5KG5oVOIc2l9ZhgS8S8
         guZg==
X-Forwarded-Encrypted: i=1; AKwUvBzgyz9RuBn13I8c12lgS5aFl08re60WxmS1rL6JkU09fuR6s4SfsshoeQdHWGnCmHaYLf3MzsVSqH6peg2xMJ9r@lists.infradead.org
X-Gm-Message-State: AFq9FYIV02VRUDFYw7aIvNlX6dbFc7hLcb6nYho+gHhl9y05s2qCVDnZ
	Pn6/Frs285h3vJJdI13aObiOPrkOQJiBmetoFR/xHaDIL4jfpDuoWADpYNxTSJ78OXE=
X-Gm-Gg: AYBFou0OOtNBJjFS63sMyAEIk76Eeglk+eCbvoqoFKIIsDcPgsd5Amslhoxn9lrgFV9
	Tt5kAYbqZ2rSqDL8TgrCnzmkS1LBhTDbtx7kW7grJrOoV9kWZVjMHJrNgea+HMSvRfXUz7GQK3f
	cqK6zkpw/vGqj21pLFfxbpkIN+/0tp6dv631jWNkS+gylliZ00smiTAV54kHiYRuMvkhC7Fgpfw
	D1rcNhXRX2/Ft9z/w64S6V800xRoktC0caAXkiDGOGlkR3pJ9xoYpvQ/RSE1BQn03G9epJcuSZP
	9Y+x/uob0BQkEwOWvlRGqBuzdos9SF8/VjHSwrPdtAjFV41xiC8lQ1cnVoort3Y1ZlHwDl557I5
	NsKfpgxIogD8kdz4pGE07e7pyc9ooL15x/QGs2LGCU8w6YHzpR8UTpdIn+D1SI4NpEcwWvxvFz5
	bKDQxAIpHlXaDNOFEmXuT7MnFksqKZwsA3hXZMGrutbj8ydJIEoWvPqHx6EG0tYmRytUreSUdaP
	T5G/wM3vCFnAwlfF0fOlavZfLwxwcxPhW3JWszpbmdZXatPPUg9XjaTAznT
X-Received: by 2002:a05:600c:3e0b:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4a2150f1703mr22409525e9.12.1792748981720;
        Fri, 23 Oct 2026 02:49:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2103622f0sm64638015e9.6.2026.10.23.02.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:49:41 -0700 (PDT)
Message-ID: <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
Date: Fri, 23 Oct 2026 10:49:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261021164332.GI26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_024943_875711_68C203D6 
X-CRM114-Status: GOOD (  42.04  )
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
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 21/10/2026 17:43, Leo Yan wrote:
> On Mon, Oct 12, 2026 at 04:05:22PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
>> --- a/drivers/hwtracing/coresight/coresight-config.h
>> +++ b/drivers/hwtracing/coresight/coresight-config.h
>> @@ -35,6 +35,10 @@
>>    * a device that matches one of its classes and has all of its capabilities.
>>    */
>>   #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
>> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))

Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use 
that instead?

> 
> We can just use a single capacity for all output singals. It would be
> good to follow the naming convention in the Arm ARM:
> 
>    #define CS_CFG_MATCH_CAP_TRCEXTOUT            BIT(8)
> 
>>   int etm4_cscfg_register(struct coresight_device *csdev)
>>   {
>> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   	struct cscfg_csdev_feat_ops ops;
>> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>>   
>>   	ops.load_feat = &etm4_cfg_load_feature;
>> +	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
>>   
>> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
>> +	return cscfg_register_csdev(csdev, match_flags, &ops);
> 
> I would suggest to enable the capability bit base on drvdata->caps:
> 
>    if (etm4x_is_ete(drvdata) && drvdata->caps.nr_events)
> 	match_flags |= CS_CFG_MATCH_CAP_TRCEXTOUT;
> 
> For now, we can enable TRCEXTOUT for ETE only, as this should be
> sufficient to detect the feature safely. I'd like to leave this to
> James and Mike as I got suggestions from them.

ETE only makes sense to me.

> 
> Please also rebase onto the latest CoreSight next branch [1], which
> moves the capability fields into drvdata->caps. I found an issue in the
> decoding of caps.nr_event; the attached patch fixes it and makes the
> field hold the actual event count.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git branch: next
> 
> ---8<---
> 
>  From 95307fa0574b1e0b3922ffa23fe98144b2688496 Mon Sep 17 00:00:00 2001
> From: Leo Yan <leo.yan@arm.com>
> Date: Wed, 21 Oct 2026 17:05:18 +0100
> Subject: [PATCH] coresight: etm4x: Fix event count decoding
> 
> TRCIDR0.NUMEVENT normally encodes the number of events minus one.
>  From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
> means that no events are implemented and NUMEVENT is zero. The sysfs
> event controls currently interpret this combination as one event and
> allow writes to unsupported event fields.
> 
> Decode NUMEVENT after NUMRSPAIR and store the actual number of events
> in nr_event. Use the decoded resource count so that older ETM versions,
> where a zero NUMRSPAIR represents one resource pair, still report at
> least one event. Update both sysfs event controls to use the actual
> count and clear their event fields when no events are implemented.
> 
> Also correct the instruction event enable mask for the single-event
> case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
> event 0 from being enabled.
> 
> This change depends on the recent driver refactoring. With no reported
> failures, it is not intended for stable backporting.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../coresight/coresight-etm4x-core.c          | 13 +++++++--
>   .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
>   2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e954..af017bd8a5477 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
>   	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
>   	/* RETSTACK, bit[9] Return stack bit */
>   	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
> -	/* NUMEVENT, bits[11:10] Number of events field */
> -	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
>   	/* QSUPP, bits[16:15] Q element support field */
>   	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
>   	if (caps->q_support)
> @@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
>   	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>   	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>   		caps->nr_resource += 1;
> +
> +	/*
> +	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
> +	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
> +	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
> +	 */
> +	if (caps->nr_resource)
> +		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
> +	else
> +		caps->nr_event = 0;
> +
>   	/*
>   	 * NUMSSCC, bits[23:20] the number of single-shot
>   	 * comparator control for tracing. Read any status regs as these
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index db9e603f97ba8..fb38f0102290a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
>   
>   	raw_spin_lock(&drvdata->spinlock);
>   	switch (caps->nr_event) {
> -	case 0x0:
> +	case 0:
> +		sysfs_config->eventctrl0 = 0;
> +		break;
> +	case 1:
>   		/* EVENT0, bits[7:0] */
>   		sysfs_config->eventctrl0 = val & 0xFF;
>   		break;
> -	case 0x1:
> -		 /* EVENT1, bits[15:8] */
> +	case 2:
> +		/* EVENT1, bits[15:8] */
>   		sysfs_config->eventctrl0 = val & 0xFFFF;
>   		break;
> -	case 0x2:
> +	case 3:
>   		/* EVENT2, bits[23:16] */
>   		sysfs_config->eventctrl0 = val & 0xFFFFFF;
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* EVENT3, bits[31:24] */
>   		sysfs_config->eventctrl0 = val;
>   		break;
> @@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
>   	/* start by clearing all instruction event enable bits */
>   	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
>   	switch (caps->nr_event) {
> -	case 0x0:
> -		/* generate Event element for event 1 */
> -		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
> +	case 1:
> +		/* generate Event element for event 0 */
> +		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
>   		break;
> -	case 0x1:
> -		/* generate Event element for event 1 and 2 */
> +	case 2:
> +		/* generate Event element for events 0 and 1 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   						   TRCEVENTCTL1R_INSTEN_1);
>   		break;
> -	case 0x2:
> -		/* generate Event element for event 1, 2 and 3 */
> +	case 3:
> +		/* generate Event element for events 0, 1 and 2 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |
>   					     TRCEVENTCTL1R_INSTEN_2);
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* generate Event element for all 4 events */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |


