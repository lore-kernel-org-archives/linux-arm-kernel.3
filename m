Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD68AC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=II1vrpQzsG0S7v84UkTk/WaSdbLh4EFCo68wrGNewR8=; b=Qy7vDu+v8AuesybLUoo/0rsKPw
	nwOGJ/bqNufUb4rNiKROGCFcNgzo0hlelnqQrowXjQePVgv0LJ2/3H+ChglSEC+cpKslFD2vWKaPj
	Ge8A8up9Lp0BfWUzekUAnOoe7dC2KLqhg5xwzuWe+5WQ4XxnVcqgjg58CaxVYclAUdeubqmCD6H4e
	KiNSTWd943KaSrbw0nFgFFDyHpWuwjFD297Xy4fW8LUqnqD8k0Nh1XRSR+7WnVDjz58bXNoa1+7Xs
	Rzw7l6TXpzvPPNGB3OpPnmKMyMa5djfYQm29NsUZCDc3M5A5dDsIM9qR8gqFVlj3PcLc0xQJHohov
	wxdZBkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnft-0000000CEa8-3kZK;
	Thu, 13 Mar 2025 18:52:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn7E-0000000CAm2-3WBU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:17:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A9A61477;
	Thu, 13 Mar 2025 11:17:18 -0700 (PDT)
Received: from [10.57.85.159] (unknown [10.57.85.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17BE53F694;
	Thu, 13 Mar 2025 11:17:03 -0700 (PDT)
Message-ID: <83c04cc2-a170-4d4d-82e3-23aec9749352@arm.com>
Date: Thu, 13 Mar 2025 18:17:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>
Cc: suzuki.poulose@arm.com, corbet@lwn.net, catalin.marinas@arm.com,
 will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
 joro@8bytes.org, akpm@linux-foundation.org, mark.rutland@arm.com,
 joey.gouly@arm.com, maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
 anshuman.khandual@arm.com, oliver.upton@linux.dev, ioworker0@gmail.com,
 baohua@kernel.org, david@redhat.com, jgg@ziepe.ca,
 shameerali.kolothum.thodi@huawei.com, nicolinc@nvidia.com,
 mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-3-miko.lenczewski@arm.com>
 <0abe8643-d4ea-4e77-bd77-afe07399eec9@os.amperecomputing.com>
 <20250313181319.GB40525@mazurka.cambridge.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250313181319.GB40525@mazurka.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_111708_919727_2D9063F4 
X-CRM114-Status: GOOD (  15.57  )
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

On 13/03/2025 18:13, Mikołaj Lenczewski wrote:
> On Thu, Mar 13, 2025 at 10:21:51AM -0700, Yang Shi wrote:
>> On 3/13/25 3:41 AM, Mikołaj Lenczewski wrote:
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index fb8752b42ec8..3e4cc917a07e 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -453,6 +453,9 @@
>>>   	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
>>>   			32 bit applications.
>>>   
>>> +	arm64.nobbml2	[ARM64] Unconditionally disable Break-Before-Make Level
>>> +			2 support
>>
>> Hi Miko,
>>
>> A question about the kernel boot parameter. Can this parameter be used 
>> in early boot stage? A quick look at the code shows it should be ok, for 
>> example, cpu_has_bti() is called in map_kernel(). But I'd like to double 
>> check because my patchset needs to check this parameter in map_mem() to 
>> determine whether large block mapping can be used or not.
>>
>> And a nit below.
> 
> I will need to double check exactly when the arm64 software overrides
> are finalised, but as long as those values are finalised in / before (?)
> the early boot stage then it should be fine? Will reply again once I
> check and have an answer.

This will work fine. The override is setup in the PI code before start_kernel().

>    
>>> +static inline bool bbml2_possible(void)
>>> +{
>>> +	return !arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOBBML2);
>>> +}
>>
>> Can this be moved to cpufeature.h? My patch will use this, anyway I can 
>> do it in my patchset.

I'd prefer to do the moving as part of the series that needs it moved.

Thanks,
Ryan

>>
>> Thanks,
>> Yang
> 
> I can do so. In fact, on second thought, I will probably extend this to
> also include the `IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT)` check as well,
> and then move it to cpufeature.h, instead of folding said check into
> has_bbml2_noabort().
> 


