Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0BEC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crvtFoSSf1pJ/8ytC325QwTRj4uYdG2Mu4jqSpqZJqk=; b=JNUp/k9tDDDKX8Rcs2/wUUXN+B
	dcUXTS5OBFiZLYtUPrgz1cre71RN25TZ31lM/I41TjiFtCrG+UG3/avkL0BIwmGW0LAjdHEcQnWyr
	htOUeObF337gPY/4qdLAYlBZszdlafm29gpDq3UoGQoVONO64oFJCGOgBIF0O4gjPgiCbnDVToolJ
	xkUwUI5kivf6EtHV1OB+UpoXtuId0LFdyqPGHADtL/LIVB795WDTjJl0zn5MRfiGbAjIxcZyFRsyO
	l4A7SancXvTTKe92k5w/eTlzEKJLq2aJwFrDpihoLYLphtu90To4GYiGZsVjh/PedtuUOLQ0yHzk6
	T/pDV1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnZC-0000000EZbL-0jTv;
	Fri, 16 Jan 2026 17:24:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnZ9-0000000EZZH-2TYh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:24:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E51CA1515;
	Fri, 16 Jan 2026 09:24:44 -0800 (PST)
Received: from [10.57.49.133] (unknown [10.57.49.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 416DE3F59E;
	Fri, 16 Jan 2026 09:24:49 -0800 (PST)
Message-ID: <4da29d46-9a80-4ec4-b6b8-6c9457eed481@arm.com>
Date: Fri, 16 Jan 2026 17:24:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: imx8 PCI regression since "iommu: Get DT/ACPI
 parsing into the proper probe path"
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>,
 iommu@lists.linux.dev, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, "Rob Herring (Arm)"
 <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <jroedel@suse.de>,
 regressions@lists.linux.dev
References: <a1d926f0-4cb5-4877-a4df-617902648d80@green-communications.fr>
 <eb94b379-6e0b-4beb-aaa7-413a4e7f04b9@green-communications.fr>
 <3780eb61-68e2-42ce-939e-7458cd3a63cb@green-communications.fr>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <3780eb61-68e2-42ce-939e-7458cd3a63cb@green-communications.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_092455_761998_7006AEDE 
X-CRM114-Status: GOOD (  23.48  )
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

On 2026-01-16 4:52 pm, Nicolas Cavallari wrote:
> +cc regressions ML
> 
> Le 13/01/2026 à 10:17, Nicolas Cavallari a écrit :
>> +cc patch author & reviewers
>>
>> On 1/9/26 17:22, Nicolas Cavallari wrote:
>>> When upgrading from 6.12 to a 6.18 kernel, I noticed that a PCI
>>> Ethernet adapter (Microchip LAN7430) would hang under load and not
>>> recover.  When that happens, some of its registers indicate it is
>>> failing to do DMA reads, so cannot reclaim entries on its ring buffer.
>>>
>>> I bisected the problem into this commit:
>>>
>>> commit bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c
>>> Author: Robin Murphy <robin.murphy@arm.com>
>>> Date:   Fri Feb 28 15:46:33 2025 +0000
>>>
>>>       iommu: Get DT/ACPI parsing into the proper probe path
>>>
>>> The problem still exists on 6.19-rc1, on pci/next (29a77b4897f1) and on
>>> iommu/master (360e85353769) trees.  Reverting the commit fixes the 
>>> issue.
> 
> The problem persists on 6.19-rc5
> 
>>> The system is a Gateworks GW7200, which is a i.MX 8 Mini connected to a
>>> Pericom
>>> PI7C9X2G404 4-port switch connected to the LAN7430 chip.
>>>
>>> -[0000:00]---00.0-[01-ff]----00.0-[02-05]--+-01.0-[03]----00.0
>>>                                              +-02.0-[04]--
>>>                                              \-03.0-[05]----00.0
>>>
>>> The problem only occurs when there is at least another PCI device in use
>>> on the
>>> switch.  It does not happen if the LAN7430 is the only PCI device, or if
>>> the
>>> other devices are not actively used.  For example i can reproduce it
>>> with an
>>> ath9k wireless network adapter when it is up and running, but not when
>>> it is
>>> down or its driver is not loaded.
>>>
>>> I suspect that other PCI devices have similar issues, but the LAN7430 is
>>> the
>>> easiest one to diagnose, as it hangs within seconds with an iperf3 --
>>> bidir -u
>>> -b 200M and its register map are public.
>>>
>>> I couldn't find an way to dump the PCI address translation mapping from
>>> userspace.
>>> I would be happy to provide more information or test patches.
> 
> I debugged it further, it seems to be mostly a PCI issue since the 
> system does not actually have an IOMMU.

Indeed, I was figuring this had to be another case of a switch with 
wonky ACS - do Mani's patches adjusting ACS enablement make any difference?

https://lore.kernel.org/all/20260102-pci_acs-v3-1-72280b94d288@oss.qualcomm.com/

Although in this case I guess the issue is arguably more that we're 
requesting ACS at all, before we know that there's actually an IOMMU 
present to warrant it. Clearly the best option would be to figure out if 
the switch behaviour itself can be fixed somehow, but perhaps something 
like this might help paper over the issue for now (but I'd have to test 
it to make sure it doesn't break IOMMUs again...)

----->8-----
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 6b989a62def2..837cc0b5ace4 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -141,10 +141,12 @@ int of_iommu_configure(struct device *dev, struct 
device_node *master_np,
  			.np = master_np,
  		};

-		pci_request_acs();
  		err = pci_for_each_dma_alias(to_pci_dev(dev),
  					     of_pci_iommu_init, &info);
-		of_pci_check_device_ats(dev, master_np);
+		if (!err) {
+			pci_request_acs();
+			of_pci_check_device_ats(dev, master_np);
+		}
  	} else {
  		err = of_iommu_configure_device(master_np, dev, id);
  	}
-----8<-----

Thanks,
Robin.

