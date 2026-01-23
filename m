Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93103D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D57JNkS+49f708+rij13SXe+bfYTIefVNh6ybtQ6MpA=; b=JK67W8YjA+HnzmXDXonVVYl+Ix
	EkS1Dp9qbE0yzR8ERxZIdUrP4pRO4z5Cyn1VHDZCNXLbg5+8q0cUVNm76ayk5E+7epN+TfGJDbcn3
	+BRSgv75lUmQRhW8R65PRFtOOFob04a9utV7sqXuB4/PJB4swtr6Qf9sahXXZ9h2UVz9UBfTJ2Ol6
	XziF28UArhVeXoCh89UmZb3ikTCEPVmZD4wghIvqytIFXKNVuurepDKr9pssKbED8Z7p9tzPDOWid
	nlv0AZLc+Yd+cH2jn0K3El6NQXb67Qv8ZdopP92kNKLYscCntb8dfd0+PcDBajAd4mujCjxRiDCxb
	d1RTl1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOAL-00000009UWj-11BC;
	Fri, 23 Jan 2026 20:54:01 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOAI-00000009UW1-28CI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 20:54:00 +0000
Date: Fri, 23 Jan 2026 14:53:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769201633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D57JNkS+49f708+rij13SXe+bfYTIefVNh6ybtQ6MpA=;
	b=ZnH0wKL7V4AzqdF2+UteZAwtP250tR69sZHujXIR1CJx3JU/fpLTmelFkvlMZVCtJbG4xy
	IobF1/JwBMPo54B+MzyPuFGgV2aNVsBoIDIvxPhm9uNXtxowaHViIFzCdj8CBor9zHvGqZ
	42QEKF5m6NyamKfn4xGhhunujnt06d0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, alexandru.elisei@arm.com, 
	eric.auger@redhat.com, maz@kernel.org, kvmarm@lists.linux.dev, 
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [kvm-unit-tests PATCH v6 00/14] arm64: EL2 support
Message-ID: <wjivmdycgamisp6zbplolorxvqcf4aui7khtezed7dusiweybe@chjqcekg5q5g>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
 <ixq5fcyiey4prwl5luzlemznvjd6hk2pqj73rmlinnl233gfdy@b6mns7sf3dv5>
 <20260123193015.GA2258507@e124191.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123193015.GA2258507@e124191.cambridge.arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_125358_973337_C4A8C376 
X-CRM114-Status: GOOD (  22.50  )
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

On Fri, Jan 23, 2026 at 07:30:15PM +0000, Joey Gouly wrote:
> On Fri, Jan 23, 2026 at 01:23:41PM -0600, Andrew Jones wrote:
> > On Fri, Jan 23, 2026 at 04:50:39PM +0000, Joey Gouly wrote:
> > > Hi all,
> > > 
> > > This series is for adding support to running the kvm-unit-tests at EL2.
> > > 
> > > Changes since v5[1]:
> > > 	- make debug bp/wp skip on EL2
> > > 	- fix microbench test
> > > 	- add to CI
> > > 	- applied the fixup's Drew talked about in v5
> > > 
> > > About this failure in micro-bench:
> > > 
> > > 	- micro-bench hits the assert in gicv3_lpi_alloc_tables()
> > > 		lib/arm/gic-v3.c:183: assert failed: gicv3_data.redist_base[cpu]: Redistributor for cpu0 not initialized. Did cpu0 enable the GIC?	
> > > 
> > > in micro-bench.c lpi_prep() looks like this:
> > > 
> > > 	static bool lpi_prep(void)
> > > 	{
> > > 	        struct its_collection *col1;
> > > 	        struct its_device *dev2;
> > > 	        if (!gicv3_its_base())
> > > 	                return false;
> > > 
> > > QEMU by default runs with gic-v2, so gicv3_its_base() should have returned
> > > false and the lpi tests skipped. However because of the overflow mentioned in
> > > the first commit (new to v6), the its_data.base was being overwritten to a
> > > non-zero value.  This meant the test tried to do gic-v3 things on a gic-v2.
> > 
> > Nice work on the micro-bench/gic issue. Unfortunately the timer test still
> > times out, and that breaks the new CI since that test is listed.
> 
> Can you drop the timer from the CI commit while I investigate? It passes here,
> but I can try look more into. If everything else is working will be nice to
> merge.
>

Done. Hopefully you'll find a way to reproduce the timer issue and get it
fixed soon.

Thanks,
drew

