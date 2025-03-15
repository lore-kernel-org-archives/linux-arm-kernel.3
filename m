Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84157C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYhCAtwl0naHYx3jn0rAzf3JyaDdmMRxV28VmCFt8DE=; b=TS+Q8MA2wRcLbDRwdvKVGfRsuO
	e7LN4MsSSXTKdZlFCxV9kPJnPgutj1OVFQWHCmN2OGqN8yhKQabEqhG+alnYlw6ab063EGE2Hb8Ct
	RlZEuLtOcdGIZRtf7NM7+Tf7lFtbHgOIpM/6wq1ma8w2rz8IuFltILosX1Q7TmcZEZNg0yljMlbla
	yI1fzsjePmP7MZ7b4AR8hOkKefphNAwMIVk0U8/nZuiLhvuAGavjFDZwaJd3Sd35jzpYmfsLCID49
	1A/doL0puWOwacgy+fyB7sVJaFHBm17nsw1cSVYrR7FonNoJERIMCOwVp5zWmfPKTGq/zqXVvdeXA
	l49iJRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttT15-0000000GV2V-1AlQ;
	Sat, 15 Mar 2025 15:01:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttSzO-0000000GUmP-2OHT;
	Sat, 15 Mar 2025 14:59:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2685A48AAA;
	Sat, 15 Mar 2025 14:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE96C4CEE5;
	Sat, 15 Mar 2025 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742050789;
	bh=nbH36w1dL+pRRLGP3n0xnr2K2/yhzh6Zxphogml5rEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0QKS65a7KfZjQU861W52Aibfx/85WGuyFdmAbFJD8Faw3UXl9rlDwwANcvDpozNo
	 JY2yA2JpsppGFoq46iKbGHKw2+mYXsxoaPZba7Aa55oAS8vZt/de2susUwsmDUiN+b
	 2xYTyrDKyRPgJxaNEO2fiJumHmBzinGW/SeoPgA/WDvu7GpRQEzHtVzq7tM+fOKjIt
	 CTdTDfEjSGsuHVjoF6gTr5/WBgkDzQShecYdKLdDSPDvhdAlSadj4Gpm8SkQAGoMnj
	 6SnWUN9GpxkEBZbYDvWmtxl9UKaubRs4yGG9/i1VeMfLM7ph1aR6UPzjwXc9vniNva
	 G6hEUIgdd6hAg==
Date: Sat, 15 Mar 2025 15:59:46 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <Z9WV4mNwG04JRbZg@lore-desk>
References: <20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org>
 <b647d3c2-171e-43ea-9329-ea37093f5dec@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0gwZGiIvCsP+axxS"
Content-Disposition: inline
In-Reply-To: <b647d3c2-171e-43ea-9329-ea37093f5dec@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_075950_671071_46F798E6 
X-CRM114-Status: GOOD (  14.56  )
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


--0gwZGiIvCsP+axxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
> > routine.
>=20
> A more interesting question is, why do you see an invalid port? Is the
> hardware broken? Something not correctly configured? Are you just
> papering over the crack?
>=20
> > -static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
> > +static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
> > +					struct airoha_foe_entry *hwe,
> >  					struct net_device *dev, int type,
> >  					struct airoha_flow_data *data,
> >  					int l4proto)
> > @@ -224,6 +225,11 @@ static int airoha_ppe_foe_entry_prepare(struct air=
oha_foe_entry *hwe,
> >  	if (dev) {
> >  		struct airoha_gdm_port *port =3D netdev_priv(dev);
>=20
> If port is invalid, is dev also invalid? And if dev is invalid, could
> dereferencing it to get priv cause an opps?

I do not think this is a hw problem. Running bidirectional high load traffi=
c,
I got the sporadic crash reported above. In particular, netfilter runs
airoha_ppe_flow_offload_replace() providing the egress net_device pointer u=
sed
in airoha_ppe_foe_entry_prepare(). Debugging with gdb, I discovered the sys=
tem
crashes dereferencing port pointer in airoha_ppe_foe_entry_prepare() (even =
if
dev pointer is not NULL). Adding this sanity check makes the system stable.
Please note a similar check is available even in mtk driver [0].

Regards,
Lorenzo

[0] https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/medi=
atek/mtk_ppe_offload.c#L220

>=20
> 	Andrew

--0gwZGiIvCsP+axxS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9WV4gAKCRA6cBh0uS2t
rG88AQC/jFkglYKzs7gKjBMXlbb4qZXUvmG4BooRm1FBX3ufNAD8C4Kkjhzs5jAE
MFryAvFRHcSIrWLNX8IUoQyL/VhhfQA=
=91tS
-----END PGP SIGNATURE-----

--0gwZGiIvCsP+axxS--

