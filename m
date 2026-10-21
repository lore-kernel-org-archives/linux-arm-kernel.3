Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R4pQWbKb;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kwBQM5Nb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjzGdWbiEqzzV/MbYQG4TopYjAr0X/I+MiCAzcAGLpI=; b=R4pQWbKbvLJghoIAy4XSJQ1Ce6
	qgWCNuOm5pO0ivblyVvFdG3CxGD2hYoCzUFkAcUVoUROUEkA7NtLO2YyjzxnCTi3jNGMjYguWFPgn
	NJPTWozEJk73aDJuY1AwsPca2oLquex8NRKkRFPQHvVcFTbLwfFjRh63zxoWIOoSDCBSDXUg+Aqim
	ZTTfv/t+jWknLnIMS2ELuhrlzoSzLzMa8zNRkdX2EiwccBEh17Ji9Fn2Ipb0/xwVmav9nLvzVfXOC
	RKUdvXWb2cL92nrhnP4T74qYFlvNOadHXEPkBvVijbqCvwYNVTxxXXXwYE1oc+eNovF4GcSctZCyr
	7IrX1Bmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTgz-0000000BcS5-234f;
	Wed, 21 Oct 2026 10:37:09 +0000
Received: from sender6-pp-g123.zoho.com ([165.173.180.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTgw-0000000BcQu-1RKA;
	Wed, 21 Oct 2026 10:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1792579004; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vg4ASxVe/gRrDD7T/H1HLXKpWWkQxEoEToUwf2gjVgQHhTYdsZF+0wcPe/aCT6kTTygdTn8+XsTD4KtGu2NKj4mneTRLu+o0VYhkjaQexiAmfxaPQXlcWkvJ8mu+as0fYuu1Z6VApa5hqNk6BEhCQW+lD4eLzEP2HGCw7Z54wTU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792579004; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QjzGdWbiEqzzV/MbYQG4TopYjAr0X/I+MiCAzcAGLpI=; 
	b=XcQSfehKD8VgFwklFZJegFzqLTSxt+T60vRuu/Y6MC3JjpjUtQNDXGycZu7OPrKJ/c3933kKqODgfJqZ/u94N6+w9cbvIoSw6xnfamF74sy/IM1OJvKgt6HY5wh8Ew7eOg21XWfIY6gwNQI+nlUupDgA0qMT0k+bvuRoeCygFlQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792579004;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=QjzGdWbiEqzzV/MbYQG4TopYjAr0X/I+MiCAzcAGLpI=;
	b=kwBQM5NbKMKpWskOQ/UK068FN2dUY6f3Tqfsgf0xMc4o9dWO9sF6V3kiGe08IUg7
	+naym6+93bNkSscqYsND5A/H5/jtiUtWzKFSSmAXBBabwt41p9RF3uJQantmcB+nqwR
	EgGGkjq59XEsOgSNwGVkJJUUh8lRFRFDV5IdN8ro=
Received: by smtp.zohomail.com with SMTPS id 1792579002564512.9314975124558;
	Wed, 21 Oct 2026 03:36:42 -0700 (PDT)
Message-ID: <b7d26b378e3cfdb54a113cca1d8d53293cad966c.camel@collabora.com>
Subject: Re: [PATCH net-next v3 5/9] net: stmmac: mediatek: add RX/TX delay
 stage divider in platform data
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran	 <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Biao Huang
 <biao.huang@mediatek.com>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Eric Dumazet
 <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 21 Oct 2026 12:36:37 +0200
In-Reply-To: <34608ab8-18f3-4680-8276-cd8611c05cb1@bootlin.com>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
	 <20261016-dwmac-mediatek-mt8189-v3-5-25daf2bbcf35@collabora.com>
	 <34608ab8-18f3-4680-8276-cd8611c05cb1@bootlin.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_033706_486384_0FF5118E 
X-CRM114-Status: GOOD (  26.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime,

On Fri, 2026-10-16 at 13:37 +0200, Maxime Chevallier wrote:
> Hi Louis-Alexis,
>=20
> On 10/16/26 12:31, Louis-Alexis Eyraud wrote:
> > In preparation of newer SoC support, that have like MT8189 SoC
> > different RX and TX internal delay stage steps than MT8188/MT8195,
> > add
> > the RX and TX delay stage divider values in the variant platform
> > data
> > and replace the hardcoded value uses in mt2712_set_delay and
> > mt8195_set_delay.
> >=20
> > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0.../net/ethernet/stmicro/stmmac/dwmac-mediatek.c=C2=A0=C2=A0 | 46
> > ++++++++++++++++++----
> > =C2=A01 file changed, 38 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > index 596411d4a5b2..cb5bda53edb9 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > @@ -108,6 +108,10 @@ struct mediatek_dwmac_variant {
> > =C2=A0
> > =C2=A0	u32 rx_delay_max;
> > =C2=A0	u32 tx_delay_max;
> > +	u16 rx_rmii_delay_stage_div;
> > +	u16 tx_rmii_delay_stage_div;
> > +	u16 rx_rgmii_delay_stage_div;
> > +	u16 tx_rgmii_delay_stage_div;
> > =C2=A0	u8 dma_bit_mask;
> > =C2=A0};
> > =C2=A0
> > @@ -146,14 +150,22 @@ static int mt2712_set_delay(struct
> > mediatek_dwmac_plat_data *plat)
> > =C2=A0	u32 fine_val =3D 0;
> > =C2=A0
> > =C2=A0	if (phy_interface_mode_is_rgmii(plat->phy_mode)) {
> > -		rx_delay_stage_div =3D
> > MT2712_RGMII_DLY_RXC_STAGE_DIV;
> > -		tx_delay_stage_div =3D
> > MT2712_RGMII_DLY_TXC_STAGE_DIV;
> > +		rx_delay_stage_div =3D plat->variant-
> > >rx_rgmii_delay_stage_div;
> > +		tx_delay_stage_div =3D plat->variant-
> > >tx_rgmii_delay_stage_div;
> > =C2=A0	} else {
> > -		rx_delay_stage_div =3D
> > MT2712_RMII_DLY_RXC_STAGE_DIV;
> > -		tx_delay_stage_div =3D
> > MT2712_RMII_DLY_TXC_STAGE_DIV;
> > +		rx_delay_stage_div =3D plat->variant-
> > >rx_rmii_delay_stage_div;
> > +		tx_delay_stage_div =3D plat->variant-
> > >tx_rmii_delay_stage_div;
>=20
> Looking closer at this, what's RMII delay ? There's no delays in
> RMII, and
> it's a single clock not a RX and TX clock like RGMII, there's no RMII
> TXC/RXC.
>=20
You are right, these structures field and define names are wrong for
RMII/MII cases.
The mediatek,tx-delay-ps and mediatek,rx-delay-ps vendor properties are
used by this driver to fine tune different clocks depending on the phy
mode:
 - RX_CLK/TX_CLK in MII
 - REF_CLK in RMII
 - TXC/RXC in RGMII

I'll fix the fields and define names in next series revision, along the
issues the Sashiko reviews found.

> I think it's the same as on allwinner, the delay handling has been
> mixed-up between
> RMII and RGMII in the glue, you should be able to simplify this even
> more by
> ditching the RMII case.
The register fields that the driver sets in RMII or MII mode to tune
the needed clock(s) are different than the ones set in RGMII.
So I cannot really ditch the case but I'll simplify the delay handling.
For instance I could use a single divider field per mode, since for all
compatibles the value is the same in both RX and TX.

Best regards,
Louis-Alexis
>=20
> Maxime

