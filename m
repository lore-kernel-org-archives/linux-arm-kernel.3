Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89663C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fHXwD8OvU9cV/MDshPrR2qNKLFhCGJ3BcCfTPyE5/c=; b=b0Gkrv36JSrDphk5lUFTQfSZxO
	ItDihg5P8YG5by8WN1dWBCP8a2m4naNwIeeAScqUy6TWOzg4ZtF6/Lu4cfsbfi4S0Zgh4qox+tF00
	6GgHL00b4cv2kdxBSRQWEItTVXYzpObMZO3v8tMr1mzIqCHW3f5X0nrgOnwdz58xbfl2yRuXzW1RT
	MgySmPLJRqoN9sC3gczpN+DInCLJlkP2faHOYGDb5dInnud5AsJw9BWVc5A4kkxfIGvzkjoUWhcXE
	7iMWxlPcFs/ffCYLTZ7CSneq3BQlkWQyhQBBW1v74nmAFXZt8MirFwHAwhx0cMsJ3BSUegnRx+uq9
	bi8N4Gmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcy2-0000000FEVV-0ngM;
	Wed, 07 May 2025 11:29:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcv4-0000000FDsv-00Sz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 11:26:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40C19A4D830;
	Wed,  7 May 2025 11:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F92C4CEE7;
	Wed,  7 May 2025 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617192;
	bh=S1L7sH9tYMVEFiiOMdXeISnetXLHKztjNnRoxxPOYsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SseTs20xYh0gfvLKGoaEOfu+8HsCRGQ2H/2K1hhe+LR3LqgTb6zHCHAm8X2+Aw3C4
	 NH0jXzNUKniMogbcx2bm5Jgql4YQm/fIigLDg4DtC32ljr2sdU57Vgq9O1iDD4iJy0
	 aRGS3wE0Av0sUh1Y7Mc47ynR4kOQHoBm6pFJQvRBYB8Ep0q0Z44m7pzuoQARNG7Nw1
	 2P5ZLAzu0kJ0E3lCrv91dYtaU/c3PXrzwDSD2rq8jR4XDh2PqgorJxzGhz4l6Ws3Ih
	 xBpfU4gdqlA0PC4l50tI9cBtfZ/EWxbJayFrhlmJnkB0F03UuGSTolgFejRfSe9zDV
	 CnETt3yUKXDJA==
Date: Wed, 7 May 2025 20:26:30 +0900
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	daniel.kiss@arm.com, david.spickett@arm.com, luis.machado@arm.com,
	maz@kernel.org, richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	will@kernel.org, yury.khrustalev@arm.com
Subject: Re: [PATCH 00/20] arm64: FPSIMD/SVE/SME fixes + re-eanble SME
Message-ID: <aBtDZlAJO8UfoLKH@finisterre.sirena.org.uk>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <aBq7-_VhS8DXFgYL@finisterre.sirena.org.uk>
 <aBstn-9GClsAmlXC@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hrKbvo1MwThWmI8W"
Content-Disposition: inline
In-Reply-To: <aBstn-9GClsAmlXC@J2N7QTR9R3>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_042634_163926_BC4B7740 
X-CRM114-Status: GOOD (  21.10  )
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


--hrKbvo1MwThWmI8W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 10:56:54AM +0100, Mark Rutland wrote:

> If you have a specific objection, I can consider massaging the wording,
> but as it stands I don't see any problem with the commit message on
> patch 17. There clearly was an incorrect assumption during development,
> as indicated by the code, the comments, and the documentation. Providing
> that context makes review *much* easier.

I don't have a specific wording in the style you like right now, and
like I say I'm not sure it's too important since the actual chagne looks
good.  The main thing is just that the original thought was that we'd
not supply any register data unless in streaming mode which does due to
the use of one bit boil down to setting the FPSIMD value for the flag,
but the intent was more that the data format flag was rendered
irrelevant by the lack of data.  I was definitely aware that the two
flags were just a single bit - I distinctly remember seeing that and
thinking how unhelpful it was. =20

Life would be a lot simpler and we probably wouldn't loose much if we
didn't support the FPSIMD format in the SVE regset but that ship is far
over the horizon.

> > I'm on holiday for a week and a bit more so probably
> > won't have time to review properly, other than a couple of the smaller
> > patches.

> No problem. If it's possible to throw any automated testing at this,
> that'd be much appreciated.

Yeah, might take a little bit since some other stuff blew up and my CI's
a bit miserable right now.

--hrKbvo1MwThWmI8W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgbQ2MACgkQJNaLcl1U
h9B+WQf+NVpn1KGSBLdjtgiLDC9ipmYcop7EB5j9gkGEMcT5YD4HhBC/KahMsINP
mDc0r/F53X+BcOCkJJWNKgebfayuZPqkckZBD5p9/V7GHTjZ+jVY1FkaKj8KBNU/
jgI+/MiEDxnOGnerzPk1HcCkX8DXL9kzEqXPGs+hhH4Pap+/Qssc3yjhWNj7CeK0
B4E3R9tmGY8bKTn45oZFpQC4iiIEcBuYDdlnLwWWEf5UN5VT+rX0FGFGKkF0fQxv
uNx2dcM7uB4+HO+RiUo43pFJjaQi9V7z7oCjK5y0li8XmET2PJbTEt1LwK3mBF6u
R/bED2hHGNHK1R5KViFXqU1Vb6BKpg==
=kikk
-----END PGP SIGNATURE-----

--hrKbvo1MwThWmI8W--

