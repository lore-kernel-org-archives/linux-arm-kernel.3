Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540D7C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unCGW6fQj8zqs3Na1nmhVi8JLwaJwOr3omf9RbAzO04=; b=Fysl/piHy6SYN59IW1AjFNlDe1
	zlcI7Eg//kmrBx+d8zmGgqTPNoVW9IWt3+HGmGPgjyaz7ylcGnPs2JTsp74feKIAwKJudFzjkjce8
	hGhWTgGEODsg/4+QKLvzr6yOzY9gSgODb2/JgaYsmQGFpofgXV7h0klvskNHZmUptqKbv2GLq44ol
	JTxhrZb7FpKzsB1WFYSri1cDt6haBx/rskNAHRlI91RS7NSzCRozDTXqG1tc4ZL2+Qcg+L8pJw4cu
	bXiiMFQfFvIpzVmtiCytsX89tfgLGGGXRxt37qYv2P9nUxBI7Ky8n+KoZbcbKX1oO7KSl1ofSpy/u
	oZv3c0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Mzd-00000000Pb4-11G9;
	Fri, 25 Apr 2025 17:37:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Kom-000000000x9-2Vbc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:18:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E685106F;
	Fri, 25 Apr 2025 08:18:11 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48ED13F59E;
	Fri, 25 Apr 2025 08:18:15 -0700 (PDT)
Message-ID: <e6db6396-cb1e-4e24-8fd0-3cce388a3913@arm.com>
Date: Fri, 25 Apr 2025 16:18:13 +0100
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
 <03e6283e-2ef7-498c-9460-8411114711e2@arm.com>
Content-Language: en-GB
In-Reply-To: <03e6283e-2ef7-498c-9460-8411114711e2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_081820_722433_DBB280AB 
X-CRM114-Status: GOOD (  27.71  )
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

On 11/04/2025 8:11 pm, Robin Murphy wrote:
[...]
> OK, I found it, but I'm still not sure what exactly to make of it - it's 
> the pci_request_acs() in of_iommu_configure(), now being called early 
> enough to actually have an effect. Booting with EDK2 already using PCI 
> prior to Linux, here's what I get for `sudo lspci -vv | grep ACSctl` 
> with 6.15-rc1:
> 
>          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
> UpstreamFwd+ EgressCtrl- DirectTrans-
>          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
> UpstreamFwd+ EgressCtrl- DirectTrans-
>          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
> UpstreamFwd+ EgressCtrl- DirectTrans-
>          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
> UpstreamFwd+ EgressCtrl- DirectTrans-
>          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
> UpstreamFwd+ EgressCtrl- DirectTrans-
>          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
> UpstreamFwd+ EgressCtrl- DirectTrans-
> 
> whereas with the 6.14 behaviour they are all '-'. I don't have a working 
> root filesystem with the U-Boot setup, but if I boot it with 
> "pci=config_acs=000000@pci:0:0" then the kernel does assign the bridge 
> windows and discover the ethernet/SATA endpoints again. I can spend some 
> time getting NFS working next week, but if you're able to get lspci 
> output off a machine in the "broken" state easily that would be handy to 
> compare.
> 
> So at this point it would seem to be something about how Linux 
> configures ACS when doing it from scratch. What I don't really know is 
> where to go from there. I do know Juno's possibly a bit odd in that the 
> switch supports ACS, but both the root port and endpoints either side of 
> it don't. Could this be tickling some subtle bug in the PCI layer, and 
> what is EDK2 doing that makes it not happen?

Just following up on where I ran out of ideas. I poked at things a 
little more, and from a process of elimination, the culprit appears to 
be is that we enable ACS source validation on the downstream port while 
its secondary bus is still 0, *then* we get to the "bridge configuration 
invalid" bit and reconfigure the bus numbers, but after that, config 
space accesses to the secondary bus still apparently fail to work as 
expected.

What's now beyond me is whether this is just an ACS quirk of this 
particular switch, and/or whether there's something we could or should 
be doing in the PCI layer.

All I can suggest a this point is that you could at least sidestep the 
problem on the LKFT boards by updating them to a less-ancient version of 
U-Boot which supports PCIe for Juno (looks like that landed in 2020.10), 
which should then configure the switch at boot such that the bus 
numbering doesn't need to change when Linux probes it - that appears to 
be the only "magic" thing that EDK2 is doing.

Thanks,
Robin.

