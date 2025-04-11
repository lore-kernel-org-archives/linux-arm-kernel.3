Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA79DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpoBex9j09oBZpwi1f8AcI88Shly3qmm7d7XUbIKzUw=; b=Tu31gzouYf8yRh9RmpcBvjzKKr
	emtX83qwIthHkfuP0bRkftdlNP4tSme/JHeyUkTLjPRndH3J3i+WL7OAyOTKmvaEh6jIGGpMGpofn
	tY655Lbbi3kl+ILxSt/P27+kqExW/8gdV7TkFDD6a6dpQK6KuJDdufivoibJP1FHKAORfCM4j97Zr
	rP5984ylr2Y7Nb3Hk8PRRTD2kKKaNLc4NoxT31JGnR7qf1K5HUO1ZbNX/Ch7/e3RFVH0uC7iyMLT9
	rqaSnkVN+pIMeDYGq3+XajUR23G0c0D7sahjlHS/wZAiW13sYYeT9Osql8+AEqZPoHBopI+mgAgUx
	RGWCQP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Jox-0000000EhKX-16mo;
	Fri, 11 Apr 2025 19:13:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Jn7-0000000Eh8r-2BHW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 19:11:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BCF6106F;
	Fri, 11 Apr 2025 12:11:49 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5DB3F59E;
	Fri, 11 Apr 2025 12:11:48 -0700 (PDT)
Message-ID: <03e6283e-2ef7-498c-9460-8411114711e2@arm.com>
Date: Fri, 11 Apr 2025 20:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: juno-r2: SSD detect failed on mainline and next
From: Robin Murphy <robin.murphy@arm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux.dev,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Anders Roxell <anders.roxell@linaro.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <CA+G9fYt0F_vR-zOV4P8m4HTv6AecT-eEnrL+t5wgAaKPodi0mQ@mail.gmail.com>
 <6e0ef5cc-b692-4d39-bec4-a75c1af3f0aa@arm.com>
 <CA+G9fYs_nUN2x8fFJ0cfudHWbCOLSJK=OhEK0Efd1ifcjq_LRg@mail.gmail.com>
 <5a277d1d-c7b1-430c-a463-1e307a2823f6@arm.com>
Content-Language: en-GB
In-Reply-To: <5a277d1d-c7b1-430c-a463-1e307a2823f6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_121153_646729_9F1953CB 
X-CRM114-Status: GOOD (  29.56  )
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

On 10/04/2025 4:36 pm, Robin Murphy wrote:
> On 09/04/2025 4:56 pm, Naresh Kamboju wrote:
>> On Wed, 2 Apr 2025 at 21:04, Robin Murphy <robin.murphy@arm.com> wrote:
>>>
>>> On 31/03/2025 5:03 am, Naresh Kamboju wrote:
>>>> Regressions on arm64 Juno-r2 devices detect SSD tests failed on the
>>>> Linux next and Linux mainline.
>>>>
>>>> First seen on the v6.14-7245-g5c2a430e8599
>>>>    Good: v6.14
>>>>    Bad: v6.14-7422-gacb4f33713b9
>>>
>>> Sorry, I can't seem to reproduce this on my end, both today's mainline
>>> and acb4f33713b9 with my config, and even acb4f33713b9 with the linked
>>> LKFT config, all work OK on my Juno r2 (using a SATA SSD and PCIe
>>> networking). The only thing which stands out in your log is that PCI
>>> seems to give up probing and assigning resources beyond the switch
>>> downstream ports (so SATA and ethernet are never discovered), whereas on
>>> mine it does[2]. However that all happens before the first IOMMU
>>> instance probes (which conveniently is the PCIe one), so it's hard to
>>> imagine how that could have an effect anyway...
>>>
>>> The only obvious difference is that I'm using EDK2 rather than U-Boot,
>>> so that's done all the PCIe configuration once already, but it doesn't
>>> seem like that's significant - looking back at a random older log[1],
>>> the on-board endpoints were still being picked up right after
>>> reconfiguring the switch, well before the IOMMU comes into the picture.
>>>
>>
>> Since it is a still issue on mainline and next,
>>
>> Bisected and reverted patch ^ causing kernel warnings at boot time
>> but finding the SSD drive,
>>
>>    [bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c]
>>    iommu: Get DT/ACPI parsing into the proper probe path
>>
>> pcieport 0000:00:00.0: late IOMMU probe at driver bind, something 
>> fishy here!
>> WARNING: at drivers/iommu/iommu.c:559 __iommu_probe_device
>>
>> I see boot warnings [1]
>> I am happy to test debug patches if you have any.
> 
> Seeing the warning after reverting the commit which introduced the 
> warning mostly just means the conflict resolution in the revert wasn't 
> right (there were some subsequent fixups...)
> 
> Anyway, I have now managed to get my Juno booting with the same antique 
> version of U-Boot and finally reproduce the issue. It seems to be 
> somehow connected to bus->dma_configure() being called in the 
> device_add() notifier (even though the rest of the IOMMU setup doesn't 
> run at that point since the driver hasn't registered yet), but how and 
> why that prevents the buses behind the switch downstream ports being 
> probed, and why *that* only happens when the switch isn't already 
> configured, remains a mystery so far. I'm still digging...

OK, I found it, but I'm still not sure what exactly to make of it - it's 
the pci_request_acs() in of_iommu_configure(), now being called early 
enough to actually have an effect. Booting with EDK2 already using PCI 
prior to Linux, here's what I get for `sudo lspci -vv | grep ACSctl` 
with 6.15-rc1:

		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ 
EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ 
EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ 
EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ 
EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ 
EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ 
EgressCtrl- DirectTrans-

whereas with the 6.14 behaviour they are all '-'. I don't have a working 
root filesystem with the U-Boot setup, but if I boot it with 
"pci=config_acs=000000@pci:0:0" then the kernel does assign the bridge 
windows and discover the ethernet/SATA endpoints again. I can spend some 
time getting NFS working next week, but if you're able to get lspci 
output off a machine in the "broken" state easily that would be handy to 
compare.

So at this point it would seem to be something about how Linux 
configures ACS when doing it from scratch. What I don't really know is 
where to go from there. I do know Juno's possibly a bit odd in that the 
switch supports ACS, but both the root port and endpoints either side of 
it don't. Could this be tickling some subtle bug in the PCI layer, and 
what is EDK2 doing that makes it not happen?

Thanks,
Robin.

