Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC14ED2E9E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTfIcvaXtVOJ3RLpAfsIMnhBPDjlYHzkHn7hReN4Nxw=; b=Vlz468Q/+klg1x/P+ITCVvBnd9
	VQSg4HJDSN92adIefmiDy2BaT99HMHhLCQBMJk51CUAa3NCXyuJA26lfGpZiLefBkQ+lDx6o+CHnJ
	yHYr3gGOWKmQ7ReL50h5MHh8iVodoZbf2Vgpx082e6FZvXXu18HzifyPY7Lgy+TT/aNIn8nwoIADX
	XqflPLB6AprfoQgUOW7RufQNqkTDYZfPHLrMVwhU1r7AjochT++xbpSflInJkLVncGkj7/3DyL10g
	PM0qFh4Vh/WPCMVpH0ia/QvZobbSazKD+EqNP9gpfT2LkMqaaOyvDG4U9xrsKmJrI4SXzyXQxEwyH
	d2xxqRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUAa-000000008oK-2ujd;
	Mon, 11 Nov 2024 13:09:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAU1U-0000000064K-3Lzt;
	Mon, 11 Nov 2024 13:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97D395C4D33;
	Mon, 11 Nov 2024 12:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4547AC4CECF;
	Mon, 11 Nov 2024 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731330003;
	bh=cTfIcvaXtVOJ3RLpAfsIMnhBPDjlYHzkHn7hReN4Nxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FwjG9dy8feOeUMgscat3wLAgttFcsxSX8CisOBSVWPZ76R/5Jw98YWorSR/QxRYqr
	 4kqy0OQo8ZzPhI8n0THBGE7X3UT/mXUCloYUhGKVheaVd159H+nOX1/liQBBX2TUpr
	 kW8Ci9ycOjRIGdksZRw8mOvO7/07rENEKv0Qxy+XQ764acvn1NZw45chbfIR1L8n6O
	 8vd+QG34B9RgmYpxE9iWhCFRKhD8+Y8VZquW1yqcRkARzQGAaOxYzs3rnEEymv0tpA
	 CNJAIaI17MkiOMFCPxqS3IE/rhjwt8cfAt7AO8yzzgRUm2xthPmwIM3lDONUkjvoJ0
	 OXEcAxemTtLmQ==
Date: Mon, 11 Nov 2024 12:59:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tang Bin <tangbin@cmss.chinamobile.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with
 local dev variable
Message-ID: <ZzH_yJWLJVfO3sux@finisterre.sirena.org.uk>
References: <20241025080026.2393-1-tangbin@cmss.chinamobile.com>
 <28f2bba7-40f0-4015-af84-d3c08c9a14c1@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3w1txq//RnEmfVad"
Content-Disposition: inline
In-Reply-To: <28f2bba7-40f0-4015-af84-d3c08c9a14c1@web.de>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_050004_911911_AAB13CD4 
X-CRM114-Status: GOOD (  10.22  )
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


--3w1txq//RnEmfVad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 01:10:21PM +0100, Markus Elfring wrote:
> > Simplify the function mt8192_afe_pcm_dev_probe() by
> > using local 'dev' instead of '&pdev->dev'.
>=20
> You may occasionally put more than 51 characters into text lines
> for an improved change description.

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--3w1txq//RnEmfVad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcx/8QACgkQJNaLcl1U
h9Cppgf/V3FoC1TPeB/EU3FEu7W8G29WVYt95os1L7qazp9yLlFvUP4kmeYWblBW
woE1a/RmQ4zFeOaOve3EjrJnVtf8zs9xq7BP/QUc+DjwB1kTh8eHELeM8zFcE7bX
NwfMpeiZHWBLCwVsNugiDy87OQqgKYU1mIoc9SUi+SLmEcGiLsNgJuUuJvRGozQ+
URyh7lKaAsQCwQwzF7uXmzBCUhJ6yfKNzn9KkF3KpEAPNJadm+QJ970OnTHPPQNn
61g63h16VfeyXwgGVkLIyz/pOwegFLbUsIlE0xvq0rsq0roApY/BXNHfxqRoYM3r
EbmiWMr67Fez6QvJz48oYzdj1MS/Qg==
=p8XM
-----END PGP SIGNATURE-----

--3w1txq//RnEmfVad--

