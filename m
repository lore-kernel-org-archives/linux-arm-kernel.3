Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0235CCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6/Hu0+FzeutECjLCJhR6ThF6X+jor72I2j2aChvi7s=; b=gGHW03vtyGKUGUYDAUI2chRkaN
	oVVjjyhvzj6fMEp3AoDJ6DAX5zQvFRrJ3FMyF+atZfDPACxO6nfiCTQbOUJ9pRDc627hCYQ1anIgC
	M5NTOpUz6TDgMoWuStIulXM2KHaenWF38DXVxt/nCXkWGIgTAs+a0JSM+pcUZXzFIi8wR7m1I4iy7
	3AhZ1pzPa0XVGlfysiCjU6/Av1ZJLe2FGEMJ0bZR/640fRe7ObIpYZ7rHxvLmkAacpAsix67fuqCg
	b/rpfz1ZKlOgGOe9gWrtW3UyBbaWLv88ko3x0+fp1ER85mFEhlMmkQmHXJnFMMEXaSJGQMhBu88Z9
	tzp/+Lyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe93-0000000Ftnr-0wRm;
	Mon, 05 Oct 2026 08:34:01 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe8z-0000000FtnQ-1Mo5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:34:00 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6ad186afdf4so2528460a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791189235; x=1791794035; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6/Hu0+FzeutECjLCJhR6ThF6X+jor72I2j2aChvi7s=;
        b=SVYfhaQ7sc6gq3uGZfRaGIz10UJCrGmtYwJCsF09DIvoAp/XWNwoM70q7H2/gq2eqN
         ek20wV9oU8nC2KC7jpWDX0b2brn3kKW/2FZdm+uysdyi/v8jN0owEK3DVZtWn1T4YFJQ
         AOcB8h7nonuw+MJr/u2rIaJ8RYUa+NA/8H8+naWHMwiUgSNPklNe3ke+rJVu9hShGshe
         B/Ht/xoO2S8V5wA3nazWe8jztWO3qd1cPbjDtMiZll6f8ggqKdYzd2jjSeYByPu63PG0
         yKrwRzVVCdpOzr+UL10JXtU63CFvpXHky197amS/RZ4/QvylV6eBZo3mg52pkhhlKLU7
         Vi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791189235; x=1791794035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6/Hu0+FzeutECjLCJhR6ThF6X+jor72I2j2aChvi7s=;
        b=ZTFngrAsips1i5h1LcEUvhSpviJsoakAMCTBaE7IDId94LcXFTjPpy7DYLHDgscLs3
         sKB8HPwl6TrveNpJcYn0yPYJ6WL4RQie16TNOpsvEovbpGIKc61u2QNsZXhYvzEnKI6x
         lnjMOLxkaLhqhBhIo4aWoFOWr1D7U5rcKIDR8Wd0sp8BlCGDknzC9hkkVu4X+uPNHzdG
         GSCZ3sOwwSN3xhkvKqmR1GZJM7Imw2kNGiQ9rVmLsukGJO/3dNnA03/ASYc+6YctZXJs
         r60jbI42Bd7fDgqhT4/P5PTKhinEJha5yDfok9Rz/Fhd/ML+vmTZcEqMH5+7xS2z5cmY
         BYXw==
X-Forwarded-Encrypted: i=1; AKwUvBxWTYGktFOj91zgY8z6HEffqxCL8/0nje5h+iM9z4nkY5UZtok/Yu0dCxM7/Ja2buuIn8aruGRmhmQElS508kCJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIdkXWXTyua1mEDiEFZ+9HRQ1oiB3+INrFnXHLRWxxDo48BTzCa
	bUuity9apHQN1tWHgtXmn8BtzdIDTaCLk75IjxlfW2d06L+tC6/NJVlTJVqSXU9QkSM=
X-Gm-Gg: AYBFou1GAC+AIrCiLynWcTWOCUwVAeDQfkkbPt1iZEVcNJp90X5o7j+YriwPrOhwGyb
	d1WoOMUw5qH+PdRPb6XRPkzFQtrODC+nuf4sjIfBFxqLJ33gJj13AaZxm871/0I3R5Q7Iwk1Ji3
	iKBwClJNj9sIYAfB7obTBgV+aHrhoF0aBTDyyWY66OLHLJxLFTK2gjvuEGXI4KxGEgE5E88CZ4g
	C2V/W/cWfNM8+UdEEmRdZ7hDK98mdg1m1Ne0/LGPJ+iWdPKdwyE2tNMjFUnt1wHPx6EZUPw04VD
	7pBFcKpxIuFNcUS4Q6S9Bk/oao27WIlcHDd/Usv/F6V7xuBvxx7gp1qFJTpWA7e3JnjfJ7IK1/1
	fUr7eCym5djFhIOZareqhjEoE/PVoHgGFnOqf960IbnoFDuG2l8Tt67iUBSFrJQaFY7WxMmY03j
	U/OzroFhTnM3j99qIhcLrzOmH7BBN+EUi6/izbDtqlGEButjiSLXn3IyL9fH3ptCE32VeAAsb+Y
	90=
X-Received: by 2002:a05:6402:4594:b0:6ac:c82f:3caa with SMTP id 4fb4d7f45d1cf-6af9e03e03dmr8002385a12.1.1791189233468;
        Mon, 05 Oct 2026 01:33:53 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb005a424sm3031255a12.0.2026.10.05.01.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 01:33:52 -0700 (PDT)
Message-ID: <c22b2771-95c5-4f1d-bd9e-26088313b864@linaro.org>
Date: Mon, 5 Oct 2026 09:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] perf cs-etm: Synthesize missing HW_ID mappings for
 raw trace
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Suyash Mahar <smahar@meta.com>,
 Amir Ayupov <aaupov@fb.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
 <20261002-james-cs-hw_id-output-failure-v3-3-1d8b6ef339c8@linaro.org>
 <20261002171405.GG1208404@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261002171405.GG1208404@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_013357_391230_BCEB22CB 
X-CRM114-Status: GOOD (  23.32  )
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



On 02/10/2026 18:14, Leo Yan wrote:
> On Fri, Oct 02, 2026 at 12:15:13PM +0100, James Clark wrote:
> 
> [...]
> 
>>   static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
>> @@ -314,12 +317,11 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
>>   		return -EINVAL;
>>   
>>   	/*
>> -	 * If the queue is unformatted then only save one mapping in the
>> -	 * queue associated with that CPU so only one decoder is made.
>> +	 * Ignore HW_IDs for unformatted, a decoder will be made
>> +	 * unconditionally later.
>>   	 */
>>   	if (etmq->format == UNFORMATTED)
>> -		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
>> -						    cpu_metadata);
>> +		return 0;
> 
> Nitpick: It seems to me that we can move the
> etmq->format == UNFORMATTED check into cs_etm__process_aux_output_hw_id().
> 
> This avoids duplicating the check in both cs_etm__map_trace_id_v0()
> and cs_etm__process_trace_id_v0_1(), and makes it more apparent that
> the unformatted case does not use HW_ID at all.
> 
> It's up to you whether to keep it as is or update it. Either way:
> 

I might leave it for now. It's also called by 
cs_etm__map_trace_ids_metadata() which doesn't have a reference to the 
queue, and neither does cs_etm__process_aux_output_hw_id(). Probably not 
worth another refactor at this point.

> Reviewed-by: Leo Yan leo.yan@arm.com
> 
> P.S. Although I contributed the initial idea, the change is now quite
> different from the original patch I shared. Please feel free to drop my
> name if you prefer.

Will do if I send another one, but it looks like it can be applied now 
so it might have to stay.

