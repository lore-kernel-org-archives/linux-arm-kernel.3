Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JW5bPMPO;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h5SKge6h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pzUmwNzwamyMVOA6MAa5bFlqwFID1JSnlpUPYtQh5+I=; b=JW5bPMPO6ns4g4
	deA16ZRbaeikFIHzjaVT8HG/VLcHeEBR87icshaDxQy5nhPfX6az+lF3haDMBI6/uUTyroIksETK1
	QF8ZyB51s9JrazQzNJiDHs1/4N/xL+fUjiW/sE0eN9Vatbg9mxXyVR2V4ZpwYo+efPVOgkBjpBH+I
	z2jiXiEvj/qL4qZzgKt8St5AM8/DZg+iAlMmlinJU0X3rcEaqXKivX5Ch1ZKHyWhvEhR7d8yMiaTX
	m6g7Dg0iSM2L2wsRrU2TiSK6gJENhGrrTZcdV96xyxG/oXQNS1ySS54gfFv/Cg/P0qGFqcaRGMTgZ
	xqmn7td7k8n48j8x/HXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM07A-00000006gJW-3VeJ;
	Wed, 28 Oct 2026 09:38:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM075-00000006gHw-41GJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:38:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so7862975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793180310; x=1793785110; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzUmwNzwamyMVOA6MAa5bFlqwFID1JSnlpUPYtQh5+I=;
        b=h5SKge6hVPMCrT7gLQXGUieMxzZm3QHUTgJ4oNVZbfKPBZeKid5aLbEI1uFA9NeHbd
         jQXskUX8NCGS0ZbH9CKHSktPADICtUDv9ZXp1qiTaX1RyVV74XcoleWaMm4wDxrMUMGo
         mhiDKWrBis0EPkAk+a9yM0sPhQI8wF8mHzQLsHLFUEIlp4Y1F08SEyGVdggRQJCKGXVh
         RA4PW0IekAFkWylGhlBqO8ybytACybvghDyeAb9m5h4ZH8P1G9L6xeDvkbZ/iesC8jCV
         C9hOMEAyXvKz0bENC6a7XpkYWIgvOI60Xor/xTxpYNNd5smMezjssROurVMAH3hPjDQU
         Ov4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180310; x=1793785110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzUmwNzwamyMVOA6MAa5bFlqwFID1JSnlpUPYtQh5+I=;
        b=NC+jbcVoBviUCIApf44yZDu7FwId4IQRgQKdnN8HsaPV8Aacxzsq3bIdmMqwODOu4H
         /JTaatbcI/SLPJimU8ommpFrIfObA+93T8WmmOow7a5u2GNE+zJiA8yq01M76qfMOpfL
         YARwnFV5E9zxJXukKj+MGmMgafFivvGnBgjjv5VuSx2rqikU09XTxYj0s0IocNgMrmPE
         +9GXQ3Xq3+C+qSvxcys/Sz10IYkm1YvZsnegsY328RJGRVZJ5b2esNf/RdLw+J4wJb8U
         vkMtPu0LBzPfMw1s6dlYUlKA/60081XFZlu378kE+jnPYgJIXY2uQH+F6hnjXZ8oXSex
         4vAg==
X-Forwarded-Encrypted: i=1; AKwUvBwOqnFTg9bQCymGXdDTN/qGRuyJZStJAW+fglNYjQg9VljWlk0VbOXcmN4S4xTZYLU83vrpl68ZOC58c2J+ZJaF@lists.infradead.org
X-Gm-Message-State: AFq9FYIDQ9L4OM9of+6YPzv+hd/gLsnja/oO/HzlFRedXObLOfcU+feA
	YIkfoL8yGCMWknHh9p25bfxBTVYt4Zve8+UzHAKAKDbYL1ThnSZHRGqqX5o/UnaxgwA=
X-Gm-Gg: AYBFou1gDvmqebMQaodoryYeXpucNC9B4quCVtRDfaoFmIj7YB+xKcAPfjB87SoMIbU
	VhOhbhq0ZGZcQZvsKqiuHTw2KguazK8ZqYjpTZ8zAVA8T4s/pCPllhKfFotY1qnfLgiNTQYsqWx
	+LiUH21KByuxwYvhxuYb1zzxtWWQba4efEDn5FUnaGi3uBPdAHxt+kSuKHP36nPnvZN0ucIULGZ
	zQlQTHEoRWh01pj1jlKxwlOR6X2cCJJJ5dMWDYaPMj3CgR/TemD/KlhUw3x0ikm0i39qJFzUicW
	4j++9jyuvEyD//CX8BXWRNDfMQRA+9gNiD4dxXOn70Xg7m6K+skqP8wytXQIkfn86ysqy/YilNG
	G9PLPpl324N7jJQZ1vaModvrnpAvBxlFWvlk5iLQocOfywX61oE1TtPW4AbrP3syNYTYZaJzvD9
	6BlCIwCNHYbUrddBVyzFLV+UMfp+/DzR2i2l0VW8uSuhue4q02fdVr1vKjzFc5ynBV4GL1R19ei
	80w+WhUx94YuUThtBOHcFqI2Nf3jayShW3XuXcH6rgpMQMMnc3MnHW5IBROSZrV2d42y157FHTm
	ASrga9F2laLBK34T+dQmqQ3Xb8u8RCxM1g==
X-Received: by 2002:a05:600c:6089:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a967ca24ecmr34100865e9.32.1793180309742;
        Wed, 28 Oct 2026 02:38:29 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm35187485e9.6.2026.10.28.02.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:38:29 -0700 (PDT)
Message-ID: <97df111f-edf4-4ce6-8ccd-9cccc730006c@linaro.org>
Date: Wed, 28 Oct 2026 09:38:28 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf/core: Return errors from
 perf_report_aux_output_id()
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
 <20261001-james-cs-retry-hw_id-v1-1-4d45ab46cde7@linaro.org>
 <254599ef-ace5-423b-bc31-56150909d96f@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <254599ef-ace5-423b-bc31-56150909d96f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_023832_024478_F4F8DDB2 
X-CRM114-Status: GOOD (  17.80  )
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



On 05/10/2026 16:46, Suzuki K Poulose wrote:
> Hi Peter, Arnaldo, Mark, Ingo et al
> 
> 
> 
> On 01/10/2026 15:21, James Clark wrote:
>> It's useful to know if this failed or not so a retry can be attempted
>> later. Return the error code or success.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   include/linux/perf_event.h | 2 +-
>>   kernel/events/core.c       | 6 ++++--
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index 48d851fbd8ea..01d318a4de50 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -1896,7 +1896,7 @@ static inline struct fasync_struct 
>> **perf_event_fasync(struct perf_event *event)
>>   }
>>   extern void perf_event_addr_filters_sync(struct perf_event *event);
>> -extern void perf_report_aux_output_id(struct perf_event *event, u64 
>> hw_id);
>> +extern int perf_report_aux_output_id(struct perf_event *event, u64 
>> hw_id);
> 
> This looks a trivial change with minor impact. Are you happy for me to
> pull this via the coresight tree ? Please could I have an Ack on this ?
> 
> 
> Cheers
> Suzuki

Gentle ping, thanks.

>>   extern int perf_output_begin(struct perf_output_handle *handle,
>>                    struct perf_sample_data *data,
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index d7f3e2c2ecb1..232da3b6f393 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -10563,7 +10563,7 @@ static void perf_log_itrace_start(struct 
>> perf_event *event)
>>       perf_output_end(&handle);
>>   }
>> -void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
>> +int perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
>>   {
>>       struct perf_output_handle handle;
>>       struct perf_sample_data sample;
>> @@ -10585,12 +10585,14 @@ void perf_report_aux_output_id(struct 
>> perf_event *event, u64 hw_id)
>>       ret = perf_output_begin(&handle, &sample, event, rec.header.size);
>>       if (ret)
>> -        return;
>> +        return ret;
>>       perf_output_put(&handle, rec);
>>       perf_event__output_id_sample(event, &handle, &sample);
>>       perf_output_end(&handle);
>> +
>> +    return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(perf_report_aux_output_id);
>>
> 


