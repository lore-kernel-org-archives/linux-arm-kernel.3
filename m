Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F1AC35FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm/z2pMPN/NgDz4bCLKyML4rrFvnI2oi2RmZ23RsqBQ=; b=lnq+dTOesvdaw+wAvcMw0ZNE/H
	1ViYOXsC9I+hBiS3jgUsDqnpK663DNBIbSwPu6vD2/eI5v+NEkXe56yIcxNNXTokLW80v+E26VRAN
	FUksdiSXSkmW8un7W6FuOXyMstTqoqAf9yMeuZvSeEp9oWWujUginE85iuFMcAnRcDpx/ep3EdFFt
	uzl+N3CeSVQgFqwSN8G4ut04gtF1ByKGGGpvKU3fI1HwkPbXkRwJBIPolgSf+7HY0JlkAUg97Ba4r
	0LgBImx2VmYIKvi30xjgvyAKIBSoDy01OUZe8A44ij5EqjGX8DN4XKpivuFH9YUB1qwSA8TW9r4ei
	eZyCDhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnfv-0000000CEb1-0cdn;
	Thu, 13 Mar 2025 18:52:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnC3-0000000CBPc-2nYF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:22:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 332BC1477;
	Thu, 13 Mar 2025 11:22:17 -0700 (PDT)
Received: from [10.57.85.159] (unknown [10.57.85.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10FAC3F694;
	Thu, 13 Mar 2025 11:22:01 -0700 (PDT)
Message-ID: <f244c20e-e11c-477b-9487-cb6738c028ca@arm.com>
Date: Thu, 13 Mar 2025 18:22:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
 robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, joey.gouly@arm.com, james.morse@arm.com,
 broonie@kernel.org, anshuman.khandual@arm.com, oliver.upton@linux.dev,
 ioworker0@gmail.com, baohua@kernel.org, david@redhat.com, jgg@ziepe.ca,
 shameerali.kolothum.thodi@huawei.com, nicolinc@nvidia.com,
 mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-3-miko.lenczewski@arm.com>
 <86ikocomvd.wl-maz@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <86ikocomvd.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_112207_795899_82CFDBDA 
X-CRM114-Status: GOOD (  17.97  )
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

On 13/03/2025 17:34, Marc Zyngier wrote:
> On Thu, 13 Mar 2025 10:41:10 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
>>
>> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
>> index c6b185b885f7..9728faa10390 100644
>> --- a/arch/arm64/kernel/pi/idreg-override.c
>> +++ b/arch/arm64/kernel/pi/idreg-override.c
>> @@ -209,6 +209,7 @@ static const struct ftr_set_desc sw_features __prel64_initconst = {
>>  		FIELD("nokaslr", ARM64_SW_FEATURE_OVERRIDE_NOKASLR, NULL),
>>  		FIELD("hvhe", ARM64_SW_FEATURE_OVERRIDE_HVHE, hvhe_filter),
>>  		FIELD("rodataoff", ARM64_SW_FEATURE_OVERRIDE_RODATA_OFF, NULL),
>> +		FIELD("nobbml2", ARM64_SW_FEATURE_OVERRIDE_NOBBML2, NULL),
>>  		{}
>>  	},
>>  };
>> @@ -246,6 +247,7 @@ static const struct {
>>  	{ "rodata=off",			"arm64_sw.rodataoff=1" },
>>  	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
>>  	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
>> +	{ "arm64.nobbml2",		"arm64_sw.nobbml2=1" },
> 
> Why is that a SW feature? This looks very much like a HW feature to
> me, and you should instead mask out ID_AA64MMFR2_EL1.BBM, and be done
> with it. Something like:

I think this implies that we would expect the BBM field to be advertising BBML2
support normally and we would check for that as part of the cpufeature
detection. That's how Miko was doing it in v2, but Yang pointed out that
AmpereOne, which supports BBML2+NOABORT semantics, doesn't actually advertise
BBML2 in its MMFR2. So we don't want to check that field, and instead rely
solely on the MIDR allow-list + a command line override. It was me that
suggested putting that in the SW feature register, and I think that still sounds
like the right solution for this situation?

Thanks,
Ryan

> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index c6b185b885f70..803a0c99f7b46 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -102,6 +102,7 @@ static const struct ftr_set_desc mmfr2 __prel64_initconst = {
>  	.override	= &id_aa64mmfr2_override,
>  	.fields		= {
>  		FIELD("varange", ID_AA64MMFR2_EL1_VARange_SHIFT, mmfr2_varange_filter),
> +		FIELD("bbm", ID_AA64MMFR2_EL1_BBM_SHIFT, NULL),
>  		{}
>  	},
>  };
> @@ -246,6 +247,7 @@ static const struct {
>  	{ "rodata=off",			"arm64_sw.rodataoff=1" },
>  	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
>  	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
> +	{ "arm64.nobbml2",		"id_aa64mmfr2.bbm=0" },
>  };
>  
>  static int __init parse_hexdigit(const char *p, u64 *v)
> 
> 
> Thanks,
> 
> 	M.
> 


