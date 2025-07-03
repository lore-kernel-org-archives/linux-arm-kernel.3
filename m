Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE75C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTXvd5Uvp6Q4AKEPN0WQMwq/tMxtiUVrV4mMQxECWg4=; b=s+nTA8aXNx8ynath9C6yK1+9x1
	eGVNziQHG6p08gs7353wqt6zmI/R66/MTEf77DZkYw4c+QeSaLnApyHZmlq6P8cu5TSBq8ocyvo7K
	GLqM7QzcoVqK1Bf7Xyzw+yKrOVHjc1E24kAn3cDZ1WFka7i4hV2QHS3rZQaSn/INFRf+Si84jl5N1
	M9DU5VIp4B5l6fADTzdFT1s9QgGuGltHYjXmafDpowtwKjR2uQHhkRgzUWGa3Hd5K2ESAyYYB60TK
	UZNbai1MCzwncbAukgHrrJX2PhYApiAqCbREZGpZVpEE+GmcBLZYbJFueqZVVM8L1SZCkbkKSb1SY
	hLCtkZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSs7-0000000CnUi-1QpQ;
	Thu, 03 Jul 2025 22:57:39 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR3P-0000000CZCf-2o6c;
	Thu, 03 Jul 2025 21:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DTXvd5Uvp6Q4AKEPN0WQMwq/tMxtiUVrV4mMQxECWg4=; b=eHbkUpvZHga1VvDSiTyTIqOhp0
	BJJUJ/s7r/Oti4BL8fowmXQWpzxgutuhwJM+dd9+AR9lu0KpvQADtGj8/M4bZfweCbdJ9zlqNudnm
	bfHFw1/S5J9UG1XJ2SuwVRq5zrHerOBi8efz3j5jDGB0+aF1PmAVgdP/FCVDbnzax6i71rc8YApIy
	hOSa1ET/sO1s72kMF8LBKo6/5ccmNvKZVfVRZ7tMcVVir8Zg3RPe2qA7ZWft0ORjkEIsjr5M6y2oT
	8kY7T4LY5+93Ns0gyKmxwa6YZ96Rz/VPzTZN+1/j59Hb13+Ddu1A/dUDs8xGpLkkIY7xiXzx4kCE7
	RTUjl/pg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR3K-0000000EPXR-37Bs;
	Thu, 03 Jul 2025 21:01:10 +0000
Date: Thu, 3 Jul 2025 23:00:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751576458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DTXvd5Uvp6Q4AKEPN0WQMwq/tMxtiUVrV4mMQxECWg4=;
	b=dTn5r7531nUAApuRrJVEdSU1yHQgN8OqgV/tVp18i0lXAnb6BkUZgnHlf7StaSFIv0Jz9M
	BNNct7Wcf3Poy9tY7EAT9Iv0/Znzi3/8d4/cCyrLJ+jswLaS3RHVFrD2HuVu8VHATIkPvO
	XQTJ9RS88X/x7KoggIeL5yOlHBDZ3b+BN42a8aWclYymUVLxZ1arwKhzpODAoDqgufFswo
	8UNzyNBkAaC/orKnvXhYvUMZGfJCQsiuDsvGprxUEc9UZHIGlhDHp19N2pX5+0YgB04iQw
	uPk2PRvtk4WZCK2bI5q+tmxx3ytZUeE2DMLnQjzoCEl2sh5+gpYGBiLSlHMbNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751576458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DTXvd5Uvp6Q4AKEPN0WQMwq/tMxtiUVrV4mMQxECWg4=;
	b=mcFlxZK5m7AaTULHDD29cnWKaEO4XCMTydboJXdrQ9VKl2m7LlecU8z5SM+r0xOGESw1hx
	APh3s/XqB5ssTKAA==
From: Nam Cao <namcao@linutronix.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
Message-ID: <20250703210056.sDzAytHT@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87cyaht595.ffs@tglx>
 <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_220106_824542_852D0CF1 
X-CRM114-Status: GOOD (  24.14  )
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

On Thu, Jul 03, 2025 at 08:15:07PM +0000, Michael Kelley wrote:
> From: Thomas Gleixner <tglx@linutronix.de> Sent: Thursday, July 3, 2025 1:00 PM
> > 
> > On Thu, Jul 03 2025 at 17:41, Michael Kelley wrote:
> > > From: Nam Cao <namcao@linutronix.de> Sent: Thursday, June 26, 2025 7:48 AM
> > >>
> > >> Move away from the legacy MSI domain setup, switch to use
> > >> msi_create_parent_irq_domain().
> > >
> > > From a build standpoint, this patch does not apply cleanly to
> > > linux-next20250630. See also an issue below where a needed irq
> > > function isn't exported.
> > 
> > Does it conflict against the PCI tree?
> 
> There's no conflict in the "next" or "for-linus" tags in
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/.
> 
> The conflict is with Patch 2 of this series:
> 
> https://lore.kernel.org/linux-hyperv/1749650984-9193-1-git-send-email-shradhagupta@linux.microsoft.com/
> 
> which is in netdev/net-next.

I need some guidance here. If I make it apply cleanly to linux-next, it
won't apply to pci tree.

I saw this type of conflict being resolved during merging to Linus's tree.
Shouldn't we do the same for this case?

> Michael
> 
> > 
> > > At runtime, I've done basic smoke testing on an x86 VM in the Azure
> > > cloud that has a Mellanox NIC VF and two NVMe devices as PCI devices.
> > > So far everything looks good. But I'm still doing additional testing, and
> > > I want to also test on an ARM64 VM. Please give me another day or two
> > > to be completely satisfied.

Good to hear, thanks!

> > Sure.
> > >> +static void hv_pcie_domain_free(struct irq_domain *d, unsigned int virq, unsigned int nr_irqs)
> > >> +{
> > >> +	struct msi_domain_info *info = d->host_data;
> > >> +
> > >> +	for (int i = 0; i < nr_irqs; i++)
> > >> +		hv_msi_free(d, info, virq + i);
> > >> +
> > >> +	irq_domain_free_irqs_top(d, virq, nr_irqs);
> > >
> > > This code can be built as a module, so irq_domain_free_irqs_top() needs to be
> > > exported, which it currently is not.
> > 
> > Nam, can you please create a seperate patch, which exports this and take
> > care of the conflict?

Will do.

Best regards,
Nam

