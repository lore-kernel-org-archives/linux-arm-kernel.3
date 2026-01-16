Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63747C982DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ogNT9pqt09bNh0fJR5xO0+6zrKZermPre/OJlYebic=; b=BZJGtfFabiE+F0uqjnf/XV/Hse
	eprKVFP1fIvW0xCbLCpZ7sV55jEPXTy/qsF27GekxA70ZZN63D7STW5IaFpHPmrkZThggm+zsmRku
	sHsSrKr/4SiAI0D5clEiRZRXQmdhQnwD08LcVbkVjRtDxqAWrnPpXRPwsxMlsFpe9Zt2bEyA5fHR7
	UORaetl5Y9Ipmz+1ZWoNrfJ12/SVycc8YMmLf8n2amiCA8lZOmO00udz3uKLHi/B3w8k6H5C7FkvE
	ciifQn21z76XTxqypUeF0bPB5WnNgkwHYwLHaJUiq1/W0pNJ+9quHomH1J2TPcQL5qUstaXK0RC7n
	G7RBAFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnja-0000000Eah7-2BGR;
	Fri, 16 Jan 2026 17:35:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnjX-0000000Eagi-3tqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:35:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D64011516;
	Fri, 16 Jan 2026 09:35:31 -0800 (PST)
Received: from [10.57.49.133] (unknown [10.57.49.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB053F59E;
	Fri, 16 Jan 2026 09:35:36 -0800 (PST)
Message-ID: <d3f008bf-a9cb-43a8-807b-2ba1d6d9ff3c@arm.com>
Date: Fri, 16 Jan 2026 17:35:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: imx8 PCI regression since "iommu: Get DT/ACPI
 parsing into the proper probe path"
To: Jason Gunthorpe <jgg@nvidia.com>,
 Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, "Rob Herring (Arm)" <robh@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 regressions@lists.linux.dev
References: <a1d926f0-4cb5-4877-a4df-617902648d80@green-communications.fr>
 <eb94b379-6e0b-4beb-aaa7-413a4e7f04b9@green-communications.fr>
 <3780eb61-68e2-42ce-939e-7458cd3a63cb@green-communications.fr>
 <20260116171048.GP961588@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260116171048.GP961588@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_093540_102390_5E1156D6 
X-CRM114-Status: GOOD (  27.58  )
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

On 2026-01-16 5:10 pm, Jason Gunthorpe wrote:
> On Fri, Jan 16, 2026 at 05:52:36PM +0100, Nicolas Cavallari wrote:
>> I debugged it further, it seems to be mostly a PCI issue since the system
>> does not actually have an IOMMU.
>>
>> When examining changes in the PCI configuration (lspci -vvvv), the main
>> difference is that, with the patch, Access Control Services are enabled on
>> the PCI switch.
>>
>>          Capabilities: [220 v1] Access Control Services
>>                  ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>> UpstreamFwd+ EgressCtrl+ DirectTrans+
>> -               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>> UpstreamFwd- EgressCtrl- DirectTrans-
>> +               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>> UpstreamFwd+ EgressCtrl- DirectTrans-
>>
>> If I manually patch the config space in sysfs and re-disable ACS on the port
>> connected to the LAN7430, I cannot reproduce the problem.  In fact,
>> disabling only ReqRedir is enough to work around the issue.
> 
> My guess would be your system has some kind of address alias going on?
> 
> Assuming you are not facing an errata, ACS generally changes the
> routing of TLPs so if you have a DMA address that could go to two
> different places then messing with ACS will give you different
> behaviors.
> 
> In specific when you turn all those ACS settings you cannot do P2P
> traffic anymore. If your system expects this for some reason then you
> must use the kernel command line option to disable acs.
> 
> If you are just doing normal netdev stuff then it is doubtful that you
> are doing P2P at all, so I might guess a bug in the microchip ethernet
> driver doing a wild DMA? Stricter ACS settings cause it to AER and the
> device cannot recover?
> 
> It will be hard to get the bottom of the defect without a PCI trace
> 
> I don't know why your bisection landed on bcb8 - the intention was
> that pci_enable_acs() is always called, and I didn't notice an obvious
> reason why that wouldn't happen prior to bcb8.. It is called directly
> from pci_device_add() Maybe investigating that angle would be
> informative..

The difference is that bcb8 moves the pci_request_acs() call on OF 
systems back early enough to actually have an effect - that's spent the 
last 6 years being pretty much a no-op since 6bf6c24720d3 ("iommu/of: 
Request ACS from the PCI core when configuring IOMMU linkage")...

Thanks,
Robin.

>> I also read up on AER and I'm surprised that I don't see anything in dmesg
>> when the problem occurs, even through UERcvd+ start appearing on the root
>> context and AdvNonFatalErr+ appears on the switch.
> 
> Though UE and AdvNonFatalErr sure are weird indications for an
> addressing error.. Is there some kind of special embedded system thing
> going on? Vendor messages over PCI perhaps?
> 
> Jason


