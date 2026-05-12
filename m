Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E381DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnWES2DtzHOX7Ps9Md0/z2VxDbBxml/AvvTmLTj0mA8=; b=gFw6ZdthxudHyi/f2GEZmJFysg
	pYNfz06PEoMOrFo2gPDys9bEe/ySJH/ySQ9aSPoP49W2Es7yBTzbzfp7sOb7DNHlR3rJVwMpQ2pyZ
	PviTPTPqbvLkyC3HAz2BOrg7MZdykEYbl0K7OIbdLY1H0gVxHeo3HbmZ7002JhdVGzWIwFBhvRG6Z
	jcrFdH4dJyp6PsAKJc9LCCDIec1sOlkEPe7Yy/yhF6Ry1RzQ9TLIAZcMOSv4QmjqvvcOkcgf0q527
	3IcZ21y4PSKep46Q2/VtEJE0LCujo9MYGJOFaxAOiuUxwnBDtFCBiwh2dwJLFRY1zL47RtzawkoZ1
	Vd4S6ohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpCE-0000000HElU-3ZrK;
	Tue, 12 May 2026 15:38:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpCB-0000000HEkQ-1iQQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:38:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B04202C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:38:46 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 916513F85F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778600331; bh=bTW8PIkNq6aZUF6NF1FmasGVCIC4HDNHJXMvlerQOQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kx7Oy9RxnbwjWxTo4dE8kl4wbb3En/Wbc3B+aK+NuahXVAJT+w0BrOER9MNNcyd+J
	 KzyJu8KzuznT+7PxVUDGVVpqEf4hZeaRdLYZpDJl2qqQygKxPMEToQBZowRnqQA9BZ
	 qc9p3F9J5fHIiE864vBavIXoAcByrarBqMND2Ts0=
Date: Tue, 12 May 2026 16:38:18 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Steven Price <steven.price@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <agNJasayW8VCHTiU@e142607>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com>
 <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607>
 <20260512161111.0cb7000e@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512161111.0cb7000e@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_083855_788305_B75C49F3 
X-CRM114-Status: GOOD (  32.00  )
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

On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> On Tue, 12 May 2026 14:47:27 +0100
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > On Thu, 7 May 2026 11:02:26 +0200
> > > Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
> > >   
> > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:  
> > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
> > > > > >  			return ret;
> > > > > >  	}
> > > > > >  
> > > > > > +	/* If a protected heap name is specified but not found, defer the probe until created */
> > > > > > +	if (protected_heap_name && strlen(protected_heap_name)) {    
> > > > > 
> > > > > Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
> > > > > name is "" already?    
> > > > 
> > > > If dma_heap_find() will fail, then the whole probe with fail too.
> > > > This check prevents that.  
> > > 
> > > Yeah, that's also a questionable design choice. I mean, we can
> > > currently probe and boot the FW even though we never setup the
> > > protected FW sections, so why should we defer the probe here? Can't we
> > > just retry the next time a group with the protected bit is created and
> > > fail if we can find a protected heap?  
> > 
> > The problem we have with the current firmware is that it does a number of setup steps at "boot"
> > time only. One of the steps is preparing its internal structures for when it enters protected
> > mode and it stores them in the buffer passed in at firmware loading. We cannot later run the
> > process when we have a group with protected mode set.
> 
> No, but we can force a full/slow reset and have that thing
> re-initialized, can't we? I mean, that's basically what we do when a
> fast reset fails: we re-initialize all the sections and reset again, at
> which point the FW should start from a fresh state, and be able to
> properly initialize the protected-related stuff if protected sections
> are populated. Am I missing something?

Right, we can do that. For some reason I keep associating the reset with the
error handling and not with "normal" operations.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

