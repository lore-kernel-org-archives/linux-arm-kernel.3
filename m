Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC80606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=va+u8DhW;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lh1PHg+i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fFF2D3oBqdNknTwvIUSmhanyWdoVvDAzBCNug1HGEEE=; b=va+u8DhWE+xYDN
	gVstDCT+8nSG+tKUHxD3Z/ic2bgPdxbvizwA+aUBnagL7ufkSg7/PPMqZZ2UH69ycCpi74xIw6HZf
	AYF3uiHJ0tbb23fpxl53gsSo7jCi1QO/9Uah3pUqoofBhZw6W4x3scbi7HKCAH07W3QD7u40y9UJx
	qtEDd3LkkIZM7I4Joxg73Vf5rG9rW8Qh9KXcf+FxY6qp7W4PmVu6jvGXgxuCdTOLpaXHCm39/XmwV
	q3BSkFlzlM7lILQiCxKcHfMzLjN5ieuECdjda5DYMjCDc94Pz6MzFwDnT1mCtzer4/CcH/lh2AcnE
	D4B74V0W9P+vBQWgpY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBmf-0000000G47g-1cKT;
	Fri, 23 Oct 2026 09:41:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBmc-0000000G47F-2yde
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:41:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso444457f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792748508; x=1793353308; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFF2D3oBqdNknTwvIUSmhanyWdoVvDAzBCNug1HGEEE=;
        b=lh1PHg+inFZwY7YM53R3BS2LYvdZW1UtZnsJIW636JI1kaZxvWNQnvkj/ZessODnGU
         Y46zOh8NDUiKZVV6CyuBFaswThsOPSoLfTFIOnOAi99px6c5x25588f0iYVpHm7T85qd
         q0JlNBL8h4wvasaK1RMBy8mwAORK/K63p0xenMTlx1DYe2Ft7p7pIiokNm2YxIRRzWfb
         kllQsoFuwxVmfcIL6cCEIkV0Gs2aXVNQC6WF7gSAVw/Fcf3cf82oqwqA8b3IGcugIhJY
         n9TDnmsCk7y8v6ebVw6APTDT1JS/g4dj+VV6ugWuM77Ge2AqOGIIm111cG7hY+hNCnuH
         CG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748508; x=1793353308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFF2D3oBqdNknTwvIUSmhanyWdoVvDAzBCNug1HGEEE=;
        b=MG+7FVvJx25pLq4Nfyp1A8wJbVIzC+DLk58jv1MhS4c25OiYED+/rqGxyWgVFaXDBG
         CPUAUHjNfj2ivOMwvMNU6LdYsVFnUOQKZzuAGSSUr+UaN92i9YuY77isy4WfxMkK+eU6
         J6yoIjIhBBaAesvWKQAHLffxiPueGplhVNVj2eOf2XFfOuRIzC3tHmNk4pWhoESpD7Ij
         Xhi1G8gUqcrgXzHSEZ8hiuFCpBkLNpGmsuktg7n2pgzsUexZLBtYbQQCSCB2lGMc/A1M
         PHvEMVgjYZI3/j1vl2uCyctlyI8IS0gtl6VUbSoUSS1JSsHx6s7TLltYNdEHmVeBuH1e
         kt3A==
X-Forwarded-Encrypted: i=1; AKwUvByv+RtEMHQEk10hU9xb3125WWk1q8+RakH7CamMPqu8uZ7XcmeUXp+Fm/7yERbWhhpA9XubQWLD6xxi37K7CRcL@lists.infradead.org
X-Gm-Message-State: AFq9FYI1WEzR4hllImfUurunpPqxfBZXTBJ8E0B9w3wXw6MIRLCiorGx
	J831oYSRziXZFKmjgFvaYaURBK4JCfGpLAb0x3x7rPonTEXnCzjO//cbiq+lBZ4aQ+nfSIVV1ue
	qELYR7Zf7lA==
X-Gm-Gg: AYBFou001dVvwua6K21EYZTnFR9La9RoFBzXIVwacMiuo3x+463gRb7vP2GpYbLJ4f2
	ykWVDo2ItGsMOE+6MUCnj2mkSaK+sEVKfEWWyZl8FAaULuqGI1zB80WffjRLiJPlNa4PAxmVcOW
	/cydagEHHIxKPZ3PibfstwJ7jMs8o/ULH8J11K2NQXN87quB/ER7xxeXqYNQQpPA4/yQSrFlCJy
	J3jWzEwYxEUdtXvWV4DN3mS9WatIQ74k2XCC+tARrnmGpzi2iN4cGEh5aE8+xV2FyKZ+FdC9wM6
	zfpKuSNOwySzlypxlOtcP9oSYAkuwk3dIG9kzTzWotNUpCO0cn94cfXBcVoWi7ctutwuVypZCIm
	lCkGboNj2m8lDzEPnwZ96BMRlKn1/LhZQmF/8iBVgv/3bDqTX8w0/HyK/RsgNN4tyfMq2O2F+eC
	SEh2Oerm62TErB8VbqE8zbwczkLdbeps2+wks7GCD5I9DE6AGvwQxbfXaaaZniblqSBEhI7oJ77
	rKFuG566nYZ1Lry8W/nADofjbItv3NlH1PtZQ+cIR9usUD8N1cjmDGH6Wzm
X-Received: by 2002:a5d:5d10:0:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-48e3859d173mr2609746f8f.33.1792748508060;
        Fri, 23 Oct 2026 02:41:48 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm3913978f8f.7.2026.10.23.02.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:41:47 -0700 (PDT)
Message-ID: <8ae9c5fb-a481-4437-baf0-6610d8131b3f@linaro.org>
Date: Fri, 23 Oct 2026 10:41:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm4x: Fix event count decoding
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Amir Ayupov <aaupov@fb.com>
References: <20261022-arm_cs_fix_etm4_event_count-v1-1-588b2922a546@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261022-arm_cs_fix_etm4_event_count-v1-1-588b2922a546@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_024154_979731_42A3B27C 
X-CRM114-Status: GOOD (  25.83  )
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



On 22/10/2026 09:11, Leo Yan wrote:
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
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 +++++++++--
>   .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 29 ++++++++++++----------
>   2 files changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e9544fe6e22f524de4fef9f89d7484f..b0e286f487017a4155595f14cbb9c9c33b17dc6b 100644
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
> @@ -1519,6 +1517,19 @@ static void etm4_init_arch_data(void *info)
>   	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>   	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>   		caps->nr_resource += 1;
> +
> +	/*
> +	 * See ARM IHI0064H.b, sections 7.3.32 (TRCIDR0) and 7.3.36 (TRCIDR4).
> +	 *
> +	 * Before ETMv4.3, one event is always implemented. For ETM v4.3 and
> +	 * later, NUMRSPAIR == 0 indicates that no events are implemented.
> +	 * Otherwise, NUMEVENT encodes the number of events minus one.
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
> index db9e603f97ba82cd608d3d61881fe8153db020ff..fb38f0102290a53a681934c827abf107c141a740 100644
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
> 
> ---
> base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
> change-id: 20261022-arm_cs_fix_etm4_event_count-49f384a2f6a7
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


