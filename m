Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD95C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caeS/LjqHC5JFGhaMq+lIhUSoljgls3cFZwTrqH3Jig=; b=rRX3pvBc8GtLJYC1nj/XZc9ijD
	JN27Zcdlb232Yh9C+4Itm+L9HZBbWUtllSdIg6ihl5iNYPpPE42/VDLMZsrxoEqrFNjyZaVaAqJuQ
	sSgVBPGeiIIkKPr/EhN5kr8TeNsIP6Uj0J6w1azKYG+L1lbUhsvTOVPOEi4skqGPnwZO4zfrC/kh8
	8hd8d3IrrHFYajJsxsNO40t+5ymG6kHAs5JyOCQPz6kgshI0rL8nyZBPL9nSjF3vVJEbtURWnva+A
	Fv1OgslYFrkz6aW4UsBjsoJExq+cePTSL6cr1bYObeGpZBcWrdKadnVIsjpXAAo/KzT9cox74qVei
	U5gWtWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYND5-0000000EWy2-05zX;
	Thu, 16 Jan 2025 10:34:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNBn-0000000EWaq-1d84;
	Thu, 16 Jan 2025 10:33:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27A6F5C59F2;
	Thu, 16 Jan 2025 10:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18742C4CED6;
	Thu, 16 Jan 2025 10:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737023606;
	bh=S+g0KwJKhEGGe+s0qjck8zl1QAQR7IzypnJhI9sb/gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0t9msqzYXzRFVJkhPK83dEQJDpnYF9mZGlMJzJNy1niLUhu6AMF+N7B7aw1iFmFD
	 1fAOmcCTasqh4+06+fceLgtZF2fKwj0UdaHC6c1g+dJUHtCUejZZMkZ5Kjs1TM+jtT
	 lPY04G5ITi1hi/mrvN1BlfbOb7aa2L90fzwu9wgmUnc4fpYw9vCIrTQ5+exsNPGWOM
	 GBG7SS8Fx1+RZoQ8tyKcCDkUBbpxLqyptYsGQEe6V32JrD6dLcuH5Z6DEDyKZaLu1W
	 003DVDiq0vjn48KJYp9quDVPYPylYp9P3spQqqNWSgHAvPIv7Tpf5JO5oUoOMlFJmi
	 ihVxdg5HbpWfg==
Date: Thu, 16 Jan 2025 11:33:23 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Remove leftover mac_reset assert for
 Airoha EN7581 SoC.
Message-ID: <Z4jgczH63wfdfU27@lore-desk>
References: <20250115-pcie-en7581-remove-mac_reset-v1-1-61c2652e189f@kernel.org>
 <1f143d85c24d4691299072d582142f36c018c878.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vk7D2QuutwXiu5yy"
Content-Disposition: inline
In-Reply-To: <1f143d85c24d4691299072d582142f36c018c878.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_023327_518954_1DE40F76 
X-CRM114-Status: GOOD (  21.65  )
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


--Vk7D2QuutwXiu5yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mi, 2025-01-15 at 18:58 +0100, Lorenzo Bianconi wrote:
> > Remove a leftover assert for mac_reset line in mtk_pcie_en7581_power_up=
().
> > This is not armful since EN7581 does not requires mac_reset and
>               ^ harmful

ack, I will fix it.

>=20
> > mac_reset is not defined in EN7581 device tree.
> >
>=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..0f64e76e2111468e6a45388=
9ead7fbc75804faf7 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -940,7 +940,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3=
_pcie *pcie)
> >  	 */
> >  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> >  				  pcie->phy_resets);
> > -	reset_control_assert(pcie->mac_reset);
>=20
> Is it ok to keep the mac_reset assert in mtk_pcie_power_down() ?

yes, since it is in common between mtk chipset and airoha one.
reset_control_assert() just returns if rstc is NULL.

>=20
> >  	/* Wait for the time needed to complete the reset lines assert. */
> >  	msleep(PCIE_EN7581_RESET_TIME_MS);
> >=20
> > ---
> > base-commit: d02e16e4e05d5d2530a4836ca92318c6a6b21b01
>=20
> I can't find this commit, which tree is it on?

it is in next tree:

commit d02e16e4e05d5d2530a4836ca92318c6a6b21b01
Merge: 07eecfa5d467 9dfc6850cfa4
Author: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
Date:   Wed Jan 15 13:56:57 2025 +0000

    Merge branch 'resource'
   =20
    * resource:
      PCI: Encourage resource request API users to supply driver name


Regards,
Lorenzo

>=20
> regards
> Philipp

--Vk7D2QuutwXiu5yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ4jgcwAKCRA6cBh0uS2t
rD2VAQD0Qbr6I8sYkx4eqnBqrDn/gH4xjGSC0w0smSCqEcW7tgD/Y3UAhJwS/hbm
MSdL+AxX5xXh2mKfBkXGhM7w1jLgqAI=
=K7Oy
-----END PGP SIGNATURE-----

--Vk7D2QuutwXiu5yy--

