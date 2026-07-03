Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 04:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iImkYAQys03jyls+4zquO8ErFi2DvHQeHMlTw+fewTk=; b=L/yDcy3kxZIg2qmYpzjtuDeiTs
	wE147GmBtC0p2PxQtMm7pGvq1dkC74s4+XNuAM199iVrL+7HcZXCGqSyI7oYRXw5XPaGQFs/CwAG8
	wiRFdk7t5+NoRRiMCfkoEJS3Td4SLk3fKK0NpQzqEa5pVId0hb5eZyxzjkPs+966U1b1SCpv/an8f
	f3irgzZUilPeZlYDLPJdOeAX4SUaLUm9jKMlTWaR84Xcvrb9czh03SBacItO7fyO7PILm982vFRQS
	uEPNzlmBs0tIQ4pSjfm/eiqeut2sEB0qbfqnOXuUqRHJRajCJk1227uMeUtUZZPcOa8C51eGBr9RG
	lor6D/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVja-000000061f0-1xy0;
	Fri, 03 Jul 2026 04:42:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVjX-000000061ef-3NYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 04:42:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E719822D7;
	Thu,  2 Jul 2026 21:42:28 -0700 (PDT)
Received: from [10.163.170.216] (unknown [10.163.170.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D41F93F905;
	Thu,  2 Jul 2026 21:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783053753; bh=bpC4wmpVc1FwcEVKb6RSPdMEZIiFxBvqCXgKU0+5NQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VNhTqcmTkxr+gN1QFVp5aEJvLy7IMDZNrJ/foFduClQ6LfmhWYvSjx4EUOT9rqoSy
	 8ebXSbeVcj92yZVxKwg2njw/r/wxAN9UfhzV7kXRhjjS6c2tyAkJ/fOZfYLLVZBQmF
	 ZBIr+fjrFow99uqCB+pFR6IionZ6DN1R0qIDR4yI=
Message-ID: <10192896-e632-4ce9-8fd5-cdd535435581@arm.com>
Date: Fri, 3 Jul 2026 10:12:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add BBML3 cpu feature
To: Linu Cherian <linu.cherian@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <830a4d39-c829-4e79-a0ec-5a3633b58aa6@arm.com>
 <akcpqX8gpduwqtOg@a079125.arm.com> <akc3Y44XLqY3ZaEX@a079125.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <akc3Y44XLqY3ZaEX@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_214235_899146_DBA62C56 
X-CRM114-Status: GOOD (  13.95  )
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



On 03/07/26 9:45 AM, Linu Cherian wrote:
> Hi Suzuki,
> 
> On Fri, Jul 03, 2026 at 08:47:01AM +0530, Linu Cherian wrote:
>> Hi Suzuki,
>>
>> On Wed, Jul 01, 2026 at 11:11:35AM +0100, Suzuki K Poulose wrote:
>>> On 01/07/2026 10:41, Linu Cherian wrote:
>>>> Patches 1 and 2 introduces BBML3 cpu feature
>>>> Patches 3, 4 and 5 adds more cpus to the BBML3 support list,
>>>> 	which dont advertise themselves through the standard
>>>> 	MMFR2_ID registers.
>>>>
>>>> Linu Cherian (5):
>>>>    arm64: cpufeature: Add BBML3
>>>>    arm64: cpufeature: Detect BBML3 based on MMFR2 ID
>>>
>>>
>>>>    arm64: cputype: Add Cortex-A520AE definitions
>>>>    arm64: cputype: Add C1-Nano definitions
>>>>    arm64: cpufeature: Extend bbml3 support list
>>>
>>> If you could move the last 3 patches to the top, would be easier
>>> for people to back port the "enable" BBLM3 for those CPUs, without
>>> the renaming conflicts.
>>>
>>
>> IMHO, if we change the order, "arm64: cpufeature: Extend bbml3 support list"
>> title need to be tweaked and might not go well with this BBML3 support series.
>> Also, backporting issue wouldnt be a problem if the whole series is
>> backported and not just 3 patches in isolation ?
>>
> 
> After looking further on this, i definitely agree that moving those patches up has an
> advantage, w.r.t avoiding dependency on other patches.

A possible patch order could be

  arm64/tools/sysreg: Update ID_AA64MMFR2_EL1
  arm64/cputype: Add Cortex-A520AE definitions
  arm64/cputype: Add C1-Nano definitions
  arm64/cpufeature: Extend supports_bbml2_noabort_list
  arm64/cpufeature: Add BBML3
  arm64/cpufeature: Detect BBML3 based on MMFR2 ID



