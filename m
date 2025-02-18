Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85995C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHCQLJGugEQsQZhnJVqruuSwE0827hNxe+wi51NaIlo=; b=3+C0lMvi5QrQzjzxQlHRY7c5+p
	m2EZjaaiDazzyGruNC3DOpLX6t51FW5+jF1ME5/i8mjkGGeXazRUDMr3ErAw21tKudSHU+PYNniHL
	4e8IoR1TU1rqzESlgOL0HIyHDn5BmKgttM2kJXFo2jbnERgce/XneVRHwV88v2AB5DLKGj65SX0aa
	UnS3CpvsiA+0s35/S+MOpbM9S4Je1oxUw6zWrBFovNSAuaJBkpONnj3+XGmBC9xdrxE0Qcd43RK9B
	Sal7slXWxcs44gSFOd6KR1gwR+6p3ydSEWJe5U0D9FQJo4zTFjTTnFvaO+I1HlpQHNMFcKfcKUqMK
	1YGiUPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQpK-000000092XZ-2ooD;
	Tue, 18 Feb 2025 16:52:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQnr-000000092K0-2ZHf;
	Tue, 18 Feb 2025 16:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1D9E5C60D0;
	Tue, 18 Feb 2025 16:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C74C4CEE2;
	Tue, 18 Feb 2025 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739897434;
	bh=/YVHQ+p5V3VCdn+u9aKhlu71S03saM0vo09sgG79sWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDqc9UkkxW2nMEk503wToA7FM1ONqMLx5RxYYa0YBCAQy+2Uxgtk2qJ7veH03JWTM
	 JeNXodB/0x36gmhoNiS5jDt0pUodg8nlD+P0K9gzwp5hOdld34yotKzi8cPR5acJem
	 /gWw33X4Fzt1czqg5v5AJOcXhNlkRAb+1ZqgAaC+RqhiXAaz1Iiuv0XHfJcAMxlinS
	 8esBOwlcuxaK2Jd5ctgNIS6QT0TwCGIgXUfECcMSodmFqesrREcU8ExwGw4ENrgVHn
	 ePwfCtEVUozIlhZQN4+liIK+LbtQJjQl3N/acjqWIpXbu2RRZ6xr1Ca82dFEudnGxH
	 I9irZQomDOdqg==
Date: Tue, 18 Feb 2025 16:50:29 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com, macpaul.lin@mediatek.com,
	pablo.sun@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek,mt8188: Add
 VDO1_DPI1_HDMI clock
Message-ID: <20250218-ferry-glorifier-e10b0ae13371@spud>
References: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com>
 <20250212-arming-gyration-103e42b94ed6@spud>
 <906ed1df-3c63-4028-ae7d-97e086acca32@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="koIZKDiabKMrvHLl"
Content-Disposition: inline
In-Reply-To: <906ed1df-3c63-4028-ae7d-97e086acca32@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_085035_742287_313BC30B 
X-CRM114-Status: GOOD (  23.17  )
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


--koIZKDiabKMrvHLl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 02:22:25PM +0100, AngeloGioacchino Del Regno wrote:
> Il 12/02/25 20:17, Conor Dooley ha scritto:
> > On Wed, Feb 12, 2025 at 11:03:41AM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > Add binding for the HDMI TX clock found in the VDO1 controller.
> > > While at it, also remove the unused CLK_VDO1_NR_CLK.
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > ---
> > >   include/dt-bindings/clock/mediatek,mt8188-clk.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/includ=
e/dt-bindings/clock/mediatek,mt8188-clk.h
> > > index bd5cd100b796..0e87f61c90f4 100644
> > > --- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
> > > +++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
> > > @@ -721,6 +721,6 @@
> > >   #define CLK_VDO1_DPINTF				58
> > >   #define CLK_VDO1_DISP_MONITOR_DPINTF		59
> > >   #define CLK_VDO1_26M_SLOW			60
> > > -#define CLK_VDO1_NR_CLK				61
> > > +#define CLK_VDO1_DPI1_HDMI			61
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > btw, I see the mt8195 has this same CLK_VDO1_NR_CLK define in it, if you
> > fancy getting rid of that too.
>=20
> Thanks Conor, yeah I'll do that asap... one commit for each NR_CLK is a b=
it
> too much... I should just clean them all up :-)
>=20
> That requires a bit of work though, so it's not something that I can do in
> a few minutes; let's see if I can make it for this cycle, but no promises.

Yah, no worries. Was just pointing it out, don't need to let this
particular patch wait around for it by any means.

--koIZKDiabKMrvHLl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7S6VAAKCRB4tDGHoIJi
0menAPwMIMl/Yz8zjCE/wgQtTGuMlk04Porrv7GFsIP8l1gNMQEArAqwMMdmP2j1
yXgjRkIPaKsOrL54hlT7KowOxubhEAo=
=hGQS
-----END PGP SIGNATURE-----

--koIZKDiabKMrvHLl--

