Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7498EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 04:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs57OjuQby2JRRKhT9rDinp96K8xrW31ZkfwIf3fvbw=; b=imVA4d/1xL4ggN3pl5ykjII1iG
	v3hlVypyO650eXmpeW/r3ty+/i1Ywwhkwx46+iGRgmaYNakxSi1l7ojWoSC1OvVAXLpS13B03JqWR
	Hhu5R1PH8NgeW9R5OQA9iF65JDI6CjuHYETEojuaSIiu1J4/3fpClbByQGFds5WPGX41VmuqVUo1f
	2r0+NzeG6yiRSNvZruttrtPZZBQeGicozG9OCeIgqxyzo5yUshlf//XfclFN0ym+4dxOMwdGYtCGr
	CxkyReUZ5MwxG3Jf6w1jDJqbeFj4GQQ7zj7jrte4BfG9YaJDmQIGvzwnVbzV7KesCHZIYIIKLgCcX
	Jz8zjdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWFb-0000000EAaA-1GBU;
	Wed, 07 May 2025 04:19:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWDc-0000000EATP-2ekn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 04:17:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906CD2F;
	Tue,  6 May 2025 21:17:04 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8501A3F5A1;
	Tue,  6 May 2025 21:17:12 -0700 (PDT)
Message-ID: <d08adb1c-6db5-45d1-9eb7-dce19bc7158e@arm.com>
Date: Wed, 7 May 2025 09:47:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250417105253.3188976-1-anshuman.khandual@arm.com>
 <0be8e3be-a029-4eea-a79c-310b8e0a05c3@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <0be8e3be-a029-4eea-a79c-310b8e0a05c3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_211716_714089_F9FB3A90 
X-CRM114-Status: GOOD (  17.11  )
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

On 5/6/25 18:40, Ada Couprie Diaz wrote:
> Hi Anshuman,
> 
> On 17/04/2025 11:52, Anshuman Khandual wrote:
>> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
>> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
>> macros become redundant and hence can be dropped off completely. While here
>> convert all variables handling MDSCR_EL1 register as u64 which reflects its
>> true width as well.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
> 
> I think the changes make sense, even more so given that `kvm/debug.c` already uses the sysreg format definition for MDSCR_EL1.

> 
> It looks good to me, but I think there is a missing conversion to 64 bits below.
> Would it make sense to convert the two instances of MDSCR_EL1 used in `tools/testing/selftests/kvm/arm64/debug-exceptions.c`, in `enable_monitor_debug_exceptions()` and `install_ss()` , to 64 bits as well ? (They don't rely on `DBG_MDSCR_*`, the test defines its own macros)

Sure, will do the necessary changes.

> 
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index b260ddc4d3e9..6dbfc1008007 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
>>         __this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
>>       reg = read_sysreg(mdscr_el1);
>> -    val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
>> +    val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
>>       write_sysreg(val, mdscr_el1);
>>       asm volatile("msr daifclr, #8");
>>       isb();
> 
> Given the change of width to 64 bits elsewhere, shouldn't we change val and reg to u64 here as well ?

Sure, will fold this in as well.
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 73cf6a5f41d8..d61a5ddf53d6 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -344,7 +344,7 @@ static DEFINE_PER_CPU(int, __in_cortex_a76_erratum_1463225_wa);
>  
>  static void cortex_a76_erratum_1463225_svc_handler(void)
>  {
> -    u32 reg, val;
> +    u64 reg, val;
>  
>      if (!unlikely(test_thread_flag(TIF_SINGLESTEP)))
>          return;

Thanks for your review.

