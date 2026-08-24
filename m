Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B75C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36XSYQRqdPAd+B6sJlPnCE0gh5OCgUy3ucqeEekGoG8=; b=kZH7pX6s7xEuQ/WHI8+JDGFEVa
	oOhdgTZhv+PSkS900N2kYwDDZtldHrkER16qFT1lpT3Sbjo4RzovJ0IEO1XwaeV0XLCUcmU4b3knx
	1TtL8oKGNDmPktVNkUscmUJcB5Uxnv1NxvX4+C4d5r1lSNMq+rkbqjthApfZp59scklAKA+3wchVM
	Y9Vt9P5pempyyOZt9efZ7CRQZEFJ4/j+IAmMhAU9paKhJlUPKBT8VgLmECsvARUN3v7vU94qdJu8t
	Tnz5e/w8F1VHQ+J67PmAw7MvsEMA7hVfIGOIf/AObTlfbxKdCPCimlLVBFZyb03bfGDALFTwQgokW
	HDzfxx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW2i-0000000GprK-4AdS;
	Mon, 24 Aug 2026 14:53:01 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW2b-0000000GpqN-1Nb9;
	Mon, 24 Aug 2026 14:52:55 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 27528200F4F;
	Mon, 24 Aug 2026 16:52:43 +0200 (CEST)
Message-ID: <f419c95ff3f97e25593557234d1b2276ba6cf453.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/2] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Pieralisi	
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ryder
 Lee	 <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, 	linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 24 Aug 2026 16:52:43 +0200
In-Reply-To: <20260806165334.7328-3-ansuelsmth@gmail.com>
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
	 <20260806165334.7328-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_075249_521335_7B3AA416 
X-CRM114-Status: GOOD (  23.41  )
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

On Do, 2026-08-06 at 18:53 +0200, Christian Marangi wrote:
> The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lane=
s
> mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
> done by configuring the PCIe MUX in the SCU register.
>=20
> To correctly configure PCIe0 in x2 link, define in DT the following
> additional properties:
>=20
>   - additional reg, 'sec-pcie-mac' for the secondary PCIe.
>   - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' a=
nd
>     'sec-perstout'
>   - 'airoha,scu' property to correctly configure the SCU register for the
>     PCIe MUX
>   - 'num-lanes' set to '2' to enable PCIe0 in x2 link
>=20
> In such configuration the EQ preset are configured to the same values.
>=20
> To permit correct configuration of the PCIe link, additional logic is add=
ed
> to assert and deassert the PERSTOUT resets. Support of these additional
> reset was introduced in Airoha clk driver with commit
> 6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset=
")
> and on backporting of this commit also the clk driver change will be
> needed.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 106 ++++++++++++++++----
>  1 file changed, 89 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/co=
ntroller/pcie-mediatek-gen3.c
> index b0accd828589..c8300c47374b 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -32,6 +32,11 @@
> =20
>  #include "../pci.h"
> =20
> +/* AN7581 SCU register */
> +#define SCU_PCIC			0x88
> +#define SCU_PCIC_PCIE_CTRL		GENMASK(7, 0)
> +
> +/* PCIe register */
>  #define PCIE_BASE_CFG_REG		0x14
>  #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
> =20
> @@ -131,6 +136,7 @@
>  #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
> =20
>  #define MAX_NUM_PHY_RESETS		3
> +#define MAX_NUM_PERSTOUT_RESETS		2
> =20
>  #define PCIE_MTK_RESET_TIME_US		10
> =20
> @@ -203,9 +209,11 @@ struct mtk_msi_set {
>  struct mtk_gen3_pcie {
>  	struct device *dev;
>  	void __iomem *base;
> +	void __iomem *sec_base;
>  	phys_addr_t reg_base;
>  	struct reset_control *mac_reset;
>  	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
> +	struct reset_control_bulk_data perstout_resets[MAX_NUM_PERSTOUT_RESETS]=
;
>  	struct phy *phy;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> @@ -928,6 +936,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie =
*pcie)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
> =20
> +	pcie->perstout_resets[0].id =3D "perstout";
> +	pcie->perstout_resets[1].id =3D "sec-perstout";
> +
> +	ret =3D devm_reset_control_bulk_get_optional_exclusive(dev, MAX_NUM_PER=
STOUT_RESETS,
> +							     pcie->perstout_resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get PERSTOUT bulk reset\n");

"bulk" is a property of the API, not the reset controls. Maybe just
"failed to get PERSTOUT resets"?

> +
>  	pcie->mac_reset =3D devm_reset_control_get_optional_exclusive(dev, "mac=
");
>  	if (IS_ERR(pcie->mac_reset))
>  		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC=
 reset\n");
[...]
> @@ -992,6 +1028,19 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3=
_pcie *pcie)
>  	size =3D lower_32_bits(resource_size(entry->res));
>  	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
> =20
> +	/* Assert PERSTOUT for all relevant lanes */
> +	err =3D reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
> +					pcie->perstout_resets);

Isn't there a possible error return before this? Should the PERSTOUT
resets be asserted in those error cases as well?


regards
Philipp

