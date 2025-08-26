Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D34CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs3lA0xtwHyZRzw7X/rouKWvwTFpddTtyCuNGpxeQfg=; b=0SFfImaWYAWhO0bX97pRgqzSJR
	vtV2citEI1kzV/vZwbPNl7zuKpCo5hlT57RSIsXq/ynVmWgLBRFMXjryAsXyqXqD0mZ46jmiNwMC0
	7Cwpe0+hv0lRM2HfFLbiataFyoXdpcedAQIM6N9xnZJdboRAuo4UuOXDL6NeDKQSS7cMBOhW+aVBe
	0guFs5+A3ONaHofSiJfPysrN2v4wpTNycXBe1rRKz8lv1vPd5mB71fMWQMaCaibC/fpFZ8B+bdipw
	Hg8VzgDML37xpTNU0uoTL60riwrNzH1rIjXFEptbJIYDD7o6fmqZyMNdXaR7Lb5ngn0XNEyernBwb
	6k9bNBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwgb-0000000CfcO-2VdV;
	Tue, 26 Aug 2025 16:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwdt-0000000CfGS-3t4L;
	Tue, 26 Aug 2025 16:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Cs3lA0xtwHyZRzw7X/rouKWvwTFpddTtyCuNGpxeQfg=; b=OZceRtTnXpkXN7MsmlPuJoe2Sv
	+Rd1y+UmaNCfMNS6F6DnEG15mXTIKl38PP6azrJTgsvUJ8Qfkm1NbfJHWBcWSmHwANbvmVVHioKq+
	hUPbwGnIXx5fahRT2KnJ9WAbAtahJHwGze58fEWMVDcbcQ9VIWGeqOxjM47IS05/ZL2Rznom11Q4q
	E/VYNrJiReReu22mXB6rzhGSeVZkA5rLojePOBr5LJmJrrw73it16RSDn4NS2V+1fCzJKGM5x15du
	0cYBZuujm8OpTh/qr96K5hk1EpXJTVJpqk1UYordrgdcaugvo+mTb6PyMy9za8GBzTjym4rDITJrE
	ktn35v2A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwdq-00000002Gk5-2Cim;
	Tue, 26 Aug 2025 16:35:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E4571A25;
	Tue, 26 Aug 2025 09:35:15 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A1B3F694;
	Tue, 26 Aug 2025 09:35:17 -0700 (PDT)
Message-ID: <8d6ac059-fc8f-4a5d-b49e-d02777c01cfb@arm.com>
Date: Tue, 26 Aug 2025 17:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
To: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, will@kernel.org, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
 <20250826130806.GY4067720@noisy.programming.kicks-ass.net>
 <aK22izKE4r6wI_D9@J2N7QTR9R3>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aK22izKE4r6wI_D9@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_173527_023543_BE579732 
X-CRM114-Status: GOOD (  15.68  )
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

On 2025-08-26 2:28 pm, Mark Rutland wrote:
> On Tue, Aug 26, 2025 at 03:08:06PM +0200, Peter Zijlstra wrote:
>> On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
>>> Sampling is inherently a feature for CPU PMUs, given that the thing
>>> to be sampled is a CPU context. These days, we have many more
>>> uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
>>> assume sampling support by default and force the ever-growing majority
>>> of drivers to opt out of it (or erroneously fail to). Instead, let's
>>> introduce a positive opt-in capability that's more obvious and easier to
>>> maintain.
>>
>>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>>> index 4d439c24c901..bf2cfbeabba2 100644
>>> --- a/include/linux/perf_event.h
>>> +++ b/include/linux/perf_event.h
>>> @@ -294,7 +294,7 @@ struct perf_event_pmu_context;
>>>   /**
>>>    * pmu::capabilities flags
>>>    */
>>> -#define PERF_PMU_CAP_NO_INTERRUPT	0x0001
>>> +#define PERF_PMU_CAP_SAMPLING		0x0001
>>>   #define PERF_PMU_CAP_NO_NMI		0x0002
>>>   #define PERF_PMU_CAP_AUX_NO_SG		0x0004
>>>   #define PERF_PMU_CAP_EXTENDED_REGS	0x0008
>>> @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
>>>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
>>>   #define PERF_PMU_CAP_AUX_PAUSE		0x0200
>>>   #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
>>> +#define PERF_PMU_CAP_NO_INTERRUPT	0x0800
>>
>> So NO_INTERRUPT was supposed to be the negative of your new SAMPLING
>> (and I agree with your reasoning).
>>
>> What I'm confused/curious about is why we retain NO_INTERRUPT?
> 
> I see from your other reply that you spotted the next patch does that.
> 
> For the sake of other reviewers or anyone digging through the git
> history it's probably worth adding a line to this commit message to say:
> 
> | A subsequent patch will remove PERF_PMU_CAP_NO_INTERRUPT as this
> | requires some additional cleanup.

Yup, the main reason is the set of drivers getting the new cap is 
smaller than the set of drivers currently not rejecting sampling events, 
so I wanted it to be clearly visible in the patch. Indeed I shall 
clarify the relationship to NO_INTERRUPT in the commit message.

Thanks,
Robin.

