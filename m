Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3EFC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 21:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPlC94AM010WZW8moD0YzW91Vm5e7DR3TS+SPuJHxV0=; b=oq3kxS27vuogkfW0VFyfSbqLnr
	asgtaJD4k/Tzii2o2vUd0mRKgRIQqGNYAwaYw7y68R3EqC8H36qPy/J4y/E8gIEcj/HBpTYY+DAg0
	rRSzJVN3tzn/hOyXSNLUl5TKWxYnKMhwg5JI3XUR9eV/2Hndp61ltii1/iJHIuvBSwGkTtMTSlH3N
	BIBrr3XrK2o1H2EPOJGNMADkfcAr8O9Rms6CgAs24feh/kVw19CW9A60AYkxE7rBE9+QTT5Do4krR
	kgoj2DHgZzgIkOd/j8ALhhRpvHwZWACxr7+3ZGjirItcXzHLhLCnPYa06TvAcXp2j6v4HJd6CrZOK
	x6PC8Y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twSkW-00000001kIm-3tHa;
	Sun, 23 Mar 2025 21:20:52 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twSil-00000001k2L-3E8A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 21:19:05 +0000
Date: Sun, 23 Mar 2025 17:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1742764739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPlC94AM010WZW8moD0YzW91Vm5e7DR3TS+SPuJHxV0=;
	b=b3eLBULz46IcHBiPzzA6apX7WoWCRsF73fSS+jtN1xfxJzeNP5ZAmZR9OzYdhFT3OyJHE2
	dKosWAHDrjSstQLNbOdbHT73E9IQTixfNVQ2JGOn+BtMQMq8HVdvdOEih7MVC/Uq2r5psE
	at17txaMiEIxdkeGFId0K3JCqb5QykTPE89o5O4LKZASRa1uWEac8jRAqmpsC5jps7hs6l
	AOC2Gxe3NETgytlAOKNRdhlPe8+BjuWw7AMPxJOufWVrl7qR45PPy6ZlPhJn7UwQj+AU7y
	Y801thcyZQHvcKyEOfVdh7Bmjb83QVZ/s2+8lzpLhpkMQXolwVBsFL90zh043g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?=22Bj=F6rn_Roy_Baron=22?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	asahi <asahi@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-B6uc7EEAdBPXmt@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
 <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_141904_333382_AAEB4FB8 
X-CRM114-Status: GOOD (  49.11  )
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

>  >  > +/** 
>  >  > + * enum drm_asahi_bind_op - Bind operation 
>  >  > + */ 
>  >  > +enum drm_asahi_bind_op { 
>  >  > +    /** @DRM_ASAHI_BIND_OP_BIND: Bind a BO to a GPU VMA range */ 
>  >  > +    DRM_ASAHI_BIND_OP_BIND = 0, 
>  >  > + 
>  >  > +    /** @DRM_ASAHI_BIND_OP_UNBIND: Unbind a GPU VMA range */ 
>  >  > +    DRM_ASAHI_BIND_OP_UNBIND = 1, 
>  >  > + 
>  >  > +    /** @DRM_ASAHI_BIND_OP_UNBIND_ALL: Unbind all mappings of a given BO */ 
>  >  > +    DRM_ASAHI_BIND_OP_UNBIND_ALL = 2, 
> 
> Do you use this? We don't have it in nouveau and NVK gets by fine. Or does the asahi kernel do something where it expects you to unbind everything before the buffer is really destroyed? I think I remember talking to Lina about this a while ago but I don't remember the details.

We do not use it and I don't know why it's here either. In fact,
drm/asahi does an unbind_all equivalently when closing a GEM
handle, so should be definitely ok without.

Dropped in v4, thanks.

>  >  > +    /** 
>  >  > +     * @DRM_ASAHI_BIND_SINGLE_PAGE: Map a single page of the BO repeatedly 
>  >  > +     * across the VA range. 
>  >  > +     * 
>  >  > +     * This is useful to fill a VA range with scratch pages or zero pages. 
>  >  > +     * It is intended as a mechanism to accelerate sparse. 
>  >  > +     */ 
>  >  > +    DRM_ASAHI_BIND_SINGLE_PAGE = (1L << 2), 
> 
> Does this require the BO to be a single page? If so, does it require offset==0? Or does it just take whatever page is at the specified offset?

I believe the intention is that it takes whatever page is at the
specified offset and just maps that a bunch of times. HK doesn't use
this yet though it probably should (this was added to help reduce
overhead when emulating sparse with scratch/zero pages, which is still
very new functionality in hk).

Accelerating this properly involves GPUVM patches - although even without
that, moving the loop into the kernel so it's only a single ioctl
(user-kernel roundtrip) seems worth keeping the flag for.

Added comments in v4.

>  >  > +    /** @object_handle: Object handle (out for BIND, in for UNBIND) */ 
>  >  > +    __u32 object_handle; 
> 
> How is this different from the GEM handle? I mean, I know it's different, but What is this handle for? Just a thing we can pass in later?

Yes, this is just a handle that's passed with the submit, see the
comment in drm_asahi_timestamp.

>  >  > +    /** @priority: Queue priority, 0-3 */ 
>  >  > +    __u32 priority; 
> 
> Is one of these priorities REALTIME and only usable by privileged apps? If so, maybe document that and/or have an enum?

Added an enum, thanks.

I haven't actually implemented the priority check because that means
even more rust bindings, and I don't think it's actually a uAPI
regression to tighten the permissions later now that I've documented
that we may do so.

>  >  > +    /** 
>  >  > +     * @usc_exec_base: GPU base address for all USC binaries (shaders) on 
>  >  > +     * this queue. USC addresses are 32-bit relative to this 64-bit base. 
>  >  > +     * 
>  >  > +     * This sets the following registers on all queue commands: 
>  >  > +     * 
>  >  > +     *    USC_EXEC_BASE_TA  (vertex) 
>  >  > +     *    USC_EXEC_BASE_ISP (fragment) 
>  >  > +     *    USC_EXEC_BASE_CP  (compute) 
>  >  > +     * 
>  >  > +     * While the hardware lets us configure these independently per command, 
>  >  > +     * we do not have a use case for this. Instead, we expect userspace to 
>  >  > +     * fix a 4GiB VA carveout for USC memory and pass its base address here. 
>  >  > +     */ 
>  >  > +    __u64 usc_exec_base; 
> 
> I mean, you could have a command for this or or something but meh. That can be an extension on top of the current UAPI later if it's ever needed.

Yep, and I really cannot fathom a use case for doing this at
finer-than-queue granularity.

>  >  > +    /** 
>  >  > +     * @barriers: Array of command indices per subqueue to wait on. 
>  >  > +     * 
>  >  > +     * Barriers are indices relative to the beginning of a given submit. A 
>  >  > +     * barrier of 0 waits on commands submitted to the subqueue in previous 
>  >  > +     * submit ioctls. A barrier of N waits on N previous commands on the 
>  >  > +     * subqueue within the current submit ioctl. As a special case, passing 
>  >  > +     * @DRM_ASAHI_BARRIER_NONE avoids waiting on any commands in the 
>  >  > +     * subqueue. 
>  >  > +     * 
>  >  > +     * Examples: 
>  >  > +     * 
>  >  > +     *   (0, 0): This waits on all previous work. 
>  >  > +     * 
>  >  > +     *   (NONE, 0): This waits on previously submitted compute commands but 
>  >  > +     *   does not wait on any render commands. 
>  >  > +     * 
>  >  > +     *   (1, NONE): This waits on the first render command in the submit. 
>  >  > +     *   This only makes sense if there are multiple render commands in the 
>  >  > +     *   same submit. 
>  >  > +     * 
>  >  > +     * Barriers only make sense for hardware commands. Synthetic software 
>  >  > +     * commands to set attachments must pass (NONE, NONE) here. 
>  >  > +     */ 
>  >  > +    __u16 barriers[DRM_ASAHI_SUBQUEUE_COUNT]; 
> 
> I'm not sure how good of an idea this is. You said in the comment above that SUBQUEUE_COUNT must be a power of 2. However, once you use it to size an array in the command header, it can never change ever. I'm not sure what to do about that. The command header being 8B is kinda nice... But also, will we ever need more than 2? I'd hate to have to change the size of the header.
> 
> Another option would be to potentially have a barrier command which would then be extensible but that sounds kinda annoying.

I think the mistake here is making this an array instead of just
`vdm_barrier`, `cdm_barrier` fields. It will never be not-2, at least
not without such large hardware changes that we'd be due for a refresh
of this uAPI anyway.

I don't love the idea of the extra command, adds a lot more
complexity/overhead for a hard-to-fathom theoretical future hw issue
(that we could address with a drm_asahi_cmd_header_m7 if we
need that.)

Addressed in v4.

>  >  > +/** 
>  >  > + * struct drm_asahi_timestamp - Describe a timestamp write. 
>  >  > + * 
>  >  > + * The firmware can optionally write the GPU timestamp at render pass 
>  >  > + * granularities, but it needs to be mapped specially via 
>  >  > + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT. This structure therefore describes where to 
>  >  > + * write as a handle-offset pair, rather than a GPU address like normal. 
> 
> Given that this struct is embedded in other structs, it might be worth a comment saying it can never be extended without breaking those structs.

Done (for each of the places mentioned).

>  >  > +struct drm_asahi_helper_program { 
>  >  > +    /** 
>  >  > +     * @binary: USC address to the helper program binary. This is a tagged 
>  >  > +     * pointer with configuration in the bottom bits. 
>  >  > +     */ 
>  >  > +    __u32 binary; 
>  >  > + 
>  >  > +    /** @cfg: Configuration bits for the helper program. */ 
>  >  > +    __u32 cfg; 
> 
> There's configuratin bits here and in the binary pointer abov?

Yes. Not sure what the different bits mean exactly. My guess is that the
binary pointer is tagged as "enable the helper prog?".

The one known @cfg bit is when the helper program is needed within a
preamble shader, i.e. if the preamble spills.

> Woo! I made it to the end. I think that's all for now. I mostly asked a lot of questions.

Hooray! Thank you so much for reviewing!

