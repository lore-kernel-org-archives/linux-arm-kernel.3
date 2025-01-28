Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DBFC02195
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnVMXTgZx/ZG5AwDKAMtvKL1rVRXvOB2pVoi5ozrFJo=; b=Y4kr2kX+jUyOszfuUeb5bO6rnT
	FJixyuPcoWMDPrKsmly1IIK8ty/zsKEKXE2J1W7plr3wNT/Rr81DhYAMwYeQZKmqfz9p2JsO9mZ/H
	9pJes70ezxUq+bUEQjgG0qaKr7qgXn9lMPwfZKCt9R/sFg4roTNI+i0lEtGqcKLGgdQxM0nZ2Aod4
	+b8KvOCHdh31nWferdBXSGJU2n3+PeLTrNul3uwU+0mh1JUEi/FfIfMSCAZsjNQ1/Dh2HtRPExXUR
	FU7IN5Leyj5+kn0SL7Q5gBLBEDn23S42OCmVSgXbYGCBLHjtaU3N6Nw1nEyiMcMufikReaSz+UGCO
	mKkAHNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcheN-00000004TZT-2CNl;
	Tue, 28 Jan 2025 09:12:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchd0-00000004TGD-14qr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 09:11:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE0F497;
	Tue, 28 Jan 2025 01:11:50 -0800 (PST)
Received: from [10.162.16.94] (a077893.blr.arm.com [10.162.16.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BC663F528;
	Tue, 28 Jan 2025 01:11:20 -0800 (PST)
Message-ID: <7f5c68c7-8036-4d18-950f-80e55ac8ea11@arm.com>
Date: Tue, 28 Jan 2025 14:41:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
To: Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Eric Auger <eric.auger@redhat.com>,
 kvmarm@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
 <20250102160402.GB3990035-robh@kernel.org> <Z30adHnQ7ZFaU9UR@arm.com>
 <CAL_JsqLLnh1o4L1=PpNt5brBwZZCgp7mOygByOYakchrzc29Ow@mail.gmail.com>
 <86wmf5wo8u.wl-maz@kernel.org>
 <CAL_JsqKKiEOj=a1k6U-bB0F6-ht7QokDnh3bspHupp-QG=haSg@mail.gmail.com>
 <Z4kmlhnlpKjS_MII@arm.com>
 <CAL_JsqK1k7fG=yDZSbTbV63yRP5U9=GpuAiv=NWZJWdppUtRwA@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAL_JsqK1k7fG=yDZSbTbV63yRP5U9=GpuAiv=NWZJWdppUtRwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_011126_342886_7DC45493 
X-CRM114-Status: GOOD (  12.69  )
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



On 1/18/25 03:37, Rob Herring wrote:
> On Thu, Jan 16, 2025 at 9:32 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>>
>> On Wed, Jan 08, 2025 at 07:47:16AM -0600, Rob Herring wrote:
>>> On Wed, Jan 8, 2025 at 5:15 AM Marc Zyngier <maz@kernel.org> wrote:
>>>> On Tue, 07 Jan 2025 22:13:47 +0000,
>>>> Rob Herring <robh@kernel.org> wrote:
>>>>> On Tue, Jan 7, 2025 at 6:13 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>>>>>> But does KVM actually expose the feature to EL1 in ID_AA64DFR1_EL1 and
>>>>>> than traps it at EL2?
>>>>>
>>>>> As Marc pointed out KVM only advertises PMUv3.8. Regardless, guest
>>>>> accesses to these registers are trapped with or without this series.
>>>>
>>>> And most probably generates a nice splat in the kernel log, as nobody
>>>> updated KVM to handle *correctly* PMICNTR_EL0 traps, let alone deal
>>>> with the FGT2 registers.
>>>
>>> Isn't that this series[1]? Should that have come first, I guess I know
>>> that *now*.
>> [...]
>>> [1] https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/
>>
>> It's not any clearer to me. Does this series depend on the 46-patch one?
>> Or, if we had the other, is this no longer needed? Or none of these,
>> they are independent.
> 
> They are independent. I think ideally we'd want everything landing at
> the same time, but we're past ideal at this point. Without this
> series, if someone uses PMU on v8.9 and firmware enabled FGT2, then
> the kernel will crash. Without the above series, KVM will have
> warnings in the kernel log, but otherwise function.

Right, they are independent. Just that Rob had observed this PMU v3.8 boot
requirement while reviewing the HW breakpoint series earlier. I should just
respin this series after the upcoming v6.14-rc1 release is out ?

