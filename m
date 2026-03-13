Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0191107BCCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOmfsoCVZBb7ldrWN87ku/IauQaPRx7xx12ia+os7z4=; b=iS44Gh7P6b+hqt1L8mk16ZPlCR
	KEwOujSfXlhpm9DYNz25rm19iQ9BiVIv+SkYhwKK7eWGr6LoXNaHUuMriDp2P0xuhOjLSnlo1k8Fb
	yft9dO2sj+4loFi62Ac3XSHKCP2UIMZPqpSh9Z/0Z5ogi6aH1NGIWv9uZu4fpf5u2q5Wb9lLU4XNG
	F6EGkOV4aBY+419v/yxJG+HTBd2FNRnc76mDwQUfe6PiaHxDQqx2w6AIiRG1a1xwrWPUGl8HpV5/u
	ZfcxmAA+FXiZomOpsMguJHWYULbDRer6W525KvafhkTYdfQqbwmN3Fpuk3g4UojrynoUicNBBIfap
	OtVD1N5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15DO-00000000d4x-0Ne9;
	Fri, 13 Mar 2026 16:18:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15DL-00000000d4b-1u9N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD43941849;
	Fri, 13 Mar 2026 16:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5F0C19421;
	Fri, 13 Mar 2026 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773418694;
	bh=DC+UEd/KI0YueqES/DOoc2TWM1McbdHSNf/ARGnWnP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esXLqrPZEgnaeJFTNY9Jw1IN9FtaoM11rf9C6TazhCA1o2M6dSiJxJnu+3/AoJchh
	 dcPcCG/esTVwNSu+CpeJucD5r7ffatVtfO+/B0A38K9fm9ERTsoOxelYFCUeceUmn/
	 3JAJKb3d+BaFxOm3mTgZy/BRJdB2JZnff7/vQzfLteJrQIlCscPe3FhhVu66bJF2wA
	 B14rcgeXVgu4OlletHHhBvM7A/oKikZFVy5Yi8SpBkv99obGrBINP5IclYPNjhp8IC
	 7fT/l8qzhCTo0erndc9x4C01mgFe3utVmf8u0+No1BujsPuko6xuE0IgwPwYLAdPUX
	 CSWWoIFMwoq6w==
Date: Fri, 13 Mar 2026 16:18:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
Message-ID: <20260313-kettle-craftily-aa087e6b74db@spud>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
 <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
 <20260313-quantum-modest-prawn-896bde@quoll>
 <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
 <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QKsxWvC+3M79r6rP"
Content-Disposition: inline
In-Reply-To: <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_091815_559099_1F302377 
X-CRM114-Status: GOOD (  28.51  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, Markus Schneider-Pargmann <msp@baylibre.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--QKsxWvC+3M79r6rP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:49:14PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2026 14:38, Markus Schneider-Pargmann wrote:
> > Hi Krzysztof,
> >=20
> > On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
> >> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (T=
I) wrote:
> >>> If memory-region is used, require memory-region-names.
> >>
> >> Why?
> >=20
> > This was a suggestion/comment from Conor in the last version:
> >=20
> >     Is this really optional? Shouldn't it be made mandatory so that it =
is
> >     easy to tell the difference between the two configurations?
>=20
> Then write it in commit msg. You have entire commit msg to explain why
> you are doing things, instead of obvious what. We can read the diff.
>=20
> >=20
> > https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58@sp=
ud/
> >=20
> >>
> >> I don't understand also why this is a separate change, but maybe answer
> >> to "Why are you doing it" would cover it as well.
> >=20
> > I made this a separate patch so the git tree never has any
> > binding/devicectree warnings for memory-region-names even in-between
> > patches. That's why I created these patches in this order:
> >=20
> > 1. Add the memory-region-names as an optional property.
> > 2. Add memory-region-names to all users of memory-region.
>=20
> So what is the point of this if it is optional? IOW, what does this
> commit achieve? Almost nothing.
>=20
> > 3. Make the property required if memory-region exists.
>=20
> but only required here? You need to organize your work in logical hunks.

My rationale for my original request was that the meaning of the second
memory region is modified by this series. Previously it was always
"firmware image sections", but now it can also be "IPC resources".
Nothing changed in terms of the number of memory regions (it was 2-8
before and 2-8 after), so without making memory-region-names mandatory,
there'd be no way to tell which of the two configurations are being
used.

This patch should likely be squashed with the patch adding
memory-region-names, so that it is easily to provide an explanation for
what's going on.

--QKsxWvC+3M79r6rP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQ4vQAKCRB4tDGHoIJi
0igaAP0UYLmk5KqJjFuU9cgYHnh5gnSjSdw9RHHs+PKivKTAIAD+KgB8taDRXwSw
6jx+etbSB1NieXYbkeCwEgKVHr7J6AE=
=mzlP
-----END PGP SIGNATURE-----

--QKsxWvC+3M79r6rP--

