Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DCEE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 03:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZZkh6OwOIbdVqxjHStImr8vIZS/3yYpzVbE9/1h+Vg=; b=RPVMxBJHAoI/Q5teopeNNglu/I
	RGLooiFeZNSqQhmTPmTHZAViEjgQB4xmcHYitU7b6pYnbDSKdVyZNxjoc4UCOw2Sr2maMy+WiMu0G
	NgHEuXTR9jLqEuSBRXG/f76Q0iRfqrCKcCRYUZ3UiFWbo9UJ4tUzObuskBFP8ertN/QVNeypcP7mz
	KO7yH6zU/1MU3Vb0wmvxoGD85XJ56xA564pX1cGXie/tagrbjQ9498Q4eB6b0Se1lW7vbELNlzxNm
	iHFn4gLMchv0fzwR+Xy3fdX0fbOc0bxJSMyBB+8AyqEMIk5LZtOjzbMU0lWhqh/34fyrNWRPyMiBd
	RKX8PzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqtI-0000000A6Gy-1vCA;
	Tue, 10 Dec 2024 03:26:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqsF-0000000A6AL-02oB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 03:25:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDC10339;
	Mon,  9 Dec 2024 19:25:47 -0800 (PST)
Received: from [10.163.48.173] (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0D543F720;
	Mon,  9 Dec 2024 19:25:16 -0800 (PST)
Message-ID: <c17a45b9-a3a2-4f9d-8243-399f65fc1a52@arm.com>
Date: Tue, 10 Dec 2024 08:55:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on
 EXECMEM
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel test robot <lkp@intel.com>, linux-mm@kvack.org,
 Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241209031251.515903-1-anshuman.khandual@arm.com>
 <202412092048.tTzJ5szH-lkp@intel.com>
 <f492ac51-9dad-4b18-8cd4-81dc236b3162@arm.com> <Z1ckOoPMSXfNdrXd@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z1ckOoPMSXfNdrXd@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_192523_148719_89290117 
X-CRM114-Status: GOOD (  20.70  )
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



On 12/9/24 22:39, Catalin Marinas wrote:
> On Mon, Dec 09, 2024 at 07:43:32PM +0530, Anshuman Khandual wrote:
>> On 12/9/24 18:06, kernel test robot wrote:
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on akpm-mm/mm-everything]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-execmem-Make-ARCH_WANTS_EXECMEM_LATE-depend-on-EXECMEM/20241209-111533
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>>> patch link:    https://lore.kernel.org/r/20241209031251.515903-1-anshuman.khandual%40arm.com
>>> patch subject: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on EXECMEM
>>> config: arm64-kismet-CONFIG_ARCH_WANTS_EXECMEM_LATE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/config)
>>> reproduce: (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412092048.tTzJ5szH-lkp@intel.com/
>>>
>>> kismet warnings: (new ones prefixed by >>)
>>>>> kismet: WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE when selected by ARM64
>>>    WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE
>>>      Depends on [n]: EXECMEM [=n]
>>>      Selected by [y]:
>>>      - ARM64 [=y]
>>
>> Although above mentioned config here has CONFIG_ARCH_WANTS_EXECMEM_LATE=y
>> and CONFIG_EXECMEM=n (actually absent), could that really happen though ?
>>
>> Tried making CONFIG_EXECMEM=n (rather deselecting) but that did now allow
>> setting CONFIG_EXECMEM=n, it always remained set. Reverting this patch i.e
>> the current behaviour is also the same (CONFIG_EXECMEM always remains set).
>>
>> select ARCH_WANTS_EXECMEM_LATE if EXECMEM
>>
>> Above statement seems to be selecting EXECMEM as well but the intent seems
>> to be a dependency check instead! OR arch selection for a config brings in
>> all its dependencies as well.
>>
>> If the selection is always, should this change be like the following ?
>>
>> config ARCH_WANTS_EXECMEM_LATE
>>  	bool
>> 	selects EXECMEM
> 
> This is wrong. What ARCH_WANTS_EXECMEM_LATE means is that, _if_ EXECMEM
> is enabled, the arch code require its late initialisation. Currently for

Which implies that even if ARCH_WANTS_EXECMEM_LATE is only applicable when
EXECMEM is enabled, there is no real dependence on the later for platforms
that need a certain init behaviour.

> arm64 EXECMEM is selected by KPROBES, BPF_JIT and MODULES. So if you

EXECMEM gets enabled from the above, not via ARCH_WANTS_EXECMEM_LATE as I
had anticipated earlier.

> don't have any of these on, you don't need EXECMEM either, no point in
> selecting it above just because arm64 wants a specific behaviour (late
> initialisation) for EXECMEM.

Right, specific behaviour preference for a function on a platform should
not necessarily pull in that function itself.

> 
> If you do want a patch for this, I think for arm64 we simply need to
> select ARCH_WANTS_EXECMEM_LATE unconditionally. Not much use in having
> any dependencies really, it just adds to the clutter. And don't change
> the core Kconfig either.

Sure, will do.

