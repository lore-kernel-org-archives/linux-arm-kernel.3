Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB732CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRj2ZMjLQ9MiV/+cNr6hXbMzB4RDW9flfgaJjhzFxlg=; b=wIRinxADd6n8BZkxKrx1r0jJi0
	spsCf7hurUMri3EYIHowpjrRIESMTAkQcX47J9kX8yrxdILFfcfWXfeDWzDkuMT39ZhJ8re34Z1dw
	iQec9Zf5y9kwDd/1b5Gq1TP4xBjIqSNYxB09YLLPGy0sJ5EYE2eoH3gNX2ydqXpSM1Yx7VyTVMJW1
	SyCWjr2B4HDfuDgPyw/8I9U/HHtVc1cHBTvNciPYHn3yrKyn3PD8KYgmaUdqHN89w7idb/tPyTzrl
	gQzQ2MaNUPZaP5Ml8LPZIdjHgr41AnVE76lV4BTrmApMw8WTnZMkd5h+NSALd2vEP/73XiWzynQqU
	SrOwi/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpe3-0000000GZNo-3xh9;
	Tue, 28 Oct 2025 19:46:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpdx-0000000GZNL-2R2s;
	Tue, 28 Oct 2025 19:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7A5941A1E;
	Tue, 28 Oct 2025 19:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77482C4CEE7;
	Tue, 28 Oct 2025 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761680768;
	bh=w3VcIMFNncYev6xyyHdkUM5LCBO6snPWm/1dFj2oeDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHQwPYXmFh/OqSYeZ9teA5Cb8sxABO+O8gpxByZTt2tr8hEVS7m4Kx7nRp3O0dpR2
	 Wf5h41rCJpWbeni650Xz72zX0gfMhAFipd/8DlXFwhk1L+HWu1+15i+rLieZkj8cqp
	 f1zkHB3tL8lZ25qC7Tew3nGK0HceXRQJpmo47FWO3p40DBi3i8tPcQfMezW7rNyg2N
	 qnaHWVldSVRtOON2ncmO1upjl5nq+PagisYIQ7Lf1Ui7impHNFgqCSsj40HrCjkh0/
	 M8zZSgcF6fSHyvnCfyRYeIbTN3Hq4dBzATbHMd1Cd5J5Fxr/3bc9SMmPHMFIu6xDRm
	 6nGik2Ue5rHjQ==
Date: Tue, 28 Oct 2025 19:46:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
Message-ID: <20251028-semicolon-audacity-dd5bdd418207@spud>
References: <20251028-haste-amusing-78c28e834b5b@spud>
 <CALj3r0jQ-Y3wt=iyykrFVWDXyA+2feCtYy+budYzqOaVY6WqnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="niplE5DXJ5xnJ+ih"
Content-Disposition: inline
In-Reply-To: <CALj3r0jQ-Y3wt=iyykrFVWDXyA+2feCtYy+budYzqOaVY6WqnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_124609_662470_ECCFDDA4 
X-CRM114-Status: GOOD (  22.28  )
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


--niplE5DXJ5xnJ+ih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 12:38:10PM -0700, Coia Prant wrote:
> At first, it was to avoid problems with the beginning of numbers.

What problems does starting with a number produce?

> Given that it is already used by downstream projects, we have retained
> this to ensure that users can seamlessly migrate to the mainline
> version.

What's the actual impact of changing it from "nine" to "9" for
downstream users? This is a board vendor, probably nothing is even
interacting with the board-level compatible at all programmatically?

Please don't top post.

> Thanks.
>=20
> 2025-10-28 19:35 (GMT+00:00), Conor Dooley <conor@kernel.org> said:
> > On Sun, Oct 26, 2025 at 10:36:44PM +0800, Coia Prant wrote:
> > Add NineTripod to the vendor prefixes.
> >
> > Signed-off-by: Coia Prant
> > ---
> > Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index f1d188200..37687737e 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1124,6 +1124,8 @@ patternProperties:
> > description: National Instruments
> > "^nicera,.*":
> > description: Nippon Ceramic Co., Ltd.
> > +  "^ninetripod,.*":
> > Why ninetripod instead of 9tripod? That's what the company uses and in
> > the marketing fluff for the boards.
> > +    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
> > "^nintendo,.*":
> > description: Nintendo
> > "^nlt,.*":
> > --
> > 2.47.3
> >

--niplE5DXJ5xnJ+ih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEdfAAKCRB4tDGHoIJi
0t0JAPwMQxn3n3NWEpsiImdiPhus3HKlzVvj5qA2XdW1fRX9ZAEAv2NYiwS8iLK3
cRoKFl4agYz9hNMDop3M98ItwQtM7wE=
=VZvn
-----END PGP SIGNATURE-----

--niplE5DXJ5xnJ+ih--

