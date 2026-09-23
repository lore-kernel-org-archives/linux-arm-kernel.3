Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591ACC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExOume0RxNp+eQGZM9E2Gpt9Yr0okaIsouUpEfdruVo=; b=Vt9dWe7OOBuycvLhoRBBOuCn3o
	OR39rHm57wHPqdpp2GEAozRUe/FRb3f6Y2tVbTz9zmq96XuPD+YyJ61+QWfL+7GJZf/OBgl4V1rRo
	vO+PH831T+n58wFpzMMtQLPIoutJq1V4M0yAFmQgOXoeNlYst+dW729xLCjQ949THOWMpQhzAfZGB
	uN1pq2iTLbJYeyO0Nxfm7T2OUByVvcPo1lKaXq8nPWquq/kkQ8PBy5OKMTpzlRnXcH/YdmSmNvFkm
	npVXC//5avBx2Ty4I/C9vxxybj17cvyBRNut42L/8FzAc8kb1fH87c6eTsWgYfrL1DjNrbdVe9HTR
	wQzaEyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PUL-00000008ppV-1U5W;
	Wed, 23 Sep 2026 16:06:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PUJ-00000008pp8-2jiJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 16:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ExOume0RxNp+eQGZM9E2Gpt9Yr0okaIsouUpEfdruVo=; b=HMw0peQrmP0BHaPPadwkAU/hwz
	sMgh33iTqQECrjG+QH4YNhVxa2xle3TP9FzHuyqkovaElvFIOP87GR9ow9hWBBbog7S+nkzNPIjR8
	+pNxBA9+1hSiCwGE5DBaIhzQ4/ePZ4SbHVpvWM6VDYY3ToE+XWCr4jP+jkY7qaR5SHDPhnLu5ZecR
	LpsY3fmTLXS9xe7WItWZpKT8VyXdQjYsWH0Qbb/xfwFDxZ5aFl9WWN7hehNt2DiLPvUA3tMBqyKYs
	jtsLyZSi1vZ6hSYMyCzT4PhYj+nWQ/4YjvNvu8bIaCTXbo8ETAkxJ9muZAirqEFZk9j5gFpZ+e9td
	ISSuIsYw==;
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9PUE-0000000EzM5-0iL9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:06:25 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-zsqw.prod.antispam.mailspamprotection.com; s=arckey; t=1790179582;
	 b=hOxfBrSgqoEG1jLWQ/Izc0HTn+VTnb7fituJ+cuDB8SjlIWmw5GWojTnkI7DyUK+jpK0kFjLxe
	  W1OikIdEUH0OnnC1DRKkD5rCvHBf4nh/CMMwqStxpyQF008kofUPiDIvz6e4MFpyrhhz/RgTBr
	  jVJLGAJrz7igg38XMtO7pGzGf6bUy+5wRSFnuKMTxqPDUr2jSam47OKEYhl5Z5EqK5WtS2YHDW
	  r2n+BGMPZhBgEDxb//LUq5AjMwK5RaacJyyHdk2Myo5wF8KctI22q0hChp0crMG+ettMvmjeDs
	  KfyFp2vPSaCeAu3o1ZQcTr7hvKCIL59rpq4xKNyL+hRkvw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-zsqw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-zsqw.prod.antispam.mailspamprotection.com; s=arckey; t=1790179582;
	bh=IkleXA3PhsAe26br548CaGLPW3um7HiKfzluT6wlItE=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=CvXwT8TemcT1FR/kulmC3IB98N6pDAsb0OHBjjrOmJMVQxv5fiJjFoj9Um2pb6EY32Wxn+95xc
	  Lghj4FIidCf4Ux2cb9qzdUSmam3YuGQve6tZ5vvUZ3sSnUA3fMlbkCJCemvmVX4r7TTg5PY8TR
	  J9VGfxm+5U2K1BFE74P0or+TftXyYm1dVURDwxdMUG8utDv49k7CdKkprG91Ea3V8fGErZv9J5
	  EGY9F2Ic7FdM9eUecojYb5lbAFbOXE0FTBKdJiZREvli6ZX5PsIWq/miNZGdPHqFEOLRQvfFid
	  foBLhqMjpZOy/5kZspS5jONwqfO4dRjJ4eb2U0TGlLcgdA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=ExOume0RxNp+eQGZM9E2Gpt9Yr0okaIsouUpEfdruVo=; b=PqR0S05kQ0mz6dY2ddLJDZipL/
	7x2dXweR6DWgBCBBWYAzaYic0+jwngACK9d01ecu93q575oNB3eca4+s8T0AC4TgJV8ttOW/DS0Tx
	Ij5iHzz+MBhiO3K+h1sShD2ko6oIc+ALL1dZu/L/lPHCLid6GCZCHo3K0fM9MV2rjouY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-zsqw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1x9PTx-000000047Vg-1573
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ExOume0RxNp+eQGZM9E2Gpt9Yr0okaIsouUpEfdruVo=; b=s4i9PNzTPS62uqMOP/zZ9XctFI
	jIElpj7SRnkH0ZaguZf78ZyKYruKevLb9KBtK57yE+YWCCUwi/tSHNCZAmFqcf8pwQebSBrcXQU6O
	swQN8EKNBoG9Bko/jF5glgrDil4PnDtsDmOYHiWM5Q5RD0zIU84EGZ0AHwRznGt1Tm6k=;
Received: from [79.45.60.29] (port=59672 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1x9PTV-00000000GNB-0mZC;
	Wed, 23 Sep 2026 16:05:37 +0000
Date: Wed, 23 Sep 2026 18:05:35 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
Message-ID: <arP38OEaabFFu8lJ@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
 <arKlvZGqu2nt6Ci0@p14s>
 <arLXthhYbKkwZ9zY@bywater>
 <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: facba70af1af7461bd6b8757015d13e7
X-AntiAbuse: ID - facba70af1af7461bd6b8757015d13e7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x9PTx-000000047Vg-1573-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-zsqw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_170623_404887_CB810987 
X-CRM114-Status: GOOD (  55.40  )
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

On Wed, Sep 23, 2026 at 08:44:41AM -0600, Mathieu Poirier wrote:
> On Tue, 22 Sept 2026 at 13:39, Francesco Valla <francesco@valla.it> wrote:
> >
> > On Tue, Sep 22, 2026 at 09:58:53AM -0600, Mathieu Poirier wrote:
> > > On Wed, Sep 16, 2026 at 11:10:51PM +0200, Francesco Valla wrote:
> > > > Depending on the driver originating them, data buffers used for virtio
> > > > communication can either:
> > > >
> > > >   - already be allocated from the coherent memory area that is
> > > >     accessible by the remote processor; this is the case of rpmsg
> > > >     and the rproc flavor of virtio-console;
> > > >   - be allocated from generic kmem, and thus not accessible directly by
> > > >     the remote processor.
> > > >
> > > > Exploiting the map operations, which are used by the virtio framework
> > > > when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
> > > > bounce buffering for the second case: when the map() callback is called
> > > > for a buffer, one or more pages of coherent memory are allocated and
> > > > data is copied to them, then they are exposed to the remote processor;
> > > > the data is  then bounced back on unmap().
> > > >
> > > > The first case is not impacted, since buffers already suitable for
> > > > remote transmission are passed through.
> > > >
> > > > With the bounce buffering in place, any kind of virtio device can be
> > > > supported through the remoteproc-virtio transport, at least from a
> > > > data exchange standpoint.
> > >
> > > Is this _necessary_ for the imx93 platform you are implementing feature for?
> > >
> >
> > If I don't want to fundamentally change how the remoteproc integration
> > works (i.e.: using buffers only from a pre-shared area), yes. While in
> > my test environment the Cortex-M33 serving as remoteproc is able to
> > access the whole RAM space, that is not always the case.
> 
> The first sentence tells me it is mandatory while the second says it
> is not.  I understand the use case but don't want to bloat the
> subsystem with code that is trying to address a problem you currently
> don't have.
> 

Let me rephrase: while on i.MX93 the Cortex-M33 can theoretically access
the whole RAM space, that is not a good idea from a security point of
view and can be the source of a number of bugs. The target is to
statically define a static shared memory area (as I am doing on i.MX95)
and only use that.

> 
> > This is even more important for mixed-criticality-ready processors (say:
> > i.MX95), where access to different memory areas si defined even before
> > the various application cores are started.
> >
> > For the sake of completeness, there *might be* a completely different
> > approach that would work: modify every virtio driver to make sure they
> > allocate buffers from the pre-shared memory area (that is, the coherent
> > memory pool). That approach would even avoid the bounce buffering and
> > allow for zero-copy transmission. I even started working on that,
> > defining virtio helpers to do the allocations instead of using raw
> > kmallocs, but then I dropped the idea because of the magnitude of the
> > changes required.
> >
> > > >
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_virtio.c | 182 +++++++++++++++++++++++++++++++--
> > > >  include/linux/remoteproc.h             |  14 +++
> > > >  2 files changed, 190 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > > index cfd66d9d1c9e..d21b3b8044df 100644
> > > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > > @@ -241,7 +241,14 @@ static void rproc_virtio_reset(struct virtio_device *vdev)
> > > >     dev_dbg(&vdev->dev, "reset !\n");
> > > >  }
> > > >
> > > > -/* provide the vdev features as retrieved from the firmware */
> > > > +/* Provide the vdev features as retrieved from the firmware, plus the following
> > > > + * additional ones:
> > > > + *   - VIRTIO_F_VERSION_1 that is required by some non-rpmsg virtio devices
> > > > + *   - VIRTIO_F_ACCESS_PLATFORM to force usage of the map operations
> > > > + */
> > > > +#define RPROC_VIRTIO_STATIC_FEATURES \
> > > > +   ((1ULL << VIRTIO_F_VERSION_1) | (1ULL << VIRTIO_F_ACCESS_PLATFORM))
> > > > +
> > > >  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > > >  {
> > > >     struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> > > > @@ -249,7 +256,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > > >
> > > >     rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> > > >
> > > > -   return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
> > > > +   return rsc->dfeatures | RPROC_VIRTIO_STATIC_FEATURES;
> > > >  }
> > > >
> > > >  static void rproc_transport_features(struct virtio_device *vdev)
> > > > @@ -275,16 +282,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > > >     /* Give virtio_rproc a chance to accept features. */
> > > >     rproc_transport_features(vdev);
> > > >
> > > > -   /* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> > > > +   /* Make sure we don't have any features > 32 bits */
> > > >     if (WARN_ON_ONCE((u32)vdev->features !=
> > > > -                    (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> > > > +                    (vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES)))
> > > >             return -1;
> > > >
> > > >     /*
> > > >      * Remember the finalized features of our vdev, and provide it
> > > >      * to the remote processor once it is powered on.
> > > >      */
> > > > -   rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
> > > > +   rsc->gfeatures = vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES;
> > > >
> > > >     return 0;
> > > >  }
> > > > @@ -337,6 +344,151 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
> > > >     .set            = rproc_virtio_set,
> > > >  };
> > > >
> > > > +static inline unsigned int rproc_virtio_bounce_slot(struct device *dma_dev,
> > > > +                                               dma_addr_t dma_handle)
> > > > +{
> > > > +   const dma_addr_t dma_base = dma_dev_coherent_base(dma_dev);
> > > > +
> > > > +   return (dma_handle - dma_base) >> PAGE_SHIFT;
> > > > +}
> > > > +
> > > > +static dma_addr_t rproc_virtio_map_page(union virtio_map map, struct page *page,
> > > > +                                   unsigned long offset, size_t size,
> > > > +                                   enum dma_data_direction dir,
> > > > +                                   unsigned long attrs)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +   struct rproc_vdev *rvdev = dev_get_drvdata(dev);
> > > > +   dma_addr_t dma_base = dma_dev_coherent_base(dev);
> > > > +   size_t dma_size = dma_dev_coherent_size(dev);
> > > > +   phys_addr_t paddr = page_to_phys(page) + offset;
> > > > +   void *vaddr = page_to_virt(page) + offset;
> > > > +   struct rproc_map_record *record;
> > > > +   dma_addr_t map_handle;
> > > > +   void *bounce;
> > > > +
> > > > +   // No need to allocate a bounce buffer if the memory to map is already
> > > > +   // part of the device's coherent pool.
> > > > +   if (paddr >= dma_base && paddr < (dma_base + dma_size)) {
> > > > +           // The allocation details will be recorded also in this case,
> > > > +           // indicating that no bounce buffer was allocated.
> > > > +           map_handle = (dma_addr_t)paddr;
> > > > +           bounce = NULL;
> > > > +   } else {
> > > > +           // Allocate bounce buffer from device coherent memory
> > > > +           bounce = dma_alloc_coherent(dev, size, &map_handle, GFP_KERNEL | __GFP_ZERO);
> > > > +           if (!bounce)
> > > > +                   return DMA_MAPPING_ERROR;
> > > > +
> > > > +           // Copy data to bounce buffer
> > > > +           memcpy(bounce, vaddr, size);
> > > > +   }
> > > > +
> > > > +   // Save bounce details
> > > > +   record = &rvdev->map_records[rproc_virtio_bounce_slot(dev, map_handle)];
> > > > +
> > > > +   record->original = vaddr;
> > > > +   record->size = size;
> > > > +   record->bounce = bounce;
> > > > +
> > > > +   return map_handle;
> > > > +}
> > > > +
> > > > +static void rproc_virtio_unmap_page(union virtio_map map, dma_addr_t map_handle,
> > > > +                               size_t size, enum dma_data_direction dir,
> > > > +                               unsigned long attrs)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +   struct rproc_vdev *rvdev = dev_get_drvdata(dev);
> > > > +   unsigned int slot = rproc_virtio_bounce_slot(dev, map_handle);
> > > > +   struct rproc_map_record *record = &rvdev->map_records[slot];
> > > > +
> > > > +   WARN_ON(size != record->size);
> > > > +
> > > > +   // If a bounce buffer was used, copy data back to original one
> > > > +   if (record->bounce) {
> > > > +           memcpy(record->original, record->bounce, record->size);
> > > > +
> > > > +           dma_free_coherent(dev, record->size, record->bounce, map_handle);
> > > > +   }
> > > > +
> > > > +   record->original = NULL;
> > > > +   record->size = 0;
> > > > +   record->bounce = NULL;
> > > > +}
> > > > +
> > > > +static void rproc_virtio_sync_single_for_cpu(union virtio_map map,
> > > > +                                        dma_addr_t map_handle,
> > > > +                                        size_t size,
> > > > +                                        enum dma_data_direction dir)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +
> > > > +   dma_sync_single_range_for_cpu(dev, (map_handle & PAGE_MASK),
> > > > +                                 offset_in_page(map_handle), size, dir);
> > > > +}
> > > > +
> > > > +static void rproc_virtio_sync_single_for_device(union virtio_map map,
> > > > +                                           dma_addr_t map_handle,
> > > > +                                           size_t size,
> > > > +                                           enum dma_data_direction dir)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +
> > > > +   dma_sync_single_range_for_device(dev, (map_handle & PAGE_MASK),
> > > > +                                    offset_in_page(map_handle), size, dir);
> > > > +}
> > > > +
> > > > +static void *rproc_virtio_alloc(union virtio_map map, size_t size,
> > > > +                           dma_addr_t *map_handle, gfp_t gfp)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +
> > > > +   return dma_alloc_coherent(dev, size, map_handle, gfp);
> > > > +}
> > > > +
> > > > +static void rproc_virtio_free(union virtio_map map, size_t size, void *vaddr,
> > > > +                         dma_addr_t map_handle, unsigned long attrs)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +
> > > > +   dma_free_coherent(dev, size, vaddr, map_handle);
> > > > +}
> > > > +
> > > > +static bool rproc_virtio_need_sync(union virtio_map map, dma_addr_t map_handle)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +
> > > > +   return dma_need_sync(dev, map_handle);
> > > > +}
> > > > +
> > > > +static int rproc_virtio_mapping_error(union virtio_map map, dma_addr_t map_handle)
> > > > +{
> > > > +   if (unlikely(map_handle == DMA_MAPPING_ERROR))
> > > > +           return -ENOMEM;
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +
> > > > +static inline size_t rproc_virtio_max_mapping_size(union virtio_map map)
> > > > +{
> > > > +   struct device *dev = map.dma_dev;
> > > > +
> > > > +   return dma_dev_coherent_size(dev);
> > > > +}
> > > > +
> > > > +static const struct virtio_map_ops rproc_virtio_map_ops = {
> > > > +   .map_page = rproc_virtio_map_page,
> > > > +   .unmap_page = rproc_virtio_unmap_page,
> > > > +   .sync_single_for_cpu = rproc_virtio_sync_single_for_cpu,
> > > > +   .sync_single_for_device = rproc_virtio_sync_single_for_device,
> > > > +   .alloc = rproc_virtio_alloc,
> > > > +   .free = rproc_virtio_free,
> > > > +   .need_sync = rproc_virtio_need_sync,
> > > > +   .mapping_error = rproc_virtio_mapping_error,
> > > > +   .max_mapping_size = rproc_virtio_max_mapping_size,
> > > > +};
> > > > +
> > > >  /*
> > > >   * This function is called whenever vdev is released, and is responsible
> > > >   * to decrement the remote processor's refcount which was taken when vdev was
> > > > @@ -355,6 +507,8 @@ static void rproc_virtio_dev_release(struct device *dev)
> > > >     of_reserved_mem_device_release(&rvdev->pdev->dev);
> > > >     dma_release_coherent_memory(&rvdev->pdev->dev);
> > > >
> > > > +   kvfree(rvdev->map_records);
> > > > +
> > > >     put_device(&rvdev->pdev->dev);
> > > >  }
> > > >
> > > > @@ -429,13 +583,29 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > > >             of_reserved_mem_device_init_by_idx(dev, np, 0);
> > > >     }
> > > >
> > > > +   /* Allocate one tracking record for each page of the device reserved
> > > > +    * memory. Contiguous memory is not required for this array, which can
> > > > +    * also be quite big (depending on the size of the coherent memory), so
> > > > +    * let's use vmalloc for this allocation.
> > > > +    */
> > > > +   rvdev->map_records = kvcalloc(dma_dev_coherent_size(dev) >> PAGE_SHIFT,
> > > > +                                 sizeof(*rvdev->map_records),
> > > > +                                 GFP_KERNEL);
> > > > +   if (!rvdev->map_records) {
> > > > +           dev_err(dev, "failed to allocate memory for map records\n");
> > > > +           return -ENOMEM;
> > > > +   }
> > > > +
> > > >     /* Allocate virtio device */
> > > >     vdev = kzalloc_obj(*vdev);
> > > > -   if (!vdev)
> > > > +   if (!vdev) {
> > > > +           kvfree(rvdev->map_records);
> > > >             return -ENOMEM;
> > > > +   }
> > > >
> > > >     vdev->id.device = id;
> > > >     vdev->config = &rproc_virtio_config_ops;
> > > > +   vdev->map = &rproc_virtio_map_ops;
> > > >     vdev->dev.parent = dev;
> > > >     vdev->dev.release = rproc_virtio_dev_release;
> > > >
> > > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > > index c3ba51fe9e54..2ff48b505ac0 100644
> > > > --- a/include/linux/remoteproc.h
> > > > +++ b/include/linux/remoteproc.h
> > > > @@ -339,10 +339,23 @@ struct rproc_vring {
> > > >     struct virtqueue *vq;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct rproc_map_record - remoteproc map record
> > > > + * @original:      original virtual address
> > > > + * @num: allocation size
> > > > + * @bounce: bounce buffer virtual address (NULL if not used)
> > > > + */
> > > > +struct rproc_map_record {
> > > > +   void *original;
> > > > +   size_t size;
> > > > +   void *bounce;
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct rproc_vdev - remoteproc state for a supported virtio device
> > > >   * @subdev: handle for registering the vdev as a rproc subdevice
> > > >   * @pdev: remoteproc virtio platform device
> > > > + * @map_records: array of map records
> > > >   * @id: virtio device id (as in virtio_ids.h)
> > > >   * @node: list node
> > > >   * @rproc: the rproc handle
> > > > @@ -358,6 +371,7 @@ struct rproc_vdev {
> > > >     unsigned int id;
> > > >     struct list_head node;
> > > >     struct rproc *rproc;
> > > > +   struct rproc_map_record *map_records;
> > > >     u32 rsc_offset;
> > > >     u32 index;
> > > >     unsigned int num_vrings;
> > > >
> > > > --
> > > > 2.55.0
> > > >
> >
> > Regards,
> > Francesco
> >

