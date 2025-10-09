Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A323CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4mH1G+FMKhoYnhMZuNcJLdaBMJFTzeUcPUOMNeqi5c=; b=fhHTu2OntBUETIT/sxniljoHV3
	pruaqo/LXSH1BERQtUHKREtBceBJ02Y0AhK8UWxBxBgGUDD4BZ2jmClCBlZDCpB3tAj9wENr5Vz80
	DRvUfFMw+el8aWuzbTZkC5IIOBicFlI0V7mHCWQYLFyJ68sY4hFy7Xh9WSedVGBTvcU4PUPGKwI97
	utVK+g0p3UOOcDLYVm3+baIyqe/mBUWRnke+XY0tz58VjHoytX0evXknSDQHuuO1J+MY3ZKlNBWyX
	4IaBSOyHoF/AnCfhC9yFY3B4yFarHqec67E1nijI7K3aUhs7u0WJ4KYbUwkBda8JHH9u24ETQkIN9
	Yk6OFKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tee-00000006hop-09Xg;
	Thu, 09 Oct 2025 16:38:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tea-00000006hoS-2RIm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:38:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531701762;
	Thu,  9 Oct 2025 09:37:57 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BE7B3F66E;
	Thu,  9 Oct 2025 09:38:04 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:38:01 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.17-6.12] soc: sunxi: sram: add entry for a523
Message-ID: <20251009173801.13c133a4@donnerap.manchester.arm.com>
In-Reply-To: <20251009155752.773732-11-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
	<20251009155752.773732-11-sashal@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_093808_740194_CC8E5A96 
X-CRM114-Status: GOOD (  27.25  )
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

On Thu,  9 Oct 2025 11:54:37 -0400
Sasha Levin <sashal@kernel.org> wrote:

Hi,

> From: Chen-Yu Tsai <wens@csie.org>
>=20
> [ Upstream commit 30849ab484f7397c9902082c7567ca4cd4eb03d3 ]
>=20
> The A523 has two Ethernet controllers. So in the system controller
> address space, there are two registers for Ethernet clock delays,
> one for each controller.
>=20
> Add a new entry for the A523 system controller that allows access to
> the second register.
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Link: https://patch.msgid.link/20250908181059.1785605-4-wens@kernel.org
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>=20
> LLM Generated explanations, may be completely bogus:
>=20
> YES =E2=80=93 this should go to stable; without it the second GMAC on A523
> cannot program its clock-delay register.

It's pointless, any kernel before v6.15 will not boot on any A523 device,
so support for any kind of A523 MAC is irrelevant.
For newer kernels, this would be tied to the GMAC1 enablement, which is
also a new feature, so not a candidate for stable.

Cheers,
Andre

> - The A523 DT already instantiates the system-control syscon with an
>   A523-specific compatible and wires GMAC0 (with GMAC1 expected next) to
>   that syscon (`arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:423` and
>   `arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:543`). Because the
>   current driver falls back to the A64 variant,
>   `sunxi_sram_regmap_accessible_reg()` only exposes a single EMAC clock
>   register (`drivers/soc/sunxi/sunxi_sram.c:325`), so any attempt to use
>   the second EMAC clock register at 0x34 is blocked, which makes the
>   second Ethernet controller unusable on this SoC.
> - The patch adds a dedicated A523 variant with `.num_emac_clocks =3D 2`
>   and wires it into the OF match table
>   (`drivers/soc/sunxi/sunxi_sram.c:313` and
>   `drivers/soc/sunxi/sunxi_sram.c:438` after the change). This is the
>   minimal change required to expose the second register; no other SoCs
>   are affected and no behaviour changes for existing users.
> - Risk is very low: the change only enlarges the allowed register window
>   for the A523 system controller and mirrors the existing H616 handling.
>   Without it, backporting forthcoming GMAC1 enablement (or any
>   downstream board DT that already uses it) will continue to fail, so
>   carrying this fix in stable keeps A523 Ethernet support from
>   regressing.
>=20
> Next step if you pick it up: merge alongside the GMAC1 enablement so the
> second port works end-to-end.
>=20
>  drivers/soc/sunxi/sunxi_sram.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 2781a091a6a64..16144a0a0d371 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -310,6 +310,10 @@ static const struct sunxi_sramc_variant sun50i_h616_=
sramc_variant =3D {
>  	.has_ths_offset =3D true,
>  };
> =20
> +static const struct sunxi_sramc_variant sun55i_a523_sramc_variant =3D {
> +	.num_emac_clocks =3D 2,
> +};
> +
>  #define SUNXI_SRAM_THS_OFFSET_REG	0x0
>  #define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
>  #define SUNXI_SYS_LDO_CTRL_REG		0x150
> @@ -430,6 +434,10 @@ static const struct of_device_id sunxi_sram_dt_match=
[] =3D {
>  		.compatible =3D "allwinner,sun50i-h616-system-control",
>  		.data =3D &sun50i_h616_sramc_variant,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun55i-a523-system-control",
> +		.data =3D &sun55i_a523_sramc_variant,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);


