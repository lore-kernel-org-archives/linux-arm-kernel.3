Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3742CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lE1lcjKMGS6njjkAs4Q7DtVgz0COWaFrMoj2uLVJhM=; b=P5a8pKB+v+ZcpgWaMX8u1nW8iH
	/GIZCsEIJJgOu0I24HskfSPo/DTPLlEr3KGpQU7cej2XtEWFblz8o/RjbvarMCUXzGr3DpGYIveDR
	3buTN6z2Idw+0ZXTEsyPaQ0QzeDiqcYJVuDFUbIbKew7TsGImczhMyB7GmCf6RgYFcorGrakBP9CG
	eDJ177NuBfJfTWpuCS2DUfHp8BBw00jxJ/yVhYsRiZvz4e4AwMwZilqgJVpZn8Zloj8ENnndot4S/
	VsVOkx8UKyDIcRMaiAfbW/B7yUPbx5/dg5h61dEjN9ceVEykdja9YxA6AOvCXTXIvg6UjDqSYHrz3
	bUeFL2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J71-00000003rxS-0bgQ;
	Thu, 16 Oct 2025 08:13:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J6z-00000003rxB-23so;
	Thu, 16 Oct 2025 08:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF65660393;
	Thu, 16 Oct 2025 08:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B94C4CEF1;
	Thu, 16 Oct 2025 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760602404;
	bh=JRPlKX+eOfHCbEao1Pk+DQKZrPhLJMjawB7Jmn0nkuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfwktXLkYCPsutEN4IMLIXWbPx1m+L2Pl1atPbDyhlQX9pB1k+ZnjDZ/wA/P3xM8R
	 kZCQCiHgfvBb9xDNz7Prt6yHDUWZvQspwERNPPZEiS3CgAM0FHMlp2lXY79JBWFJA8
	 5YYTSXrTlx2OqiDhBZrneODysIG/64H2YrLHdpAySXZi4zllPE3BFuaDJTOW20/QOb
	 fb1tZNXuB6Qa2Hmwv3Bz5ikljnsPGEYX8irH4mli3cV1TPoKfhMUKgKUBpsaXOmuK3
	 R80BM53DWbzjr7BrqJPj2xsGT+r9PeGnzl0BhJtWXl5aP6KbKA0kmNpVemnXHlwwQj
	 yw7AhCajfDWVg==
Date: Thu, 16 Oct 2025 10:13:21 +0200
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
Subject: Re: [PATCH net-next 08/12] net: airoha: ppe: Configure SRAM PPE
 entries via the cpu
Message-ID: <aPCpIS1Hd4hIb20q@lore-desk>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-8-064855f05923@kernel.org>
 <aO_CFRYy6vXCQIS2@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vAW4T/rTlIVRq6th"
Content-Disposition: inline
In-Reply-To: <aO_CFRYy6vXCQIS2@horms.kernel.org>
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


--vAW4T/rTlIVRq6th
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Oct 15, 2025 at 09:15:08AM +0200, Lorenzo Bianconi wrote:
> > Introduce airoha_ppe_foe_commit_sram_entry routine in order to configure
> > the SRAM PPE entries directly via the CPU instead of using the NPU APIs.
> > This is a preliminary patch to enable netfilter flowtable hw offload for
> > AN7583 SoC.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_ppe.c | 30 +++++++++++++++++++++++-=
------
> >  1 file changed, 23 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/eth=
ernet/airoha/airoha_ppe.c
> > index fcfd2d8826a9c2f8f94f1962c2b2a69f67f7f598..0ee2e41489aaa9de9c1e99d=
242ee0bec11549750 100644
> > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > @@ -662,6 +662,27 @@ static bool airoha_ppe_foe_compare_entry(struct ai=
roha_flow_table_entry *e,
> >  	return !memcmp(&e->data.d, &hwe->d, len - sizeof(hwe->ib1));
> >  }
> > =20
> > +static int airoha_ppe_foe_commit_sram_entry(struct airoha_ppe *ppe, u3=
2 hash)
> > +{
> > +	struct airoha_foe_entry *hwe =3D ppe->foe + hash * sizeof(*hwe);
> > +	bool ppe2 =3D hash >=3D PPE_SRAM_NUM_ENTRIES;
> > +	u32 *ptr =3D (u32 *)hwe, val;
> > +	int i;
> > +
> > +	for (i =3D 0; i < sizeof(*hwe) / 4; i++)
> > +		airoha_fe_wr(ppe->eth, REG_PPE_RAM_ENTRY(ppe2, i), ptr[i]);
>=20
> I realise that a similar pattern it is already used elsewhere,
> but '4' seems somewhat magic here.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> ...

--vAW4T/rTlIVRq6th
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPCpIQAKCRA6cBh0uS2t
rKdgAPsH0ww4Hrlelb1QuqnLD1TGZZFr8UF1MNUoTOTwV+4gHgD/UrxDeNf2dARc
ohcbUBc9rlkS5/IM2e7+vMYWUg5PBgA=
=J4PD
-----END PGP SIGNATURE-----

--vAW4T/rTlIVRq6th--

