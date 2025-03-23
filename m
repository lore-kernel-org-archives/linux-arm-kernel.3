Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBE7C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjI5CAIKnyK0cdKaefRJI+q3uIG7lhr68HrdHr6otHQ=; b=Y84Kpc+MDPbWAJn0rnRCRiwCgD
	avY22qQ0UiVxymth9vv/2i28u69+h3ja2DsUVkVW1X0DcLC3FSpGvARO430ars2OdFVDjiHnjlxtQ
	M47N459AdNyy1nMPg1NzUO8rPbiEKkaVJOovgT5yBD4TK3zuDA1Fpe6zPIQCebem/h2it6UNluapD
	qoJaaMTBkQf8ppDOPnNUcdC/TDrw7oupQes9yaITnVD8SWSs+pJEUKLPzeLsdSyuhXNnW5tK54RWR
	q73iTz4q0JQW+hivQ5pzMRc2IeG269gdlgcMDDRdcDYsEb4Kx3JcDZpQL/gUoClUvPlKkDwXIAegq
	Aaso+nAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twT99-00000001lfO-0ubE;
	Sun, 23 Mar 2025 21:46:19 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twT7R-00000001lWB-28B3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 21:44:35 +0000
Date: Sun, 23 Mar 2025 17:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1742766271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjI5CAIKnyK0cdKaefRJI+q3uIG7lhr68HrdHr6otHQ=;
	b=nZ9Le3K9grAmT8NSqrDY7VgqawNr/XTrJxRvN1cnBj5rG5ctGZFQCbYbmgaahOqfE4y8X6
	9KiTK78LgpYvRwVN+5zFnyPVfkywDFasGxtxhKNwLwWoFJmI3aEZJwku1/EAvQL4segCBL
	GKMhFQ9tW6Sie6nKkCQzSyxkQg/G91JQl5JBVLihPfSOBgK0Rw9zfLdsp5oL61XNAM2K4y
	EOadBxaZValTGWpyOOX2ozW/iNrMvBnfzLdCp+xW/A4nUucYKeDqrqta/rfKTlhwkGNgDe
	CZGYYmPXcuH8jntdQWJIvZ7MVHpgdSGE0X7sP901OWfGmctB8KHsZb9uFe7BFA==
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
Message-ID: <Z-CAtz-D-CslvABE@blossom>
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
X-CRM114-CacheID: sfid-20250323_144433_779077_448E0225 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

>  >  > +struct drm_asahi_queue_create { 
>  >  > +    /** @flags: MBZ */ 
>  >  > +    __u32 flags; 
>  >  > + 
>  >  > +    /** @vm_id: The ID of the VM this queue is bound to */ 
>  >  > +    __u32 vm_id; 
>  >  > + 
>  >  > +    /** @queue_caps: Bitmask of DRM_ASAHI_QUEUE_CAP_* */ 
>  >  > +    __u32 queue_caps; 
>  >  > + 
>  >  > +    /** @priority: Queue priority, 0-3 */ 
>  >  > +    __u32 priority; 
> 
> Is one of these priorities REALTIME and only usable by privileged apps? If so, maybe document that and/or have an enum?

Actually, I've reserved realtime&high but always deny right now to make
sure Mesa doesn't assume it can use them, then we can relax in the
future once the kernel permission gating is there. (Needs rust
bindings.)

