Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D137C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRMlo223WK1vJhCGy8/PE42NkVsYFCsHmCK+AI0l5aI=; b=5FvrrrUnuUGPe4/qvnuQZSiA/n
	H0bFPlvKYTihetsXwu1Wq/19yiQdif/Feiwi97FWm0YL1LDYd4/BWJEl5KXhwixWPVM/AiUqRghuE
	yu2DFl/AavlWu6O1kKw767fUuccQfrmkAwKvvkyQorZfnQtqt+TNfDMBqWhbqoVugrcKZzkr7zglZ
	3M3xQj1aRLgJAS56tnlHEhYHxiELyAs22YloUHF8zuJKD387YrYHMirfV1pXtp3Eny5eRxvgmfw2z
	imXBtx72CK8tviFLVYnLdbwoG6klSlmr6nplKN5/nDAlf1WXvIocpoT53IDT7/BKqkuzOc5fVynd4
	GmPY2/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr2k-00000002yZY-2z27;
	Thu, 09 Jul 2026 15:52:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr2j-00000002yZJ-1IGa;
	Thu, 09 Jul 2026 15:52:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBC2E43AEA;
	Thu,  9 Jul 2026 15:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D8F1F000E9;
	Thu,  9 Jul 2026 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783612324;
	bh=GRMlo223WK1vJhCGy8/PE42NkVsYFCsHmCK+AI0l5aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YwClcfqy+EI0om3wSR+FTT1nFgfjpWkF5h/T1GEs2Hwem8VlfwtaZT1QNgHljZDAW
	 hipWaCyRmHExw0KqSNv/DEr/yLqjSScHHShaYXoLCEbXeMIIj+Aqs4O9iJP7uWLJrk
	 AxD0I3bINYSMttjJ51Ryh5aKOd7sAt7uBRwhghu20uMYKW5WnpcJoKdRgm3FEeNjce
	 jPV4MVNrJp4jz/JLFpD5KL5Ppm5AmP8zte4zGC+yyiRtCNYhZsUAyoFYBNxfPJbzr/
	 gnyt7BrYYpctTlbIIhJaXsAkkugU6Ep2yVX3ZIZ7V1dAOJjimxGQQqNViFMw3LaZsy
	 BAtoaebdIc8gQ==
Date: Thu, 9 Jul 2026 16:51:59 +0100
From: Conor Dooley <conor@kernel.org>
To: "Praveen, Gokul" <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, neil.armstrong@linaro.org, nm@ti.com,
	robh@kernel.org, sjakhade@cadence.com, kristo@kernel.org,
	vigneshr@ti.com, vkoul@kernel.org, yamonkar@cadence.com
Subject: Re: [PATCH v5 net-next 1/2] dt-bindings: phy: cadence-torrent:
 Update property values to support multilink SERDES configuration
Message-ID: <20260709-unvalued-washtub-d024d21f5624@spud>
References: <20260708083725.66777-1-g-praveen@ti.com>
 <20260708083725.66777-2-g-praveen@ti.com>
 <20260708-purifier-subside-667f32244c09@spud>
 <18b1c832-d0ba-4465-90c8-09e7c48becde@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mqzgQ8eCWAJGP231"
Content-Disposition: inline
In-Reply-To: <18b1c832-d0ba-4465-90c8-09e7c48becde@ti.com>
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

--mqzgQ8eCWAJGP231
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 03:37:15PM +0530, Praveen, Gokul wrote:
> Hi Conor,
>=20
> On 08-07-2026 22:09, Conor Dooley wrote:
> > On Wed, Jul 08, 2026 at 02:07:24PM +0530, Gokul Praveen wrote:
> > > Update the maxItems value of clocks parameter as 3 clocks
> > > (refclk,pll1_refclk,phy_en_refclk) are supported.
> > >=20
> > > Update the clock-names parameter to support mutilink SERDES configura=
tion
> > > as the existing enum configuration of the clock-names parameter does =
not
> > > allow both pll1_refclk and phy_en_refclk to be used at the same time,
> > > hence preventing the support for the configuration  (refclk,pll1_refc=
lk,
> > > phy_en_refclk), which is neeed for multilink SERDES usecases.
> > >=20
> > > For multilink SERDES configurations where the links require different
> > > clock speeds, all 3 clocks(refclk, pll1_refclk and phy_en_refclk)
> > > are needed.
> > >=20
> > > For example,considering the USXGMII+SGMII multilink SERDES configurat=
ion
> > > usecase, having only 1 reference clock(refclk) fails because USXGMII
> > > requires a clock speed of 156.25 Mhz and SGMII protocol requires an
> > > clock speed of 100 Mhz.
> > >=20
> > > Since one reference clock(refclk) alone cannot cater to the 2
> > > different clock speed requirements of these protocols, the second
> > > input reference clock(pll1_refclk) along with phy_en_refclk
> > > is also needed.
> > This binding supports 2 devices and the generic compatible. Do all these
> > devices have the new refclk?
>=20
> Not all of these devices have the new refclk(pll1_refclk), Conor, which is
> is why the enum was kept as it is and in these devices multilink serdes
> configuration will not be possible due to the limitation of not having the
> new refclk(pll1_refclk).

In that case, please restrict 3 clocks to only the devices which have
them.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> However, The intent of this patch is to add multilink serdes support for =
the
> devices which have the new refclk because the
>=20
> earlier clock-names configuration could not support having all the 3
> clocks(refclk, pll1_refclk, phy_en_refclk) in the clock-names, which is
> needed for mutlilink serdes configuration configuration.
>=20
> Also, Please feel free to ask if you have any other queries, Conor and th=
ank
> you for this query .
>=20
> Thanks and Best Regards
>=20
> Gokul Praveen
>=20
> > Thanks,
> > Conor.
> >=20
> > > Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> > > ---
> > >   Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 =
++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torren=
t.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> > > index 9af39b33646a..ac0f625cd76d 100644
> > > --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> > > @@ -34,7 +34,7 @@ properties:
> > >     clocks:
> > >       minItems: 1
> > > -    maxItems: 2
> > > +    maxItems: 3
> > >       description:
> > >         PHY input reference clocks - refclk (for PLL0) & pll1_refclk =
(for PLL1).
> > >         pll1_refclk is optional and used for multi-protocol configura=
tions requiring
> > > @@ -48,6 +48,7 @@ properties:
> > >       items:
> > >         - const: refclk
> > >         - enum: [ pll1_refclk, phy_en_refclk ]
> > > +      - const: phy_en_refclk
> > >     reg:
> > >       minItems: 1
> > > --=20
> > > 2.34.1
> > >=20

--mqzgQ8eCWAJGP231
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/DnwAKCRB4tDGHoIJi
0n4XAQC5MnC2I5YXHC52d+ueIJB+UAs57axUxbMswrRVlQ4JpgEA/wgE2WC9Nhgs
VMzI4rhMq6Yy6RqGA/Uoy3fwULsBgQM=
=t+xa
-----END PGP SIGNATURE-----

--mqzgQ8eCWAJGP231--

