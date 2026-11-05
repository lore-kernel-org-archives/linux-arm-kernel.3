Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF003606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WIrV5XTE;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OjbMNR/r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xF2MyCPe1SO/SsRhlDuDyRpsUTowZ9eaIobnWhahWMM=; b=WIrV5XTE+wjG5N
	GJQGgoYFz68qwIEInhd2oHpho6XjrcjqMHxW30Ug6ar9SEC103DNlvuO7hhKClV9Iq6j85+moaKkO
	wiZDEc/CWtoy0tIv+5CdDmeHe+uufz51dWq6aXM2nuK07z4epKzFnwGuvOXuBEAh9PWTTVoyIj7rg
	gIZt4uxg9OS4Z3FgXViJ5EYBTaByOIKm0HMpjApLj19oXR4InjOGrLrpSTnZvV8LqC9NvauHSnCAb
	MvJfD+t/K0cUkEskajA2WajMq2Qx5ve3z0Ld2S4fDMXrGGeO76WfZorGBOHXXyev1HZmlhWesS+Dy
	afde78LbypITkyqi3fwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz79-00000009N7T-0yPa;
	Thu, 05 Nov 2026 15:10:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz74-00000009N6B-21iG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:10:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a215e64962so18979345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 07:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793891447; x=1794496247; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF2MyCPe1SO/SsRhlDuDyRpsUTowZ9eaIobnWhahWMM=;
        b=OjbMNR/rtToRjrJkXoTKLvCovasVlQrQMWKSwJ0Pww/OGSTBem05Du6VFn0Ar7AVTf
         ZOe9RiHNRKEnoyRDTWgo8ju4JoBJ93p8IrCHucm8+zmhpv5n7MzC7X9TawCE280tHmTr
         R/CCe4s6yPRmIVMADU+FTXNyBNabU6JxclVYDdubZVlZkJ5NdkiULRFHyjpQ7AJQRkGq
         S3HHNtiUYl6KLDk8d8uj2c1x+AZKnEJ8AR+fvNduwalPtMPvb1NiVAe2qrZOvftFnrDz
         iKx/qDF/suAzBXf7rNcD4uYtrUK17220a4+IN9C0EFNKnXiZ8d+xgOK4G/Q4YNa3/L5C
         R+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891447; x=1794496247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xF2MyCPe1SO/SsRhlDuDyRpsUTowZ9eaIobnWhahWMM=;
        b=z7mZLRuSMBZ23NWq/FdfYccOXwh4vhYegfeOLc5REQal19hBODukEAPOX69aw75duh
         JDC71W5uZkpxwiX1P2SDnN++aecUvvJ03EPh7suy7j1TYD4LujL5nJty5k8Uz2Vdg4l2
         gOOF2C45EHeACazBRkdzhx6T5McdYQo5RfHFNCnZkY62lWXjbKnAYVVQEKPjj1FoUVBt
         Ed0AeqJ1F36gMLSNK2flM4XPNLCkIMfW0kdCiHRE1rZP/mxdEq9wXYl2k52URYq6G3Oq
         KbjrGgu+fKcS2iDbe5y22XvKuxlNxUhZnjgEHK+90W8rBxEnC3I9V3DbVohNDzdwLct9
         5qrw==
X-Forwarded-Encrypted: i=1; AKwUvBxvP1d8OUPS4r+9iFxWV6y3BemfplToJ13wDaf85kAZ1fIbeOejVIpdSdEmCfO8CYRYqcCYjVamsnIKiXYL46Ty@lists.infradead.org
X-Gm-Message-State: APuU4Z+Qngso6WlQNfoMpdSE2BuHQ6jp3Au+Qhe/e1aJgdUcGxIYKkzF
	zV+epatTR618rh0yVhPFvEljB6PHHp3xiog6p5ULzX4zKnmPyg0UMg3v1p1E6SA0YZI=
X-Gm-Gg: AYBFou2jwjz+tVdxlUGBhHL+OIHeSuKGPCHGefChFIEhQ7x2IKmqWprp5L5sWE1UbVM
	spP4qkD3yX0IQ5sDWnxLVh5ErA9tep+4EBkUDIHgN+yITa2W3/ivogEBwplXLcCm3HKD0SyGHT9
	W/3Z9DaCat/wRCmzJrsWS/XW6dQFiFSfbJFk+VtFLQcxZrtmJCkMsMzpsYvxYK5nL5+JbB9llWT
	UTjdkZzTWkIiB84hWEtFlJdBR0jH5k9hrl2/zadsjWb6w3NHGp8y0CriDRlnRbwPRIATJNCpWZr
	XYZHl+/QTt/zgBtDH3B/whMNe7WZEkAjActkJtkI5AqQUnETsrRij5hh0IHHYfGPc29djGMeSW6
	B6+lOtdU4Ju76EuGcxWKtPZQRmsKj9//Dom7m7qhEKJ7cfTQyTuRbkUucRoSb89DoZhy990uSvU
	x8fvv5Pp61/CsjiQtcpkwL/Lpo5Hyc50LDGzn/1qJ5oUuNgX8SwTjTDZwEscZScxI+9G8hW4CpQ
	LKe2JnCtoCbov5+URS2XwNAG3T9wkraOtpCfVRGC8Trs3cWXyOwxfeRqVL391nF1ddT5yer7GaH
	xj9lAzxzgHRqTvbdBgifOiqTLmez6VS+GdGmcnHq9RtFOrZrkwu2qQ==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr449585315e9.29.1793891447318;
        Thu, 05 Nov 2026 07:10:47 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm132091435e9.2.2026.11.05.07.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:10:46 -0800 (PST)
Message-ID: <f7b19834-dc88-4431-a383-4b73edc5dc4d@linaro.org>
Date: Thu, 5 Nov 2026 15:10:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
 <a876b77b-c4e4-4019-868a-af12c93f441f@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a876b77b-c4e4-4019-868a-af12c93f441f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_071050_564463_D61BA795 
X-CRM114-Status: GOOD (  23.67  )
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



On 05/11/2026 14:54, Suzuki K Poulose wrote:
> On 26/10/2026 05:48, Amir Ayupov wrote:
>> Drivers outside the PMU driver may need to know whether the local CPU's
>> PMU implements a common event before relying on it, for example a trace
>> unit driver checking that the PMU counts its external outputs as
>> TRCEXTOUTn.
>>
>> Add pmuv3_event_implemented() to the arm64 asm/arm_pmuv3.h, next to
>> read_pmceid0() and read_pmceid1(). It reads PMCEID0/1 on the calling CPU:
>> events 0x0000-0x003f are reported in bits [31:0], and the common events
>> from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits [63:32] from PMUv3p1. Move
>> ARMV8_PMUV3_EXT_COMMON_EVENT_BASE next to the event numbers in
>> linux/perf/arm_pmuv3.h so it is available without CONFIG_ARM_PMU.
>>
>> Suggested-by: James Clark <james.clark@linaro.org>
>> Assisted-by: Devmate:Opus-5.5
>> Signed-off-by: Amir Ayupov <aaupov@fb.com>
>> ---
>>   arch/arm64/include/asm/arm_pmuv3.h | 19 +++++++++++++++++++
>>   include/linux/perf/arm_pmu.h       |  1 -
>>   include/linux/perf/arm_pmuv3.h     |  3 +++
>>   3 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/ 
>> asm/arm_pmuv3.h
>> index 8a777dec8d88a..acd62c4f16743 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -173,6 +173,25 @@ static inline bool pmuv3_implemented(int pmuver)
>>            pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>>   }
>> +/*
>> + * Whether this CPU's PMU implements a common event, as reported by
>> + * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 
>> events
>> + * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
>> + * Must run on the CPU whose PMU is queried.
>> + */
>> +static inline bool pmuv3_event_implemented(u16 event)
>> +{
>> +    bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
>> +    u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
>> +    u64 pmceid;
>> +
>> +    if (id >= 64 || !pmuv3_implemented(read_pmuver()))
>> +        return false;
>> +
>> +    pmceid = id < 32 ? :() : read_pmceid1();
>> +    return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
>> +}
>> +
>>   static inline bool is_pmuv3p4(int pmuver)
>>   {
>>       return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>> index 02d2c7f45b527..792283d29d7b5 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -124,7 +124,6 @@ struct arm_pmu {
>>       u64        reg_brbidr;
>>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS        0x40
>>       DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
>> -#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE    0x4000
>>       DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> 
> Could we not avoid this change ? Or why not move both of the definitions ?
> 

I don't think you can avoid it unless you redefine it. But the place 
it's moved to has similar event number definitions, so it seems ok to me.

Moving both makes sense though.

> 
> Also, I would need an ACK from the arm_pmu maintainers to accept this
> change via coresight tree.
> 
> Cheers
> Suzuki
> 
> 
>>       /* Only to be used by ACPI probing code */
>> diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/ 
>> arm_pmuv3.h
>> index d698efba28a27..c21f185a283d6 100644
>> --- a/include/linux/perf/arm_pmuv3.h
>> +++ b/include/linux/perf/arm_pmuv3.h
>> @@ -78,6 +78,9 @@
>>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND            0x003E
>>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT                0x003F
>> +/* Base of the common events reported in PMCEID{0,1}[63:32] from 
>> PMUv3p1 */
>> +#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE            0x4000
>> +
>>   /* Statistical profiling extension microarchitectural events */
>>   #define ARMV8_SPE_PERFCTR_SAMPLE_POP                0x4000
>>   #define ARMV8_SPE_PERFCTR_SAMPLE_FEED                0x4001
> 


