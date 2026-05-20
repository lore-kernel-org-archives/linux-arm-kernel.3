Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75B1CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTs9j84EvrpbUB8zmi/sXVyU6CvZkmauLXlVFqdgLPE=; b=U1M07HW2rtcIt7McFxBoROWQke
	OnbF8yE5aL7muHD7shCLetZYb/Glt4hiBKtxopjd9BrINABqt/EfXSBJl9zoNYCsLa06b7bElcg1G
	leA8WzYTGhp0sbC3Th3CIzJS2tzsUtZlQUd8ph/vPtW5v91sIc56qV2KYl7a05DsXgnlO4VbBMNBG
	pSbWQFNBi7bG5UmJDxHyWkHqfAkf7Xi4HGMPrmo9FAqyN9I7ivvMH8rQAk6gJxckwpDoaRZgM22Av
	SfONx/X1VrHtLsSlIYi/Pcz2PjPeShnhsl6rbhCqWow//CcPfyBM+l1YzqT2ksl4zZzhrlbH+Rrne
	x1jMjmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPj3f-000000052nC-2j6d;
	Wed, 20 May 2026 15:42:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPj3e-000000052mk-3Yrb;
	Wed, 20 May 2026 15:42:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BEFF760008;
	Wed, 20 May 2026 15:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A241F00893;
	Wed, 20 May 2026 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779291724;
	bh=xTs9j84EvrpbUB8zmi/sXVyU6CvZkmauLXlVFqdgLPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RSSfWItJZQLm/gKbl48yMOmzxjineVIK03iKozC8JKuvQoBs3ovHcQ7xQ4XqiSZDd
	 tHbGTI7X3VsJL3Rhmu+TlDcVLKucB22OF71wpJ6wrPh551wMTlMlAmHb2WrFukdzMv
	 5VTaFfBzbhVM2NDlh9tJryrxXN4sg1FN6q3NEb3JCGR8ia0J7W38fbL363H4tBGeKf
	 Zxxqs12ToS45Q0qaR+q6RcO7GQLwhu0GTYO27z02rN5ClS0D8euymnQR4Ne+YegA7Z
	 Vz0+8HN9hw3cgYLp7UWD+U4NjpDPl5sdes2zhsyTDF+CzRKV1mDubaMPzvqI8GhRvE
	 jIdrvFf0cSxLQ==
Date: Wed, 20 May 2026 16:41:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
Message-ID: <980eef5c-478e-4503-a3b8-27f3eba7ec3d@sirena.org.uk>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
 <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
 <81b15533-3258-48a8-8d5a-0dcec7027254@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LeC902u89KSq/6Lj"
Content-Disposition: inline
In-Reply-To: <81b15533-3258-48a8-8d5a-0dcec7027254@oss.qualcomm.com>
X-Cookie: Natural laws have no pity.
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


--LeC902u89KSq/6Lj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 03:34:59PM +0000, Srinivas Kandagatla wrote:
> On 5/20/26 1:42 PM, Mark Brown wrote:
> > On Wed, May 20, 2026 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
> >> use snd_soc_component_set_jack() instead of custom callback to
> >> max98090 codec.

> > This needs to be squashed into the first commit, otherwise the first
> > commit will cause a build break.

> I had them in opposite order in my local setup, which is why it did not
> break the build for me, I can send out a squashed version.

Putting this first would also be fine from a build point of view so is
probably also OK, though there would be runtime breakage (which I
imagine is why you reordered).  I'm not sure anyone will notice the
runtime bisection issue.

--LeC902u89KSq/6Lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoN1kYACgkQJNaLcl1U
h9Bglwf/fFyVX5wZ6pPFxe17aKN5nIUOOpNPzWcYnojdG/+Dm2HC7YBpPzPcIUfd
IS8u4clCZmMSaBULc1R37Du8CRthdVGpqwMEUuBZ0iECRpJGr3S3OT25i653DWNu
oYSyWmnM5UlrpSoLGk39DOO0k+K1mKDFCPmzCHRbkFcpL+lK+vo0KRjr3oO9o1UV
S/It3KPhyc3FRRo+Z0UaTzruQ72Ky1HAoAvsPxSdYmtxV88iU9YxSEwSAjtAB1gl
FhUWNJopESjFOyM7x6JUYz0Yp3FC76ZKwpmV+ONJ7X96onrFQv6SVQ8a+FmVCUim
qR2xcAdHjU3W37KUi7R0hkadSgb0+A==
=ZDx3
-----END PGP SIGNATURE-----

--LeC902u89KSq/6Lj--

