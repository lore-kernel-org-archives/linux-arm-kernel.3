Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F7EF44845
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W8BQyhl2FXAtq1l8AaoMNX45tFzqDxS6dlGXM21Kk8=; b=nspad35RGKVpxTrc/OmWwcw9FD
	ce/DzKrJCYGLj3vPvKCCrqp/UWvi9G2MNax+YC+FCE2ZRm9yJ3aR9OSlYXYpzYbuBejSpV2c0ugZu
	wHLuK7ergeSG/bBRYtojL6d7sar04MMGzNgDD/WZgiKMCgZOVz6rakEEuQ9DPlDOPIGgBPlNMZNaq
	ub3g2eziDXdDCgGFzfGpka+3Jt/6PNDNgx6MOCJR/uC4YY+RtzUwoyh/q6F1RJy8bZ+gUoSOhUKVW
	2bdVNBK73aYRqVFuaOM9BRPqYKoJsP9CfGgWPJdL4wE3WQdExxZ8qdPx7ksgk9tXpb14vDn/76cYU
	ennoNPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAPz-0000000C6nt-3W6Q;
	Fri, 10 Apr 2026 11:52:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAPy-0000000C6nc-12Da;
	Fri, 10 Apr 2026 11:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59FC660154;
	Fri, 10 Apr 2026 11:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B71C19421;
	Fri, 10 Apr 2026 11:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775821977;
	bh=Y4GnJSxmVoLcOsU28nVNoZ44KeRm+qtdWi6Re7neJws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8hkTLvdwmNEtlQbPxwGhpXKFahK7mAw84EdneFSvzt8h2dssZtDjOraINVgKLXVw
	 zCFVOJJr0UaOhh3JHtuGLlFl8kL6eLsvcRTOdeI0ZbjWyJ98VN9BOtayLeSX6jRPfm
	 XsbIfNl2jY9BmQNkieqFqSIKunfkAPedZWAkKJ/x8aygtpXTGcCFXbt/t/4o0Ns7g8
	 TLmmIjcEwypFAgvyUOTa55Gs406EdHlufYK2P5Tv5HN2ZRcLTIoZZccpEWgBC6HmBM
	 CZHB2dAjbMS+jd/Ke1lK6d62Orvfk1YtmGHmghdTeu8RPdsjOVplos307CCBnyvzl4
	 prUynAYuTiZGA==
Date: Fri, 10 Apr 2026 13:52:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Jakub Kicinski <kuba@kernel.org>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 04/12] net: airoha: Rely on net_device
 pointer in HTB callbacks
Message-ID: <adjklonQX0q7ghZD@lore-desk>
References: <20260406-airoha-eth-multi-serdes-v3-4-ab6ea49d59ff@kernel.org>
 <20260410025722.1809973-1-kuba@kernel.org>
 <bd486b55-a8d7-4811-965a-aa1f3dc98e30@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1NM/Tit3uG0u/BY"
Content-Disposition: inline
In-Reply-To: <bd486b55-a8d7-4811-965a-aa1f3dc98e30@genexis.eu>
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


--i1NM/Tit3uG0u/BY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 10/04/2026 04:57, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email says "For your consideration."
> > ---
> > net: airoha: Introduce WAN device flag
> >=20
> > This commit introduces a WAN flag to specify whether a device is used to
> > transmit or receive WAN or LAN traffic. It enables specifying multiple =
LAN
> > devices but limits the configuration to a single WAN device.
> >=20
>=20
> [...]
>=20
> > > +		fallthrough;
> > > +	}
> > > +	case AIROHA_GDM2_IDX:
> > > +		/* GDM2 is always used as wan */
> > > +		dev->flags |=3D PRIV_FLAG_WAN;
> > >   		break;
> > >   	default:
> > >   		break;
> > >   	}
> > > -	for (i =3D 0; i < eth->soc->num_ppe; i++)
> > > -		airoha_ppe_set_cpu_port(dev, i, airoha_get_fe_port(dev));
> > > +	airoha_dev_set_qdma(dev);
> > > +	airoha_set_macaddr(dev, netdev->dev_addr);
> >=20
> > Since the commit message notes it is possible to specify multiple LAN
> > devices, does unconditionally calling airoha_set_macaddr() for each
> > device overwrite the single shared hardware LAN MAC register?
> >=20
> > If so, could this cause only the last initialized LAN device to have it=
s MAC
> > correctly programmed into the hardware, leading to dropped unicast
> > packets for the other LAN interfaces?
> >=20
> > > +
> > > +	if (!airoha_is_lan_gdm_dev(dev) &&
> > > +	    (port->id =3D=3D AIROHA_GDM3_IDX || port->id =3D=3D AIROHA_GDM4=
_IDX)) {
> > > +		int err;
> >=20
> > [ ... ]
>=20
> Hi, the frame engine can be configured with a range of wan mac addresses =
and
> a range of lan mac addresses via registers that set the top 24 bits and t=
hen
> 2 registers that form a range of the low 24 bits.
>=20
> Documentation says that packets that fall into this mac address range eit=
her
> on the lan side or the wan side are to be treated as layer 3 packages and=
 if
> a packet is not then it will be handled as a layer 2 packet.
>=20
> The exact implication of this and if it actually matters is unknown. But
> traffic that comes in on an interface that is not matched by an accelerat=
ion
> flow is usually forwarded to the cpu for further processing.

The assumption here is the mac addresses are read from the SNAND or eMMC and
they all share the upper bits. I will fix the issue with a separated patch =
for
net tree.

Regards,
Lorenzo

>=20
> MvH
> Benjamin Larsson

--i1NM/Tit3uG0u/BY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCadjklgAKCRA6cBh0uS2t
rOALAQDChwhT+q+W9kV8svjw4vYBOXlgu4gRACeUn8gsl1GgfQD9HP1z0i1xfifR
9EwKX95S/PvAovnwKbRE5sYz1v1dGQY=
=Za20
-----END PGP SIGNATURE-----

--i1NM/Tit3uG0u/BY--

