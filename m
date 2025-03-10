Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8505C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+ofQwuGVRqhE03VmsYlGEcNUurWgNiie1yoZECtaVQ=; b=WoqBiA1tTwrFZOrg12DCGPTUwZ
	cXkV+mUvlfU8VUr3im9oPnL/YnDw20TE7pCiWt8atpByGnG7g2V3utK0YKaasCqb/3zYpIFMXRulX
	LVdXWryLGr0SBhU30QJUU8acAmT5k6+4LN5tMd89S2dxTU0J0HjQLIlWd2cDNHQKdKT/mmqtRrQvI
	LMj0W4UGLKNScl3UxVCPQHK5xkJxsnxLs/GxUgvJnGz1wWO8W79wk0rH4eIy7KgTTk27IMoawnpKZ
	EMsJg9dI6HkXer5Igq1mNlQFSc5dPQAbZuSrRk+K6vM376MZknuVBm6d/m4TApOZ7NBj8Z7NVC/48
	dX3MoRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triCu-00000003fkj-0pnb;
	Mon, 10 Mar 2025 18:50:32 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trh1v-00000003VoA-0Of0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:35:08 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 64E3B2038F33;
	Mon, 10 Mar 2025 10:35:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 64E3B2038F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741628105;
	bh=1+ofQwuGVRqhE03VmsYlGEcNUurWgNiie1yoZECtaVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TKhga+c9cuJgMknPM13jAgQP1DCYNGUPpcl+c1m94c8yVqD62xkfoXvk7bLjOxBY2
	 Jd/ln5jDO+gGUjD6Z3n3nQwi1hJPN7SvGVn7aNlAeIKOpA9Lr5y1NMvcg21OqMdsUE
	 Sb7ps3xymomjl6NcnK+v0qVmLnYE/BpYP3OBs4GY=
Message-ID: <e0dce529-0777-491d-aced-1e9ead31ac17@linux.microsoft.com>
Date: Mon, 10 Mar 2025 10:35:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 03/11] Drivers: hv: Enable VTL mode for
 arm64
To: Arnd Bergmann <arnd@arndb.de>, Michael Kelley <mhklinux@outlook.com>
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com, bhelgaas@google.com, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dexuan Cui <decui@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Joey Gouly <joey.gouly@arm.com>,
 krzk+dt@kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Oliver Upton <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 ssengar@linux.microsoft.com, Sudeep Holla <sudeep.holla@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-4-romank@linux.microsoft.com>
 <e0f81049-688e-4f53-a002-5d246281bf8d@app.fastmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <e0f81049-688e-4f53-a002-5d246281bf8d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_103507_183923_7557D745 
X-CRM114-Status: GOOD (  15.01  )
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



On 3/8/2025 1:05 PM, Arnd Bergmann wrote:
> On Fri, Mar 7, 2025, at 23:02, Roman Kisel wrote:
>> @@ -5,18 +5,20 @@ menu "Microsoft Hyper-V guest support"
>>   config HYPERV
>>   	tristate "Microsoft Hyper-V client drivers"
>>   	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
>> -		|| (ACPI && ARM64 && !CPU_BIG_ENDIAN)
>> +		|| (ARM64 && !CPU_BIG_ENDIAN)
>> +	depends on (ACPI || HYPERV_VTL_MODE)
>>   	select PARAVIRT
>>   	select X86_HV_CALLBACK_VECTOR if X86
>> -	select OF_EARLY_FLATTREE if OF
>>   	help
>>   	  Select this option to run Linux as a Hyper-V client operating
>>   	  system.
>>
>>   config HYPERV_VTL_MODE
>>   	bool "Enable Linux to boot in VTL context"
>> -	depends on X86_64 && HYPERV
>> +	depends on (X86_64 || ARM64)
>>   	depends on SMP
>> +	select OF_EARLY_FLATTREE
>> +	select OF
>>   	default n
>>   	help
> 
> Having the dependency below the top-level Kconfig entry feels a little
> counterintuitive. You could flip that back as it was before by doing
> 
>        select HYPERV_VTL_MODE if !ACPI
>        depends on ACPI || SMP
> 
> in the HYPERV option, leaving the dependency on HYPERV in
> HYPERV_VTL_MODE.
> 

I was implementing Michael's suggestion, and might've gone a bit
overboard, my bad. I'll fix this, thanks a lot for reviewing!

> Is OF_EARLY_FLATTREE actually needed on x86?
> 

No, it is not needed on x86. It is only needed when VTL mode is used.

>        Arnd

-- 
Thank you,
Roman


