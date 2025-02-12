Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0522C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxYBpi925DNrMEzqq2mhuodXoQPQ2urVmGp/joLgWWA=; b=HcMDHYVH9XQBGCWTTpAdN7qpWG
	d/Z+CFrvczXNfvWkvsANN3dvKHp4Cyr64v1gu2ElcKBBos0g0EmKaNAvTGvmfaNKekg+F3GuYE/pO
	aJFT4nK+EbXzuA9JxkJlsgLwtMIgGdC+41J+VNhkEES6QKmimVXz6v7TR3Vm8+Zj74xaJfkAxgw97
	OpUFsIad9qMcv3vHakhd8sTeeIfFv/srh2w/9WwyKjxgx6icTzyRo6xdFZfZhSnFEfX6gcWdwhCI3
	hDeP5GmflX7Uk1oLG9dtyqho1rCkZnyyaPj+DJk75N2vq6uWCsBtY4PegkGIQlXYgTg/mvkmYsJb4
	k6SyYm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiC1q-00000007NTQ-16EH;
	Wed, 12 Feb 2025 12:39:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiC0Q-00000007ND2-0iqv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 12:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA13B5C5AE2;
	Wed, 12 Feb 2025 12:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522EAC4CEDF;
	Wed, 12 Feb 2025 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739363897;
	bh=AN9M3YnTbLbeifclEgjFxY1ryG7kNJVenpcxqcZ3F80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVxj3DPpRHUUcYmM5OfB3KJD8jWcx2OymMZ7VW0uQAOk6NEz18pNh9ck8dP6iijVQ
	 eYsABt+PevimDso6q55lSckWyl4umHxVIJvUFD03h2HeSDmDd+HsVc0DfIZIe/uyjW
	 xofGhVxZ6xa4pAgYqNFiUiIWoQhuUkc96xxkjHNLD+7pQ/OZAGDf5jplVvQaCedIou
	 WHBFKi6HGAtQEes6YnIXTn/LIqcZ6QKnLOA4RPdcZcD7xldtww/1GlSe9gcGzcFx7q
	 41Dq2Zxfte0PtJ9jrRRkgwtieD2znuEVYVDniq4Dico715bI+gey+G6/agJbgfJ7gL
	 1XXPHf3juNaYw==
Date: Wed, 12 Feb 2025 12:38:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
Message-ID: <d66996eb-f49b-448b-9743-d19a3c3eba52@sirena.org.uk>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
 <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
 <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C+7jhM8tQThOiQo5"
Content-Disposition: inline
In-Reply-To: <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
X-Cookie: Reality does not exist -- yet.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_043818_266922_47F2A3F9 
X-CRM114-Status: GOOD (  19.22  )
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


--C+7jhM8tQThOiQo5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 12:11:49PM +0200, Daniel Baluta wrote:
> On Wed, Feb 12, 2025 at 11:38=E2=80=AFAM Marco Felsch <m.felsch@pengutron=
ix.de> wrote:
> > On 25-02-11, Laurentiu Mihalcea wrote:

> > > +    const: fsl,imx95-cm7-sof

> > Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
> > add the -sof suffix instead of -audio or so? SOF is a software project
> > but you can clearly run different software on the audio-copro as well.

> Sure you can run a different software project on the audio DSP but
> you will need a way to distinguish between the different projects.

> There might be different mailbox, memory configurations. So you will  need
> to invent another suffix specific to the new project.

> We can make  const: fsl,imx95-cm7-audio as the one used with SOF
> and think about a different name later for when another project will
> want to use the DSP.

I think the point here was that the DT should stay the same even if the
DSP firwmare changes, just as how changing the main OS shouldn't affect
the DT.

--C+7jhM8tQThOiQo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmesljIACgkQJNaLcl1U
h9DJ1Qf+KGbLlszokVtBw52F0VChslY+IeXlVNkhYXA48jltF44gWifkjngIfJUm
sPwroba34ljMgHrow2mDAQAGToN7yPjjkMLZqqU5MhVWVFgbau7Ib+XcFCdo7aqy
iVFndv4raNHPcgcsOKIopsZjz74XGZYbSXI7XlippeazjE7Ik7tK5rST0fXYqkMk
xywVMJ3R6iLEIF6brHqZuDaBBUsM6y0lYi4tTawWtmQtVbWercnA/w21k4laCYDc
huQ8ANiF8SKvr0e032yxtuY9tfjHXSwxdWA1LGW3tLGeEAVa0q5khBvAskQPXbdp
qrhQSpsJdwmXIsU89H+E3O4GYWpipQ==
=cpaS
-----END PGP SIGNATURE-----

--C+7jhM8tQThOiQo5--

