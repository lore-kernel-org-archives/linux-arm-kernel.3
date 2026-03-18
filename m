Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21B710775E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4jIvRdq41sdpkNR59YgAhgCQF9p5JBAIePvr6PeZfc=; b=XDhaV/YduONwobKDTERB4fm6kb
	xtZ1R+FPPoiIsoRn+La+/lIUvuTHPxHtboMepj7wKyA2/rj+ZxEV8ZX7r9J0r1WyPBEJvgdjSHJLr
	Svp3Le/9zgjoOgWRm0R/rMywHhaBqJ8pKZvYmYtDwk7mNBCDwaSP4yxY9P/HRItowb808YsMGzVcq
	6KF/HCehVRk4RPwvZpxYDlkkFkbc2MSCadDX0tZY+AgebWbOJGXexXMqXwGpY7BLHeKoa2AdmnAmV
	Ix14aRnLXncDf5zvdVUtrTY0eDtDjBYXBiSs9SrtoMH/BgYsmVWuen4QUGRhdvjgxu+OdHSmaKqeg
	jSZyfzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2taW-00000008uG9-3VBH;
	Wed, 18 Mar 2026 16:17:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2taW-00000008uFp-0eRz;
	Wed, 18 Mar 2026 16:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CD5560054;
	Wed, 18 Mar 2026 16:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64BBC19421;
	Wed, 18 Mar 2026 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850658;
	bh=04y6croxeOmqjnbcWmSl67kEZY37J97+g2n9aRbWKxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMyFt0sls9ZMvB259JQK5xEKcwEU6tWQCb7EZVPtB19bPLNOuPh5DGBjKXLHDad5X
	 z4UoXfYnrB/j2H9Rdn13E3nXLIXOprLaEnc91zJjr4Qu+G2Xb/v33NIuxYR1qaBOxc
	 LqjIXQTs0tFQa76Xqsh39hHSnVsEc6R8BDQP9iCTUhNBZ2EjEBnYjCLwvgZfvU2DYi
	 aDGwm13JxDp+0vLUXP4W/pWCo530Ug9MgLRb8EypHKYuIr5aEQ8P3DRB+cm+6GA7sF
	 iL3Zn8hc8eYBS7GqTOG1xR9J62Fp8s5CX9PwCDIJtVTOtdWYzE5Y/zz9s5Vd5WFy2o
	 9t7QlYpbbm3zA==
Date: Wed, 18 Mar 2026 16:17:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM
 mode
Message-ID: <339ebaa9-9642-4716-bca7-6a32a135124a@sirena.org.uk>
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zb/SnunaRrrnfbVQ"
Content-Disposition: inline
In-Reply-To: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
X-Cookie: All celebrity voices impersonated.
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


--zb/SnunaRrrnfbVQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 06:50:25PM +0400, Alexey Charkov wrote:

>  	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MAS=
K, val);
> =20
> +	if (!sai->is_tdm)
> +		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
> +				   SAI_XCR_SBW(params_physical_width(params)));
> +

What happens if playback and capture have different widths?  I wonder if
forcing a TDM configuration with the affected CODECs would be easier.

--zb/SnunaRrrnfbVQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm60BsACgkQJNaLcl1U
h9B0mQf/WnluiIQfcuWPQwkJP+jdH4bqZ9WjRB6WWfMMfGP2Q+Q9lOEN0deP061G
alqHGYpFhgQYNqP3lYb+pY3hCxWPhnCeDtuSlWL9i6Ir3MY4rievxqOHpG8O3gXK
A4eQzHNfAdp6szh9HMWfd5bUR2hkaH8UNhzQrvwSVOMWd0ks2x3DBX3uH/iFS00M
nAU47rUzn/jL6wfOTHKflWvgBdXWw25nbfCHKpRb1rNjBqSleUR5sxwIG3QpOlkr
aT0R36ilXkp0J+JnKXxbEcilgVfCcC8Jyz+UVSN17oMgUq3oj8+TaYRhovkBmtKI
4dsbyvbA/pgZ8TPiVzLIr8+mCmO7dw==
=vI0e
-----END PGP SIGNATURE-----

--zb/SnunaRrrnfbVQ--

