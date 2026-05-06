Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACBCCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrGI2/2uUgGxp6pTViafgrHn82l/svvOzXCnvd+tJek=; b=F9z2guUBOzDRMFw/29vg/vkK3b
	BUZO5Pzu1L/D3tnq/pokSTyEKTrpBhJJPDKtamHIkL4Fq74ajmnLhcJiP2gwA1lhWAekVsK/ME8fl
	IXI6NvJsBFMGaVW9alL4buBxpOWGzg+SiO1g6rW6S859QFZlw7zJFo0lBYiiRkmZOuc7OIIS0n8zh
	811ZKt3INJwIKIu1x7DwLAVdXkWUAYVldjyjJJy/fylZpXWVX14Kc0uR5kfIN0Zol77edY8UGUnjo
	9XfgndTdwMUgw/sw606Ur1O8eoxIH2uZGGGUcLMeYB6TObAjoMBs++dUeD5FuZ3eOWKZaYuz9ESpC
	Vl+7HDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdoV-00000001EQz-2mhq;
	Wed, 06 May 2026 15:05:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdoU-00000001EQO-2XE0;
	Wed, 06 May 2026 15:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778079924;
	bh=5VmaZC0RomEbp6aSDoSjoUMQMXlIAykXwImP8NyVAX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xl2+76cJ+aSL9e3r2WJoupZZAaYmQbPGDTHPik5U1VTSygVKWY3ArXBA/kjLDvK4G
	 eg9+ssBQ7WGf+DKYenyfLSkd5s4HT/1O9GMoqrlLxFyY0gax8+zwirT6uUFHpDh13T
	 0kqWAvplq2HRPGwxVpV7x81YumQffmyohu09SIXwfXESbDS5ZguwU2j2jNqVm+hpiq
	 laYdbYVv3n8e9Va/HRP8M9VY74Jc3EtOds65TNkUJAHJ/GXycujbibDaOv+giz73Cq
	 gCyTna02cmPHhb8AkVl3fQ23YY1KHnz1yMjPIfF63MXay/Kr/iYE/FwktK2luqam6O
	 nqUdERfFEz3VA==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBF9F17E0610;
	Wed,  6 May 2026 17:05:22 +0200 (CEST)
Date: Wed, 6 May 2026 17:05:15 +0200
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
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260506170515.2d8511c3@fedora>
In-Reply-To: <20260506-golden-python-of-aptitude-ff972a@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260506-energetic-azure-pig-2b6ec4@houat>
	<20260506125015.0108ef44@fedora>
	<20260506-golden-python-of-aptitude-ff972a@houat>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_080526_800685_22BA7110 
X-CRM114-Status: GOOD (  43.81  )
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

On Wed, 6 May 2026 15:12:37 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, May 06, 2026 at 12:50:15PM +0200, Boris Brezillon wrote:
> > On Wed, 6 May 2026 12:08:24 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > Hi,
> > > 
> > > On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:  
> > > > From: Florent Tomasin <florent.tomasin@arm.com>
> > > > 
> > > > This patch allows Panthor to allocate buffer objects from a
> > > > protected heap. The Panthor driver should be seen as a consumer
> > > > of the heap and not an exporter.
> > > > 
> > > > Protected memory buffers needed by the Panthor driver:
> > > > - On CSF FW load, the Panthor driver must allocate a protected
> > > >   buffer object to hold data to use by the FW when in protected
> > > >   mode. This protected buffer object is owned by the device
> > > >   and does not belong to a process.
> > > > - On CSG creation, the Panthor driver must allocate a protected
> > > >   suspend buffer object for the FW to store data when suspending
> > > >   the CSG while in protected mode. The kernel owns this allocation
> > > >   and does not allow user space mapping. The format of the data
> > > >   in this buffer is only known by the FW and does not need to be
> > > >   shared with other entities.
> > > > 
> > > > The driver will retrieve the protected heap using the name of the
> > > > heap provided to the driver as module parameter.    
> > > 
> > > I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> > > better in the device tree and lookup through the device node? heaps are
> > > going to have a node anyway, right?  
> > 
> > I'm not too sure. Take the PROTMEM (name="protected,xxxx") dma_heaps
> > instantiated by optee for instance, I don't think the originating
> > tee_device comes from a device node, nor is the underlying heap
> > described as a device node. The reserved memory pool this protected heap
> > comes from is most likely defined somewhere as reserved memory in the
> > DT, but there's nothing to correlate this range of reserved mem to some
> > sub-range that the TEE implementation is carving out to provide
> > protected memory.  
> 
> Maybe we should be working on a dt bindings for heaps then? Something
> simple like we have for clocks with a phandle and an ID would probably
> be enough. In optee's case, it looks like it would map nicely with
> TEE_DMA_HEAP_* flags too.

Sure.

> 
> The only two that wouldn't be covered would be the system and default
> CMA heap if not setup in the DT, which shouldn't be too bad for this
> particular use-case.

I'm not opposed to the idea of describing the association through the
DT (with a <phandle, ID> pair). My main fear is that it drags us into
endless discussions around what's considered HW description and what's
not (PTSD of all those DT-bindings discussions I suppose :-)), which
ends up delaying the merging of Panthor's protected memory support.

Honestly, at this point I'm considering going back to my initial
suggestion to add a dedicated ioctl() (requiring high privilege) to let
the user pass the memory for the FW protected sections as a dmabuf FD.
Given we don't need those sections to be populated for the FW to boot,
it wouldn't block the probe of the driver, it would just prevent PROTM
usage until those sections are populated.

This would let us make progress with the rest of the changes in this
patchset, while the community decides how they want to expose dma_heaps
to in-kernel users.

