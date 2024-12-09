Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381BBE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtWfRQ26OIhM7EeP/8RgbWs9Yf5wwY/1/Y9HcoU6Mkw=; b=Y4Y8kw6NR4vf0R9XaEoHqNbq+p
	9aP+y9/YOjOT1p/LyVpdslh7wdzqgBOknQxHeQ2/8byqkCrOHRHtdGWJo0yvjHMNmLPN6S97kBtVb
	PJF29wrwwdeNYsMn8VXix1lHheTCDhz3t2VIyBP+qejlApC82xr6ZQAF7vVHO8RYeKO5nRXn+4W87
	tzjFFBOEdtxu+1+hTYrwpW7hxbabZLBL5et+yS9SanvBt0zj3RYdYsI1oSWh8+fV411OQvB0EZCAe
	NnXAH+659/ls4Wl9BkkAXYl/vNvzy09G52NGpJ90FG7xJkC5oWLaca1BMtVODYSE6Krk2hpzbpLB/
	3ciFqfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKePm-0000000895r-0Pfv;
	Mon, 09 Dec 2024 14:07:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeOb-000000088lf-1Yyc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FB44A41454;
	Mon,  9 Dec 2024 14:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2283C4CED1;
	Mon,  9 Dec 2024 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733753156;
	bh=TtWfRQ26OIhM7EeP/8RgbWs9Yf5wwY/1/Y9HcoU6Mkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFiJhMoVz9wtNpUFVkpnA743TrXqCKzFC5Fs1K0IYtqJXoDA9aglbIjTO9h8vsOpW
	 un9zS1OJoAcFQ1cT/6+4XcKWP6Ro+wSWGlv4zxXuuxAy5UqvGNrIwILDFbgtS/KMeb
	 pdCN46SnXhyYsECzrDi6OLrv3Fx4cdyxUCRzQTt4TVU3XsLPmA1gjehUmjZBrCR4ML
	 TUhVXvDxyMeZEbNVl00aDm/ffuH6+74ApHtwApjQpQf0K7c1D4c1jrhjBum6gX3J+z
	 LR3p/FcQ946lsxQfNUsWHAs4yq9QcVbtyig7360UNzcbtVaQfSWUFxQ28CoJoMKad1
	 iKnvFxXmRHenQ==
Date: Mon, 9 Dec 2024 14:05:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH 1/4] arm64/sysreg: Allow a 'Mapping' descriptor for
 system registers
Message-ID: <06726aa6-3be0-434c-9870-3d40a5ff24f9@sirena.org.uk>
References: <20241207190740.2607673-1-maz@kernel.org>
 <20241207190740.2607673-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m5vTs3lMncUYB5AX"
Content-Disposition: inline
In-Reply-To: <20241207190740.2607673-2-maz@kernel.org>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_060557_471283_6ABB36DD 
X-CRM114-Status: GOOD (  10.05  )
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


--m5vTs3lMncUYB5AX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 07, 2024 at 07:07:37PM +0000, Marc Zyngier wrote:
> *EL02 and *_EL12 system registers are actually only accessors for
> EL0 and EL1 registers accessed from EL2 when HCR_EL2.E2H=3D=3D1. They
> do not have fields of their own.
>=20
> To that effect, introduce a 'Mapping' entry, describing which
> system register an _EL12 register maps to.
>=20
> Implementation wise, this is handled the same was as Fields,
> which ls only a comment.

With Mark Rutland's suggested clarifications

Reviewed-by: Mark Brown <broonie@kernel.org

--m5vTs3lMncUYB5AX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdW+T8ACgkQJNaLcl1U
h9Czvwf+PSttBMTnItSkDEFFS3RT0/CsH9qdmk0+RQXLDaxb6bfvwBfoYsD09/Rn
dfVBjFLNKYoGMGzQxrqlLryqki3CnjmMGdZzuqhkcKEVZIfpzVmredUfH9uwIKZr
E3q4MNiEyd8vv4tnNoC9wDQ6mVm5/qBjph9yfY8MxVlQHQdMrFgqx+HSRHDn6ZKE
OSFhU7L6blyxaz1pIwEEfiRhBsG+ZaXop39NUIYa+k1NbUfNxy41zrGAap1a65La
ISAaxuNoHVMH3JuvKSh9j1L2yvLGXXOUPXB3j9dqZnPGKcf8aWQQ+VdFCgh+blJu
16oUCFJqBy6IvLuhCB0NlgO5P3sV8g==
=gLmv
-----END PGP SIGNATURE-----

--m5vTs3lMncUYB5AX--

