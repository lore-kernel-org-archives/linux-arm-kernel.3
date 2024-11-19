Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82105D6007B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVX7RkSMCWqEzuoSHbqp8RLQVffpCyQRTHH1DBr09w4=; b=Bjzx0gbOndi4QKPjs0GskeG6OQ
	HdPEI0Qj6NzG923qoLAPaEz4Wqs3mTVb+HEhWq2/MbJ0JTSOsindr3KXlSZYv7ygThUNMOiy61Oq8
	+WTyo/aCISbF0oQJCD0Qlkr+kk4pTe+ekzq6B9UF6+jNsxVsJ2XVTMC6X4JopXa1wRfjsn7r4IXxQ
	O3AsEOa+nEbcj/OXz5QFLB/qudpoBbf5SuxWfwCzp1H6Moz47ohUcICb/HXBrhmW4zt2GhFo4azlw
	/OUAOHDJujMdULQMzehsCJeil3oNSGmndLWi9KBn8lk4MDFm35/fTAcEF5/OeIyazJue4zuGyWfq3
	Sx9FeT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJPk-0000000BjFN-0YJ6;
	Tue, 19 Nov 2024 08:16:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJOn-0000000Bj7h-1hxD;
	Tue, 19 Nov 2024 08:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9037A5C3F98;
	Tue, 19 Nov 2024 08:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CD0C4CECF;
	Tue, 19 Nov 2024 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732004148;
	bh=ejBrNZZPHW9XhE6WU+WW7+dWvdcRTPCPgQ6keHGeN8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMqtFtQMQ7GJofz2J1aN+IQ8uJX2UE4HAUA443syTNnq6pNXp1NwWZb9+3HTRYbnS
	 4GeVy4YKnB4gMVTyLk1enflzHoqzDpoyUKuPsF6P0JUsCefkkRxIeXtHxpHU80Rb/W
	 oOI1rdKrjVWGWBw1yb+A51Knat6r4STg2kdCPQQqDYsw8176RZMnem9QkKSDDeBx2L
	 9T91sno/xAFl15q+oPDsHvXm/hhC8sq4uEL54uMPwROROHZ+cJezsniWOk2JX1YOql
	 HsJPfHElGMj58qHJCawxtN468ji3lyXZM3xbVY8pxMPG+r8j77klXtWvF725qoCQbn
	 nsU57w3VxIVIw==
Date: Tue, 19 Nov 2024 09:15:45 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <ZzxJMbWkV1OELEID@lore-desk>
References: <20241113-pcie-en7581-rst-fix-v3-1-23c5082335f7@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oWqVrS/inJW1ZEom"
Content-Disposition: inline
In-Reply-To: <20241113-pcie-en7581-rst-fix-v3-1-23c5082335f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_001549_538522_847353F9 
X-CRM114-Status: GOOD (  29.15  )
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


--oWqVrS/inJW1ZEom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIE_RSTB signals are not asserted/released during device probe =
or
> suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
> (0x88) and REG_RESET_CONTROL (0x834) registers available in the clock
> module running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
>=20
> Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> specify per-SoC capabilities.
>=20
> Tested-by: Hui Ma <hui.ma@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Jianjun and Bjorn,

any news about this patch? Thanks in advance.

Regards,
Lorenzo

> ---
> Changes in v3:
> - cosmetics
> - Link to v2: https://lore.kernel.org/r/20241104-pcie-en7581-rst-fix-v2-1=
-ffe5839c76d8@kernel.org
>=20
> Changes in v2:
> - introduce flags field in mtk_gen3_pcie_flags struct instead of adding
>   reset callback
> - fix the leftover case in mtk_pcie_suspend_noirq routine
> - add more comments
> - Link to v1: https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1=
-1043fb63ffc9@kernel.org
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 60 ++++++++++++++++++++---=
------
>  1 file changed, 42 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/co=
ntroller/pcie-mediatek-gen3.c
> index 16a55711a7f3bdc8d6620029e3d2cfdd40b537b7..443072adb9b52a6934a5d1e38=
eb6fca5f86a1e13 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -128,10 +128,18 @@
> =20
>  struct mtk_gen3_pcie;
> =20
> +enum mtk_gen3_pcie_flags {
> +	SKIP_PCIE_RSTB	=3D BIT(0), /* skip PCIE_RSTB signals configuration
> +				   * during device probing or suspend/resume
> +				   * phase in order to avoid hw bugs/issues.
> +				   */
> +};
> +
>  /**
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
>   * @phy_resets: phy reset lines SoC data.
> + * @flags: pcie device flags.
>   */
>  struct mtk_gen3_pcie_pdata {
>  	int (*power_up)(struct mtk_gen3_pcie *pcie);
> @@ -139,6 +147,7 @@ struct mtk_gen3_pcie_pdata {
>  		const char *id[MAX_NUM_PHY_RESETS];
>  		int num_resets;
>  	} phy_resets;
> +	u32 flags;
>  };
> =20
>  /**
> @@ -405,22 +414,34 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pc=
ie *pcie)
>  	val |=3D PCIE_DISABLE_DVFSRC_VLT_REQ;
>  	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
> =20
> -	/* Assert all reset signals */
> -	val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> -	val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> -
>  	/*
> -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> -	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> -	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> -	 * for the power and clock to become stable.
> +	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> +	 * causing occasional PCIe link down. In order to overcome the issue,
> +	 * PCIE_RSTB signals are not asserted/released at this stage and the
> +	 * PCIe block is reset configuting REG_PCI_CONTROL (0x88) and
> +	 * REG_RESET_CONTROL (0x834) registers available in the clock module
> +	 * running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
>  	 */
> -	msleep(100);
> -
> -	/* De-assert reset signals */
> -	val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB=
);
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> +		/* Assert all reset signals */
> +		val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> +		val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> +		       PCIE_PE_RSTB;
> +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +
> +		/*
> +		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> +		 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> +		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> +		 * for the power and clock to become stable.
> +		 */
> +		msleep(PCIE_T_PVPERL_MS);
> +
> +		/* De-assert reset signals */
> +		val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> +			 PCIE_PE_RSTB);
> +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	}
> =20
>  	/* Check if the link is up or not */
>  	err =3D readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
> @@ -1179,10 +1200,12 @@ static int mtk_pcie_suspend_noirq(struct device *=
dev)
>  		return err;
>  	}
> =20
> -	/* Pull down the PERST# pin */
> -	val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> -	val |=3D PCIE_PE_RSTB;
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> +		/* Pull down the PERST# pin */
> +		val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> +		val |=3D PCIE_PE_RSTB;
> +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	}
> =20
>  	dev_dbg(pcie->dev, "entered L2 states successfully");
> =20
> @@ -1233,6 +1256,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_so=
c_en7581 =3D {
>  		.id[2] =3D "phy-lane2",
>  		.num_resets =3D 3,
>  	},
> +	.flags =3D SKIP_PCIE_RSTB,
>  };
> =20
>  static const struct of_device_id mtk_pcie_of_match[] =3D {
>=20
> ---
> base-commit: ff80d707f3cb5e8d9ec0739e0e5ed42dea179125
> change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--oWqVrS/inJW1ZEom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZzxJMQAKCRA6cBh0uS2t
rODiAQCGocPFNzuQfGPZrdtN1u3PEY2gdZEL4k92plmNdYqaFwD/YOgoQZifIClN
PzTooz0Twz8NFgekhlISf3wT485sFwk=
=oXff
-----END PGP SIGNATURE-----

--oWqVrS/inJW1ZEom--

