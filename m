Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD1EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkiGJlLmwWrIeT59E68+X2AL+DOeQuSZ8tAHUGC/ssg=; b=Ng2ZfHP5dvew53VdA+f3ouETEv
	3njUuNwmyz/fclTEjBNbEdhlTz6imDbMDxNSghE7P+XCi+H5Oa/Hr/pndgyHvj7byEn0SHyg2xcr1
	5wJs94qUeeqcNZztQAdP0wr97nfQYXEboL+8WADvl0iXH3NXFG5gqXHX0dVdY9Hcw+kqmTPYff7lq
	qHV4XM1xE3imzhPWwM1ryw3ebaxNR49wUbdRxBiPqFF+n6amYlonjidu6VvZTEfIfVCUC7I9iDY+b
	wG87rmykjdXj4BWwxQrCDAIr7069DaB60eDJJwKMi9D3y+OO2rQ+f5azPUikOeNkJW0VjxKH5dD11
	8+RvWm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH30D-00000009jTB-2xAm;
	Mon, 19 May 2025 16:06:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2Aa-00000009ZFJ-3HE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38775629C7;
	Mon, 19 May 2025 15:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99960C4CEE9;
	Mon, 19 May 2025 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667567;
	bh=SkiGJlLmwWrIeT59E68+X2AL+DOeQuSZ8tAHUGC/ssg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHmF9q4lNN/sFfmrTADP8R/WO8VdA+K2oV9AtUsKaMLYAhTJH33gTLwnh5IGWA5iF
	 O3X9MsPOpMaec6OH+KlZzxVXHyrXEret+oivJa6dcaYBpX+nzD9e3b68h8gP7EHtx4
	 DWnFgIpMH2mBXxpTSpK9HYLTJgwRSdNdb4l+zEd+Q5v7eqVlHwkTGbMjHNzL4YZnnW
	 EN/NC6nTovg5DGDsv+gsp3+kXDuQAuc5W0j0hF79WrWH0b1qmV+WBCr4dDdOCe/V6N
	 HRNiBbxwN3GgaSQNBfezI1I5hQ4RzoliAoylnUSd4iJi0odjnBXZR4e9u+P5BzbjRh
	 5NYymZ+eFNKrQ==
Date: Mon, 19 May 2025 16:12:42 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
Message-ID: <20250519-prepaid-exact-79cd35658c59@spud>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250516-unpaid-reexamine-922bbecd4cbb@spud>
 <CA+V-a8v64jcDhdtSvqE4UTuCnL9mvjXOwtKyiZJQUeEtLmMFNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="muECFG8tm0x08w4t"
Content-Disposition: inline
In-Reply-To: <CA+V-a8v64jcDhdtSvqE4UTuCnL9mvjXOwtKyiZJQUeEtLmMFNA@mail.gmail.com>
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


--muECFG8tm0x08w4t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 05:38:24PM +0100, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> On Fri, May 16, 2025 at 3:21=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, May 15, 2025 at 07:22:06PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document support for the Renesas OS Timer (OSTM) found on the Renesas
> > > RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> > > other RZ families, so no driver changes are required as `renesas,ostm`
> > > will be used as fallback compatible.
> > >
> > > Also update the bindings to require the "resets" property for RZ/V2N
> > > by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> > > the "resets" property.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v3->v4:
> > > - No changes in this version.
> > >
> > > v2->v3:
> > > - Added Acked-by tag from Conor.
> >
> > But v3 -> v4 doesn't mention why it was dropped?
> >
> Sorry I missed adding it. Please can you re-ack it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--muECFG8tm0x08w4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtKagAKCRB4tDGHoIJi
0mUGAQCm94wanZRqJPVRMl4qsTXCeaa0De8Wpjwqwga+3HUwlwEA98mVAvFIb1KW
lM6AR7Q1eJFIFIE7BW5Z3o5Z3dVlNAE=
=xE4v
-----END PGP SIGNATURE-----

--muECFG8tm0x08w4t--

