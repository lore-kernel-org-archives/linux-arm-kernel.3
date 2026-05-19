Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E8ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFsih1oM8khuFifnw1qBaw/17wfrL9w8S7JH369Uy2o=; b=FPuGeRf2SiJcXdSTyvXiKqm2Ls
	FYpo2LEhRGhXKeZpCidXpwIWRAaxn4sFssDsssIkabJfJZ/LUlDMqwYcuXA/MY4TwF5FbYIq7TYRX
	Fu+MItEqWNKf8iNDuxZHaMqZz3uPXQ0h4cWURgK6EMXeuJO8uDxRe4rLV2S9G8xVFfEgQqeU8LdCH
	+g+43uNh49EZrZAVFlfegUf2Z2zWrBwz5OlrkQexUGpyZswENUNSGNuxIEH25246baiFlbeY12UW6
	fwyIGc4BoPUb8TnmcVR4A8BW91XBOj5TkpPHu4+52Fce6qK176Q19fMj/5egyd6+FEZnjdrJ4Frjp
	RrysWpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlb-00000001LCQ-2H7T;
	Tue, 19 May 2026 11:37:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIla-00000001LBl-0JBM;
	Tue, 19 May 2026 11:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dFsih1oM8khuFifnw1qBaw/17wfrL9w8S7JH369Uy2o=; b=SETSaNdo6ilBSF/5m6h9wj59Mp
	A9KCuFCMe5CwWLNuQuHLcvkF7MjLoNLCGyjibxpI959bHZjF4l6VxlTvheJqW6MJbZEHUxu43LwyI
	XuYTOCmcIPZx0JRTrF7C8GfHH47JbzfVW7h035owW8BGzHuXTaoWa/lMXlUCLg5uU7UI9+AgL+ci0
	kUo68D+FMqJ6tW5hSnyAc8TDgAdDOgWVYWZNl9uiu1JpfDYY5+0F7zKRN2ZSKabEIQuhNMREcOMUl
	4jhXFn+UZy0CtSsRUfCCXW7C3Sy7UMq6tpB3Hx3HUAmAr23t7nNtmiXroHHe52ux9aVdKrQIi38Gu
	y4NIehvA==;
Received: from [148.251.105.195] (helo=bali.collaboradmins.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlW-0000000E4nc-3on3;
	Tue, 19 May 2026 11:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779190642;
	bh=P71i5LOBOPL4Hw9EeBymlq0Uf0mmQClWsPDyQMD6YBw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lmkJMfMFv3KpVtRpcOyjXSIVDVhu6eCaJRIpW91cYOFDTqtTZIC2c9C+1C1oJMtSU
	 dnXMaW6ng5tUAkAskq35eqxUC1O+6hNTVv3ZEfCXQD0BDsa2/0uZpsUEzq1Esv2qxZ
	 615G/Hj4eMOGF4pB1h2Vu6Cygfef+Ypql4Qe2tp3asoMM20dltJ83aK9xDrDpdNjbM
	 6iR+0qbuawQlElj596VtUO+CgXYXrOMvfkA6dJV2s8GSWcHzzz4OXdvKMqCzrC7oIp
	 KFu7AEHGP5uoXhH8VP+npLTMz3B87ETrX4Qo41jOb8UOqcWeFMJeXt7HLLVpLm8ybE
	 aDrFawFNR4TbQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C28B17E1305;
	Tue, 19 May 2026 13:37:21 +0200 (CEST)
Date: Tue, 19 May 2026 13:37:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, Marcin
 =?UTF-8?B?xZpsdXNhcno=?= <marcin.slusarz@arm.com>, Ketil Johnsen
 <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [Linaro-mm-sig] Re: [PATCH 4/8] drm/panthor: Add support for
 protected memory allocation in panthor
Message-ID: <20260519133718.373d6070@fedora>
In-Reply-To: <20260519-loutish-beautiful-trogon-67453f@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260505181523.49a3d85c@fedora>
	<afxVIuVVPisBQ9p_@e129842.arm.com>
	<20260507135356.5428d50d@fedora>
	<agMvb_jeRsO7tSS-@e142607>
	<20260512161111.0cb7000e@fedora>
	<agNJasayW8VCHTiU@e142607>
	<CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
	<20260518091650.5a7a4f4a@fedora>
	<20260519-loutish-beautiful-trogon-67453f@houat>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_123739_322926_05ABE563 
X-CRM114-Status: GOOD (  49.06  )
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

On Tue, 19 May 2026 11:52:13 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Boris,
>=20
> On Mon, May 18, 2026 at 09:16:50AM +0200, Boris Brezillon wrote:
> > On Wed, 13 May 2026 12:31:32 -0700
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> >  =20
> > > On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.=
com> wrote: =20
> > > >
> > > > On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:   =
=20
> > > > > On Tue, 12 May 2026 14:47:27 +0100
> > > > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > > >   =20
> > > > > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote=
:   =20
> > > > > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > > > > >   =20
> > > > > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon w=
rote:   =20
> > > > > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct pan=
thor_device *ptdev)
> > > > > > > > > >                     return ret;
> > > > > > > > > >     }
> > > > > > > > > >
> > > > > > > > > > +   /* If a protected heap name is specified but not fo=
und, defer the probe until created */
> > > > > > > > > > +   if (protected_heap_name && strlen(protected_heap_na=
me)) {   =20
> > > > > > > > >
> > > > > > > > > Do we really need this strlen() > 0? Won't dma_heap_find(=
) fail is the
> > > > > > > > > name is "" already?   =20
> > > > > > > >
> > > > > > > > If dma_heap_find() will fail, then the whole probe with fai=
l too.
> > > > > > > > This check prevents that.   =20
> > > > > > >
> > > > > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > > > > currently probe and boot the FW even though we never setup the
> > > > > > > protected FW sections, so why should we defer the probe here?=
 Can't we
> > > > > > > just retry the next time a group with the protected bit is cr=
eated and
> > > > > > > fail if we can find a protected heap?   =20
> > > > > >
> > > > > > The problem we have with the current firmware is that it does a=
 number of setup steps at "boot"
> > > > > > time only. One of the steps is preparing its internal structure=
s for when it enters protected
> > > > > > mode and it stores them in the buffer passed in at firmware loa=
ding. We cannot later run the
> > > > > > process when we have a group with protected mode set.   =20
> > > > >
> > > > > No, but we can force a full/slow reset and have that thing
> > > > > re-initialized, can't we? I mean, that's basically what we do whe=
n a
> > > > > fast reset fails: we re-initialize all the sections and reset aga=
in, at
> > > > > which point the FW should start from a fresh state, and be able to
> > > > > properly initialize the protected-related stuff if protected sect=
ions
> > > > > are populated. Am I missing something?   =20
> > > >
> > > > Right, we can do that. For some reason I keep associating the reset=
 with the
> > > > error handling and not with "normal" operations.   =20
> > > I kind of hope we end up with either
> > >=20
> > >  - panthor knows the exact heap to use and fails with EPROBE_DEFER if
> > > the heap is missing, or
> > >  - panthor gets a dma-buf from userspace and does the full reset
> > >    - userspace also needs to provide a dma-buf for each protected
> > > group for the suspend buffer
> > >=20
> > > than something in-between. The latter is more ad-hoc and basically
> > > kicks the issue to the userspace. =20
> >=20
> > Indeed, the second option is more ad-hoc, but when you think about it,
> > userspace has to have this knowledge, because it needs to know the
> > dma-heap to use for buffer allocation that cross a device boundary
> > anyway. Think about frames produced by a video decoder, and composited
> > by the GPU into a protected scanout buffer that's passed to the KMS
> > device. Why would the GPU driver be source of truth when it comes to
> > choosing the heap to use to allocate protected buffers for the video
> > decoder or those used for the display? =20
>=20
> Just fyi, the trend is to go to devices listing the heaps userspace
> should allocate from

Devices listing the heaps they are able to import buffers from
(with the list being different based on the buffer properties, I
guess) is a good thing. This way the central allocator is in a position
where it can intersect the devices lists and decide which heap to
allocate from based on its buffer sharing knowledge.

> and/or using the heaps internally to allocate their
> buffers,

Yes, that too. For internal buffers (especially the device-wide ones,
like the protected FW sections we were discussing), it makes sense to
leave that up to the driver.

> so that last part is where we're headed, and feels totally
> reasonable to me.

Just to be clear, my main concern right now is not the long term plan,
but how realistic it is to assume we'll have all the DT/dma_heap pieces
in place in a reasonable amount of time. Looking at the current state
of affairs (based on this patchset), it feels like we're a long way
till we can have a robust way of exposing dma_heaps to in-kernel users
(refcounting, lifetime issues, describing allowed heaps, ensuring heaps
truly provide buffers with the expected properties, ...). I'm certainly
not saying these are not valid concerns, but I'd like to have a
temporary solution to support protected rendering in the meantime...

>=20
> Maxime


