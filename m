Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8A0C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 01:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDhBrrex6g5QaN9laTXmAgCa/05IrHo33281B3Hc3OE=; b=zTmffl906IZlPH/HpK8cMY7aTe
	cEOEQizNU4Fq8V+y6nzd3ZmzoQOwDTqopxIpJSZU/22t2rOs66wBDc6Hd3/CNBT7e+jNIMMnOkZ4l
	eqNfH8g7fTxjWRPvsnrazKK2LbVmHPC14Z4g/+wZVHz/gJKK8hnG+7BhEDQk43uU8teAfNU8/UKht
	GH/up3T4jf1DYXUjQg7cNDP4QCDPxDes/F1mmlshJDo1CR/TZx9HIxs0vwxeyCphbIbsutrLuL5R/
	qlPD63T7wOC1A1zFYiIg9J0PK5Hkt5na1xmZeEGBUgzt/fE3DzQwFymBMMML274hG9Jw2/aesQv9q
	RXUmmIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiKs-0000000AH1d-3CCf;
	Tue, 26 Aug 2025 01:18:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiIC-0000000AGrD-24ep
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 26 Aug 2025 01:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BDhBrrex6g5QaN9laTXmAgCa/05IrHo33281B3Hc3OE=; b=cRPzHwlH2A3CccIXuAgXAm325Y
	nHSRVbx9IlUvvyZdZic8uyC2HzX5LNitVMRtZVdLqAvvUyKTce8HffoUUtbC1NccCL/EF9XoQCgsT
	jNMQKTo7/ppJb9zQ7QuBHFw4feUYZ7LZsDeGtA1NJbEir05/tktnu45kFpyPv7P/Hm21JztRQmSv/
	3NYEyXxwPTE1M9MkW9sRb+Kytt5tirClX3ySgYyJtDgci6vWOeCR9rVLUkRhBm9VhbsLWmMEEM11I
	exXwfqKsHXy8J4qp6u99TgTJn6UsP/yZQnoeBkWAGo1pVIhior2o2lQzNoc+pdW0dHZY32a2z/pBB
	PeIlKbLw==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiI6-000000026hr-22ru
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 01:16:07 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id EC06C211829B; Mon, 25 Aug 2025 18:15:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC06C211829B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1756170957;
	bh=BDhBrrex6g5QaN9laTXmAgCa/05IrHo33281B3Hc3OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCOaDPbrhTWDx26NAZDc9zk+UaPWJQFOnMx5s6aDmbJWEJtnk+D0lvohw3+XojSPK
	 Qv3pWi6wrhkhJMYhP0mVuPXz/iBl6yuihWoQs/Zmwfrsd+rddgzfRP3dWr8jAaSeUM
	 F+DYnYoRI+Wyl5NUEWaHe385v3/AAG5+kS1Nf69M=
Date: Mon, 25 Aug 2025 18:15:57 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com, robh@kernel.org,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI
 devices
Message-ID: <20250826011557.GA2980@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
 <20250808121515.GE377696@ziepe.ca>
 <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250815003958.GE599331@ziepe.ca>
 <20250815023236.GA30997@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250818155310.GG599331@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818155310.GG599331@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_021602_980010_AF2BC525 
X-CRM114-Status: GOOD (  24.07  )
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

Hi Jason,

On Mon, Aug 18, 2025 at 12:53:10PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 14, 2025 at 07:32:36PM -0700, Shyam Saini wrote:
> > On Thu, Aug 14, 2025 at 09:39:58PM -0300, Jason Gunthorpe wrote:
> > > On Thu, Aug 14, 2025 at 04:30:18PM -0700, Shyam Saini wrote:
> > > > or were you referring to [2]?
> > > > 
> > > > In that case, the PCI child node data needs to be parsed, which is
> > > > currently handled individually by each host controller driver.
> > > 
> > > Yes, this looks like it may be what I was thinking of, the pci@1,0
> > > specifes the BDF effectively
> > 
> > In that case, we'll need to parse the child DTS nodes properly
> > within of_iommu_get_resv_regions(). I'll include this in v4.
> 
> Kinda surprised this isn't happening already? It would be good to
> refer to the original specs and describe how whatetever you propose is
> aligned there.

Just to confirm, does the v3 version of this series look good to you?
If so, I’ll go ahead and respin the series with the iommu_set_sw_msi()
change and address the other review comments from Jacob.

Otherwise having pci devices nodes in the fdt or dts needs additional
handling, let me know your preference :)

> 
> > > Presumably this is a fixed issue of the platform. You never did
> > > explain how your system has such werdio behavior, or how something
> > > like iommu=pt can function on it...
> > Yes, this issue is platform-specific. On this platform, the default MSI IOVA
> > range overlaps with an address region that is reserved for another purpose,
> > Other than that we haven't observed any obvious issues for DMA operations
> 
> Usually DRAM is at the default MSI IOVA address, so if you run
> iommu=pt then presumably your DRAM map has a nice hole in it.. But
> maybe the memory map told the OS about that.
>
 
our DRAM for this platform starts at higher offset, way beyond MSI_IOVA.


Thanks,
Shyam 

