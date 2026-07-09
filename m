Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBFBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6ExRqFYusMX+tjVg7cG0UAnunHkBLlwLxZ3V0z43Yo=; b=heR2b89z4I63cSsFMmlgbGJP8g
	SKwUPBBNtNxf9a2vKXh1JeZwsbYAH9LNDVA4lZT1GsO1gYo/p763IfSobIoMFCYavZf8RRTxAOlSu
	3V9GAc0PugMdrO6Y6m16v0p8LZz22FwSIOSUYIAedV0r7Kn4bZCMV9KcYhxR2K49rJoHUXsLCY7yK
	8hhPYnDkc4ve65rC7VCBvs/e4Jc38u0sqF2EnfrIiouZMqSaQ84K9In4cmfB0OCMV72uZaZpaydp3
	3vimZeNOzF3YzNGytrdqK4Jyetk572iYOyHz4CPBC5OEOqfHlohK239ZEtrD+1jl9Uy/kjUrwzojf
	Qxromb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtEL-00000003Cxk-3vuA;
	Thu, 09 Jul 2026 18:12:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtEL-00000003Cx7-101C;
	Thu, 09 Jul 2026 18:12:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 010E3436B7;
	Thu,  9 Jul 2026 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDAB1F000E9;
	Thu,  9 Jul 2026 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620732;
	bh=N6ExRqFYusMX+tjVg7cG0UAnunHkBLlwLxZ3V0z43Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gGDgNua5r/LnOAlUxg9BTyvo5mQCvFnGTGo2oOO+5cSHjWM2J1jOjdJw8UPmHQnVV
	 NlH8GCheUps5nixZGBXCLRI3924QII5l9IIy6oTlD/eSL8YAg/U1hW6gwouU13vVUF
	 lRUFbx29bdoVukedcHBj7JgWIYnmDfE4d2QatHh/DGoODhpiv5Pzfzd840SDSL6xvZ
	 BFBh57Rc5mmIG1MjI/a3Xxt4g6W8VF+0TlOkcDDe8LxtovAtURy5EqMo6DtEi1XVXq
	 uXMngg8j0bC9Quvo4bGNhGf9LY1O1H6Wd0B58owsFccwEEd4vh4py600QE4bLMDEm0
	 lO+sQU8ACHo6A==
Date: Thu, 9 Jul 2026 19:12:07 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v2 08/18] dt-bindings: clock: mediatek: Add MT8189 clocks
Message-ID: <20260709-omission-thievish-45fb4b21f4a2@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-8-2926da3db6cf@collabora.com>
 <39ba7e37-bdd7-41ab-b72d-fed0bdbfc3b6@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UX1C2aIXjTZQUR6q"
Content-Disposition: inline
In-Reply-To: <39ba7e37-bdd7-41ab-b72d-fed0bdbfc3b6@collabora.com>
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

--UX1C2aIXjTZQUR6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 04:05:35PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/9/26 15:42, Louis-Alexis Eyraud wrote:
> > Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> > The MT8189 clock IP provide clock control for main system
> > (apmixedsys, topcksys and vlpcksys) and subsys (eg. peri, scp,
> > ufs...).
> >=20
> > Also, add compatible for frequency hopping and spread spectrum clock
> > functionality and reset controller header file for MT8189 UFS reset
> > controller support.
> >=20
> > Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>=20
> Both the commit description and title are misleading, as in, you're not a=
dding
> MT8189 clocks, but *both* clocks *and* resets.
>=20
> Fix it please.
>=20
> After which:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

And
Acked-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested

Cheers,
Conor.

>=20
> > ---
> >   .../bindings/clock/mediatek,mt8186-clock.yaml      |  15 +
> >   .../bindings/clock/mediatek,mt8186-fhctl.yaml      |   1 +
> >   .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   5 +
> >   include/dt-bindings/clock/mediatek,mt8189-clk.h    | 433 ++++++++++++=
+++++++++
> >   include/dt-bindings/reset/mediatek,mt8189-resets.h |  17 +
> >   5 files changed, 471 insertions(+)
> >=20
>=20
>=20

--UX1C2aIXjTZQUR6q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/kdwAKCRB4tDGHoIJi
0nERAP4kLU13u3da3l4qcBWIw/VmYndpJtfFXpU6Zgypf9MYBQD8DwkM+FWeYAyD
xhlJbInggvLHDfXzemV0LCSaeSizQAw=
=+U1Y
-----END PGP SIGNATURE-----

--UX1C2aIXjTZQUR6q--

