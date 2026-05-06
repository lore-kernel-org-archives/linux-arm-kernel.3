Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CDFCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uL9sZui6Tc+jbSJjSfAU4vVKT8bOv/CLYiR/2+rWG8M=; b=EhomkmWjex64ThUlU2BB2UAEBs
	4LYXkJoFH7UEmMWGITZkms/WabxcRcYLlTvfJ+QrIuVKi4MiBKz70eU5qXy2cDko1Qwo7agwyObLU
	v1SYxS6fe/E8uUNu31MWU+AYpardzMHWT4v9SlcbcRDtwwk3p0nkyCs+ISzPmrMTMhLsvmh5Ipo7P
	4Zm3FIEmeBG2UJg5ZqtTomvvXZIS2NArl8sLxszaULyYy6GihWDU8OBxN42cia4owSgUbO8jHsRku
	+DoaFw5VXi5gMnrnh1DfO8Lj0FC5TkPaoWI/LZRaLdl9ACg0l7wBnNCe2Ifa42qKtlKa7Pfc6cH8F
	pVTYPGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZpj-00000000XWl-2Yx7;
	Wed, 06 May 2026 10:50:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZpi-00000000XW3-0uhL;
	Wed, 06 May 2026 10:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778064622;
	bh=Av+OJ79VSNTfsD5HTF058Kp/sSgGxzbHFK44LrzECYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DIHE5bizmTy6YdKbGpf4m7cazO7rEE1F6QWeN3PnMUwjQ5EESwvZapFqbV6GIIoIg
	 0GEcvbV9DhIyWXfMFJ7jgWd9RVNBlwQDXdkQYCB82YalyzZjBPzsLR6UyvEbtZcBdO
	 32LCDdqvpLJGV2y0SyBjxQ39w70AnmTHEc/tjXm7RYr16ONIEi5bmKXRTGrZTK+XPj
	 IFbZn9yudWLUZLZivVCiWMpjqICec7UOt70meUd+htsoImVNkSGWFucpETNzAEwyJS
	 N1HUBCY1zlbxnRlBZkBErtLaiy0fEm4fnBSkHx+uAHN99T/r3xNCHJ9yuz0+DjagVw
	 wZ6jc1/MrP+PA==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFF6017E1305;
	Wed,  6 May 2026 12:50:21 +0200 (CEST)
Date: Wed, 6 May 2026 12:50:15 +0200
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
Message-ID: <20260506125015.0108ef44@fedora>
In-Reply-To: <20260506-energetic-azure-pig-2b6ec4@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260506-energetic-azure-pig-2b6ec4@houat>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_035026_442526_E50625E5 
X-CRM114-Status: GOOD (  33.92  )
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

On Wed, 6 May 2026 12:08:24 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:
> > From: Florent Tomasin <florent.tomasin@arm.com>
> > 
> > This patch allows Panthor to allocate buffer objects from a
> > protected heap. The Panthor driver should be seen as a consumer
> > of the heap and not an exporter.
> > 
> > Protected memory buffers needed by the Panthor driver:
> > - On CSF FW load, the Panthor driver must allocate a protected
> >   buffer object to hold data to use by the FW when in protected
> >   mode. This protected buffer object is owned by the device
> >   and does not belong to a process.
> > - On CSG creation, the Panthor driver must allocate a protected
> >   suspend buffer object for the FW to store data when suspending
> >   the CSG while in protected mode. The kernel owns this allocation
> >   and does not allow user space mapping. The format of the data
> >   in this buffer is only known by the FW and does not need to be
> >   shared with other entities.
> > 
> > The driver will retrieve the protected heap using the name of the
> > heap provided to the driver as module parameter.  
> 
> I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> better in the device tree and lookup through the device node? heaps are
> going to have a node anyway, right?

I'm not too sure. Take the PROTMEM (name="protected,xxxx") dma_heaps
instantiated by optee for instance, I don't think the originating
tee_device comes from a device node, nor is the underlying heap
described as a device node. The reserved memory pool this protected heap
comes from is most likely defined somewhere as reserved memory in the
DT, but there's nothing to correlate this range of reserved mem to some
sub-range that the TEE implementation is carving out to provide
protected memory.

> 
> This would allow you to have a default that works and not mess to much
> with the kernel parameters that aren't always easy to change for
> end-users.

I guess we can have a default list of heaps that we know provide
protected memory for GPU rendering if that helps. Right now this list
would contain only "protected,trusted-ui" :D. The other option would be
to make this list a panthor Kconfig option and not expose it as a module
param.

