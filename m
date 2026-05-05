Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63141CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut/8vw0pobkEujfmgbKOqwHR1RUpqwxxxrM2MdsNypU=; b=zjZtnDzZUpRO5rCGjMYBZIxbbr
	PatBMf1HabSv8B5zNHfV/U5DXahEl0/iZvmA9l1HFIwWMnnGol28hA4Wy8yEzGDtDrGkc3v3oQO7O
	qK9l+mEI97cES2fUDZnDiritBc5m6bju1aQNlPfuHOwihS3w1kYVvPOY4sga01LjBF5+w7UnrTxgS
	WNAyp3T/8D+QYRxA1l9Tu1fxhzes29C0+8iSWRoy9WRNCD1yK+6ksb0DcQPEZm9ovmqa73q37HVd7
	eqLIhdNNGtbFk83YFYSg/E9bfEl0x+xsJ1STrGVANmTvweRUL/lZEGNdO+EyqLAnAEyNCz7rbFy+U
	zqdZXdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIp2-0000000GvUc-3RV8;
	Tue, 05 May 2026 16:40:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIp1-0000000GvU0-1bs9;
	Tue, 05 May 2026 16:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ut/8vw0pobkEujfmgbKOqwHR1RUpqwxxxrM2MdsNypU=; b=PpAcwfgrnWlIU5QQLaGgM6lhi5
	Qis9INcRsuqyKXYXOrKqRTG7BWI971jjPd0RfTavgFVuUd2l+svhbcrlFyVUTx8P4ujVLSVJtz09S
	Aob/6CR7To9eH5umnCqNwnOl+obkqzFvFMQM+7uWgwudM/+v6wF3dB8+6kdTYCiliagLCNx5+R7Yl
	73T0Y4NFnEYrwDZ3kt5WmIfJYolRYXyl008Bc6a9C9RObGzJN8zz7as2LK4UnEtysmRX5GuAJI4EB
	qbXcmDoSap6tHTCct8szVoIPGx4XJePnhuKQ46SYFEvkGtCZ0adYRVlZ4yDWiaCZisYJGkNvtyx6U
	xJI3g0vQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIoy-0000000E47O-0Us8;
	Tue, 05 May 2026 16:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777999227;
	bh=v1fIHwgfddcCmh6pGZRO/cpadp8xSOxN1BF2obFbABM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N7205ghHVDdafje5WfeBl5l41S/dIJAvAJo92TYcH0WldQVC6tZuQOpBbIkfp1HSC
	 IAbfHExmOTsVIZAn7J+1JqkufgEjWjnrqkYHlU8jqys8Qz2nFomi4tJMxrMyZrH4ZR
	 nIN0C+PRJ0keEzegdG3vnexsh2K3Yq1b/QKkO4mss0eOzmqUh0vZ9zZ9J6BDWrhHkw
	 fUQqbwO4bY/wbA7qpK+O/N+qlFBbiVBJ1fK45L4vtZeg+UA7GW/OZklM5JUs2PgTOc
	 1CN00qQU1Zllsyj9D54prWzFp6RUYSNBeraq/HSf2OBsyOWqSJV9KwNpELgAdBom15
	 H1hXEX6eJgwVQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD9A917E13B2;
	Tue,  5 May 2026 18:40:26 +0200 (CEST)
Date: Tue, 5 May 2026 18:40:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T.J. Mercier"
 <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 1/8] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20260505184021.3676f9af@fedora>
In-Reply-To: <20260505-spaniel-of-scientific-warranty-ca075e@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-2-ketil.johnsen@arm.com>
	<20260505172048.1c48e030@fedora>
	<20260505-spaniel-of-scientific-warranty-ca075e@houat>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_174032_356589_E3F7C487 
X-CRM114-Status: GOOD (  43.13  )
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

On Tue, 5 May 2026 17:39:13 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Boris,
> 
> On Tue, May 05, 2026 at 05:20:48PM +0200, Boris Brezillon wrote:
> > Hi Ketil,
> > 
> > On Tue,  5 May 2026 16:05:07 +0200
> > Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> >   
> > > From: John Stultz <jstultz@google.com>
> > > 
> > > Add proper reference counting on the dma_heap structure. While
> > > existing heaps are built-in, we may eventually have heaps loaded
> > > from modules, and we'll need to be able to properly handle the
> > > references to the heaps  
> > 
> > It's weird that this "heap as module" thing is mentioned here, but
> > actual robustness to make this safe is not added in the commit or any
> > of the following ones.
> >   
> > > 
> > > Signed-off-by: John Stultz <jstultz@google.com>
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > [Yong: Just add comment for "minor" and "refcount"]
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > [Yunfei: Change reviewer's comments]
> > > Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> > > [Florent: Rebase]
> > > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> > > [Ketil: Rebase]
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 29 +++++++++++++++++++++++++++++
> > >  include/linux/dma-heap.h   |  2 ++
> > >  2 files changed, 31 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index ac5f8685a6494..9fd365ddbd517 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/dma-heap.h>
> > >  #include <linux/err.h>
> > >  #include <linux/export.h>
> > > +#include <linux/kref.h>
> > >  #include <linux/list.h>
> > >  #include <linux/nospec.h>
> > >  #include <linux/syscalls.h>
> > > @@ -31,6 +32,7 @@
> > >   * @heap_devt:		heap device node
> > >   * @list:		list head connecting to list of heaps
> > >   * @heap_cdev:		heap char device
> > > + * @refcount:		reference counter for this heap device
> > >   *
> > >   * Represents a heap of memory from which buffers can be made.
> > >   */
> > > @@ -41,6 +43,7 @@ struct dma_heap {
> > >  	dev_t heap_devt;
> > >  	struct list_head list;
> > >  	struct cdev heap_cdev;
> > > +	struct kref refcount;
> > >  };
> > >  
> > >  static LIST_HEAD(heap_list);
> > > @@ -248,6 +251,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
> > >  	if (!heap)
> > >  		return ERR_PTR(-ENOMEM);
> > >  
> > > +	kref_init(&heap->refcount);
> > >  	heap->name = exp_info->name;
> > >  	heap->ops = exp_info->ops;
> > >  	heap->priv = exp_info->priv;
> > > @@ -313,6 +317,31 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
> > >  }
> > >  EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
> > >  
> > > +static void dma_heap_release(struct kref *ref)
> > > +{
> > > +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> > > +	unsigned int minor = MINOR(heap->heap_devt);
> > > +
> > > +	mutex_lock(&heap_list_lock);
> > > +	list_del(&heap->list);
> > > +	mutex_unlock(&heap_list_lock);
> > > +
> > > +	device_destroy(dma_heap_class, heap->heap_devt);
> > > +	cdev_del(&heap->heap_cdev);
> > > +	xa_erase(&dma_heap_minors, minor);
> > > +
> > > +	kfree(heap);  
> > 
> > That's actually problematic, because cdev_del() doesn't guarantee that
> > all opened FDs have been closed [1], it just guarantees that no new ones
> > can materialize. In order to make that safe, we'd need a
> > 
> > 1. kref_get_unless_zero() in dma_heap_open(), with proper locking around
> >    the xa_load() to protect against the heap removal that's happening
> >    here
> > 2. a dma_heap_put() in a new dma_heap_close() implementation
> > 3. a guarantee that heap implementations won't go away until the last
> >    ref is dropped, which means ops and all the data needed for this heap
> >    to satisfy ioctl()s (and more generally every passed at
> >    dma_heap_add() time) have to stay valid until the last ref is
> >    dropped. Alternatively, we could restrict this only to in-flight
> >    ioctl()s, and have the ops replaced by some dummy ops using RCU or a
> >    rwlock. But I guess live dmabufs allocated on this heap have to
> >    retain the heap and its implementation anyway.
> > 
> > For record, #3 is already not satisfied by the current tee_heap
> > implementation (tee_dma_heap objects can vanish before the dma_heap
> > object is gone). The other implementations seem to be fine because they
> > are statically linked, and they either have exp_info.priv set to NULL,
> > or something that's never released.  
> 
> That statement won't hold for long, see:
> https://lore.kernel.org/r/20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org
> 
> However, all upstream heaps can be loaded as module, but not unloaded.
> So once you get a reference to it, you can assume it will live forever.
> That's why we didn't merge that patch before, even though it was discussed:
> 
> https://lore.kernel.org/all/CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com/

Hm, not too sure that makes the tee_heap implementation sane WRT
tee_heap removal though, unless we have a guarantee that
tee_device_unregister() will never be called...

