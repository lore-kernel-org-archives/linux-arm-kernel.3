Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE7CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6Giflfvchb6NZjulgUz4DhbUjIv9lOhcRLxlAXMESs=; b=5ALPqlULyTgle/oXqFMwt5SCx5
	cmnmOraYzX+E2caJe+o1PNJJEISGiM0jY4gk1ftaJlKswSERkf3nyCNe/S17WHaOmfas78fAeef6m
	H5nqesRJ9Egx26f07PmuhQwC2NCHvJrtgEk0PbEp2SiR1DwcEeGzwfvbGwISj3m2GNAB6qh58FSFZ
	AXpYR85/Qie717kCRCPQsJFdNKJ1aKpU+MfgbZ76Pji8ICx1LD4znTNnEBum4boeR4pFlZaRBSTVP
	+mNV3uJ96DxZshlFWmI2XU5xb3qC8gbolQjYm4tyoaqjxijoAPJSFp7ImsvDJo9qY3kFNul+NApls
	T7p5FeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDO5-000000045ZX-0PJI;
	Wed, 27 May 2026 12:29:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDO2-000000045Z3-2uIa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 649D643E22;
	Wed, 27 May 2026 12:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EBE1F000E9;
	Wed, 27 May 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884965;
	bh=P6Giflfvchb6NZjulgUz4DhbUjIv9lOhcRLxlAXMESs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=otkztzJEHgXu9dGNuOG43MBJN2ozTwV96u/a9ImZ+tzsmlLNahdOG5xIzU0Blr+ua
	 RS6n1DMooVRU67ILnIelJdUdWXy6VYKMZVF/FA1bRACsoHPR7+sx+4OXY77+d/7RPU
	 fenMFusxgicdrHfg4YfQ37PptQbL91ptZGyvvfPR35wKM4tNB8C6reAejmI8uWB0jI
	 Vs1pRhIAUEj/+3gpd/ewyi8yPyGAz+zhvDsGEj3PbkbsSSnRJ6zcN2rsCcAb3RQO9v
	 NepcK4n34ty4f4day/BL0I4FVub2Ep+ClZMArb+cfY3YB8/mEqMqXQvwmj/dtelbBf
	 JeOZuvM/S2cYg==
Date: Wed, 27 May 2026 13:29:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 15/18] arm64: fpsimd: Move SVE save/restore inline
Message-ID: <bf4fda69-c387-496a-aa7b-60ddb48e74aa@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-16-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ya5TE6wnOBYzJmoP"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-16-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_052926_760924_C8B1FAC6 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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


--ya5TE6wnOBYzJmoP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:53PM +0100, Mark Rutland wrote:

> To handle the above, move the SVE register save/restore sequences
> to inline assembly.

That's a lot nicer than the macros:

Reviewed-by: Mark Brown <broonie@kernel.org>

--ya5TE6wnOBYzJmoP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW46AACgkQJNaLcl1U
h9DSlAf+Pd+HyrNo7yd3QuYwJqQIVpP1gqWq92C8uv2n+lYBNthOz8jPZ5Kzqr8T
k3p51EhEuC942QtVHS6ZCgsyL5MI0x26lLRgzRQbh2zljubYTVvBLovXbiUnRyTy
JDBoIu/Ra/DmxqSDsPYouV5UFduCEiOopr7BI5A4vlSHbIYkED85eWU/jSmJHBTL
8mhyMwAFT79rTMkdgxr68snAQh0LICAlufv66tFTyd5x0Marl4G0WHEOetb8+QqX
8JM1xVIvFSUs6x5PIhVKivQ16Qq+hxtgnLv9KYEXWKVaXNR7NWUVGFDlbscKUkSn
svCUnf89m3L9pIY6acmXYDk3yzfmvw==
=lDv6
-----END PGP SIGNATURE-----

--ya5TE6wnOBYzJmoP--

