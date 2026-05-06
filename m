Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B41CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCh4yhjdNR924lOxuGZLWdvuu+uWeBY+kkry4TW5Smc=; b=XkDDKAxH+BAdq0JK2RYJ0pinxn
	Kz690tFNeS2gebkDfaGsHRGzFm4jqiWkFEAK064m5DjRLvbmrKgJdqFJP3iAYTtyG5XM4N+emwnon
	PLgqMguStiifH/egx4cnq+G7wpge7FR21q4TKjN+GUhHBsamBgYV46jBfup8MU2smYgIKhQWPA6I8
	R2QDzrXM3hhcJzc++A3mqS8iE3ghN3do1KLIFZDH1DEn5AYFKRRe7K0/RdIV80iRu4kDZhbjO4qrh
	R4bfnWB1OWHkMWHbghZag1XDjSIV9cNB6AJuULdbDy5q/y76gcX66HUfUwzl7UlPaqDGWuFMNea5N
	0I6xj7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcLN-00000000u27-0pVO;
	Wed, 06 May 2026 13:31:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcLM-00000000u1m-02Lo;
	Wed, 06 May 2026 13:31:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 743E160103;
	Wed,  6 May 2026 13:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAFCC2BCB8;
	Wed,  6 May 2026 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074275;
	bh=NrQ+dSjs384ZRfIyJS33HBam4QDZDfVx4xzhTdvPuwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5qwe4Px1vR/zhejuZ6rq139PRRBewNML9UMUMEP44GXpxMQjJJUwlozQKB9SGRkv
	 zWV7fllywcM+I1MXoddI0ycvpS1NehEDsIHhNQgGF8vvgVdM8vn/GSrFBDgh6NnWhW
	 2nFnnf9H57o3AsN+ToNpEAGTGOENHH3KOhv+VX91unTD1ZzLqP+X9GMfCqD2rnXibz
	 TV8RLx03eMbuDn/0SgUY/4OAxxIKoMeprEs+SOoDWbCJBL1nPMfZpv0ngUVKXdVRXm
	 iNr6GR+ja8rjfwkt8/Xw979sVHEXqDCJQfNdArL8mlh0Rs2TIcmHCMYDn5hy6SAc89
	 Ng/POKlY0fyHA==
Date: Wed, 6 May 2026 15:31:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260506-certain-busy-warthog-bd42d7@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260506-energetic-azure-pig-2b6ec4@houat>
 <SurytM7FTOazQNVXXqCU7g@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ulftqthwgql3ly5x"
Content-Disposition: inline
In-Reply-To: <SurytM7FTOazQNVXXqCU7g@collabora.com>
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


--ulftqthwgql3ly5x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
MIME-Version: 1.0

On Wed, May 06, 2026 at 02:43:42PM +0200, Nicolas Frattaroli wrote:
> On Wednesday, 6 May 2026 12:08:24 Central European Summer Time Maxime Rip=
ard wrote:
> > Hi,
> >=20
> > On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:
> > > From: Florent Tomasin <florent.tomasin@arm.com>
> > >=20
> > > This patch allows Panthor to allocate buffer objects from a
> > > protected heap. The Panthor driver should be seen as a consumer
> > > of the heap and not an exporter.
> > >=20
> > > Protected memory buffers needed by the Panthor driver:
> > > - On CSF FW load, the Panthor driver must allocate a protected
> > >   buffer object to hold data to use by the FW when in protected
> > >   mode. This protected buffer object is owned by the device
> > >   and does not belong to a process.
> > > - On CSG creation, the Panthor driver must allocate a protected
> > >   suspend buffer object for the FW to store data when suspending
> > >   the CSG while in protected mode. The kernel owns this allocation
> > >   and does not allow user space mapping. The format of the data
> > >   in this buffer is only known by the FW and does not need to be
> > >   shared with other entities.
> > >=20
> > > The driver will retrieve the protected heap using the name of the
> > > heap provided to the driver as module parameter.
> >=20
> > I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> > better in the device tree and lookup through the device node? heaps are
> > going to have a node anyway, right?
> >=20
> > This would allow you to have a default that works and not mess to much
> > with the kernel parameters that aren't always easy to change for
> > end-users.
>=20
> Hopefully the kernel parameters aren't easy to change for end-users on
> systems that deploy this. :) The use-case is copy protection for embedded
> devices running on locked-down systems. Though admittedly the mechanism
> works even on "tampered"-with systems, as long as the underlying hardware
> implements the access restrictions properly.

I guess it wasn't just about the user tampering it, but also about
distros shipping, say, a signed UKI that would support multiple
platforms with 42 versions of optee but all using panthor. I'm not sure
we can expect a single heap name to work for all of them.

> I'm a bit hesitant about making this DT myself. It would solve the problem
> that panthor could probe before the heap provider and needs to handle
> deferral by itself, but it does mean that we'd be putting software
> configuration into the device tree.

Is it? If the system has a protected allocator, and if panthor
absolutely needs to allocate from that allocator, it's not software
configuration: it's a description of what the platform looks like from
Linux PoV.

Or put it differently, it's not more software than optee is, and yet it
has its own node.

> Having the secure heap be a node with no address would allow the tee
> (or whatever else) to still dynamically allocate it wherever, and let
> us handle the dependency relationship between dma heap and GPU, but
> then we require that tee heap driver implementations play nice with
> this scheme, and bring OF into the dma_heap APIs.

I mean, it's a dma_heap API that we create so we don't bring anything
more to it :)

Maxime

--ulftqthwgql3ly5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaftCnwAKCRAnX84Zoj2+
dhXNAX0UyoGSxTfl5B13C2G2JHLqgb01BTvh/1Ob1SVJrqGkUfDzg6CRc+vjIxPh
fsftM88BfR4cCx3hWDWF7WDUDVxG50bXC1qkh0VN5jFTn3OoLjwjh1LahaWy8Z09
NmujI7ISBA==
=xA7h
-----END PGP SIGNATURE-----

--ulftqthwgql3ly5x--

