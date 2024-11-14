Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7A9D65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJkC8kA6dGMJdoD6V4YUCW/70FaJFyHKCUtXY4mJlAI=; b=dOO1PYZuOQCyrxV1HuVNmJb/kx
	7KpfsfqbYdnr2KXLIaramgMgQ8lGiqoQDudnydvSkwVO6ZlQte6uKjw6VXj0WFbfIDyuUCcY+Z7om
	70zZUL60grrZ3JOjeIm/4smQ+ZWrZKD29oIKRONhYtyArHsv0JC2j6msAFoMwsbnrTD3UBl+fMVXp
	p4le+hiHaWGL3OdJz7PLesMM+Lh2lA5XHqdwK/7p1Ix4QteBVz9Z8mUyxBGEH9/+VuessK4B3bGig
	PuUXcWJfVT0aTVt9pj5odKUwTW61zh0Tz3eXpz5+M/zsTzdvu7gflVYQZ4GHIbNLzshoPAeEaqRhR
	JeqmoqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZ0W-00000009uwn-2eZN;
	Thu, 14 Nov 2024 12:31:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYyg-00000009uj4-23Zy;
	Thu, 14 Nov 2024 12:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E69D2A402D0;
	Thu, 14 Nov 2024 12:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DD9C4CECD;
	Thu, 14 Nov 2024 12:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731587376;
	bh=jO8wO2u4TzSToVkvP8mnOBJEASwGFrGljAE99wHmaPE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=SPR/fBQd80bXXGD5IPBlR4X7HFTjYE5PHfr8245sbYTmj+g0esjtnIiss+qf2ZyKD
	 HOdgQ4qZ5mJNnB+ExZV0XFEfEhFYayh4LFv8vHeMCLExPg2baQW835vkCWkNHYacNy
	 Ms8uvo9fWQZPskkh23D2w93r6TlksldOU1u65ij5sM8uIdFwHRhQJeKu+PgJCowB1M
	 9be93vxQCvQnfAzgoTUFzEteB1ZbvyQnHgN58FKyDI2OBBAjTIVctfgMZjRIER6h9W
	 a/9oa/sbht8PM9Xn/zHOK2euCD8uxgKuQbjnsGV8HXemsHCmd9CuI8PZmdBsrIpRkL
	 W+P0WM8igLjhg==
Content-Type: multipart/signed;
 boundary=52ace44e12075fa8225f0041c53d0c91369398e0eb41fb0d755839799c8c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 14 Nov 2024 13:29:32 +0100
Message-Id: <D5LWHT7OU9DQ.NCMSTUWT5991@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Set mediatek,mac-wol on
 DWMAC node for all boards
Cc: <kernel@collabora.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "Biao Huang"
 <biao.huang@mediatek.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Jose Abreu" <joabreu@synopsys.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>, "Andrew Halaney" <ahalaney@redhat.com>,
 "Simon Horman" <horms@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
X-Mailer: aerc 0.16.0
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com> <20241109-mediatek-mac-wol-noninverted-v2-2-0e264e213878@collabora.com> <bdbfb1db-1291-4f95-adc9-36969bb51eb4@collabora.com>
In-Reply-To: <bdbfb1db-1291-4f95-adc9-36969bb51eb4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_042938_690486_93BE77AB 
X-CRM114-Status: GOOD (  19.06  )
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

--52ace44e12075fa8225f0041c53d0c91369398e0eb41fb0d755839799c8c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Nov 14, 2024 at 10:26 AM CET, AngeloGioacchino Del Regno wrote:
> Il 09/11/24 16:16, N=C3=ADcolas F. R. A. Prado ha scritto:
> > Due to the mediatek,mac-wol property previously being handled backwards
> > by the dwmac-mediatek driver, its use in the DTs seems to have been
> > inconsistent.
> >=20
> > Now that the driver has been fixed, correct this description. All the
> > currently upstream boards support MAC WOL, so add the mediatek,mac-wol
> > property to the missing ones.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 1 +
> >   arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  | 1 +
> >   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
> >   3 files changed, 3 insertions(+)
> >=20
>
> ..snip..
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/=
boot/dts/mediatek/mt8195-demo.dts
> > index 31d424b8fc7cedef65489392eb279b7fd2194a4a..c12684e8c449b2d7b3b3a79=
086925bfe5ae0d8f8 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > @@ -109,6 +109,7 @@ &eth {
> >   	pinctrl-names =3D "default", "sleep";
> >   	pinctrl-0 =3D <&eth_default_pins>;
> >   	pinctrl-1 =3D <&eth_sleep_pins>;
> > +	mediatek,mac-wol;
>
> The demo board has the same WoL capability as the EVK, so you can avoid a=
dding the
> mac-wol property here.

Not sure I can follow you here.

>
> >   	status =3D "okay";
> >  =20
> >   	mdio {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.=
dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> > index e2e75b8ff91880711c82f783c7ccbef4128b7ab4..4985b65925a9ed10ad44a6e=
58b9657a9dd48751f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> > @@ -271,6 +271,7 @@ &eth {
> >   	pinctrl-names =3D "default", "sleep";
> >   	pinctrl-0 =3D <&eth_default_pins>;
> >   	pinctrl-1 =3D <&eth_sleep_pins>;
> > +	mediatek,mac-wol;
>
> I'm mostly sure that Kontron's i1200 works the same as the EVK in regards=
 to WoL.
>
> Michael, I recall you worked on this board - can you please confirm?

I'd say so. Honestly, I've never tried WoL on this board, but I'm
not aware of any difference to the *demo* board (not the EVK).

-michael

--52ace44e12075fa8225f0041c53d0c91369398e0eb41fb0d755839799c8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZzXtLRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iWHAF9EGqmrI+ZjOLTQX1iNMNp1lIL3a30zG0Z
fCfLfeCWZL2+RRWPcly4R/8op414wophAYCl6jD4W7sXAYn0uTQU69C8uyAyzQus
LYNR9AIEedX7Y537PxIcEpLeEJ++qmkDDo8=
=xSul
-----END PGP SIGNATURE-----

--52ace44e12075fa8225f0041c53d0c91369398e0eb41fb0d755839799c8c--

