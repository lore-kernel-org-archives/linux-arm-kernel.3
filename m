Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CAFCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 04:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwnnKKdXjj8b7uQoWjJpYT1O1YhdnyjTW0dY/NLAGVA=; b=kXeVRlhISZSZgnvhoxk6Ip7/jD
	Fdeyfd7ko1S4bOLeN+OXq9syYv/E3iieOyLi3Dc6bRUjP6fSH4KHdb71M55zYFBzvlX2SXGpHeFXz
	Nlq77qDSW7VSPFWqo+8PWv5/r/wQG71R5NJ42mkOd09cI1NlBbcXIYNPmqxIwPoig32Sxdl7En3gW
	6UMYZzr6wQBR308vd7cWxXYu4lF2cHlfGpdCgouZJOj/Zj/AJoOzA6pyoPq/hGbYGk3TQ2sV+n7lq
	pJOkMX1v2cH3lixG8tda7dOVyla+N1ZMz+yvc9ohmriDlrPxfHUVI1PbwZ6f2pfPShqI6Y0vG0rHw
	zqVxa52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDwM-00000009NGe-0C8Y;
	Tue, 19 Aug 2025 04:27:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDtk-00000009N6L-2CcO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 04:24:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65603152B;
	Mon, 18 Aug 2025 21:24:27 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF223F63F;
	Mon, 18 Aug 2025 21:24:32 -0700 (PDT)
Message-ID: <bf78530c-e3e7-42b1-be7c-409d6427afda@arm.com>
Date: Tue, 19 Aug 2025 09:54:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64/sysreg: Add VTCR_EL2 register
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250818045759.672408-1-anshuman.khandual@arm.com>
 <20250818045759.672408-5-anshuman.khandual@arm.com>
 <aKLw1jvwOo4wG64n@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aKLw1jvwOo4wG64n@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_212436_611078_A5B88774 
X-CRM114-Status: GOOD (  13.92  )
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



On 18/08/25 2:52 PM, Mark Rutland wrote:
> On Mon, Aug 18, 2025 at 10:27:59AM +0530, Anshuman Khandual wrote:
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index d2b40105eb41..f5a0a304f844 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -4910,6 +4910,63 @@ Field	1	PIE
>>  Field	0	PnCH
>>  EndSysreg
>>  
>> +Sysreg	VTCR_EL2	3	4	2	1	2
>> +Res0	63:46
>> +Field	45	HDBSS
>> +Field	44	HAFT
>> +Res0	43:42
>> +Field	41	TL0
>> +Field	40	GCSH
>> +Res0	39
>> +Field	38	D128
>> +Field	37	S2POE
>> +Field	36	S2PIE
>> +Field	35	TL1
>> +Field	34	AssuredOnly
>> +Field	33	SL2
>> +Field	32	DS
>> +Res1	31
>> +Field	30	NSA
>> +Field	29	NSW
>> +Field	28	HWU62
>> +Field	27	HWU61
>> +Field	26	HWU60
>> +Field	25	HWU59
>> +Res0	24:23
>> +Field	22	HD
>> +Field	21	HA
>> +Res0	20
>> +UnsignedEnum	19	VS
>> +	0b0	8BIT
>> +	0b1	16BIT
>> +EndEnum
> 
> You left TCR_EL1.AS as a single-bit 'Field', so please do the same here
> for consistency. I don't think there's much gained by making this any
> sort of enum.

But actually there is an use case in kvm_get_vtcr().

        /* Set the vmid bits */
        vtcr |= (get_vmid_bits(mmfr1) == 16) ?
                SYS_FIELD_PREP_ENUM(VTCR_EL2, VS, 16BIT) :
                SYS_FIELD_PREP_ENUM(VTCR_EL2, VS, 8BIT);

> 
>> +Field	18:16	PS
>> +UnsignedEnum	15:14	TG0
>> +		0b00	4K
>> +		0b01	64K
>> +		0b10	16K
>> +EndEnum
> 
> As with other patches, this is not ordered. Please use Enum.
> 
> Likewise for the other cases below.


Sure, will do the changes.
> 
> Mark.
> 
>> +UnsignedEnum	13:12	SH0
>> +		0b00	NONE
>> +		0b10	OUTER
>> +		0b11	INNER
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
>> +Field	7:6	SL0
>> +Field	5:0	T0SZ
>> +EndSysreg
>> +
>>  SysregFields MAIR2_ELx
>>  Field	63:56	Attr7
>>  Field	55:48	Attr6
>> -- 
>> 2.25.1
>>
>>


