Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AB4CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jT1Ry3XK2uxvUYqon+pxyvPgFgnqM/4Z+7OBJI7gqgY=; b=N1qV2Ii4xaMrPv5EKh9cPUlSXx
	KfKHPgRZ8iBxrkxQbWpRbUwxmPd+yYRn3Ilcrr4a0t+PH5/SHJpEyuPojNiLmltrdVNS8nPlArzIM
	1mr6W3CH/gJf9EBJ9Ai23WpsgD+u5fZxfekLpcQjBthf0aNnsh3cHXlquyOiSBvdc2q3kyonoqL3J
	CsfWnuy05ueopwwhDOVTBAarL8E1Z9m7M//eLL4v16UV1JGiEkbfpvhwbC3vaB4nmwvTksWKPf9jl
	s+3vp101l2ytsI3HI0zgo96XHAZsfZ7Nm+l5VSTNwNk3WNYCQt+umpz0kKQtq4zA8bxqqHkViN1UC
	03rWypkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J4C-00000003rXZ-30CS;
	Thu, 16 Oct 2025 08:10:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J4B-00000003rXQ-2wgR;
	Thu, 16 Oct 2025 08:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2054660393;
	Thu, 16 Oct 2025 08:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45001C4CEF1;
	Thu, 16 Oct 2025 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760602230;
	bh=BqE165DW1W7QlpVTH7AU/66UVMbPwzOvW0CrLWglYhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFAs+/pzVgP+mpwH3riBiHGxPTQFVGQ1SFIFoCFpefs9Ay3Hae3mOTbOb9ANhytly
	 h8ZZ1HqK+R0kNzc6F/+UIZPZ5RFZ9T5ZCm40F7YU5g3SupREgEsd3rH2UMvj6rqX3+
	 Y90Lkvkdu6eYglFqR/BXbMaSwcyMr/jZx1kegnulI5CbT9B9O3tZ3QPJ05c6fj0XTv
	 b9ud1Xm4QhpzMO/lI4giQm35TOECNxN819WRZd/Cy/eUe2uPfrKmpVkG6YRmIkZQCW
	 O6cBEpXx0bnHzMQ976S4ryGEBcHBnbaFfz63KaSZi59UJlIM7VKXN4B6D0Y14KKYyb
	 XDdhJeMcFu4mg==
Date: Thu, 16 Oct 2025 10:10:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 03/12] net: airoha: Add
 airoha_ppe_get_num_stats_entries() and
 airoha_ppe_get_num_total_stats_entries()
Message-ID: <aPCodE0_u94s-w73@lore-desk>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-3-064855f05923@kernel.org>
 <aO-ZCqsvPQ6Pqjpg@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zgC7fqkmMZN9riIm"
Content-Disposition: inline
In-Reply-To: <aO-ZCqsvPQ6Pqjpg@horms.kernel.org>
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


--zgC7fqkmMZN9riIm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Oct 15, 2025 at 09:15:03AM +0200, Lorenzo Bianconi wrote:
> > Introduce airoha_ppe_get_num_stats_entries and
> > airoha_ppe_get_num_total_stats_entries routines in order to make the
> > code more readable controlling if CONFIG_NET_AIROHA_FLOW_STATS is
> > enabled or disabled.
> > Modify airoha_ppe_foe_get_flow_stats_index routine signature relying on
> > airoha_ppe_get_num_total_stats_entries().
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.h |  10 +--
> >  drivers/net/ethernet/airoha/airoha_ppe.c | 103 +++++++++++++++++++++++=
++------
> >  2 files changed, 86 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/eth=
ernet/airoha/airoha_eth.h
> > index 4330b672d99e1e190efa5ad75d13fb35e77d070e..1f7e34a5f457ca2200e9c81=
dd05dc03cd7c5eb77 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -50,15 +50,9 @@
> > =20
> >  #define PPE_NUM				2
> >  #define PPE1_SRAM_NUM_ENTRIES		(8 * 1024)
> > -#define PPE_SRAM_NUM_ENTRIES		(2 * PPE1_SRAM_NUM_ENTRIES)
> > -#ifdef CONFIG_NET_AIROHA_FLOW_STATS
> > +#define PPE_SRAM_NUM_ENTRIES		(PPE_NUM * PPE1_SRAM_NUM_ENTRIES)
> >  #define PPE1_STATS_NUM_ENTRIES		(4 * 1024)
> > -#else
> > -#define PPE1_STATS_NUM_ENTRIES		0
> > -#endif /* CONFIG_NET_AIROHA_FLOW_STATS */
> > -#define PPE_STATS_NUM_ENTRIES		(2 * PPE1_STATS_NUM_ENTRIES)
> > -#define PPE1_SRAM_NUM_DATA_ENTRIES	(PPE1_SRAM_NUM_ENTRIES - PPE1_STATS=
_NUM_ENTRIES)
> > -#define PPE_SRAM_NUM_DATA_ENTRIES	(2 * PPE1_SRAM_NUM_DATA_ENTRIES)
> > +#define PPE_STATS_NUM_ENTRIES		(PPE_NUM * PPE1_STATS_NUM_ENTRIES)
> >  #define PPE_DRAM_NUM_ENTRIES		(16 * 1024)
> >  #define PPE_NUM_ENTRIES			(PPE_SRAM_NUM_ENTRIES + PPE_DRAM_NUM_ENTRIES)
> >  #define PPE_HASH_MASK			(PPE_NUM_ENTRIES - 1)
> > diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/eth=
ernet/airoha/airoha_ppe.c
> > index 8d1dceadce0becb2b1ce656d64ab77bd3c2f914a..303d31e1da4b723023ee0cc=
1ca5f6038c16966cd 100644
> > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > @@ -32,6 +32,30 @@ static const struct rhashtable_params airoha_l2_flow=
_table_params =3D {
> >  	.automatic_shrinking =3D true,
> >  };
> > =20
> > +static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe,
> > +					    u32 *num_stats)
> > +{
> > +#ifdef CONFIG_NET_AIROHA_FLOW_STATS
> > +	*num_stats =3D PPE1_STATS_NUM_ENTRIES;
> > +	return 0;
> > +#else
> > +	return -EOPNOTSUPP;
> > +#endif /* CONFIG_NET_AIROHA_FLOW_STATS */
> > +}
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> I think that in general using IS_ENABLED is preferred over #ifdef
> in cases where the former can be used. For one thing it improves compile
> coverage.
>=20
> That does seem applicable here, so I'm wondering if
> we can do something like the following.
> (Compile tested only!)
>=20
> static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe,
>                                             u32 *num_stats)
> {
>         if (!IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS))
>                 return -EOPNOTSUPP;
>=20
>         *num_stats =3D PPE1_STATS_NUM_ENTRIES;
>         return 0;
> }

ack, fine. I will fix it in v2.

>=20
> Also, very subjectively, I might have returned num_stats as
> a positive return value. I'm assuming it's value will never overflow an i=
nt.
> Likewise elsewhere.
>=20
> But that's just my idea. Feel free to stick with the current scheme.

I guess it is fine. I will fix it in v2.

Regards,
Lorenzo

>=20
> ...

--zgC7fqkmMZN9riIm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPCodAAKCRA6cBh0uS2t
rOw7AQCrjTRELdN7df/7nasO5hLMxRhlBZzyAL0R8iFX2T/0jAD/Z0pUAE59OW0Z
Q9RIe4mD8YXtUcw5ym+gnF/sXJKqLgM=
=3ofA
-----END PGP SIGNATURE-----

--zgC7fqkmMZN9riIm--

