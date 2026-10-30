Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9D6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3xqwb5Eg;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=d9+IfE5w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MZqMRfPEVUiuMNxLqgmTIf03oB0BvArhy/TSmIC7oCY=; b=3xqwb5Eg4a/QQaiNA2EepGB9SK
	2U6SgODR5TCYTAEZzkUi5Fhk51u+OUOUSprvoaDdk6C30yf+Ece2pPWuXOelyG43AxbPW/1u05rtp
	NvKLsZKljSipBwfJA+zzefrw8vIa0ifhFzREWIegUZC8jhGlarQBrK9Pt7KgtVGNCG/YCh2rFWdLd
	WOkuH4n6CClVyyRocPyti3V5NROh5zbgKXrYAb+olEGZE58is2LWpNvOM4et0uDyTWDsBCDtXzFM0
	uhG4nDa55OHM0vZHAzkR10lYzNOpfsmm71QFQFwxc7tOUvzdIIgai5vi8QAr3d66vr8yx2yISsGRE
	BMS0/Q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkBw-0000000BS58-0J0q;
	Fri, 30 Oct 2026 10:50:36 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkBs-0000000BS3x-30bP;
	Fri, 30 Oct 2026 10:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1793357432; x=1824893432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Bk02kov5eXaN4fQMM0pbL4dj5jWKbTsBzV8w285UiE=;
  b=d9+IfE5wQhAuevrMCVvjmFfLpV+pESxVF7+yuJ//BCJ7/wll+5ymcuzi
   MXGULe1514uARAGrUytZeqOxcdbr080OHQ8AUTKessUmCEsIqLDdDBQ8M
   0GEEtI+DB4tUYElLL7m0mGY06JhZ7OuMGLRVeINzAWB7J2SIi6k86pGOW
   32PGOU3qKRUNVnrliecsXDYI/VPeTsZ8x9xHDZAeFtU+rRpX28o14EFHQ
   PSOl2sop7s7xOo74yJHu5fDxBf7xHMQYalkOWV1EgsJ3Q+2666a+BmDeR
   q4/mhpkfDwf7ALx5SAhreJFEV1Zns3RRgfbnzWURbczqtM2M5klQYl+Qo
   A==;
X-CSE-ConnectionGUID: mxtg+VX6S+SQXV01iN1vrA==
X-CSE-MsgGUID: TlLF9SNCQtWHL0r8HYYLSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="264079886"
X-IronPort-AV: E=Sophos;i="6.27,186,1786978800"; 
   d="scan'208";a="264079886"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:50:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B340E1C00C91;
	Fri, 30 Oct 2026 10:50:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 66564C041EA;
	Fri, 30 Oct 2026 10:50:28 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.203.66])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with SMTP id EC18C140769F;
	Fri, 30 Oct 2026 10:50:23 +0000 (UTC)
Date: Fri, 30 Oct 2026 19:50:20 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	x86@kernel.org
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
Message-ID: <auR0fT1yrKQ9wbm8@FCCLS0092175.localdomain>
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
 <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck>
 <asYZFXGyafRjjBS0@arm.com>
 <asYiOgskwi8JYLe_@willie-the-truck>
 <yq5awlrt3dwo.fsf@kernel.org>
 <yq5av77c92oo.fsf@kernel.org>
 <aseRzPshcoys7AJS@arm.com>
 <yq5ao6d48dqr.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yq5ao6d48dqr.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_035033_261266_BF7BFE42 
X-CRM114-Status: GOOD (  49.35  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/08 20:02, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
> > On Thu, Oct 08, 2026 at 11:03:27AM +0530, Aneesh Kumar K.V wrote:
> >> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> >> > Will Deacon <will@kernel.org> writes:
> >> >> On Wed, Oct 07, 2026 at 11:04:05AM +0100, Catalin Marinas wrote:
> >> >>> On Tue, Oct 06, 2026 at 10:49:17PM +0100, Will Deacon wrote:
> >> >>> > On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> >>> > > @@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
> >> >>> > >  	if (swiotlb_force_disable)
> >> >>> > >  		return SWIOTLB_POOL_NONE;
> >> >>> > >  
> >> >>> > > -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> >> >>> > > +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> >> >>> > > +	    !restricted_dma_pool_present)
> >> >>> > >  		return SWIOTLB_POOL_CC_GUEST;
> >> >>> > 
> >> >>> > I think this check on the restricted DMA pool is too general -- the pool
> >> >>> > could be tied to a specific DMA-capable peripheral and so treating its
> >> >>> > presence as a global property isn't right.
> >> >>> 
> >> >>> I agree it's a hack but that was the simplest way to avoid the pVMs
> >> >>> getting a bounce buffer after this patch. More than happy to leave it
> >> >>> out and reduce the buffer on cmdline or we come up with some better
> >> >>> heuristics.
> >> >>
> >> >> Hrm, that does mean that reverting just this part will regress pVMs
> >> >> because they'll suddenly be allocating a tonne more memory for an
> >> >> entirely unused swiotlb buffer. So I think I'd prefer to drop the entire
> >> >> series until this has been worked out properly.
> >> >>
> >> >>> Another option could be the arch code passing another flag that it
> >> >>> doesn't want an encrypted pool (e.g. when running in a pKVM guest) but I
> >> >>> don't particularly this either. The arch code doesn't know whether
> >> >>> there's an alternative pool.
> >> >>
> >> >> At that point, the default size may as well be driven by the
> >> >> drivers/virt/coco driver.
> >> >>
> >> >>> That said, such heuristics should have been a separate patch to make it
> >> >>> easier to review/drop.
> >> >>
> >> >> I think the only right way to get a semi-accurate heuristic is to take
> >> >> into account the set of dma-capable devices that will use the swiotlb
> >> >> pool, but that's fiddly and should probably be tackled as a separate
> >> >> series. Maybe a simpler hack in that direction would be to take the
> >> >> SWIOTLB_POOL_CC_GUEST if _any_ device is going to use swiotlb? You'll
> >> >> run into the usual problem of not being able to tell if a device is
> >> >> DMA-capable or not, but you could probably look for a global restricted
> >> >> DMA pool and, if that doesn't exist, check for per-device restricted pools
> >> >> on dma-coherent devices (since restricted DMA isn't supported by ACPI) as
> >> >> a reasonable approximation.
> >> >
> >> > So, something like this?
> >> >
> >> > 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> >> > 	    swiotlb_cc_guest_needs_default_pool())
> >> > 		return SWIOTLB_POOL_CC_GUEST;
> >> >
> >> 
> >> Detecting a DMA-capable device is not straightforward, and if we get it
> >> wrong, we will enable SWIOTLB_POOL_CC_GUEST unnecessarily. Would the
> >> code below be a reasonable approximation of what you suggested?
> >> 
> >> Another option would be to make swiotlb_cc_guest_needs_default_pool() a
> >> weak function that architectures can override. arm64 pKVM could then use
> >> a different scheme (for this patch series default to false). Would that
> >> be preferable?
> >
> > Even the rmem check for each device is still a hack that may bite us in
> > the future (private devices for example would not need swiotlb). I'm
> > thinking more and more of leaving the sizing an arch-specific decision,
> > don't bother generalising it at all.
> >
> > On pKVM vs CCA guests, there's really nothing specific here to pKVM
> > guests. The only difference is that confidential guests that so far have
> > run without a swiotlb buffer will regress if their memory is tight. For
> > confidential guests without dedicated rmem (either CCA or pKVM), I think
> > our options are either command line swiotlb sizing or dynamic swiotlb.
> >
> > Could you respin your series while leaving out the generic sizing? IOW,
> > no x86 code generalisation. We can discuss the best strategy on sizing
> > later (I haven't checked how much of this series still makes sense
> > without the generic sizing).
> >
> 
> It would mostly consist of the first three cleanup patches, followed by
> three patches that replace the addressing_limit argument with flags.
> 
> #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
> /* Initialize a pool for devices with limited DMA addressing. */
> #define SWIOTLB_INIT_ADDRESSING_LIMIT	(1 << 1)
> /* Initialize a pool that requires architecture remapping. */
> #define SWIOTLB_INIT_REMAP		(1 << 2)
> /* Initialize a pool for DMA to memory-encrypted host or guest memory. */
> #define SWIOTLB_INIT_MEM_ENCRYPT		(1 << 3)
> /* Initialize a pool for unaligned kmalloc bouncing. */
> #define SWIOTLB_INIT_KMALLOC		(1 << 4)
> /* Do not initialize a pool unless SWIOTLB is explicitly required. */
> #define SWIOTLB_INIT_DEFAULT_OFF		(1 << 5)
> 
> This results in the large change below. I'm not sure we want to do this
> for no real benefit other than making swiotlb_should_init() slightly
> easier to follow.
> 
> static bool __init swiotlb_should_init(unsigned int flags)
> {
> 	if (swiotlb_force_disable)
> 		return false;
> 
> 	if (swiotlb_force_bounce)
> 		return true;
> 
> 	if (flags & (SWIOTLB_INIT_REMAP | SWIOTLB_INIT_MEM_ENCRYPT)))
> 		return true;
> 
> 	/* Explicit requirements override an architecture's default opt-out. */
> 	if (flags & SWIOTLB_INIT_DEFAULT_OFF)
> 		return false;
> 
> 	return flags & (SWIOTLB_INIT_ADDRESSING_LIMIT | SWIOTLB_INIT_KMALLOC);
> }
>  [...]

Hi Aneesh,

I can reproduce the CCA regression discussed in this thread:
  https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/#t

The guest runs out of SWIOTLB slots, causing disk I/O to fail and
preventing the guest from booting.

I would like to test the fix on real CCA hardware. Could you please Cc
me when you respin the series? I follow LKML, but I may still miss the
posting by chance.

Thanks,
Kohei

