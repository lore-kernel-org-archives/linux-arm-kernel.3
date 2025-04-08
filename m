Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEB7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 23:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYDcGXbkfx+Ur65gWMxldclPhPSnjrS7tVAsrYOAMxw=; b=FIOWQtBLsM9FXIYn4wZWAa0f0A
	dy/T83RkuzJVah834FR6fUMrUiX40bFElnPy+stOxuvQuU9fgGgDKckb/vq1QDqKzf4Y9ryWWMIMe
	D3qC3amB/0ZsWReIRsccS3E/VtTvvFMCqrFdeAZnIS0iGQuCrEfAC323uXJfacTt5rFUAtZ7FdPNI
	16ZRBzADxm4Os9xt+deE8ubV+FD7u6HRr5nwqpxrcWUxE+tp3affvPKzAozlY5tiM5j+6SMBt/n04
	KmFScUt4Sq6N7NY0OANcIm1sPvPkaUpDYPYrM750lz59x6QmcJp2oAfx0ula9Y75VQN81Q6zDcOjD
	dBXcSoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IIO-00000005gWW-19rU;
	Tue, 08 Apr 2025 23:23:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IDw-00000005fxS-0zzB;
	Tue, 08 Apr 2025 23:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 704D85C4BE9;
	Tue,  8 Apr 2025 23:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC94FC4CEE5;
	Tue,  8 Apr 2025 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744154359;
	bh=jq+FrRJ8wmPSlEyVRgARkqehmDkbb8yB70PS2EY+cZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaRKTDUD7aSux1lHxvu0vYbpp332XuP/7dbrUIuNehASvPMACmPTcU3k5EIRTiPlB
	 RifELkRpXtFPMa2erZyOdpnQLz/vw51OxCGTVTBEITJUuJcXfK0Qtx4lpElXRiZ5Sy
	 A5uzx+z4hg2yKUIveg5/634n0IMzjUc2vKF+ONZHUCriL0MI9pvEatkJ1cbP/8t6tq
	 5Uzl/wjRTrVwAXgWTqZUy4cN9k3ij4/E1/1zHLvU/l7PO0MWREN+1nAuy2BycaHycB
	 jync/h5nPEOUZikwPI/GBpWeXFskatlzeoMFEc3/XcywgGXkNZN5RHAUYhpkCK6afB
	 EYlT7OkUI1/9g==
Date: Wed, 9 Apr 2025 01:19:16 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: airoha: Add L2 hw acceleration support
Message-ID: <Z_Wu9EDZM9jvmgAU@lore-desk>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
 <20250407-airoha-flowtable-l2b-v1-3-18777778e568@kernel.org>
 <Z/V/ip/dA+aw+dCW@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D5x5nT7TkBsGAvZK"
Content-Disposition: inline
In-Reply-To: <Z/V/ip/dA+aw+dCW@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_161920_696991_2F1E246C 
X-CRM114-Status: GOOD (  22.99  )
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


--D5x5nT7TkBsGAvZK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Apr 07, 2025 at 04:18:32PM +0200, Lorenzo Bianconi wrote:
> > Similar to mtk driver, introduce the capability to offload L2 traffic
> > defining flower rules in the PSE/PPE engine available on EN7581 SoC.
> > Since the hw always reports L2/L3/L4 flower rules, link all L2 rules
> > sharing the same L2 info (with different L3/L4 info) in the L2 subflows
> > list of a given L2 PPE entry.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c |   2 +-
> >  drivers/net/ethernet/airoha/airoha_eth.h |  11 ++-
> >  drivers/net/ethernet/airoha/airoha_ppe.c | 162 +++++++++++++++++++++++=
++------
> >  3 files changed, 144 insertions(+), 31 deletions(-)
> >=20
>=20
> [...]
>=20
> > +static void airoha_ppe_foe_remove_flow(struct airoha_ppe *ppe,
> > +				       struct airoha_flow_table_entry *e)
> > +{
> > +	lockdep_assert_held(&ppe_lock);
> > +
> > +	hlist_del_init(&e->list);
> > +	if (e->hash !=3D 0xffff) {
> > +		e->data.ib1 &=3D ~AIROHA_FOE_IB1_BIND_STATE;
> > +		e->data.ib1 |=3D FIELD_PREP(AIROHA_FOE_IB1_BIND_STATE,
> > +					  AIROHA_FOE_STATE_INVALID);
> > +		airoha_ppe_foe_commit_entry(ppe, &e->data, e->hash);
> > +		e->hash =3D 0xffff;
> > +	}
> > +	if (e->type =3D=3D FLOW_TYPE_L2_SUBFLOW) {
> > +		hlist_del_init(&e->l2_subflow_node);
> > +		kfree(e);
> > +	}
> > +}
> > +
> > +static void airoha_ppe_foe_remove_l2_flow(struct airoha_ppe *ppe,
> > +					  struct airoha_flow_table_entry *e)
> > +{
> > +	struct hlist_head *head =3D &e->l2_flows;
> > +	struct hlist_node *n;
> > +
> > +	lockdep_assert_held(&ppe_lock);
> > +
> > +	rhashtable_remove_fast(&ppe->l2_flows, &e->l2_node,
> > +			       airoha_l2_flow_table_params);
> > +	hlist_for_each_entry_safe(e, n, head, l2_subflow_node)
> > +		airoha_ppe_foe_remove_flow(ppe, e);
> > +}
> > +
> >  static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
> >  					     struct airoha_flow_table_entry *e)
> >  {
> >  	lockdep_assert_held(&ppe_lock);
> > =20
> > -	if (e->type =3D=3D FLOW_TYPE_L2) {
> > -		rhashtable_remove_fast(&ppe->l2_flows, &e->l2_node,
> > -				       airoha_l2_flow_table_params);
> > -	} else {
> > -		hlist_del_init(&e->list);
> > -		if (e->hash !=3D 0xffff) {
> > -			e->data.ib1 &=3D ~AIROHA_FOE_IB1_BIND_STATE;
> > -			e->data.ib1 |=3D FIELD_PREP(AIROHA_FOE_IB1_BIND_STATE,
> > -						  AIROHA_FOE_STATE_INVALID);
> > -			airoha_ppe_foe_commit_entry(ppe, &e->data, e->hash);
> > -			e->hash =3D 0xffff;
> > -		}
> > -	}
> > +	if (e->type =3D=3D FLOW_TYPE_L2)
> > +		airoha_ppe_foe_remove_l2_flow(ppe, e);
> > +	else
> > +		airoha_ppe_foe_remove_flow(ppe, e);
>=20
> It's not a hard request, more of a question: wouldn't it be better to
> introduce "airoha_ppe_foe_remove_l2_flow()" and
> "airoha_ppe_foe_remove_flow()" in the patch #2?
> It looks like reorganizing the code can be part of the preliminary
> patch and the current patch can just add the feature, e.g. L2_SUBFLOW.

ack, fine for me. I will fix it in v2.

Regards,
Lorenzo

>=20
> Thanks,
> Michal
>=20

--D5x5nT7TkBsGAvZK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/Wu9AAKCRA6cBh0uS2t
rE8gAP0RtE2rJQnq69I0ppX4iKk8Uqocro+ljFSQFoVvrjGXSgEA5pei1LXuW1nS
Z3eXKwveeMuRdFN8Dj8lGxCU1GwVnw0=
=lKOk
-----END PGP SIGNATURE-----

--D5x5nT7TkBsGAvZK--

