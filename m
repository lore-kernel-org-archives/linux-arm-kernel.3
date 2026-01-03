Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA995FC6174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 06:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n009qAjQa1f/gx1JlFPWaK6vp1HVpsaalQe/6LgsF9o=; b=uuOM4lmtQMFbiyZqSg8XPWGmZl
	WV5BeMyC0qq5QrFgJcxubi717mCxaprV2mixEwD3J8pIn0CAtSdDBPC6Wzr5zbpb+V6QWTCK+rjji
	Yg36KNuh1iiH+M5L95A6+Dyga34PgHYBoIS+cfjWZTTH2JkwGX6WNMrb4Xxa8kYenU7Mx3ReIx6RQ
	3ghklx88Kqd2DY9n+OL2Q/1pdRDuyOZshPmOb/J3JrFNH2mpKwmv+rYOrfMjDX1LLLJDJyEY5iMPW
	gTaN4h1BR8v3uNO+Of8CUF99CPiFkLhafF8EzB4fPzqgEVDnI8wvEk4mSZ3FeXLPS7ghIzr5/tBgU
	QOo2+/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvFx-000000091zU-3Wtd;
	Sat, 03 Jan 2026 06:36:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvFv-000000091z7-06Uz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 06:36:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso13104871b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 22:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767422213; x=1768027013; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n009qAjQa1f/gx1JlFPWaK6vp1HVpsaalQe/6LgsF9o=;
        b=cAVqHOxxFE4PXtc/IXav7y0I7OjTTz6Y2YRGAD5so5d6L2+7JqCGIt29XMJUlho5wC
         gdMpudpSdNW8oP1YpeOdNEQBXRbsyY+I5aIFBQGa/wSdOY/HNi/kLPI77/Tv3dLbfguO
         Yui1c6UzgG8aCAdsBHrEqQQhIdo9CS3nFo3ktmIlKpa1QVRdMLCGpy4DbEUXDef95wK3
         mSA5HIs4DFybUN79kSCaJ35/tS/gLNTbYOvoH8SJjtATh+qwhMAWSuIpoNd/bVzlhV89
         A8iSMidnXQ9Nu8k/5hNeTznrpzNtvNkUJZBlGl0MWH4TnsRR7bdu/1iXXLeSql4VbOgw
         DE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767422213; x=1768027013;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n009qAjQa1f/gx1JlFPWaK6vp1HVpsaalQe/6LgsF9o=;
        b=tINiDHs7g7DBhn6lWY0zCV0Mk9qhJtNQqlGmuPJ5Y+8a/LtVkME5X8jjr1a8MIx9BP
         c5z2cI50lDfK8MbvfNLMgrRm4EfBt2YktyjQSIqjkV+7p001OX8JiuYyohhsZRHB5Zws
         z8U6n1llEqGrh2NmpKn+btToIDUCwu/wg2hhDtD8tiAq7h/cAuujVoAgc+WwjkYeUjWl
         PpTsVgNfKhP/wpGQxoq4CXudPP9BqhwEs9OiFTjPwt8HQidCwU6gMTzhmE4q0pY7Ebbo
         trMQfPuvLf/Y/xWK4uGhHzCD52EswZgbukHH6eF8lhiJC7hngQ0j5102XwHkDOYWd4ry
         bvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWio1zjJqjWRQjO7gI5qVXC/EB9ZsNbx2B637MXFGTnX0H+q8sKP5UAiMoYvbgu0NB9WFboFLumJnw1U+Bfegpt@lists.infradead.org
X-Gm-Message-State: AOJu0YxnjryvGzVY+FWhCQ3zY2DgUlptD6TDOYk8Jcinz2zIQuPD2H/Q
	55Naf2NoPl5C8di4gKVFK0ThNvGdaAFdZmrJozd2Ijisc3GdfokFlKcIIHSF+qfqRq8=
X-Gm-Gg: AY/fxX7HyXGyXNyjQli/AL16k2euec8ssZZDl8gCjx06JzAsCoK+HteaCK0H9H63/6y
	Cxupi73kERkUzeg8Og3wzvC4zFNor/3iEFwWx9MP5yZhPCKGLkDDwBipsOd9K6YHsxKZMhwFt9e
	fBedUdo2YtG87Du0xApuJdzaweC2dxfIghvOJF1Gcq894Ro6W16ZjptCAcznuRi98jKdvI72gVO
	cqPBOq506PWw9d0LcvKI4VOCsJo4HfYEfg00zNBsqol/kptZ7TbzNSx7OXhgshX/eLOOrBCT0GI
	7BAvV+8M7xyjYwS5068/TjSQBwtXroBnaYuB693mApFrD6YRyWU9TdA61o490c/Ixu7Q55QYIXB
	qQ6vrHukG5cS5OpVjX8Pqw5XS8pXNgndpjUV6YDTPSaXNTVJR+KgVpjyAzpsv9fR2XfOMm8bm8u
	JejsyRJmKJwK5+PZIfg3FyaSl/eCdfbzXeYui+6dBfnIPWy1CdAHINnAQGxfrV9NYC
X-Google-Smtp-Source: AGHT+IFjVDKmB/xNuLtQKRYfU/ITUXwxCDRtTDnOfIZDb5jRoUr7iNoQ0th445p4ZZcSbNCPgjHtMA==
X-Received: by 2002:a05:6a00:140f:b0:807:c2b9:38ec with SMTP id d2e1a72fcca58-807c2b93f63mr22110230b3a.15.1767422213430;
        Fri, 02 Jan 2026 22:36:53 -0800 (PST)
Received: from ?IPV6:2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf? ([2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a2e3esm41753812b3a.37.2026.01.02.22.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 22:36:52 -0800 (PST)
Message-ID: <4b8953ac-567b-4d68-9c25-72a69afdf1b3@linaro.org>
Date: Sat, 3 Jan 2026 08:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-19-eugen.hristev@linaro.org>
 <aVImIneFgOngYdSn@kernel.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aVImIneFgOngYdSn@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_223655_088819_28E70D69 
X-CRM114-Status: GOOD (  26.52  )
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



On 12/29/25 08:56, Mike Rapoport wrote:
> Hi Eugen,
> 
> On Wed, Nov 19, 2025 at 05:44:19PM +0200, Eugen Hristev wrote:
>> This memblock flag indicates that a specific block is registered
>> into an inspection table.
>> The block can be marked for inspection using memblock_mark_inspect()
>> and cleared with memblock_clear_inspect()
> 
> Can you explain why memblock should treat memory registered for inspection
> differently?

It should not, at a first glance.

The purpose of the flag is to let memblock be aware of it.
The flag is there to have a "memblock way" of registering the memory,
which inside memblock , it can translate to a meminspect way of
registering the memory. It's just an extra layer on top of meminspect.
With this, it would be avoided to call meminspect all over the places it
would be required, but rather use the memblock API.
And further, inside memblock, it would be a single point where
meminspect can be disabled (while preserving a no-op memblock flag), or
easily changed to another API if needed.
Ofcourse, one can call here directly the meminspect API if this is desired.
Do you think it would be better to have it this way ?

Thanks for looking into it,
Eugen


> 
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>  include/linux/memblock.h |  7 +++++++
>>  mm/memblock.c            | 36 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 43 insertions(+)
>>
>> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
>> index 221118b5a16e..c3e55a4475cf 100644
>> --- a/include/linux/memblock.h
>> +++ b/include/linux/memblock.h
>> @@ -51,6 +51,10 @@ extern unsigned long long max_possible_pfn;
>>   * memory reservations yet, so we get scratch memory from the previous
>>   * kernel that we know is good to use. It is the only memory that
>>   * allocations may happen from in this phase.
>> + * @MEMBLOCK_INSPECT: memory region is annotated in kernel memory inspection
>> + * table. This means a dedicated entry will be created for this region which
>> + * will contain the memory's address and size. This allows kernel inspectors
>> + * to retrieve the memory.
>>   */
>>  enum memblock_flags {
>>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
>> @@ -61,6 +65,7 @@ enum memblock_flags {
>>  	MEMBLOCK_RSRV_NOINIT	= 0x10,	/* don't initialize struct pages */
>>  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
>>  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
>> +	MEMBLOCK_INSPECT	= 0x80,	/* memory selected for kernel inspection */
>>  };
>>  
>>  /**
>> @@ -149,6 +154,8 @@ unsigned long memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
>>  bool memblock_overlaps_region(struct memblock_type *type,
>>  			      phys_addr_t base, phys_addr_t size);
>>  bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
>> +int memblock_mark_inspect(phys_addr_t base, phys_addr_t size);
>> +int memblock_clear_inspect(phys_addr_t base, phys_addr_t size);
>>  int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
>>  int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
>>  int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index e23e16618e9b..a5df5ab286e5 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/seq_file.h>
>>  #include <linux/memblock.h>
>>  #include <linux/mutex.h>
>> +#include <linux/meminspect.h>
>>  
>>  #ifdef CONFIG_KEXEC_HANDOVER
>>  #include <linux/libfdt.h>
>> @@ -1016,6 +1017,40 @@ static int __init_memblock memblock_setclr_flag(struct memblock_type *type,
>>  	return 0;
>>  }
>>  
>> +/**
>> + * memblock_mark_inspect - Mark inspectable memory with flag MEMBLOCK_INSPECT.
>> + * @base: the base phys addr of the region
>> + * @size: the size of the region
>> + *
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +int __init_memblock memblock_mark_inspect(phys_addr_t base, phys_addr_t size)
>> +{
>> +	int ret;
>> +
>> +	ret = memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_INSPECT);
>> +	if (ret)
>> +		return ret;
>> +
>> +	meminspect_lock_register_pa(base, size);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * memblock_clear_inspect - Clear flag MEMBLOCK_INSPECT for a specified region.
>> + * @base: the base phys addr of the region
>> + * @size: the size of the region
>> + *
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +int __init_memblock memblock_clear_inspect(phys_addr_t base, phys_addr_t size)
>> +{
>> +	meminspect_lock_unregister_pa(base, size);
>> +
>> +	return memblock_setclr_flag(&memblock.memory, base, size, 0, MEMBLOCK_INSPECT);
>> +}
>> +
>>  /**
>>   * memblock_mark_hotplug - Mark hotpluggable memory with flag MEMBLOCK_HOTPLUG.
>>   * @base: the base phys addr of the region
>> @@ -2704,6 +2739,7 @@ static const char * const flagname[] = {
>>  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>> +	[ilog2(MEMBLOCK_INSPECT)] = "INSPECT",
>>  };
>>  
>>  static int memblock_debug_show(struct seq_file *m, void *private)
>> -- 
>> 2.43.0
>>
> 


