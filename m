Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA67CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oG454rn5zmojbp+/mRa6q5csxSPlmItodqAgss5SisY=; b=lK0B9mvlPtEI3EdSzzT519mQJl
	u4/WqnqXXpTeF/Wi90poTcdOIjuw6cVNsqczflUnHQ+iC0NVuM7mQquZ43puLcbo3fRtwpQF9gLj4
	94jXuIPFrO/alKyOKTeubDeW2VYncbQS0pPOG8Gx9WgnSc4RHUDSFxBMc4f2hha30V87bPF3jAT6E
	yuriG9xDlz4EKqniqwETixvIaofIqibVMahfeFA7MvfGlCztserx1XTdu9mMVxx6Zb1XDps4FFN3e
	g+MRRkSMG2CtBWm1QBY/tkQDajYYBL5BBXlgM2/G/h+Ugg2yak5LmA4WO8NuwxY60lU7UROatoln3
	z5RIsQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFsy-00000000ggx-3uql;
	Tue, 19 May 2026 08:33:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFsw-00000000gfx-1trl;
	Tue, 19 May 2026 08:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1C724027D;
	Tue, 19 May 2026 08:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B2BC2BCB3;
	Tue, 19 May 2026 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179585;
	bh=6TGMMTE0u83WGBGyaqlbzGcDa5UQfun90gQgRnrOvk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpkB90Y3Oz6tTQ+vY8ZH4rWEgyk2v7mcacbSqK/O10gGaK8t5QuPKcqL0ogFiOHER
	 F5BjUw/ZEFq9ECeSspnZM77VZKWP0zJ5BakuXhS8PvcczTDxxiGvEQ/LDMhiyESwrV
	 gn0Ji5Xz3xjUdZI8DzvD0KZ6/fZB6iMg/yh0co2WfgPStjDT1CSiIwJtZq3P6UDKVB
	 5kmJ+JYvU70no82Pn282yrqYwYEgaW1QgBCKhQCyHVxezo3qRRpvsY93T19h6d5Jli
	 nwqLxZtcmD5V7pyKfFFvmvbozH8RB3xgFqIZpzhi+6ob4NRnmtnTB2ZNgEOaVB2LLL
	 t/w0VUH0j1Ygw==
Date: Tue, 19 May 2026 09:33:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
Message-ID: <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
References: <20260519010440.629290-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bRbs8QHSgrH1Itrk"
Content-Disposition: inline
In-Reply-To: <20260519010440.629290-1-rosenp@gmail.com>
X-Cookie: Huh?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_013306_514327_568238D2 
X-CRM114-Status: GOOD (  13.96  )
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


--bRbs8QHSgrH1Itrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 06:04:40PM -0700, Rosen Penev wrote:
> For whatever reason, GCC is unable to figure out that i2s_num is a
> single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
> represents. Add a min() call to help it out and fix W=1 errors regarding
> snprintf bounds.

> +	i2s_num = min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
>  	/* Get I2S related clocks */
> -	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
> +	for (i = 0; i < i2s_num; i++) {

This makes the code rather obscure and will start silently failing if we
ever get more than 9 clocks, we should at least put a build time assert
or a warn on in there.

--bRbs8QHSgrH1Itrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMIDwACgkQJNaLcl1U
h9ApDQf8CKbgltfBHlqjDjL8rukX2pWSsSamJye6jR/FaVEZcCEq1DGkd+gBUaTQ
Wmeyqpn6s+OawHMTL1yuTrXcAApnXmWVeKrOhW7h7TnfHnJvyTEJZ69lkQXrk/yf
V+DF2QZNJzwzp87cluUEvhDUgQFhLkZV8bxdmYIfPRPPlAsAar3brLsVNx5Vlp5/
sEGYJ29q1Na6/DrqWuUv3JGMfNBwp73VSVC9SzQ4IZbaCqngsdUEdIMCxK0RWkVy
YhXFQqA6/+tDc4L0WoKxsmgGsumRn3GfYlyTG9W4kpakrCklVTOgzoXXobAbhwDP
fF/+U/Qc2VKq414MKCdyoAA9Fhoorg==
=GZfX
-----END PGP SIGNATURE-----

--bRbs8QHSgrH1Itrk--

