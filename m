Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91191C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVCCVgz66VBGaZcjHo4acMMHMWO7BMaTt44LOHhJf0A=; b=BE7Inu9YcklXTPTxQOlNzkfm9w
	+CP9yiamZn7zBf0wKGVXGNymYMWgJzUcNk4XYb7CGuLY5g7Er+hzIq05dVYbTGYqLY/RrlpqyWtDQ
	L3MXzSee930jwfQrhH4AEZjVZplCwbtRNInSYTuLKexUYpS37mIdF68MNJ4vhVQLWIW3Xno1f6T3r
	fQAS6hfWPUBdOWqTSP3OJiY/YGFw39Enj59mSzp0JtoEm38Y8CLz8inemzhMAUFGtd5GJa0JPU+tm
	DmQkDkHxgcf+CoRldZ1eS9BsEUXxV0kbZ5EtQFP12nFsCjZ+huvo0S02bwS5L2q0nv73+gE+luKG4
	c+EAo+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00p5-00000006cSh-1D4r;
	Wed, 02 Apr 2025 16:20:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00nJ-00000006cI6-2UHD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 16:18:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F215A106F;
	Wed,  2 Apr 2025 09:18:27 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3EAF3F63F;
	Wed,  2 Apr 2025 09:18:22 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:18:19 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>, iommu@lists.linux.dev,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: arm64: juno-r2: SSD detect failed on mainline and next
Message-ID: <20250402-thistle-oxpecker-of-fragrance-d2ebb5@sudeepholla>
References: <CA+G9fYt0F_vR-zOV4P8m4HTv6AecT-eEnrL+t5wgAaKPodi0mQ@mail.gmail.com>
 <6e0ef5cc-b692-4d39-bec4-a75c1af3f0aa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e0ef5cc-b692-4d39-bec4-a75c1af3f0aa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_091825_672215_905F9122 
X-CRM114-Status: GOOD (  16.80  )
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

On Wed, Apr 02, 2025 at 04:34:08PM +0100, Robin Murphy wrote:
> On 31/03/2025 5:03 am, Naresh Kamboju wrote:
> > Regressions on arm64 Juno-r2 devices detect SSD tests failed on the
> > Linux next and Linux mainline.
> > 
> > First seen on the v6.14-7245-g5c2a430e8599
> >   Good: v6.14
> >   Bad: v6.14-7422-gacb4f33713b9
> 
> Sorry, I can't seem to reproduce this on my end, both today's mainline and
> acb4f33713b9 with my config, and even acb4f33713b9 with the linked LKFT
> config, all work OK on my Juno r2 (using a SATA SSD and PCIe networking).
> The only thing which stands out in your log is that PCI seems to give up
> probing and assigning resources beyond the switch downstream ports (so SATA
> and ethernet are never discovered), whereas on mine it does[2]. However that
> all happens before the first IOMMU instance probes (which conveniently is
> the PCIe one), so it's hard to imagine how that could have an effect
> anyway...
> 
> The only obvious difference is that I'm using EDK2 rather than U-Boot, so
> that's done all the PCIe configuration once already, but it doesn't seem
> like that's significant - looking back at a random older log[1], the
> on-board endpoints were still being picked up right after reconfiguring the
> switch, well before the IOMMU comes into the picture.
> 

Highly unlikely it is related to this issue, but I do see you are using
the default DTB files and not juno-*-scmi.dtb which aligns with the SCP
firmware you might be running. Just noticed SCPI timeout in the log, so
none of the power management calls will work. By default all the required
power domains must be on though.

-- 
Regards,
Sudeep

