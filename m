Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C8CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3JpThmv5vkF6doqHrSMFUoaUzl1eT23Tx7jhVR8PJs=; b=wiZKa4dFGV71CikQ8nIg+/fQ/C
	1YZ9Vz95UhrM6j+GIZe5ZTLTBTAVF3UciR7usAgYDSxOnpzTUGDFrGIFJtoizbk0dcE4jALV7T1UA
	32mgldwKrRpZ4yHxgQOF+qbYdJaKPIP4K973IqTZLxs5/xopzOmyGygBnjjUUyNbdG16fGpQmKCRQ
	kpjTWTdMSMfyu3oUvKFP36FcJNfozm8dYOSucTAe3qNC9jhV+ayEAJ9Qp1f4CdYbskor/GuZMvIFk
	/S+Kb4e9NsXVReV78LNO+jxpxzaU0QQzk7OecBB3ivBDeFTKdGqpZiXYASq+FUxLOcdYObEncqhNS
	G+rYokLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91ud-00000001lYS-3LlV;
	Wed, 15 Oct 2025 13:51:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91ub-00000001lY3-3chR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:51:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CCE2106F;
	Wed, 15 Oct 2025 06:51:19 -0700 (PDT)
Received: from [10.57.36.191] (unknown [10.57.36.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C10573F6A8;
	Wed, 15 Oct 2025 06:51:25 -0700 (PDT)
Message-ID: <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
Date: Wed, 15 Oct 2025 14:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, joro@8bytes.org,
 jgg@ziepe.ca, praan@google.com, Jason Gunthorpe <jgg@nvidia.com>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com> <aO9vI1aEhnyZx1PL@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aO9vI1aEhnyZx1PL@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_065129_963601_6C3C9B02 
X-CRM114-Status: GOOD (  16.66  )
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

On 2025-10-15 10:53 am, Mostafa Saleh wrote:
[...]
>>> +		KUNIT_FAIL(test, "");						\
>>> +		kunit_err(test, "selftest: test failed for fmt idx %d\n", (i));	\
>>
>> This looks suspect - AFAICS open-coded kunit_err() is intended for test
>> infrastucture errors (like the allocation in the next hunk below), while for
>> an actual test report message it seems it should just be:
>>
>> 	KUNIT_FAIL(test, "selftest: test failed for fmt idx %d\n", (i));
> 
> I see, I used kunit_err, as KUNIT_FAIL adds extra information which was
> noisy to be printed more than once as:
>    # arm_lpae_do_selftests: EXPECTATION FAILED at drivers/iommu/io-pgtable-arm-selftests.c:91
> I will check if there is a better way to do this.

But isn't that exactly what we want? The tests should not fail, but if 
they ever do then inevitably you're going to be asked to debug it from 
nothing more than a dmesg snippet in a forwarded email. Loud and 
detailed is good ;)

If anything we can trim the generic message to just the minimal useful 
information about the format, if KUnit can now provide the rest of the 
attribution for us. Ultimately we should aim to log all the test 
conditions together in one place (and probably only upon a failure, such 
that normal successful runs are quiet), but that can be a job for the 
future follow-up refactoring.

[...]
>>> +	dev = kunit_device_register(test, "io-pgtable-test");
>>> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, dev);
>>
>> Conversely, this is infrastructure, not an actual test of expected
>> io-pgtable behaviour, so I think just:
>>
>> 	cfg.iommu_dev = kunit_device_register(test, "io-pgtable-test");
>> 	if (IS_ERR(cfg.iommu_dev))
>> 		return;
>>
>> (it doesn't return NULLs either)
>>
> 
> Yes, I was not sure about this one, when checking the code base, every test
> handles kunit_device_register() failure differently, this seemed the
> most strict one so I used it, I will update that in the next version.

Yeah, my impression is that those have likely been copied from the 
lib/kunit/ code where it is actually testing its own API. I've now sent 
a patch for the example in the docs...

Cheers,
Robin.

