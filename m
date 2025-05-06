Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C7C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 08:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6GzZxLYqCmiANHnCa8BYorGRclzwFPgHPuyFeuZfnM=; b=W0NBg0a5T/omSphqMXeSDeEiPy
	4T41qBeGzwnQY5r2N7cyCk5hHXTFOVD758CEXcVRKJGT9OfCXbYO4eTR6WIiUv2UEytS/xfUX4sLD
	jYp9kf/uCzuACC0TRe6cM9nTZ/90MMDLbG3FJy6fZVWPFTXSQaq7irncEoXwEtAqk8toOJEM4fSX4
	IVGeHY208bLQUkFrUil75PPS5JPLp/QoJ57tQXWsEcfpvZycMAcQintAHpDHN/qIGlImC7bZAOLeP
	4ImzQ0gV2bsyZ9NVpNyhCoBAU7zWKMUz0KHIoHUXSIyaaRG6fpWs0tqMzHtNEOfSC+E2+JBuIlkr4
	AGdI3yiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDUz-0000000B7xa-0IEc;
	Tue, 06 May 2025 08:17:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDT2-0000000B7ef-0xl4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:15:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCE39113E;
	Tue,  6 May 2025 01:15:44 -0700 (PDT)
Received: from [10.57.93.118] (unknown [10.57.93.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 338A43F673;
	Tue,  6 May 2025 01:15:50 -0700 (PDT)
Message-ID: <fbfded61-cfe2-4416-9098-ef39ef3e2b62@arm.com>
Date: Tue, 6 May 2025 09:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, broonie@kernel.org,
 maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com> <aBZ7P3/dUfSjB0oV@e129823.arm.com>
 <aBkL-zUpbg7_gCEp@arm.com> <aBnDqvY5c6a3qQ4H@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aBnDqvY5c6a3qQ4H@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_011556_369708_0E207843 
X-CRM114-Status: GOOD (  21.67  )
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

On 06/05/2025 09:09, Yeoreum Yun wrote:
> Hi Catalin,
> 
>> On Sat, May 03, 2025 at 09:23:27PM +0100, Yeoreum Yun wrote:
>>> Hi Catalin,
>>>
>>>> On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
>>>>> On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
>>>>>> create_init_idmap() could be called before .bss section initialization
>>>>>> which is done in early_map_kernel().
>>>>>> Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
>>>>>>
>>>>>> PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
>>>>>> and this variable places in .bss section.
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Applied to arm64 (for-next/fixes), with some slight tweaking of the
>>>>> comment, thanks!
>>>>>
>>>>> [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
>>>>>       https://git.kernel.org/arm64/c/12657bcd1835
>>>>
>>>> I'm going to drop this for now. The kernel compiled with a clang 19.1.5
>>>> version I have around (Debian sid) fails to boot, gets stuck early on:
>>>>
>>>> $ clang --version
>>>> Debian clang version 19.1.5 (1)
>>>> Target: aarch64-unknown-linux-gnu
>>>> Thread model: posix
>>>> InstalledDir: /usr/lib/llvm-19/bin
>>>>
>>>> I didn't have time to investigate, disassemble etc. I'll have a look
>>>> next week.
>>>
>>> Just for your information.
>>> When I see the debian package, clang 19.1.5-1 doesn't supply anymore:
>>>  - https://ftp.debian.org/debian/pool/main/l/llvm-toolchain-19/
>>>
>>> and the default version for sid is below:
>>>
>>> $ clang-19 --version
>>> Debian clang version 19.1.7 (3)
>>> Target: aarch64-unknown-linux-gnu
>>> Thread model: posix
>>> InstalledDir: /usr/lib/llvm-19/bin
>>>
>>> When I tested with above version with arm64-linux's for-next/fixes
>>> including this patch. it works well.
>>
>> It doesn't seem to be toolchain related. It fails with gcc as well from
>> Debian stable but you'd need some older CPU (even if emulated, e.g.
>> qemu). It fails with Cortex-A72 (guest on Raspberry Pi 4) but not
>> Neoverse-N2. Also changing the annotation from __ro_after_init to
>> __read_mostly also works.

I think this is likely because __ro_after_init is also "ro before init" - i.e.
if you try to write to it in the PI code an exception is generated due to it
being mapped RO. Looks like early_map_kernel() is writiing to it.

I've noticed a similar problem in the past and it would be nice to fix it so
that PI code maps __ro_after_init RW.

Thanks,
Ryan

> 
> Thanks to let me know. But still I've failed to reproduce this
> on Cortex-a72 and any older cpu on qeum.
> If you don't mind, would you share your Kconfig?
> 
>> I haven't debugged it yet but I wonder whether something wants to write
>> this variable after it was made read-only (well, I couldn't find any by
>> grep'ing the code, so it needs some step-by-step debugging).
>>
> [...]
> 
> Thanks!
> 
> --
> Sincerely,
> Yeoreum Yun


