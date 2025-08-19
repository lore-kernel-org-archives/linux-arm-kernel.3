Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E6CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 03:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TufpTk6w8xSOTzbeKIrl7kQr4Qz9A3RXdfazBTLvPDg=; b=CH3RJgKxKb5Z+HTzaaA2rZz+JG
	H0XsC7/dryWJXxVmBv8Ab8iFbozAdN7jfxll278et8/NFaD+5gnpSMPRyd6a+e1rQYWX383lT01AC
	R3mIk/w9Lzp+TZCazI2mmWK+NWeS0P4WweuZsTYMbQIv4VLjknNKX91udchc80ugMgyMVDNr3VD2k
	zT2ZnWhSdazz6nBkhvAR3FNhs1GgxU3sWjK4S1G+uG8G4TOLP0rTowhnOVo0zV/QijbI6e/hPRJX7
	rElEjR8W06GobXbLIqsmyrrXQeTey3GbtWfSuiC5l4A036aMhSP/qsOHAY+bkDfzqLgqgBa+6Jljl
	mdXwn1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDVQ-00000009Kv4-07Qa;
	Tue, 19 Aug 2025 03:59:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDGD-00000009IYg-1NeC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 03:43:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9790152B;
	Mon, 18 Aug 2025 20:43:35 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C05703F58B;
	Mon, 18 Aug 2025 20:43:40 -0700 (PDT)
Message-ID: <cdc7bf7f-3237-43b7-ab9c-473fc65f0cad@arm.com>
Date: Tue, 19 Aug 2025 09:13:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64/sysreg: Update TCR_EL1 register
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250818045759.672408-1-anshuman.khandual@arm.com>
 <20250818045759.672408-2-anshuman.khandual@arm.com>
 <aKLuQmfSi1Qg2och@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aKLuQmfSi1Qg2och@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_204345_447689_1535535D 
X-CRM114-Status: GOOD (  13.71  )
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



On 18/08/25 2:41 PM, Mark Rutland wrote:
> On Mon, Aug 18, 2025 at 10:27:56AM +0530, Anshuman Khandual wrote:
>> Update TCR_EL1 register fields as per latest ARM ARM DDI 0487 7.B and while
>> here drop an explicit sysreg definition SYS_TCR_EL1 from sysreg.h, which is
>> now redundant.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/sysreg.h |  2 --
>>  arch/arm64/tools/sysreg         | 52 ++++++++++++++++++++++++++++-----
>>  2 files changed, 44 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
>> index d5b5f2ae1afa..ad5c901af229 100644
>> --- a/arch/arm64/include/asm/sysreg.h
>> +++ b/arch/arm64/include/asm/sysreg.h
>> @@ -281,8 +281,6 @@
>>  #define SYS_RGSR_EL1			sys_reg(3, 0, 1, 0, 5)
>>  #define SYS_GCR_EL1			sys_reg(3, 0, 1, 0, 6)
>>  
>> -#define SYS_TCR_EL1			sys_reg(3, 0, 2, 0, 2)
>> -
>>  #define SYS_APIAKEYLO_EL1		sys_reg(3, 0, 2, 1, 0)
>>  #define SYS_APIAKEYHI_EL1		sys_reg(3, 0, 2, 1, 1)
>>  #define SYS_APIBKEYLO_EL1		sys_reg(3, 0, 2, 1, 2)
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index 696ab1f32a67..4bdae8bb11dc 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -4756,17 +4756,53 @@ Field   37      TBI0
>>  Field   36      AS
>>  Res0    35
>>  Field   34:32   IPS
>> -Field   31:30   TG1
>> -Field   29:28   SH1
>> -Field   27:26   ORGN1
>> -Field   25:24   IRGN1
>> +UnsignedEnum   31:30   TG1
>> +	0b01	16K
>> +	0b10	4K
>> +	0b11	64K
>> +EndEnum
> 
> This is clearly not an ordered set.
> 
> This should just use Enum, not UnsignedEnum.
> 
> Likewise for all the other cases below.

Sure, will change.
> 
> Mark.
> 
>> +UnsignedEnum   29:28   SH1
>> +	0b00	NONE
>> +	0b10	OUTER
>> +	0b11	INNER
>> +EndEnum
>> +UnsignedEnum   27:26  ORGN1
>> +	0b00	NC
>> +	0b01	WBWA
>> +	0b10	WT
>> +	0b11	WBnWA
>> +EndEnum
>> +UnsignedEnum   25:24   IRGN1
>> +	0b00	NC
>> +	0b01	WBWA
>> +	0b10	WT
>> +	0b11	WBnWA
>> +EndEnum
>>  Field   23      EPD1
>>  Field   22      A1
>>  Field   21:16   T1SZ
>> -Field   15:14   TG0
>> -Field   13:12   SH0
>> -Field   11:10   ORGN0
>> -Field   9:8     IRGN0
>> +UnsignedEnum   15:14   TG0
>> +	0b00	4K
>> +	0b01	64K
>> +	0b10	16K
>> +EndEnum
>> +UnsignedEnum   13:12   SH0
>> +	0b00	NONE
>> +	0b10	OUTER
>> +	0b11	INNER
>> +EndEnum
>> +UnsignedEnum   11:10  ORGN0
>> +	0b00	NC
>> +	0b01	WBWA
>> +	0b10	WT
>> +	0b11	WBnWA
>> +EndEnum
>> +UnsignedEnum   9:8   IRGN0
>> +	0b00	NC
>> +	0b01	WBWA
>> +	0b10	WT
>> +	0b11	WBnWA
>> +EndEnum
>>  Field   7       EPD0
>>  Res0    6
>>  Field   5:0     T0SZ
>> -- 
>> 2.25.1
>>
>>


