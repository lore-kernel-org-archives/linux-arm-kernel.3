Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48EED65538
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a0yhj6QHkjpYBYzL3gmUx19ySy020CjtvZ7PizgCbw=; b=2ag6ebnOmzmI5s16qALJBvDoxO
	hMDMMjhN+AqtYR/UTAzVSMivKdoxkzlfs5eaiGQdqilX6UzSSESHpQovwwspBo4UrN4UxHMVPNwgV
	mGGrVqDVOkGNap9nN7lpPvbthuJEhmlHuwp6AjPvWGbEa1/yN8v45tufDGTGWhHrC1SHiGGE/YnXl
	UoXRA1ReggEcyPM+xFkJFacpprBqOJtliJm1mKzE5yWtpwxOosiQV8mboE2Et5j/MfcybXBfiwK3I
	3LPz4AVJDl03UnFgivWZ6sFGnjpnAnnW1SWcRhq73lv3ygBn9fUzmKqhKQjYxEfbRj1/ccga8t4rU
	ie1Z6jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzjA-0000000BM4N-0upQ;
	Tue, 26 Nov 2024 17:51:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFziC-0000000BLzr-3Ynd;
	Tue, 26 Nov 2024 17:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7AD15C5BD8;
	Tue, 26 Nov 2024 17:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D032C4CED0;
	Tue, 26 Nov 2024 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732643455;
	bh=1DHm33+nWlMW/ddeJDObXBwfsVPCV4BRLDeq6xv2wko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqZyTvwhXugY0c+2UWdmDVxUgh7efgeOon4J4wUR5uRQQm2ZEqtDgEhkFBQFGECct
	 MkLhICN7p0cfzrPw1ctoTKxvtHXqfY2im98LWnrF9iA+IMy6p4e/b0HAK7533EPxVq
	 IJMUh0a3EJmAAzqdHeA/Xhy1cOJq2Lue6UR7WDZaudS8c3QdBO7jgBIM80G2fvhJKu
	 k70cw/W4kWIAdR0QgCGyKkYSUWafRF9JfYdwQYqcuw97EoLl5PE7FooZQVF90P6d1S
	 +XK4eF9d17hvPqgtYTQu5PpZWsK0RIXspm/jkjwBpmsvoLZjn/nqPyURKLMuJaeIOQ
	 Jb1LJjV/eyyJA==
Date: Tue, 26 Nov 2024 17:50:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Wojciech Macek <wmacek@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
Message-ID: <20241126-angles-unequal-3578ea6bb01b@spud>
References: <20241125082130.2390310-1-wmacek@chromium.org>
 <20241125082130.2390310-2-wmacek@chromium.org>
 <20241125-snowcap-sulphate-34944bd70cf3@spud>
 <CAGb2v655Bfx44XBPH24FKuEFTJ3ngjbAPEpNBn5vyLZfNGKt+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8AIRgZYs3rO0/Bl"
Content-Disposition: inline
In-Reply-To: <CAGb2v655Bfx44XBPH24FKuEFTJ3ngjbAPEpNBn5vyLZfNGKt+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_095056_976050_CB6D28BB 
X-CRM114-Status: GOOD (  20.61  )
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


--a8AIRgZYs3rO0/Bl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 12:36:08PM +0800, Chen-Yu Tsai wrote:
> On Tue, Nov 26, 2024 at 2:34=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Nov 25, 2024 at 08:21:28AM +0000, Wojciech Macek wrote:
> > > Add an entry for the MT8186 based Starmie Chromebooks, also known as =
the
> > > ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
> > > a tablet style chromebook.
> > >
> > > Signed-off-by: Wojciech Macek <wmacek@chromium.org>
> > > ---
> > >
> > > Changelog v2-v1:
> > >  - Fixed items/const bidings description in mediatek.yaml
> > >
> > >  Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++=
++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Do=
cumentation/devicetree/bindings/arm/mediatek.yaml
> > > index 1d4bb50fcd8d9..6191a5320c148 100644
> > > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > @@ -263,6 +263,19 @@ properties:
> > >            - const: google,steelix-sku196608
> > >            - const: google,steelix
> > >            - const: mediatek,mt8186
> > > +      - description: Google Starmie (ASUS Chromebook Enterprise CM30=
 (CM3001))
> > > +        items:
> > > +          - const: google,starmie-sku0
> > > +          - const: google,starmie-sku2
> > > +          - const: google,starmie-sku3
> >
> > Compatible order here is back to making little sense. Why is the oldest
> > SKU, in both cases, appearing first?
>=20
> FWIW the SKU number has no particular ordering. They were released togeth=
er.
> SKU denotes different configurations (memory, storage, touchscreen and ot=
her
> component options). OOTH revisions would actually have chronological mean=
ing.

I see, that's fine then I suppose.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--a8AIRgZYs3rO0/Bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0YKegAKCRB4tDGHoIJi
0v3ZAP9s6/k+4zLgrMT7vndOHggRKcA/mY2xxhRmyiJtJNDvgwEAhWO7UfTEpvj4
HibsduIJN6ZIFYDBYKi7+ZDbhZUKqQI=
=cu+D
-----END PGP SIGNATURE-----

--a8AIRgZYs3rO0/Bl--

