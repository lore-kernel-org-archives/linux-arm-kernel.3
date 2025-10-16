Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60D7CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUQPjV/oPAQbRWOOL+PRntoV3gIgR8sOEGhAtWExBSI=; b=JYBa2WONQjz+tPFnl2zaWdnHzE
	WbtEZavMK4fojhR23FBQfhXl6dWG3Uyv3yRTVQaUSLaaAcc9e5E6T4xXYo5dpDI1zJ88jZzpPyRbl
	zZAltSrtP+uElR1aAMx8hAdVQcaKiRuiw92mkvYTKr4z4YEGeP6tnvzHsZ+f3yH6tIkfBk3hEtLu6
	H8Rz4IFg633LFMd9anQzhI7VFh6vDQaIY4P8Bz/kbndMRxrR4S0XsgjtEJmZid3pGKhkxS1QCQIqk
	dU6eYUVOcdBNS1KYSXDpAHvN3rTe8LPOmRfyH8sxsgXkLKyM9vDyGeEMJNNbRObzT2xPMbgi2m7IN
	lVhxSO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rbl-00000005Xzx-0C64;
	Thu, 16 Oct 2025 17:17:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rbi-00000005XzC-1biO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:17:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 798601713;
	Thu, 16 Oct 2025 10:17:31 -0700 (PDT)
Received: from [10.57.35.229] (unknown [10.57.35.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 038B53F66E;
	Thu, 16 Oct 2025 10:17:37 -0700 (PDT)
Message-ID: <73a1d5d0-8077-450c-a38f-c1b027088258@arm.com>
Date: Thu, 16 Oct 2025 18:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org, joro@8bytes.org, praan@google.com
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com> <aO9vI1aEhnyZx1PL@google.com>
 <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
 <20251015151002.GH3938986@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251015151002.GH3938986@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_101742_546234_9CB1FE3C 
X-CRM114-Status: GOOD (  22.11  )
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

On 2025-10-15 4:10 pm, Jason Gunthorpe wrote:
> On Wed, Oct 15, 2025 at 02:51:15PM +0100, Robin Murphy wrote:
>> On 2025-10-15 10:53 am, Mostafa Saleh wrote:
>>>> Conversely, this is infrastructure, not an actual test of expected
>>>> io-pgtable behaviour, so I think just:
>>>>
>>>> 	cfg.iommu_dev = kunit_device_register(test, "io-pgtable-test");
>>>> 	if (IS_ERR(cfg.iommu_dev))
>>>> 		return;
>>>>
>>>> (it doesn't return NULLs either)
>>>>
>>>
>>> Yes, I was not sure about this one, when checking the code base, every test
>>> handles kunit_device_register() failure differently, this seemed the
>>> most strict one so I used it, I will update that in the next version.
>>
>> Yeah, my impression is that those have likely been copied from the
>> lib/kunit/ code where it is actually testing its own API. I've now sent a
>> patch for the example in the docs...
> 
> I think any failure to run the test should be reported, either with an
> err or a skip. Tests that didn't do anything and silently report
> success are not a good design.

Sure, a test that hasn't completed hasn't succeeded, but it hasn't 
failed either, in the sense of there being no fault found in the actual 
code being tested. Hence it seems intuitive to me that reporting a 
failure in the test infrastructure itself as if it were incorrect 
behaviour of the target code is not right.

In this case AFAICS kunit_device_register() can only fail due to OOM or 
something unexpectedly messed up in the kobject/sysfs hierarchy, all of 
which should already scream (and represent the system being sufficiently 
hosed that any actual test results probably no longer matter anyway) - 
otherwise I would have suggested a kunit_err() message too.

> Looking at the existing users I see alot are in init functions, so
> they propogate an error code and fail the init.

Indeed I think this one ultimately wants to end up in an init function 
too once everything is unpicked, but for now...
> And the rest inside tests do something like this:
> 
> 	dev = kunit_device_register(test, dev_name);			
> 	KUNIT_ASSERT_FALSE_MSG(test, IS_ERR(dev);
> 			       "Cannot register test device\n");

The confusion is that most of those KUNIT_ASSERTs are where the KUnit 
API *is* the thing under test, or have clearly copy-pasted the same 
example soon after, and some are in init functions which could fail 
gracefully, so it's far from clear how much considered intent they 
actually represent. In fact AFAICS it's only the two cases of that exact 
pattern in overflow and fortify that hint at being an older notion.

However, on further inspection, I see that there also about as many of 
examples of kunit_skip() being used when failing to allocate per-test 
resources, so I guess that's the pattern I was after, hurrah! I wouldn't 
consider the difference between "test skipped because it unexpectedly 
couldn't run" and "test skipped because it knowingly wouldn't have been 
meaningful or possible to run" significant enough to be worth trying to 
split further.

Thanks,
Robin.

