Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49162C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivwRKrM7a+JQs2oGmLyCMI+T7Np32kctvJz0lG+G9iM=; b=S/lOBgQCVgPStOyc0kzo47lkuf
	u4alDpX9IffijD5Bup8juyIVO0ia9beQbu5kNUUfg0vD+zEwIRRRKH0WJglILSuRpTE1ksZGMGBTa
	1gG83CLl/CEAZLNQ6K3ZxRcy+E6bvrL/1ES2Bd4HlGlC8Ryo+iqwTTUPwfeAteq+3H/chbakGC0xC
	YqLJgoLmY2XU+ycE13Fnt+IO+oLpbsbR8JuKDwoDUJXoj7efQinSIdocmf14sHGWRPK3Ef6XivBXe
	PE3UpHoVK5CaPFQKOAM4pnUdR4kexmunDmVh+feV2jANS3Hb11fvY6UQWiAKzXL2M0kp0iRkTvHjw
	nuh18S0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlAAl-00000004SP2-1Kd2;
	Sat, 18 Jul 2026 18:54:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlAAk-00000004SOr-2PYl;
	Sat, 18 Jul 2026 18:54:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4FB360018;
	Sat, 18 Jul 2026 18:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7882E1F000E9;
	Sat, 18 Jul 2026 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784400841;
	bh=ivwRKrM7a+JQs2oGmLyCMI+T7Np32kctvJz0lG+G9iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cka3VSZgKkuwDGTpdGiQF3TI0XEo1Mj8D0lH8oRPSIyIrLnr4aerN+RQcCFFIk9Hf
	 5YoKbl+VHFbPo9hViMlrt4xeEQoaLfOmz6qiyBeuGu6EYGi6lJg5XWqXM9yZBt1bS5
	 xhxruFBwLFPkmY7iSS+8WJAIV/JMHa+qt4IvOw5eRasTr552EXTbUz78uKLPr2px5a
	 pGiJopjThdn1TKcDV/4bawTNF+Hr8J49tUH8tPBV4Ac4ofe4sZVC6QVw2SeQiIdYuo
	 BQF+wqzxRDsGg59nTUFl2KLFc739fRRjRRBQPYtx7xX7ibgA0bLJdm+hd5PeCQe29Z
	 hmtkjBJGg8byA==
Date: Sat, 18 Jul 2026 19:53:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: topology: Guard against out-of-range mixer control
 shift
Message-ID: <a28a49fa-a8e6-44ac-9401-4ac0286fe620@sirena.org.uk>
References: <fb5d83513eda68578f0275b7fa274f172c08a0b1.1784395999.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+7cZN/fsFiiASdA"
Content-Disposition: inline
In-Reply-To: <fb5d83513eda68578f0275b7fa274f172c08a0b1.1784395999.git.daniel@makrotopia.org>
X-Cookie: Do not pick the flowers.
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


--W+7cZN/fsFiiASdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 06:34:42PM +0100, Daniel Golle wrote:
> soc_tplg_control_dmixer_create() copies the per-channel "shift" field from
> the topology file verbatim into struct soc_mixer_control. That value is
> later used as a shift amount in soc_get_volsw() / soc_put_volsw() (e.g.

>  	sm->shift =3D tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
>  	sm->rshift =3D tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
> =20
> +	if (sm->shift >=3D 32 || sm->rshift >=3D 32) {

Won't this break for mono controls - the right shift lookup will return
a negative error code?

--W+7cZN/fsFiiASdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpby8QACgkQJNaLcl1U
h9CWKAgAhFwX4gS+72WmY2yCfB3I/YS+ThcQGmD5qK/5tbNLIrLxiK5Q+ieX8m6b
/LjYBogYwglN65Z52MSvIczTCKT3RWA+owm2Zls9Gf7FDhswD8UkLuD7X2PkhXJ9
lAsb08wSpRbYNiAiUmsUk/3sWsYBy0ao3MB+jxXc+0aTsUQ9GKpYss9vzTgHDhgE
a08lHuPe264xOVCnDbH/U8dF7LawK3q3gcKqnxC4idqsevACRCUcI2OuHGI9bhj3
FxlC5fvOKpcFtS+gF36yUSuAqdox5Irqyiha1gd3fHFLwvJhX6t5zw/MzoCq/rK0
MuyeUNZVOzSVorURGosYd3xJk/9NxQ==
=oNWG
-----END PGP SIGNATURE-----

--W+7cZN/fsFiiASdA--

