Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 03:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5wQboncGK/zebfhyUWbUZZBGDEilhZTyvOXA7Z/fB4=; b=QihoclBGaYtHAj3V+rv+gt7iey
	YMtVJMtOkgSoOgRibwE0VLb2IeljGQJhU3l7XwnEqIAxelLI8esLBYCWfVjq5WPo2D8wiQnLX0shI
	Yafbn0r+dajbgRXgHPJm6wYb4ORgii+oAYPt2uYCgIBvKoEnCxz+PqNp4pHIPlu0ewiWXmSr88kO0
	f2M19nJOfTJpB79cJ0FpaZLzMvFHKk4qNRw0RbUhddwnZEc1EG9vDIkZj5cvx5FuKR12qn/A+rQrP
	2sg6Gv7aoZEGgriGF/2ChychEBOyFOlmjLuqXkA/JlmYWSP5u7BqHGm+1v0qgT9QZKN65+hEFsotq
	1TXpe+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO707-00000000gt4-0sPV;
	Thu, 19 Dec 2024 03:14:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6z0-00000000gnO-0J6Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 03:13:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A19731480;
	Wed, 18 Dec 2024 19:14:16 -0800 (PST)
Received: from [10.162.16.49] (unknown [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CF143F528;
	Wed, 18 Dec 2024 19:13:44 -0800 (PST)
Message-ID: <c707ecfd-6f1f-47d2-93ec-116f5dfd419e@arm.com>
Date: Thu, 19 Dec 2024 08:43:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 15/46] arm64/sysreg: Add register fields for PFAR_EL1
To: Eric Auger <eauger@redhat.com>, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-16-anshuman.khandual@arm.com>
 <5203176c-2646-425b-b375-edb7931ef54f@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <5203176c-2646-425b-b375-edb7931ef54f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_191350_163243_9DE5610C 
X-CRM114-Status: GOOD (  11.54  )
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



On 12/18/24 21:12, Eric Auger wrote:
> Hi Anshuman,
> 
> On 12/10/24 06:52, Anshuman Khandual wrote:
>> This adds register fields for PFAR_EL1 as per the definitions based on
>> DDI0601 2024-09.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/tools/sysreg | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index 18b814ff2c41..e33edb41721a 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -3533,3 +3533,10 @@ Field	5	F
>>  Field	4	P
>>  Field	3:0	Align
>>  EndSysreg
>> +
>> +Sysreg	PFAR_EL1	3	0	6	0	5
>> +Field	63	NS
>> +Field	62	NSE
>> +Res0	61:56
>> +Field	55:0	PA
> Just wondering: part of the PA definition depends on FEAT_D128 or
> FEAT_LPA and the reset field value is UNKNOWN if the feature is not
> available. Shouldn't introduce separate fields directly?
Generated PFAR_EL1_PA_MASK aka GENMASK_ULL(55, 0) should cover all the
cases for PA i.e 48 bits, LPA, D128 etc. Although individual use cases
will have to trim the mask subsequently as required.

Are you suggesting something like the following instead where the user
will have to concatenate these fields selectively to find the required
PA mask ?

Field	55:52	PA_D128
Field	51:48	PA_LPA
Field	47:0	PA

