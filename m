Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A8F94CA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2J4cdDtFTR1SDj3cXANFTxz51QNNyd2kcg+wBLNTi4=; b=hwbCID5Ey2T3PQmL/3qIyyHlCB
	Qwe39wx6VfuPr5ihLca8L9GcTxjUg+lL807DQxmsXaZ98v+1U5FrSIQQZKD1MMMetBDrLwpchk4Bj
	ueyXDiT/9qEXzB0Tuo0s/TLESWNaL3bB7Rv1gYAtuRftgFXb9HDb4/wO5ZPhKTIiHecnlQix8ENa0
	n64CAuLDmZT2eKGhWZwvKC4L0n5TPDt2MtcTJldXYs1IG6rO0xkmz+b/KS/dYt741kwxEAj9ZFJm4
	PlXyoXCz+Aqk8uja+gETkff2pKwWoJs0SltAXdbAbZG+CH3SHpuauQf5aVBkaRtsZqYt5I9h+UBLh
	/7o0+erg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFH6t-000000095yC-2kF2;
	Tue, 21 Apr 2026 19:50:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFH6q-000000095xn-3qwn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 19:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0F0041941;
	Tue, 21 Apr 2026 19:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD412C2BCB0;
	Tue, 21 Apr 2026 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776801011;
	bh=jUatT9v4w7olRWsNPaL6Ydq9t2x3xZyLOCqssI66jOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsEeyrHqJhFNP0aRSmgql6ghCcNqcTNpPK4tTV8XKNRs8geDHkLsuWMZv7gYeipTL
	 OOJof7n58Fy7BHKf1i93vlRPIISn/+Xb21zIpaDfj4iNZa37oMMBr9v17uB0d9JNlT
	 Pv7dJmX7oa/sGCesa07SvlhKRUm8c4PlnStNf/oo+3l+TcLuiiTGmvhQMEOGDNAtxm
	 gyWEqTjZlaZS4rcfqoAkrrOdW19RpNR7aNsKyXcoubstlaMoSlQwSHj+wCT5VEAScW
	 kBhPP694csHzOaIWhnSS41arrmlfU7YCahMB8x5LkoCcNKmsidfLmh9DWMnxqDQx5C
	 FzXvpMguWiWwQ==
Date: Tue, 21 Apr 2026 20:50:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Gabriel Jacob Perin <gabrieljp@usp.br>
Cc: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	carlos.albmr@usp.br, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Change manual bitfield manipulation to use FIELD_PREP()
Message-ID: <16ac8986-3d21-4f6e-886c-afdc0709ea8f@sirena.org.uk>
References: <20260421193113.1060213-1-gabrieljp@usp.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcD3P89RG+pOrddx"
Content-Disposition: inline
In-Reply-To: <20260421193113.1060213-1-gabrieljp@usp.br>
X-Cookie: Jenkinson's Law:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_125012_980502_355D1089 
X-CRM114-Status: GOOD (  11.56  )
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


--kcD3P89RG+pOrddx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 04:31:13PM -0300, Gabriel Jacob Perin wrote:
> Co-developed-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
> Signed-off-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
> Signed-off-by: Gabriel Jacob Perin <gabrieljp@usp.br>
> ---
>  sound/soc/atmel/atmel-classd.c | 41 ++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 19 deletions(-)

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--kcD3P89RG+pOrddx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnn1O4ACgkQJNaLcl1U
h9BcTwf/Sb4g2CeFJw62AfZzA/9lXogBhXoHMW8RCQp8zr6Ja7pW/Gdj3uJ9KFPl
UsHhV+r7+Cn4BswcMtOeKaeUGTCD+FW/ZhYRct8+ck0Sn+o/BMvSaP4WrzwzCJ2K
TxjQU5bc2+UWePHd3Em5GLc6Tgc8PDYucMitsrjV/g8LKYNTbld8kNuKOr3REZgE
EM2HCfsDCiamuBUrHrTiEv/yuhC18jMZJBvi6yPRu+Hu/gDFSsH1+2/k8ZmLvzUj
nKRhI630Nvp/D3OR0ap41h7eaxIAxlLFrRG5HK26yi+NNkqAZAb8+DE9rLY1Ikwy
o74da2cqRoSKtN7V+exICt8pjn/Uvg==
=PUmu
-----END PGP SIGNATURE-----

--kcD3P89RG+pOrddx--

