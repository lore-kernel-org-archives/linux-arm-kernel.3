Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637EDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 02:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvLxv5drfC4Ugh3ixIRT4L/1mQoq1RfdjOPmZWDLjTc=; b=rzaYHpM1LhwMo9z+qQG2AY6DXq
	D4eAT/X/dv7wl0Gt1R0Mbwk5VkBt2UbXlWAPuWs/H+aGTexwssj+pTJdfwmESZaCbFd2HCXB0ISRH
	rMTZMf+09RgQRbZJxf0Dcfruch9tR/j5AbMuNFLiqfsP/bZEcR8Xni1pQ1fWZ3n69sMc1nu5cSJ0S
	hT7pp9czaWOpV7tQ1UyNn4RS2+sX8wgkI7GbacdV/SppqCZkkFN0hNMZD6A7LM0gQTbTRwG+s2xzx
	ujrEmoxkGdA+t9RSTl9PZolc5lxW2gB0gjwDZXnS0YWyys0s5snasCdFzQWS54sOkyDxVZ21XLRoS
	ohTPXwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6bu-00000000emQ-3H3X;
	Thu, 19 Dec 2024 02:49:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6ao-00000000ecF-02BG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 02:48:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC6601480;
	Wed, 18 Dec 2024 18:49:15 -0800 (PST)
Received: from [10.162.16.49] (unknown [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 307223F720;
	Wed, 18 Dec 2024 18:48:43 -0800 (PST)
Message-ID: <8ad1e830-9ac9-4776-a877-c8d37bb03a3c@arm.com>
Date: Thu, 19 Dec 2024 08:18:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 04/46] arm64/sysreg: Update register fields for
 TRBIDR_EL1
To: Eric Auger <eauger@redhat.com>, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-5-anshuman.khandual@arm.com>
 <36aba488-26d7-4dc9-9ca0-a14e3de028e9@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <36aba488-26d7-4dc9-9ca0-a14e3de028e9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_184850_095271_CC9C2BC0 
X-CRM114-Status: GOOD (  10.19  )
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



On 12/18/24 20:10, Eric Auger wrote:
> Hi Anshuman
> 
> On 12/10/24 06:52, Anshuman Khandual wrote:
>> This adds register fields for TRBIDR_EL1 as per the definitions based
>> on DDI0601 2024-09.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/tools/sysreg | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index 59351931d907..10b1a0998d99 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -3295,13 +3295,24 @@ Field	31:0	TRG
>>  EndSysreg
>>  
>>  Sysreg	TRBIDR_EL1	3	0	9	11	7
>> -Res0	63:12
>> +Res0	63:48
>> +Field	47:32	MaxBuffSize
>> +Res0	31:16
>> +UnsignedEnum	15:12	MPAM
>> +	0b0000	NI
>> +	0b0001	PMG
> Out of curiosity how did you choose the PMG terminology?
> I see "MPAM implemented by the Trace Buffer Unit, using default PARTID
> and PMG values in External mode". Wouldn't be TBU more meaningful?

Right, TBU seems better. Unless Mark thinks otherwise, will change.

