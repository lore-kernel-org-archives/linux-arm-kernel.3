Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158CEC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkGkUHBq+UzBxHDBQnM/lS2NOOgRMTBcY7T2S+1CUvo=; b=XAISu4f0+61zFdnIgVbCW6qTzX
	FPERMwSZvD/v+Jq931SVQ62g/1MYV9L+0Yj6GiS5PUWKfDWaVcpzYO/P4OAbt8pjVreX1pnQGPuZT
	T9Moh8Y/Os0j14tbhr8M0WA+E+aqhQnF4bkSIpoWJSGV60R7QQ51RlT7BlPnetqOSD90a2ceosQXw
	oToqFGvWthMxLd97z1FmTAAd6onGkYeFRvtpUGBIlWyqmB/PlxNxDaf80mBQFgLhGoPXCeXWXr0ae
	6cwaK056jWJyB7Kv5wq0ayTxdg96Hg7Acn3YaC6iZlp3MFSG7aCR/hLLP5qVubmfPCQr6N3rxEL0U
	fYEHFlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOs3-0000000G3Gi-45aR;
	Mon, 24 Aug 2026 07:13:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOs2-0000000G3Fv-0rVR;
	Mon, 24 Aug 2026 07:13:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3755B600AD;
	Mon, 24 Aug 2026 07:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A36B1F000E9;
	Mon, 24 Aug 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787555604;
	bh=BkGkUHBq+UzBxHDBQnM/lS2NOOgRMTBcY7T2S+1CUvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jFK8SuSaJ5QR1mA7ZeGkUBxv4gHNCd0PX9+Y4yYg/ZYq41xf8aecNaidHg/XK9aa6
	 GnWuYMeOIDiLoowf/QU3t4fCBUPZNRagABhNkyncj4Uzh16+rtPLrGEfNKEJivUG2k
	 YBHRGVQ/VBxpdz8FT7/vXWst69TfruryUZR0CclD5AsQIOQyfptzrMPT9gllGnLrdI
	 xu3Q1Eogo8FWcYp5/AVCbprx0C6P2YoaIV/SQdXOSjfAH48B4Sm9aMOV5cebfCoYIa
	 I1xGh+Z5ZOSHs6VKI3PSts0RkT+OILcDxzmxh2tousbER04F6OFyXVVMx8j1+wJaH3
	 8pkudckDSzKFQ==
Date: Mon, 24 Aug 2026 09:13:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, yangshiji66@outlook.com, upstream@airoha.com
Subject: Re: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA mask
Message-ID: <aovvEvI4sADve2iu@lore-desk>
References: <20260820085941.380401-1-pawlik.dan@gmail.com>
 <20260822122727.4f437bb5@kernel.org>
 <CALC2Api8nhePvuUPsw9CE6nX-0pFOMO5qy=4fzqox8_XM4eSqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mUbn9b3xpUqnPYR0"
Content-Disposition: inline
In-Reply-To: <CALC2Api8nhePvuUPsw9CE6nX-0pFOMO5qy=4fzqox8_XM4eSqw@mail.gmail.com>
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

--mUbn9b3xpUqnPYR0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> I tested both patches independently:
>=20
> - Patch 1 alone (DMA mask): NPU reports version 0.0 - probe fails.
>   The streaming mask is correct but 24-byte buffers still bounce
>   through swiotlb, and the NPU can't write to that address range.

I guess we need to understand why swiotlb bounce buffers are not working
here since these are valid address where the device should be capable of
performing DMA ops.

Adding Airoha folks in the loop. Any input on this?

>=20
> - Patch 2 alone (cacheline buffers): NPU reports version 0.1111 -
>   works. Cache-line-aligned allocations bypass swiotlb entirely.

I guess this is just a workaround for this particular case.

Regards,
Lorenzo

>=20
> So patch 2 is the essential fix, but patch 1 is still good to have as
> a defensive measure - without a proper streaming DMA mask, any
> future sub-cacheline streaming mapping would silently break.
>=20
> Dan
>=20
> sob., 22 sie 2026 o 21:27 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a=
):
> >
> > On Thu, 20 Aug 2026 10:59:40 +0200 Daniel Pawlik wrote:
> > > The driver calls dma_set_coherent_mask() but never dma_set_mask(),
> > > leaving the streaming DMA mask at the bus default. On the non-coherent
> > > EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
> > > after approximately 41 calls when using streaming DMA mappings.
> >
> > Can you confirm if patch 2 is still needed after this fix?
>=20
>=20
>=20
> --
> Z powa=C5=BCaniem,
> Daniel Pawlik

--mUbn9b3xpUqnPYR0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaovvEgAKCRA6cBh0uS2t
rNgQAP4gzAxPwYlVZLcsD8FbF199r8CFHfwu4FtyHed86dqaVQD+IEWDsuyiWXi+
Vf05SS9bTDTKiUc1LIT1fLizV1htAAE=
=ET2e
-----END PGP SIGNATURE-----

--mUbn9b3xpUqnPYR0--

