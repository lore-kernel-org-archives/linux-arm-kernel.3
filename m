Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiCN0XbHNxL3wiS2C15r2mhEdbBCiGu3dJWvUYNOTRY=; b=VyDZeXqFeYWu4kbv+dRSmmc2a0
	24izN+eE3+RMjbRdVVsqxQM8G+Uf3HA7m2CqS7pKtUi8MR99mh24wsuhXDNtUcXwI4ntTp1pXTZaF
	mVPAKLt5uFlC/qTFqdUJoIosUrVTBZfUPkCYljnJbu+qFVblRn+Lw9RPrxQn3cJdWcDiBDQjn13Ie
	6pgWaW82nGrQ0mbR3QNYObicU7hlwGjxNiJAWtdOZoXea2O4VctlQCFTk2JW0cssNLVSAZFV1X6q1
	Oy/Y8DbtirDhytg7mkG3XUvjrwe8r/Eu5BdgS0S1N8srcVhOCMc9p5cS+5H8psGuG3YiuRPnr2Q3b
	gJ02JoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weonJ-00000000peN-04VJ;
	Wed, 01 Jul 2026 06:51:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weonH-00000000peB-0pcu;
	Wed, 01 Jul 2026 06:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A80E442003;
	Wed,  1 Jul 2026 06:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9CB1F000E9;
	Wed,  1 Jul 2026 06:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782888694;
	bh=PiCN0XbHNxL3wiS2C15r2mhEdbBCiGu3dJWvUYNOTRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lazT/QJg6tNx8ADnUeOrhR3oQvxrL7lGXlFte3tRvPd+enNiiTRSvpBghuXOx2+fR
	 mow8Tuq6QcTEMyXmRy+0GmmRjGFgdAKov6rLldCqifp4fTpbe/2DiQP9Y6iDOrh9GA
	 xz6bVHsNd1d++2pwdRqbxRH0EAMVdaWIskPQ5GIvkDu/sQPKRfT6fK/SxVwxzSXyA6
	 /dG++YTgMt0WjvnIzHUJxcS3F+pBwwe5L3yp6YMi1tpoqrdtD1pZW1j2EX5bzRl6SK
	 4W36EwVVbQnfHaCPwANNlElPzwDhS4DabNCQwThnoyWv5VBH5PP97sFYSnasI/vY6v
	 A+V/K0+jt3rGg==
Date: Wed, 1 Jul 2026 08:51:31 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Aniket Negi <aniket.negi03@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, aniket.negi@airoha.com
Subject: Re: [PATCH] net: airoha: fix MIB stats collection to be lossless
Message-ID: <akS48y8gCJf-EmTP@lore-desk>
References: <akPQ7P1Dqb00oWa3@lore-desk>
 <20260701063823.239783-1-aniket.negi03@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9rMejwU9NztTVBPE"
Content-Disposition: inline
In-Reply-To: <20260701063823.239783-1-aniket.negi03@gmail.com>
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


--9rMejwU9NztTVBPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> Thank you for the detailed review and suggestions!
>=20
> > > +	/* TX - 64-bit H+L registers: hw accumulates the total, read direct=
ly. =3D
> > */
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> > > -	dev->stats.tx_ok_pkts +=3D ((u64)val << 32);
> > > -	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> > > -	dev->stats.tx_ok_pkts +=3D val;
> > > +	dev->stats.tx_ok_pkts =3D (u64)val << 32;
> >=20
> > I guess it is more readable to store REG_FE_GDM_TX_OK_PKT_CNT_L() read =
in v=3D
> > al
> > here. Something like:
> >=20
> > 	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> > 	dev->stats.tx_ok_pkts +=3D val;
> >=20
> > This apply even to occurrence below
> Agreed. I'll store CNT_L read in val first to improve readability.
>=20
> > > +	dev->stats.tx_ok_pkts +=3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_C=
NT_L=3D
> > (port->id));
> > > =3D20
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
> > > -	dev->stats.tx_ok_bytes +=3D ((u64)val << 32);
> > > -	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
> > > -	dev->stats.tx_ok_bytes +=3D val;
> > > +	dev->stats.tx_ok_bytes =3D (u64)val << 32;
> > > +	dev->stats.tx_ok_bytes +=3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE=
_CNT=3D
> > _L(port->id));
> > > =3D20
> > > +	/* TX - 32-bit registers: accumulate delta to handle wrap-around. */
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
> > > -	dev->stats.tx_drops +=3D val;
> > > +	dev->stats.tx_drops +=3D (u32)(val - dev->stats.hw_prev_stats.tx_dr=
ops);
> > > +	dev->stats.hw_prev_stats.tx_drops =3D val;
> > > =3D20
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
> > > -	dev->stats.tx_broadcast +=3D val;
> > > +	dev->stats.tx_broadcast +=3D (u32)(val - dev->stats.hw_prev_stats.t=
x_br=3D
> > oadcast);
> > > +	dev->stats.hw_prev_stats.tx_broadcast =3D val;
> > > =3D20
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
> > > -	dev->stats.tx_multicast +=3D val;
> > > +	dev->stats.tx_multicast +=3D (u32)(val - dev->stats.hw_prev_stats.t=
x_mu=3D
> > lticast);
> > > +	dev->stats.hw_prev_stats.tx_multicast =3D val;
> > > =3D20
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
> > > -	dev->stats.tx_len[i] +=3D val;
> > > +	dev->stats.tx_len[i] +=3D (u32)(val - dev->stats.hw_prev_stats.tx_l=
en[i=3D
> > ]);
> > > +	dev->stats.hw_prev_stats.tx_len[i] =3D val;
> > > =3D20
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
> > > -	dev->stats.tx_len[i] +=3D ((u64)val << 32);
> > > -	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
> > > -	dev->stats.tx_len[i++] +=3D val;
> > > +	dev->stats.tx_len[i] +=3D (u64)val << 32;
> > =20
> > Since now we do not reset MIB counters, this is wrong, you can't use "+=
=3D"
>=20
> You are absolutely right, since MIB counters are no longer cleared, using=
 "+=3D" for E64 counter would cause double counting each iteration. This wa=
s missed in the patch, specifically for the case where runt count(32 bit) a=
nd E64 counter (64 bit) need to be combined in the same counter.=20
>=20
> I'll fix this by using separate accumulator fields to "tx_runt_accum/rx_r=
unt_accum" to track the runt deltas, then compute tx_len[i] as tx_len[i]=3D=
 tx_runt_accum + E64_CNT (H+L).
>=20
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
> > > -	dev->stats.rx_len[i] +=3D val;
> > > +	dev->stats.rx_len[i] +=3D (u32)(val - dev->stats.hw_prev_stats.rx_l=
en[i=3D
> > ]);
> > > +	dev->stats.hw_prev_stats.rx_len[i] =3D val;
> > > =3D20
> > >  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
> > > -	dev->stats.rx_len[i] +=3D ((u64)val << 32);
> > > -	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
> > > -	dev->stats.rx_len[i++] +=3D val;
> > > +	dev->stats.rx_len[i] +=3D (u64)val << 32;
> >=20
> > same here.
>=20
> Acked. The same approach above will be applied to rx_len[i].=20
>=20
> > > +
> > > +	struct {
> > > +	/* Previous HW register values for 32-bit counter delta tracking.
> > > +	 * Storing the last seen value and accumulating (u32)(curr - prev)
> > > +	 * in 64-bit software counter & handles wrap-around transparently
> > > +	 * via unsigned arithmetic. These fields are never reported to
> > > +	 * userspace.
> > > +	 */
> >=20
> > can you please align the comment here?
>=20
> Will fix the comment alignment.
>=20
> >=20
> > > +		u32 tx_drops;
> > > +		u32 tx_broadcast;
> > > +		u32 tx_multicast;
> > > +		u32 tx_len[7];
> > > +		u32 rx_drops;
> > > +		u32 rx_broadcast;
> > > +		u32 rx_multicast;
> > > +		u32 rx_errors;
> > > +		u32 rx_crc_error;
> > > +		u32 rx_over_errors;
> > > +		u32 rx_fragment;
> > > +		u32 rx_jabber;
> > > +		u32 rx_len[7];
> > > +	} hw_prev_stats;
> >=20
> > Maybe something like "prev_val32" ?
> >=20
> > Will update the name of struct to hold prev counter from hw_pre_stats t=
o prev_val32.
>=20
> Good suggestion. However, since the struct hw_prev_stats now contains bot=
h u32 (previous register value) and u64 (runt accumulators) fields. I'll re=
name it to "prev_mib_state" to better reflect its dual purpose of storing p=
revious register values for delta calculation and accumulators for combined=
 counters.=20

Maybe better mib_prev?

Since now we do not reset the MIB counters in airoha_update_hw_stats(), we =
can
get rid of the for loop there and just call airoha_dev_get_hw_stats() with =
the
provided dev pointer. Even better, just rename airoha_dev_get_hw_stats() in
airoha_update_hw_stats() and move the spinlock there. What do you think?

Regards,
Lorenzo

>  =20
> Regards,
> Aniket Negi
>=20

--9rMejwU9NztTVBPE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCakS48wAKCRA6cBh0uS2t
rHTFAP98GZd4vah+/iyTOTP+JaCGb7y8uJEZbADWZ+6OdKVipQEAoZh7+BYH/Ppl
mqqkT8muUF4OwTApIzilfaivEim+bgI=
=w6dd
-----END PGP SIGNATURE-----

--9rMejwU9NztTVBPE--

