Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DE7D33982
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJ5aMDFu1K/igURfavaHvHn7gpkTf36UNHvBD9xoaRw=; b=WJR3UcBBnme8BL/+7uDi2ISY8w
	3FzkIaJQmlCb/KRV6BLVO5/lzxUM8rcfYxxxk4tE9A7uABf7ceS2zImjTAdpEs7h1YRoLttHorWFF
	g9y7Wzvz1o2F7KU/8FmLr4yIJ3/2/5z+pAumUXEMFCXX1ImipIJ1J+R7H0RtYmmZAiwys0iytVsxj
	4drQbn/kxRtJ2O0gepdp1miq7w029eRLExFhr3XmOlZjUZnHfgZZ9tqHyZn9yb0I2nKITj20q+8y9
	ReELwkGkiHSMjf2ZYCHjcLuoZjZ3GZRznXoXJO2iiknusTC0Li4FVTlSprja0pOZnvatViyVw5OW3
	iV3Lyj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QCD-0000000B0Iw-26mV;
	Mon, 28 Oct 2024 13:54:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Q22-0000000AyKs-1oLI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:43:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02037497;
	Mon, 28 Oct 2024 06:44:11 -0700 (PDT)
Received: from [10.163.42.200] (unknown [10.163.42.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C4103F66E;
	Mon, 28 Oct 2024 06:43:36 -0700 (PDT)
Message-ID: <92124be9-ffa5-4cf9-bec4-e7d3afb91a96@arm.com>
Date: Mon, 28 Oct 2024 19:13:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64/boot: Enable EL2 requirements for
 FEAT_Debugv8p9
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
 linux-doc@vger.kernel.org
References: <20241001043602.1116991-1-anshuman.khandual@arm.com>
 <20241001043602.1116991-3-anshuman.khandual@arm.com>
 <ZxfOeqyb3RvsdYbU@J2N7QTR9R3> <72700154-cbf4-4a0a-b6e2-6f0709dec0ce@arm.com>
 <Zx-E_8SFV74s6xN8@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Zx-E_8SFV74s6xN8@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_064342_779413_C42FF6AE 
X-CRM114-Status: GOOD (  14.70  )
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



On 10/28/24 18:05, Mark Rutland wrote:
> On Wed, Oct 23, 2024 at 11:42:37AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 10/22/24 21:40, Mark Rutland wrote:
>>> On Tue, Oct 01, 2024 at 10:06:01AM +0530, Anshuman Khandual wrote:
>>>> Fine grained trap control for MDSELR_EL1 register needs to be configured in
>>>> HDFGRTR2_EL2, and HDFGWTR2_EL2 registers when kernel enters at EL1, but EL2
>>>> is also present. This adds a new helper __init_el2_fgt2() initializing this
>>>> new FEAT_FGT2 based fine grained registers.
>>>>
>>>> MDCR_EL2.EBWE needs to be enabled for additional (beyond 16) breakpoint and
>>>> watchpoint exceptions when kernel enters at EL1, but EL2 is also present.
>>>> This updates __init_el2_debug() as required for FEAT_Debugv8p9.
>>>>
>>>> While here, also update booting.rst with MDCR_EL3 and SCR_EL3 requirements.
>>>
>>> [...]
>>>
>>>> +  For CPUs with FEAT_Debugv8p9 extension present:
>>>> +
>>>> +  - If the kernel is entered at EL1 and EL2 is present:
>>>> +
>>>> +    - HDFGRTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
>>>> +    - HDFGWTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
>>>> +    - MDCR_EL2.EBWE (bit 43) must be initialized to 0b1
>>>> +
>>>> +  - If EL3 is present:
>>>> +
>>>> +    - MDCR_EL3.TDA (bit 9) must be initialized to 0b0
>>>
>>> AFAICT we need TDA==0 this regardless of FEAT_Debugv8p9 (and e.g. we need
>>
>> That's because MDCR_EL3.TDA=0, enables access to many other debug registers
>> beside FEAT_Debugv8p9, which are currently used and hence this MDCR_EL3.TDA
>> =0 requirement is a not a new one but rather a missing one instead ?
> 
> Yes, that's why I said we need it regardless; it's an existing
> requirement that wasn't documented.

Alright, got it.

> 
>>
>>> MDCR_EL3.TPM==0 where FEAT_PMUv3 is implemented), so we should probably
>>> check if there's anything else we haven't yet documented in MDCR_EL3.
>>
>> Will scan through MDCR_EL3 register and match it with existing documentation
>> i.e Documentation/arch/arm64/booting.rst. If there are some missing MDCR_EL3
>> fields which should be mentioned, will add them via a separate pre-requisite
>> patch ?
> 
> Yes please.
> 
> Mark.

Sure, will separate those changes in a pre-requisite patch as suggested.

