Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB07BD3F081
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9i0mEQcS22TG9VBmaMNuvwjT6oinkARoZXlLZmzM44=; b=0ApMqXfaCjReWOz8eeLzL826l+
	BtTwpc+NPtgMq0WFJOdWghV+ZbkHyUta2Whw4bfTXniJqyvex1kenFMG2MeChu6jGSRIAXlUeKgSi
	STBmi4I/IfTwy5j7zvyxfj6m9RkXuUzPKiMXRBGxNR6JCtjS91b9zY/8I9Lj58vzWCsii3uOuaWrq
	U7nclHgw5zRPdse/zyZwg4jE59QDj3DuJc4/3q1K44fJat/dU27ngXb+PfChPpCCUuhjn7MT712SW
	GuJC4rUSLDBPJcxrvwVic9rmcjNlXtUL22Up0yMKJAkXzS+iVs/LNAe7oOaM4gSW/CrIaySX3UvHR
	JTtzKgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7tB-0000000GK1Q-0v5M;
	Wed, 28 Jan 2026 15:55:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7t7-0000000GK12-0ACo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAC631516;
	Wed, 28 Jan 2026 07:55:16 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 764573F5CA;
	Wed, 28 Jan 2026 07:55:18 -0800 (PST)
Message-ID: <9dbb9767-f616-4f62-996a-08ee8d580521@arm.com>
Date: Wed, 28 Jan 2026 15:55:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cpufeature: Add support for the MPAM v0.1
 architecture version
From: Ben Horgan <ben.horgan@arm.com>
To: Zeng Heng <zengheng4@huawei.com>, james.morse@arm.com,
 miko.lenczewski@arm.com, thuth@redhat.com, mark.rutland@arm.com,
 yeoreum.yun@arm.com, robh@kernel.org, james.clark@linaro.org,
 ahmed.genidi@arm.com, xry111@xry111.site, oupton@kernel.org,
 lpieralisi@kernel.org, catalin.marinas@arm.com, mrigendra.chaubey@gmail.com,
 suzuki.poulose@arm.com, maz@kernel.org, ardb@kernel.org, broonie@kernel.org,
 will@kernel.org, kevin.brodsky@arm.com, leo.yan@arm.com,
 anshuman.khandual@arm.com, yang@os.amperecomputing.com, frederic@kernel.org,
 guohanjun@huawei.com, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 leijitang@huawei.com, "Zengtao (B)" <prime.zeng@hisilicon.com>
References: <20260104133434.1887677-1-zengheng4@huawei.com>
 <37f87d5d-bd70-4b13-93e0-8024108be948@arm.com>
 <0944256a-bcc6-56fa-e3f9-eb3a83c45505@huawei.com>
 <9006b698-6fb6-4dc0-a7c6-de3fb27fb073@arm.com>
Content-Language: en-US
In-Reply-To: <9006b698-6fb6-4dc0-a7c6-de3fb27fb073@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_075525_995610_99F6963B 
X-CRM114-Status: GOOD (  18.05  )
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

Hi Zeng,

On 1/28/26 14:37, Ben Horgan wrote:
> Hi Zeng,
> 
> On 1/28/26 08:54, Zeng Heng wrote:
>>
>>
>> On 2026/1/27 22:30, Ben Horgan wrote:
>>> Hi Zeng,
>>>
>>> On 1/4/26 13:34, Zeng Heng wrote:
>>>> According to the MPAM spec [1], the supported architecture versions are
>>>> v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
>>>> identical, but v0.1 additionally supports the FORCE_NS feature.
>>>>
>>>> ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
>>>> F0_EL1.   | F1_EL1.   | Architecture   |
>>>> MPAM      | MPAM_frac | version        |
>>>> ---------------------------------------------------------------------------
>>>> 0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
>>>>            |           |                | MPAM v0.1 is the same as
>>>> MPAM v1.1
>>>>            |           |                | with FORCE_NS which is
>>>>            |           |                | incompatible with MPAM v1.0.
>>>> ---------------------------------------------------------------------------
>>>> 0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
>>>> ---------------------------------------------------------------------------
>>>> 0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
>>>>            |           |                | MPAM v1.1 includes all
>>>> features of
>>>>            |           |                | MPAM v1.0.
>>>>            |           |                | It must not include FORCE_NS.
>>>>
>>>> FORCE_NS is a feature that operates in EL3 mode. Consequently, the
>>>> current
>>>> Linux MPAM driver is also compatible with MPAM v0.1. To support v0.1,
>>>> the
>>>> existing driver which only checks ID_AA64PFR0_EL1.MPAM for the major
>>>> version needs to examine ID_AA64PFR1_EL1.MPAM_frac for the minor version
>>>> as well.
>>>>
>>>> [1] https://developer.arm.com/documentation/ddi0598/db/?lang=en
>>>>
>>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>> So far we've avoided added MPAM 0.1 support as we don't know of any
>>> machines using it. What's your motivation here? Do you have a machine
>>> with MPAM 0.1 that runs mainline linux?
>>>
>>
>> Thank you for your questions and for reviewing this proposal.
>>
>> Regarding your inquiry about hardware usage and motivation:
>>
>> Our KunPeng 920C chip (and numerous legacy SoCs in the same family)
>> indeed implement MPAM v0.1 extensions. These are widely deployed in
>> server and embedded equipment. More importantly, the product roadmap for
>> these platforms explicitly includes migration to mainline Linux kernels
>> MPAM driver for long-term support, making upstream MPAM v0.1 driver
>> support is a critical requirement.
> 
> Thanks for the explanation. It does seem worthwhile to add mpam 0.1
> support.
> 
>>
>> In the other hand, MPAM v0.1 extension version is formally documented in
>> the ARM MPAM architecture specification (still included in the newest
>> ARM DDI 0598D.b version). The specification explicitly defines v0.1 as a
>> valid implementation for earlier hardware. Supporting documented
>> architectural features is essential for the goal of hardware
>> compatibility.
>>
>> About technical compatibility, the MPAM v0.1 is designed as a
>> functionally compatible extension with the existing MPAM driver
>> framework. After having tested this on actual Kunpeng 920C hardware
>> and other MPAM v1.0 platforms running mainline kernels, this ensures
>> zero regression risk for v1.0/v1.1 users.
>>
> 
> I've tried your patch with a model, FVP_Base_RevC_2xAEMvA, setting mpam
> 0.1, 1.0 and 1.1 and the mpam driver probes as expected. For 0.1 this
> required commenting out the versioning check in mpam_devices.c. It would
> be good if this patch could come together with another updating that check.

Apologies, I confused myself with MSC MPAM version vs CPU MPAM version.
The CPU MPAM version is what's relevant here and the mpam_devices.c
check is just for the MSC. I'll try running this again on the FVP model
and actually change the correct version.

Thanks,

Ben


