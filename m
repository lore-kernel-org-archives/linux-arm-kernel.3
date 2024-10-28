Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8C9D10C11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4zVl87eaM33Cs5RngzKH7F4/SlwvuszbabtRQ04bXc=; b=TblUkOykfHR+/uZBtYDZnF1A4w
	nuACxHVheF6JtbqgwOu26J2TpKnGGjy1AABQo1eSK/dYcwxSAuPzhadh75I6/Gp8eBfgZJvRCuAM+
	GkTbXaVJpX5AKUxpY+1imGe6byCwwsNqYjmIMWe56fZBHRtLIKOuavJnll6DE4mAyYp8QEv5GViY4
	wVGx+ewTn25VQO+zV5bI2vZMdLLnq+syhCDYjeoO6Vhq2Ksj8Bb9sA+10LpPEiMHllAzldvgcciBs
	ppESFfjvoNCuyDlsHF/ub6y7MqDk1Y1zNg53dxr2kCh7L6zKMTbixoHQ9kWkdwvTcpSmjgKWrChEW
	KbSFmeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PyU-0000000Axdn-19E2;
	Mon, 28 Oct 2024 13:40:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Pwq-0000000AxKg-1Q1g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:38:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF662497;
	Mon, 28 Oct 2024 06:38:48 -0700 (PDT)
Received: from [10.163.42.200] (unknown [10.163.42.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976283F66E;
	Mon, 28 Oct 2024 06:38:15 -0700 (PDT)
Message-ID: <8efe902c-8b9f-494a-b9da-430d8ced32ef@arm.com>
Date: Mon, 28 Oct 2024 19:08:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64/cpufeature: Add field details for
 ID_AA64DFR1_EL1 register
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
References: <20241001043602.1116991-1-anshuman.khandual@arm.com>
 <20241001043602.1116991-2-anshuman.khandual@arm.com>
 <ZxfLEqlbGLnK15sf@J2N7QTR9R3> <2c51de68-fcca-4457-b8e9-b488d8030738@arm.com>
 <Zx-EqqkQL_FQMRuu@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Zx-EqqkQL_FQMRuu@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_063820_509403_B9CFF59F 
X-CRM114-Status: GOOD (  17.87  )
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

On 10/28/24 18:03, Mark Rutland wrote:
> On Wed, Oct 23, 2024 at 11:18:12AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 10/22/24 21:26, Mark Rutland wrote:
>>> On Tue, Oct 01, 2024 at 10:06:00AM +0530, Anshuman Khandual wrote:
>>>> This adds required field details for ID_AA64DFR1_EL1, and also drops dummy
>>>> ftr_raz[] array which is now redundant. These register fields will be used
>>>> to enable increased breakpoint and watchpoint registers via FEAT_Debugv8p9
>>>> later.
> 
>>>> +static const struct arm64_ftr_bits ftr_id_aa64dfr1[] = {
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABL_CMPs_SHIFT, 8, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_DPFZS_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_EBEP_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ITE_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABLE_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_PMICNTR_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SPMU_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_CTX_CMPs_SHIFT, 8, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_WRPs_SHIFT, 8, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_BRPs_SHIFT, 8, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SYSPMUID_SHIFT, 8, 0),
>>>> +	ARM64_FTR_END,
>>>> +};
>>>> +
>>>
>>> Is there some general principle that has been applied here? e.g. is this
>>> STRICT unless we know of variation in practice?
>>
>> Yes, that's correct. STRICT unless there is a known variation in practice.
> 
> Please mention that somewhere, e.g. in the commit message.

Sure, will add that.

> 
>>> e.g. it seems a bit odd that ABLE cannot vary while the number of
>>> breakpoints can...
>> But all these (ABL_CMPs, CTX_CMPs, WRPs, BRPs) are marked as FTR_NONSTRICT.
>> Would not that allow ABL_CMPs to vary as well ?
> 
> I asked about ABLE, not ABL_CMPs.
> 
> ABL_CMPs is marked as FTR_NONSTRICT, but ABLE is marked as FTR_STRICT.

Ahh, that was my bad, completely missed.

> 
>> Although the existing break-point numbers are currently marked FTR_STRICT,
>> should they be changed first ?
>>
>> static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>> 	...................
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
>>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_WRPs_SHIFT, 4, 0),
>>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_BRPs_SHIFT, 4, 0),
>> 	...................
>> }
> 
> My point was that the above didn't seem to be logically consistent; I
> think you didn't handle ABLE as you should have.

Agreed, will change ABLE as FTR_NONSTRICT instead.

But what about the ID_AA64DFR0_EL1_WRPs_SHIFT and ID_AA64DFR0_EL1_BRPs_SHIFT
which could have variations in different cpus on the same system ? So should
those be fixed as FTR_NONSTRICT first ?

I have posted V2 for this series earlier today, hence will accommodate all the
new comments here in V3 going forward.

https://lore.kernel.org/all/20241028053426.2486633-1-anshuman.khandual@arm.com/

