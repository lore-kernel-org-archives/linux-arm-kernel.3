Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF03CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wd2qjQayVtYNCQpH6/G5M3DjEU7LR4pWOUMSd4iiR2Y=; b=HjYwZpEnT2K6xFm8jmHPLWIFpO
	09doyfbvDwiq4Z7a8EGdwEJN81WKSm/vyVv4uuU26HtJK5aTccCgSlTiRTLdiR3D/SoKC0yMy89xJ
	yDQBaghLkLJDglLWvFqeUUBegbiVcG0z//EDeuYmN7ERpTy+e7XB3YdOyW6hZOiBrP9T320V0ZVVy
	HTldgMQ2CMS8qZXr/h53pkQABwleugqVTvpuPhmbM0yq15ji2DnSXy34R2be8Bz+cCSSICheRBdia
	vgU93guvsoZOTDXV2KzT21fSqxnQdcNxEg/vyQYxIjc0+lzOr2nK4xPTIofb7wg0k0ogiZPl6Jy7C
	W8sstQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVpe-0000000G1cL-1v51;
	Tue, 16 Jun 2026 15:36:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVpc-0000000G1cA-3mWg;
	Tue, 16 Jun 2026 15:36:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B76660103;
	Tue, 16 Jun 2026 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D661F000E9;
	Tue, 16 Jun 2026 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624164;
	bh=Wd2qjQayVtYNCQpH6/G5M3DjEU7LR4pWOUMSd4iiR2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PUqKcTgJZJNNJ7C+53ifL2iwOd38k3YrP1gTidtlMc9Icth6gYhdyVFBP/4mDKfyD
	 zo+JQmSCKriy01gBjLYH8/j9DZ9kb+Z+wRQztrEc/VuBwShcvKN3Ztd9ia1ClnLDeU
	 BI5zUz/xNuZ6ql3jlFLL8qz0VpXBDI6SkT3aw5zLrfJhNaNUhKyKGUZ420uGKnOJs4
	 hRW6loKmVZCGvJovvzqlHiO0TgtmRS6tk2XcSwqwnjwln2r2aZUhEie38QPvL0mVdI
	 mMHbSfwtaiSV20BbCUdTf6unkjr1nJ0iqWJFG8hEWHOgpuYs1mOdgG9y3C8OgvIrjz
	 dvJhAME73YU9Q==
Date: Tue, 16 Jun 2026 16:35:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <20260616-awaken-gills-d341ee5c2dd0@spud>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
 <20260612200717.361018-2-l.scorcia@gmail.com>
 <20260615-palatable-aerobics-3091229b6ada@spud>
 <CAORyz2+4EquYcUHEnoq0N_p7vCmDpPONEhVrmAfO1eX_RNMYbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A1YEOfPW2EWY+SaK"
Content-Disposition: inline
In-Reply-To: <CAORyz2+4EquYcUHEnoq0N_p7vCmDpPONEhVrmAfO1eX_RNMYbQ@mail.gmail.com>
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


--A1YEOfPW2EWY+SaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 07:09:39PM +0200, Luca Leonardo Scorcia wrote:
> Hi,
> yes, sorry about that, series v6 has been superseded by v7 (I replied
> to the thread and marked it as archived in patchwork, please let me
> know if I have to do something else to mark it as obsolete).
> Sashiko was correct, the regulators node is required for this device.

I have no idea what regulator node you're referring to here or what
patchwork. Please don't delete context when you reply.
If it's the devicetree patchwork I don't you need to do anything.

> Sashiko also has suggestions for v7, a few pre existing issues and a
> few nits here and there but some are actual improvements. One bit that
> caught my eye is the use of the modeset register in the
> mt6392_ldo_get_mode function. I have to double check that with the
> data sheet and the android kernel sources. Not sure if I can do that
> before next week though.
>=20
> Is there any way I can trigger a Sashiko review before sending patches
> to the ML?

I don't know sorry.

--A1YEOfPW2EWY+SaK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFtXQAKCRB4tDGHoIJi
0uJ3AP4l5qgb9a67VOWooa8/C0IiEUjhucKSkZe27ZRd032Q4AD/SBEgsH9truaa
XQXPJ0QL5mTdmrYt2N205j+jwOitVAI=
=xinJ
-----END PGP SIGNATURE-----

--A1YEOfPW2EWY+SaK--

