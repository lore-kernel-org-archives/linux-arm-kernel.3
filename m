Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DBA1061B21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+IgeM0E/Q07Sn3hriePPAxBXX3SXluGXODr4AiAiTw=; b=dk8RMPMZIvYaYbvrDY1pOJFsUD
	lMgdeP9C1XuNZj1OQ3pnzaFUz45M7WYHC8rjbRdqVtQcZ+p3uoQwGX/kPhX03W8KmQZBXlNo3rMO9
	1Q9q2A1I+Vt4OD2ogCUJqHNj+k2538YA3zGccmt26OwpCwkL0+sVIMXEYhhn2cmP0w0UI/ZdjsSEf
	wwulCelrSt1YFsM+zcvxtsFdf18Z0acOxZm3xLKYxfjgW/A0rp5Qj8GPEnm5W6YdH86fUIhtiqVUx
	uv+RifVWIQlMDCB5WWu7ZkpyP7Pw3g3dYGsF6KAu0buJ8BseaeAJ5lxZYiCPOK1dADakrplI0e+lh
	paq1wMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WRu-0000000CnTz-431l;
	Tue, 31 Mar 2026 10:35:54 +0000
Received: from www537.your-server.de ([2a01:4f8:d0a:334f::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WRs-0000000CnTY-2cJH;
	Tue, 31 Mar 2026 10:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=P+IgeM0E/Q07Sn3hriePPAxBXX3SXluGXODr4AiAiTw=; b=ZgAnieGle6zDl3EZKJg0za741y
	zLirxy2bugV/zO27BFhx+ku4dR6GFfFWtuYzQjuImkfCYLhPK9uMkKfoQEdvi29mCImnUcwR7RtIg
	d7SsfWichOIrd13aI4eXlX4npgSaqznv0AJ80EmsJCikOi05MrDOXJr8dh4ImuXnmpun9fXwcHDuU
	36cqMsfJacfr+oTkytel6paurOlzmPkKklJWqoHRektriOdfEDxeC5SXGzy1r6iQxvRM6Dj12rPS0
	8WFzww8a7xSQnM0YilT0Oc2yQpaXRa8rL68N0NdvnfGA7YGPO+1wtVTZ5a9TeMnM4G7TzKHEHPmyX
	BCdbp99A==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7WRe-000A6b-2s;
	Tue, 31 Mar 2026 12:35:38 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7WRd-0004TE-2w;
	Tue, 31 Mar 2026 12:35:38 +0200
Message-ID: <b93cbe578c3a4dec6b3b07780e57d50702a37d3d.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 5/7] phy: ti: gmii-sel: add support for J722S SoC
 family
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,  Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Date: Tue, 31 Mar 2026 12:35:37 +0200
In-Reply-To: <20260330223741.pmrx25cslrlpbcea@skbuf>
References: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
	 <5d00697f133cd33a1df62ac7ebf73e507e49ed2f.1774354734.git.nora.schiffer@ew.tq-group.com>
	 <20260330223741.pmrx25cslrlpbcea@skbuf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_033552_654694_611DED96 
X-CRM114-Status: GOOD (  22.41  )
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

On Tue, 2026-03-31 at 01:37 +0300, Vladimir Oltean wrote:
> Hi Nora,
>=20
> On Tue, Mar 24, 2026 at 01:29:41PM +0100, Nora Schiffer wrote:
> > The J722S gmii-sel is mostly identical to the AM64's, but additionally
> > supports SGMII.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  drivers/phy/ti/phy-gmii-sel.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-se=
l.c
> > index 6213c2b6005a5..4e242b1892334 100644
> > --- a/drivers/phy/ti/phy-gmii-sel.c
> > +++ b/drivers/phy/ti/phy-gmii-sel.c
> > @@ -251,6 +251,13 @@ struct phy_gmii_sel_soc_data phy_gmii_sel_soc_am65=
4 =3D {
> >  	.regfields =3D phy_gmii_sel_fields_am654,
> >  };
> > =20
> > +static const
> > +struct phy_gmii_sel_soc_data phy_gmii_sel_soc_j722s =3D {
> > +	.use_of_data =3D true,
> > +	.regfields =3D phy_gmii_sel_fields_am654,
> > +	.extra_modes =3D BIT(PHY_INTERFACE_MODE_SGMII),
>=20
> I'm not familiar with the hardware, but "mostly identical to AM64, but
> additionally supports SGMII" does not explain why j722s does not inherit
> the features that am654 has (PHY_GMII_SEL_RGMII_ID_MODE and
> BIT(PHY_GMII_SEL_FIXED_TX_DELAY).
>=20
> The phy-gmii-sel from j722s does support RGMII, right? Because in lack
> of the PHY_GMII_SEL_RGMII_ID_MODE feature, phy_gmii_sel_mode() will just
> silently skip the regmap_field_write(regfield, rgmii_id) call, and
> return successfully despite an incomplete configuration.
>=20
> We have the phy_validate() call and phy_ops::validate() through which
> the PHY can report to the Ethernet controller which phy_interface_t it
> supports and which it doesn't. If the j722s doesn't support RGMII, maybe
> it should implement this method.

Thanks for noticing this, PHY_GMII_SEL_RGMII_ID_MODE and
PHY_GMII_SEL_FIXED_TX_DELAY are missing indeed - will fix in v3. I made the
mistake to rebase from an older kernel version where these flags didn't exi=
st
yet and neglected to double check when the rebase went through without
conflicts. I assume I didn't notice any issues because our bootloader left =
the
controller in the correct state.

Best,
Nora


>=20
> > +};
> > +

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

