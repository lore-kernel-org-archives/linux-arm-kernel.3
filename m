Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E41C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UA0y4CyxIAR0Z+3K+tG1+P/C9DWJuiEg/TfDDNCwUA=; b=oDNBeXHQmHXLnDrM8gS2D3fCPr
	W34vzTTPBaPFveTFCbmoZlQw2ksmuWhCR4uyP1SipcB0eo9ZnrjRmkoU6Iysjc2OIcIR+pwC/YYm5
	9fKGuJBymFrQ0wtbnhc3AoXhA9UF8pcPm5ogI/n9qDCHeLQZozad5tIF2xx/aCy90z+8wTymV4SBP
	IM2gnJBtOWnMwSSjufhEbSD5sf83lViQ8LdRGXnFUXWeG1vlwPFaD3r7eCRViOg+yV3N6i4Ye3KBt
	vut/uc3nNMaMwdpjJWLclSTbCz8bPRRDZ+Z7ErGMd7/4eIpUrOjRGMbUzoS69zK5dDxMesOJt6y8U
	UkhzS83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z36-0000000EZmK-1OKq;
	Thu, 24 Apr 2025 16:03:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uuV-0000000DtKu-2PHF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:38:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCED11063;
	Thu, 24 Apr 2025 04:38:25 -0700 (PDT)
Received: from [10.57.73.163] (unknown [10.57.73.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00F4C3F59E;
	Thu, 24 Apr 2025 04:38:29 -0700 (PDT)
Message-ID: <7f4207ff-42ec-46ee-beb6-cb27835f955d@arm.com>
Date: Thu, 24 Apr 2025 12:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
 <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
 <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
 <aAjTg8dgvxqLQOwQ@vaman>
 <CAMuHMdXQKG0qptWMi169MVBL1S3hPo1TsaOSxWspoHAwRd+fug@mail.gmail.com>
 <aAjaPV/2DSyPAGRB@vaman> <b7557def-d0a1-4035-9586-a2651e28ab24@arm.com>
 <CAMuHMdWoxPc71YYrEMdPwdq-HOhmP2jNiwo1+-8o6_v4YJ0NHQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMuHMdWoxPc71YYrEMdPwdq-HOhmP2jNiwo1+-8o6_v4YJ0NHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_043831_701885_A7412CDA 
X-CRM114-Status: GOOD (  33.62  )
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

On 2025-04-23 3:34 pm, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Wed, 23 Apr 2025 at 15:29, Robin Murphy <robin.murphy@arm.com> wrote:
>> On 2025-04-23 1:17 pm, Vinod Koul wrote:
>>> On 23-04-25, 14:13, Geert Uytterhoeven wrote:
>>>> On Wed, 23 Apr 2025 at 13:48, Vinod Koul <vkoul@kernel.org> wrote:
>>>>> On 23-04-25, 13:11, Geert Uytterhoeven wrote:
>>>>>> On Wed, 23 Apr 2025 at 12:59, Robin Murphy <robin.murphy@arm.com> wrote:
>>>>>>> On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
>>>>>>>> The Arm DMA-350 controller is only present on Arm-based SoCs.
>>>>>>>
>>>>>>> Do you know that for sure? I certainly don't. This is a licensable,
>>>>>>> self-contained DMA controller IP with no relationship whatsoever to any
>>>>>>> particular CPU ISA - our other system IP products have turned up in the
>>>>>>> wild paired with non-Arm CPUs, so I don't see any reason that DMA-350
>>>>>>> wouldn't either.
>>>>>>
>>>>>> The dependency can always be relaxed later, when the need arises.
>>>>>> Note that currently there are no users at all...
>>
>> Huh? There is now an upstream DT binding, and DTs using that binding
>> most certainly already exist - not least the one I have, but I'm not the
>> only one. We don't have a requirement that bindings must have
>> upstream-supported consumers.
> 
> Dependencies in Kconfig are not related to DT bindings, they only
> control what can be built?

I was questioning how you have decided that there are "no users at all", 
and how you know "the need" hasn't already arisen...

>>>>> True, but do we have any warnings generated as a result, if there are no
>>>>> dependency should we still limit a driver to an arch?
>>>>
>>>> I am not aware of any warnings (I built it on MIPS yesterday ;-).
>>>> It is just one more question that pops up during "make oldconfig",
>>>> and Linus may notice and complain, too...
>>
>> Well, yeah? It's a new driver for some (relatively) new hardware; every
>> release always adds loads of new drivers for things I don't personally
>> care about, so I press "n" a lot when updating my config, just like I
>> imagine most other people do, Linus included.
> 
> Please read [1] and ask yourself if Linux wants to see a question
> about Arm DMA-350 when configuring a kernel for his AMD Threadripper
> workstation...

...because the whole point here is that it's *not* "completely 
nonsensical". I am well aware of Linus' view and I share it myself. This 
is not a driver for some deeply platform-vendor-specific firmware 
function. PCIe FPGA prototyping cards are a thing, so yes, just like 
with XILINX_DMA, anyone with one of those and access to the IP could 
absolutely synthesise and drive a functional DMA-350 in their x86 PC 
today if they wish.

Conversely, Linus doesn't have a DMA-350 in his Ampere box or his Mac 
either, so in that context it's still just as meaningless to prompt him 
for his ARM64 builds. And I doubt he has all of the dozens of new IIO 
sensors, USB HIDs, etc. which pop up every release either. I'm not sure 
what point you're trying to make there.

People are building hardware now, which by the time it comes out might 
be able to run a standard distro kernel and use this driver, if said 
distro has already built and shipped the module. Why is that such an 
unacceptably terrible thing?

>>> True, give there are no users, lets pick this and drop if we get a non
>>> arm user
>>
>> Well by that logic surely it should just depend on COMPILE_TEST, because
>> there are no ARM or ARM64 "users" either?
> 
> If you want to push it that far, fine for me ;-)
> 
>> FWIW the not-quite-upstream platform I developed on (a custom build of
>> fvp-base-revc with a DMA-350 component added) did happen to be ARM64, as
>> are some other Arm-internal designs and one available SoC that I do know
>> of containing DMA-350; I am not aware of any Linux-capable 32-bit
>> platforms to justify an ARM dependency, so I'd consider that just as
>> arbitrarily pulled out of thin air.
> 
> OK, then the ARM dependency can be dropped for now.
> I had done a quick Google search to find SoCs that contain a DMA-350
> instance, and had only found a Cortex-M0-based SoC, so I assumed it
> would be used on ARM, too.
> 
>> But then to pick another example at random, XILINX_DMA equally has no
>> "users", so please make that depend on something arbitrary as well for
>> consistency; it's only fair.
> 
> Sure, there are lots of Kconfig symbols that could benefit from
> additional dependencies. Unfortunately my time is limited, so usually
> I create and send patches for new Kconfig symbols only....

Dare I suggest your time could be less limited if you avoided spending 
it on nonsensical and unnecessary gatekeeping? ;)

Yes, config options with a clear dependency on a particular platform 
should clearly be restricted to configs which include support for that 
platform. Config options which do not have any such dependency are just 
that - *options*, for the distro/end user to decide whether they might 
be (or become) relevant within the scope and lifetime of the kernel 
being built.

Thanks,
Robin.

