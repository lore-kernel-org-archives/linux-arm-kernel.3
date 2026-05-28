Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FAFCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm4lTGbp5AhLO9VmKrf8pXms0KjfqVinspNjmknVf1Y=; b=Oz5xsaE94wJuDZRMGNaOC3tPv8
	6xd1L7FY8Hcq56HhEkoFSSRYlbCOFNnI3Y3YclDnPE8piJfePJVDpuM0jAZfh+UB5OCZmymWMPQfz
	3KuQnXZ8+PeSR0H4xU7ut2SFOWxWcHNLTjZ+cVTaZqifnyZ3xlNj1aDA/r1s6xtkXQyqWuckj5lPL
	+y3Sl9TXpB6oCWrOX8Ec39sW4CRLaaRlrzQkiRh3C9MbKurl6GGyliZINcmb2ywUkUx7NhwIUxXTw
	rvSKm9F7ubBAEm5Wa81E3JSY+haGD93eSCJYS9K050aHYyz6YPav93JJh9fkD4m+UNuVxpK6d6s9D
	Nx9860nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdlx-0000000618t-0Etc;
	Thu, 28 May 2026 16:39:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdlv-0000000618V-1cDq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:39:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A55E43DEB;
	Thu, 28 May 2026 16:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02621F000E9;
	Thu, 28 May 2026 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779986390;
	bh=Mm4lTGbp5AhLO9VmKrf8pXms0KjfqVinspNjmknVf1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbDyuYsncZxpMLAQ20zyEh2HM6EmHABuhMvF8xaXXpS8YnjWj6pY6gwPd4q87DRcr
	 nG26ufiEsDC+oDij6IWocPXYP+sSL1IHhRHPtpNliI+bk/3oqLSjihaXaMyR61AW5Y
	 UJz6Yo1aBajl4sRdRcC7ItkZUWjyxEz4mjSRksAWqb6i41JqvLpOj+boh+VdkyriJz
	 2FTZR5uROYa6F142xOtgll/h74SJYKHf1pVtmQtjf18XBiekIG9D59DcdlZXmMVG6F
	 nDE8hlkHQldT5g8vwHCBDib75nH7ykUYBIZ6k0oyTZ/6lnAkPfu2xPa4KjbSzG3nhW
	 oiRxoVfMIN/7Q==
Date: Thu, 28 May 2026 17:39:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 12/18] arm64: fpsimd: Move fpsimd save/restore inline
Message-ID: <2ac4035c-75e3-4a62-bfd8-7b4179d030db@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-13-mark.rutland@arm.com>
 <0f666889-fabe-4cdd-9fd2-d87808329dbd@sirena.org.uk>
 <ahhqEs1DhShRpgXF@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36wiTHak1laAI5AT"
Content-Disposition: inline
In-Reply-To: <ahhqEs1DhShRpgXF@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Someone is speaking well of you.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_093951_438530_57C40D95 
X-CRM114-Status: GOOD (  16.86  )
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


--36wiTHak1laAI5AT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 05:15:14PM +0100, Mark Rutland wrote:

> Based on that discussion on the last patch, I've updated the commit
> message for this patch say:

>   I've used the SVE sequence for restoring FPCR, which uses an
>   unconditional write to FPCR, rather than the conditional write used by
>   the FPSIMD assembly sequence. I believe that in practice, this doesn't
>   matter to a real workload, and given it's possible for the
>   mis-predicted branch to cost more than the necessary
>   micro-architectural synchronization, I strongly suspect any
>   performance impact is within the noise.=20

>   Looking at the history, the FPSIMD assembly sequence was changed to
>   use a conditional write to FPCR since 2014 in commit:

>     5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents ha=
ven't change")

>   ... as described in the commit message, this was based on an
>   expectation of implementation style, and was not based on
>   benchmarking.

Thanks, that clarifies the issues and addresses all the concerns I had.

--36wiTHak1laAI5AT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYb9EACgkQJNaLcl1U
h9Dpfgf8CAJOiRw31sAIWe8H3yaZEXezd/x30puODL3sR2Ozk0mtgYr2ut7fx1at
PuC7RVIxZGxqjh2ctdUzYHUNR7E94pevOCx9AJ6I/mi08fM1UvgKknCd+auE+n0b
RVjUPEuLL6z/LKOi/G+xMJ4/B0AhRmnr378P+xhqmUixJan/c/F5+XO0rAdWKZhp
m0t26y6HEpe8qmwzntExQZns/jtZbba/3vdcWAgrhBZlCdjHTfujCKa4ubGi40CY
yMm+R0LYRHBEgxzkxS2NzXqZ3IJjq+QxviI1k/X9QREw42ZgjbxLqiLdPk+Fjkv5
qTjIXIuVn9S/iOg4xzmq5VrcE0Eo/w==
=7o2Z
-----END PGP SIGNATURE-----

--36wiTHak1laAI5AT--

