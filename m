Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64354EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKBM8UKfMDjsns8MQgN/S+WMhUlQzwDOI+d9b6seXj0=; b=P/0WeyOUoOjsvsL2jrn4FOs/bv
	fYQObN9lTMoNZaV6QSy57l4UVrOR9ZDXmBEZbwALoj5aWfJ1d6FxreK/K79nhgjTO9ibKpHGEg75z
	TtCvP6SMJa67l5/G+TdcqOgk22y9sgEukw24JbfS+Jv3mrkSuKGGcFwhEvAZrofSyrY1eLnCqsXg9
	w20KWRFyqsoCFRVsybmfpR7L4gSOJ3BrVeALQSi1gC3+kPFl04i0KhD7ophQ1oITB0+wJM40CmRu/
	C21Ijg65uSvsQBeHOU/tLId8031+rypgn9KNut8gchyig04hKlurUewMxDvMyDjWqVbEo68ZB0j+L
	ut0y/M8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhbS-0000000GkPA-3EVj;
	Wed, 04 Mar 2026 08:29:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhbQ-0000000GkOU-39St;
	Wed, 04 Mar 2026 08:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EB6843E21;
	Wed,  4 Mar 2026 08:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758C3C19423;
	Wed,  4 Mar 2026 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772612947;
	bh=4Ac7+YMVNcgLTiWD3JC9geCCgf05rClB8IFh32bwZDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFXE641tTVclA+hL8OI6wWJfFCJHGWpuCPSFOTQ4OU5zgwI9haWAhiXzFbtrDXbmv
	 iq8gDAtsjZRVJ+aLRPRrG/16cW1eZQrsktx/tyCfWce/C2Ac5Jm2Y65fXpxQIZyK9W
	 T4f8JBOskKaPW3FXefOzjJ8JcCKvXWnUvpTEUjj1Oir16ucy/wiwK6Iex7XT4QKbd5
	 mpDwFkbednxLhp/y1mJWOMoVYUorMDbZOO9O4we4n6svR53+1P8yomzJsG/gS1ztLF
	 BNVuO3k3NgAx6E1G7SdZxH8lC8DO8DHckr5u3SC+IyZuPZnycmn7kzRz2ljeEg+NYO
	 Z7Yu9WLXuTv4w==
Date: Wed, 4 Mar 2026 09:29:05 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix GDM2 loopback configuration
 for USB serdes
Message-ID: <aaftUXaSD0u5ZhO7@lore-desk>
References: <20260228-airoha-fix-loopback-for-usb-serdes-v1-1-a94be0f897da@kernel.org>
 <20260303141624.GD71509@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F9TiRjTzjJbtqhOj"
Content-Disposition: inline
In-Reply-To: <20260303141624.GD71509@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_002908_850594_ADC78EBF 
X-CRM114-Status: GOOD (  32.52  )
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


--F9TiRjTzjJbtqhOj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Feb 28, 2026 at 01:20:33PM +0100, Lorenzo Bianconi wrote:
> > Flow Control source port mapping for USB serdes needs to be configured
> > according to the GDM port nbd parameter. This is a preliminary patch
> > since nbd parameter is specific for the given port serdes and needs to
> > be read from the DTS (in the current codebase is assigned statically).
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Hi Lorenzo,
>=20
> Is this a fix? If so, should it have a fixes tag? And be targeted at net?
> Otherwise, perhaps drop the "Fix" from the subject.

Hi Simon,

This is a preliminary patch in order to completely fix the loopback
configuration for USB serdes but the point is we are not supporting
USB serdes upstream yet (there is only OpenWrt support available at
the moment). Do you think we should target net-next or net in this
case?

>=20
> Also, I think it would be worth explaining the situation
> before and after this patch.
>=20
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 10 ++++++----
> >  drivers/net/ethernet/airoha/airoha_regs.h |  5 +----
> >  2 files changed, 7 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 3779f93b47bc13ae21d4ae088dece4712dc214e5..37fc2b33d3af8a190a74efc=
69ed54f163afa6412 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1729,10 +1729,12 @@ static int airhoha_set_gdm2_loopback(struct air=
oha_gdm_port *port)
> >  		      SP_CPORT_MASK(val),
> >  		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(val)));
> > =20
> > -	if (port->id !=3D AIROHA_GDM3_IDX && airoha_is_7581(eth))
> > -		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
> > -			      FC_ID_OF_SRC_PORT24_MASK,
> > -			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
> > +	if (port->id =3D=3D AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
> > +		u32 mask =3D FC_ID_OF_SRC_PORT_MASK(nbq);
>=20
> AI generated code review flags that the commit message talks about nbd.
> But here we have nbq.

yes, my mistake. It is supposed to be nbq and not nbd.

>=20
> > +
> > +		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6, mask,
> > +			      AIROHA_GDM2_IDX << __ffs(mask));
>=20
> Perhaps na=EFvely I would have used FIELD_PREP here.
> Maybe that leads to an incorrect result. But if not,
> is a shift used here for consistency with the code at
> the beginning of this hunk?

ack, I think we can FIELD_PREP() now. In the past we can't use FIELD_PREP()
with non-compile constant mask, but now it is doable.

Regards,
Lorenzo

>=20
> > +	}
> > =20
> >  	return 0;
> >  }
>=20
> ...

--F9TiRjTzjJbtqhOj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaaftUQAKCRA6cBh0uS2t
rK2AAP41fbpezZsic6pgjkdkADETszHQezTZrkrIfzqb/JPZoQEAsrucGpLcN550
Cmok4JfK/ZxGWXhXITNH04hYiVkgNg0=
=HuOh
-----END PGP SIGNATURE-----

--F9TiRjTzjJbtqhOj--

