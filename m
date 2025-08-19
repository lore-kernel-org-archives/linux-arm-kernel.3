Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7A0CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 04:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBR4BKb5987y1L2MvTvnVLCtkmMTPv1bLy7V+V4PY8o=; b=1Fec4zGTy2mHJsL71TpG5uxHfO
	6PvQmUJusm87aL70GVbt9fUkzzeHlbHjoH8yIYBAHnSOh35L0onfXe8C5YKt0/s65s5Szyh52FokN
	2hC6LWP0Gv4WpdvXvFDS9DLDY6khu/oNJAxFQzFx1FT9qEPEgceKotzYQDIvHqs3Vmnn1KLLffRKi
	nPzABVVf/1vf6pmfzEsAim3yOQQZ0AK03ra3BiZMeH0LpFCG+y9IB8ODW00zsDKUBAuZSXmk7xpp7
	dx6AjfHq9gmsxIIg98fnR40O7sgyScJnj4CAtRtsniIr8fWbTsDd3J9mzTzdNRp3T4eO8MIE8rPHC
	wkcGtcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDlJ-00000009MUi-1bBj;
	Tue, 19 Aug 2025 04:15:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDJC-00000009It0-0Keh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 03:46:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2266152B;
	Mon, 18 Aug 2025 20:46:40 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC97F3F58B;
	Mon, 18 Aug 2025 20:46:45 -0700 (PDT)
Message-ID: <ce4528c1-2b78-47a3-95c7-e4e3248755e4@arm.com>
Date: Tue, 19 Aug 2025 09:16:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64/sysreg: Add TCR_EL2 register
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250818045759.672408-1-anshuman.khandual@arm.com>
 <20250818045759.672408-4-anshuman.khandual@arm.com>
 <aKLvm2_bNtxcs8Dz@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aKLvm2_bNtxcs8Dz@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_204650_158670_07ED1D91 
X-CRM114-Status: GOOD (  10.72  )
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



On 18/08/25 2:47 PM, Mark Rutland wrote:
> On Mon, Aug 18, 2025 at 10:27:58AM +0530, Anshuman Khandual wrote:
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index 4bdae8bb11dc..d2b40105eb41 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -4812,6 +4812,50 @@ Sysreg	TCR_EL12        3	5	2	0	2
>>  Mapping	TCR_EL1
>>  EndSysreg
>>  
>> +Sysreg	TCR_EL2        3	4	2	0	2
>> +Res0	63:34
>> +Field	33	MTX
>> +Field	32	DS
>> +Res1	31
>> +Field	30	TCMA
>> +Field	29	TBID
>> +Field	28	HWU62
>> +Field	27	HWU61
>> +Field	26	HWU60
>> +Field	25	HWU59
>> +Field	24	HPD
>> +Res1	23
>> +Field	22	HD
>> +Field	21	HA
>> +Field	20	TBI
>> +Res0	19
>> +Field   18:16	PS
>> +UnsignedEnum	15:14	TG0
>> +	0b00	4K
>> +	0b01	64K
>> +	0b10	16K
>> +EndEnum
> 
> Same comment as for patch 1: this is not ordered, use Enum rather than
> UnsignedEnum. Likewise for the other cases below.


Sure, will change.
> 
> Mark.
> 
>> +UnsignedEnum	13:12	SH0
>> +	0b00	NONE
>> +	0b10	OUTER
>> +	0b11	INNER
>> +EndEnum
>> +UnsignedEnum	11:10	ORGN0
>> +	0b00	NC
>> +	0b01	WBWA
>> +	0b10	WT
>> +	0b11	WBnWA
>> +EndEnum
>> +UnsignedEnum	9:8	IRGN0
>> +	0b00	NC
>> +	0b01	WBWA
>> +	0b10	WT
>> +	0b11	WBnWA
>> +EndEnum
>> +Res0    7:6
>> +Field   5:0	T0SZ
>> +EndSysreg
>> +
>>  Sysreg	TCRALIAS_EL1    3	0	2	7	6
>>  Mapping	TCR_EL1
>>  EndSysreg
>> -- 
>> 2.25.1
>>
>>


