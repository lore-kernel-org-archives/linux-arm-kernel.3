Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177C6E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DekXU6ewZrAgFHRTWcWkn/UiaJxMQ2YfZEPni4aeitk=; b=TL+PPH+eMNAsVe5fiTSEINOSPS
	I2TDVRt1kNbZ7nDpY9WYJpw/B7FkuXO8NBYjEN7XZcjEo/eniiwOR7hTo12c0QbhGJBowo1n6ERP3
	nFAqoBWQfIyOMJ7wmrtIAsJKuDkx2XC+DsmAShhaTtlu2qkJ11eKNLj3b3lngNvcx+ugqbdva/WK9
	EiACh+BpBSR4S30P2W2RrbSI/TyU2zkvSo+jmO9+XZEdAA1eCSBf1AWYVkD2bNs9OUk+bGcDbzM7X
	ErSFub0Aim4vhjAJ99dJwpVzk6UCnzssae71l7ERO204oudTKWbVNfllUtMQuz9HTFy5cWfQsPc1j
	GYbKGl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTkN-0000000Feo1-0YyI;
	Mon, 09 Feb 2026 16:04:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTkK-0000000Femv-0c80
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 16:04:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ABFA339
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Feb 2026 08:04:08 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B77B73F63F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Feb 2026 08:04:14 -0800 (PST)
Date: Mon, 9 Feb 2026 16:02:18 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Karunika Choo <karunika.choo@arm.com>,
	Liviu Dudau <liviu@dudau.co.uk>
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs
 page table format
Message-ID: <aYoFCsNtwW3uAWXZ@e142607>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
 <0af5b5f3-912a-4f16-a68b-032617576537@arm.com>
 <aYngwtq_GtBYGjOC@e142607>
 <ac5c3df0-1d94-4a1c-9eec-a359096cfce5@arm.com>
 <aYn7obNImaI72MhK@e142607>
 <20260209163534.45b0ec7a@fedora>
 <d129d0cd-ac01-40e5-92b7-77518bf32b3b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d129d0cd-ac01-40e5-92b7-77518bf32b3b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_080421_018266_5BDD0B3B 
X-CRM114-Status: GOOD (  42.79  )
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

On Mon, Feb 09, 2026 at 03:44:07PM +0000, Steven Price wrote:
> On 09/02/2026 15:35, Boris Brezillon wrote:
> > On Mon, 9 Feb 2026 15:22:09 +0000
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > 
> >>>> Ultimately the role of this RFC is to start a discussion and to figure out a path
> >>>> forward for CSF GPUs where we want now to tighen a bit the formats we support and
> >>>> add PBHA and in the future we want to add support for v15+ page formats.  
> >>>
> >>> PBHA is definitely an area for discussion. AIUI there are out-of-tree
> >>> patches floating about for CPU support, but it hasn't been upstreamed. I
> >>> don't know if any serious attempt has been made to push it upstream, but
> >>> it's tricky because the architecture basically just says "IMPLEMENTATION
> >>> DEFINED" which means you are no longer coding to the architecture but a
> >>> specific implementation - and there's remarkably little documentation
> >>> about what PBHA is used for in practice.
> >>>
> >>> I haven't looked into the GPU situation with PBHA - again it would be
> >>> good to have more details on how the bits would be set.  
> >>
> >> I have a patch series that adds support in Panthor to apply some PBHA bits defined
> >> in the DT based on an ID also defined in the DT and passed along as a VM_BIND parameter
> >> if you want to play with it. However I have no direct knowledge on which PBHA values
> >> would make a difference on the supported platforms (RK3xxx for example).
> 
> So we need something better than a DT entry saying e.g. "ID 3 is bit
> pattern 0100". We need something that describes the actual behaviour of
> a PBHA value. Otherwise user space will end up needing to know the exact
> hardware platform it's running on to know what ID values mean.

Yes, the reason why I haven't published the Panthor patches yet is because of that.
DDK currently has a set of memory group classes that we can clean up and publish
that will define that ID 3 (e.g.) is for "inner shareable memory" and then the
DT specifies what bits need to be encoded in the PBHA to achieve that on the
target system. I don't think we can standardise the PBHA bits as their use
by the system integrator is specific to a vendor or sometimes even to a given SoC.

> 
> > I don't know if that's what it's going be used for, but one very
> > specific use case I'd like to see this PBHA extension backed by is
> > "read-zero/write-discard" behavior that's needed for sparse bindings.
> > Unfortunately, I've not heard on any HW-support for that in older
> > gens...

I'm not aware of any existing SoC that supports that, but it is something we're
looking into supporting in the v15+ GPUs.

> 
> *This* is a good example of something useful that could be exposed. If
> the DT can describe that the hardware supports a
> "read-zero/write-discard" with a specific bit pattern, then we can
> advertise that to user space and provide a flag for VM_BIND which gives
> that behaviour. And user space can make good use of it.
> 
> But from what I've heard the implementations tend to have something more
> like a hint-mechanism where it affects the behaviour of the caches but
> not the functional effect. This makes it much harder to expose to user
> space in a meaningful way because it's highly platform dependant what
> "don't allocate in the system level cache" actually means in terms of
> performance effects. But it's possible we could describe more of a usage
> based flag - i.e. "PBHA bits good for a tiler heap".

See above. The idea is to have up to 255 IDs that have some select values properly
defined in their intent and leave the rest for partner use. You then add the ID
to the VM_BIND call and it gets applied to the BO's pages.

Best regards,
Liviu

> 
> Thanks,
> Steve
> 

