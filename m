Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06E8C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+oeCLF9y8zq18/FbTwjOpOdSnMcYhWJYE6gBd5T6Kk=; b=obdyxQI7MTYbrizmSZ5NE7P+zE
	9mAZtRX16XbWM8tAa+YWrxltmOvPuS3FkfTeMf5UyMS7zColG/R9J+WVb2exovFPqKKUYloNxN3qh
	tVZKKkO1RWjsYn0mP/drdxbqZIV1qVDP92oKIUXwGphA0YrxbIJuhQ7RAopqEFMXXS2V73StMzt14
	UtdK0+l481zWwMumO1qqXqIAG3EyBliP2CVHxRkBsy7G3c+EpkfH3Mw5rWQQ6HZrfFhPf0Amx7K5P
	m+dnPw46bVpkYqc7OCb5B//19VQON3Z6Y3IvUFFxT3z13+/w9bLrBKBerQtyt7zy79nAxzbKks5OT
	xprsRL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1LT-0000000Dfsm-38We;
	Fri, 14 Mar 2025 09:28:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1Jm-0000000DfTn-2ArR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:27:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 549631424;
	Fri, 14 Mar 2025 02:27:11 -0700 (PDT)
Received: from [10.57.85.159] (unknown [10.57.85.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73EA03F673;
	Fri, 14 Mar 2025 02:26:57 -0700 (PDT)
Message-ID: <d3a15aaf-16a6-4a88-a6c5-9b9afaa5f370@arm.com>
Date: Fri, 14 Mar 2025 09:26:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
 robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
 james.morse@arm.com, broonie@kernel.org, anshuman.khandual@arm.com,
 oliver.upton@linux.dev, ioworker0@gmail.com, baohua@kernel.org,
 david@redhat.com, jgg@ziepe.ca, shameerali.kolothum.thodi@huawei.com,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-3-miko.lenczewski@arm.com>
 <ea10caee-59ef-4a00-9b61-37cb0a379411@arm.com>
 <20250313180833.GA40525@mazurka.cambridge.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250313180833.GA40525@mazurka.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_022702_647160_3445D77C 
X-CRM114-Status: GOOD (  20.91  )
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

On 13/03/2025 18:08, Mikołaj Lenczewski wrote:
> On Thu, Mar 13, 2025 at 04:13:22PM +0000, Ryan Roberts wrote:
>> On 13/03/2025 10:41, Mikołaj Lenczewski wrote: 
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index d561cf3b8ac7..b936e0805161 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -2176,6 +2176,76 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>>  	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>>  }
>>>  
>>> +static inline bool bbml2_possible(void)
>>> +{
>>> +	return !arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOBBML2);
>>
>> If you're going to keep this helper, I think it really needs to be:
>>
>> return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT) &&
>>        !arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOBBML2);
>>
>> Then you would simplify the caller to remove it's own
>> IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT) check.
>>
>> But personally I would remove the helper and just fold the test into
>> has_bbml2_noabort().
>>
>> Thanks,
>> Ryan
> 
> I was debating folding it into has_bbml2_noabort(), but went ahead and
> implemented it separately to match hvhe_possible(), which was another sw
> feature helper.

hvhe_possible() is a .matches function, so there is nothing to fold it into.

> 
> But I agree, folding it will be simpler and read just as easily (if not
> easier). Will do so.
> 
>>> +}
>>> +
>>> +static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
>>> +{
>>> +	/* We want to allow usage of bbml2 in as wide a range of kernel contexts
>>> +	 * as possible. This list is therefore an allow-list of known-good
>>> +	 * implementations that both support bbml2 and additionally, fulfill the
>>> +	 * extra constraint of never generating TLB conflict aborts when using
>>> +	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
>>> +	 * kernel contexts difficult to prove safe against recursive aborts).
>>> +	 *
>>> +	 * Note that implementations can only be considered "known-good" if their
>>> +	 * implementors attest to the fact that the implementation never raises
>>> +	 * TLBI conflict aborts for bbml2 mapping granularity changes.
>>> +	 */
>>> +	static const struct midr_range supports_bbml2_noabort_list[] = {
>>> +		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>>> +		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
>>> +		{}
>>> +	};
>>> +
>>> +	return is_midr_in_range_list(cpu_midr, supports_bbml2_noabort_list);
>>> +}
>>> +
>>> +static inline unsigned int __cpu_read_midr(int cpu)
>>
>> nit: why the double underscrore prefix?
> 
> Again copying other helpers I saw that seemed to do similar things.
> Didn't know if this was the expected style, so did as other helpers did.
> Will remove.

Often those double underscores are used when you have a public function wrapping
into a private function, like this:

static void __do_a_thing(bool modify_behaviour_in_some_way);

void do_a_thing(void)
{
	__do_a_thing(false);
}

I'm sure the coding style offers a better explanation.

Thanks,
Ryan

> 
> Thank you for the review.
> 


