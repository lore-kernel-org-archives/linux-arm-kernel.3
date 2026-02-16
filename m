Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE8DE83837
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8BYgHoDiUqLazySoLpLeVrihmYilevIB92jtHXcapg=; b=R0gsplGgJXmoaOrJVjTaocYvsW
	YWyEGN460JiBmWeWMjXUyM+S9pQ0TMIvmQe0JN4WhFzqkkl3kOe7PtaX3X4zGr4D8faWRB63P+Qm9
	w8uTNYeYUJHV80Lmyi1bBk+0TjGxfuScKeG9Ip5QFA48RWCvXXqf9D/S98b0PJVo2SlmCI/Uv02RC
	cT4SEkO79+agbdn6eyXKQMcJezqIrso/G8Cm1HvbLk32eSuye2GEHDWn1ocR1KdoaobDpNblsC9dQ
	hxNG3WvuFPydc2Fk28jUpZWI9SJ0ix9H6l6y4DZw02wggSAKVwz4U3NQRO7GBImk4YF8+MIb7VsID
	hP/74w+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6Ti-00000007JUo-2m45;
	Mon, 16 Feb 2026 21:50:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6Tf-00000007JU4-0Oyb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 21:50:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vs6TQ-00034A-LG; Mon, 16 Feb 2026 22:49:44 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vs6TO-0018BD-0n;
	Mon, 16 Feb 2026 22:49:43 +0100
Received: from pengutronix.de (p54b15bf8.dip0.t-ipconnect.de [84.177.91.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4494D4EA95C;
	Mon, 16 Feb 2026 21:49:43 +0000 (UTC)
Date: Mon, 16 Feb 2026 22:49:42 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] PCI: layerscape: Allow to compile as module
Message-ID: <20260216-mahogany-caterpillar-of-certainty-38b0bc-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="acibql3y7ovkmvyd"
Content-Disposition: inline
In-Reply-To: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_134959_140180_06DC7E00 
X-CRM114-Status: GOOD (  25.95  )
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


--acibql3y7ovkmvyd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] PCI: layerscape: Allow to compile as module
MIME-Version: 1.0

Hello,

Bjorn can you take this patch?

On 12.01.2026 20:17:11, Steffen Trumtrar wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
>
> The layerscape pcie host controller could also be compiled as module.
> Add the necessary infrastructure to allow building as module instead of
> only as builtin driver.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/pci/controller/dwc/Kconfig          |  2 +-
>  drivers/pci/controller/dwc/pci-layerscape.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/=
dwc/Kconfig
> index 519b59422b479..abfa4a6e62c25 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -121,7 +121,7 @@ config PCI_IMX6_EP
>  	  DesignWare core functions to implement the driver.
>
>  config PCI_LAYERSCAPE
> -	bool "Freescale Layerscape PCIe controller (host mode)"
> +	tristate "Freescale Layerscape PCIe controller (host mode)"
>  	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/co=
ntroller/dwc/pci-layerscape.c
> index a44b5c256d6e2..14d6ac4fc53fd 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -13,6 +13,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> +#include <linux/module.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
> @@ -403,8 +404,16 @@ static const struct dev_pm_ops ls_pcie_pm_ops =3D {
>  	NOIRQ_SYSTEM_SLEEP_PM_OPS(ls_pcie_suspend_noirq, ls_pcie_resume_noirq)
>  };
>
> +static void ls_pcie_remove(struct platform_device *pdev)
> +{
> +	struct ls_pcie *pcie =3D platform_get_drvdata(pdev);
> +
> +	dw_pcie_host_deinit(&pcie->pci->pp);
> +}
> +
>  static struct platform_driver ls_pcie_driver =3D {
>  	.probe =3D ls_pcie_probe,
> +	.remove =3D ls_pcie_remove,
>  	.driver =3D {
>  		.name =3D "layerscape-pcie",
>  		.of_match_table =3D ls_pcie_of_match,
> @@ -412,4 +421,9 @@ static struct platform_driver ls_pcie_driver =3D {
>  		.pm =3D &ls_pcie_pm_ops,
>  	},
>  };
> -builtin_platform_driver(ls_pcie_driver);
> +module_platform_driver(ls_pcie_driver);
> +
> +MODULE_AUTHOR("Minghuan Lian <Minghuan.Lian@freescale.com>");
> +MODULE_DESCRIPTION("Layerscape PCIe host controller driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, ls_pcie_of_match);
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260112-v6-19-topic-layerscape-pcie-9d10b6542139
>
> Best regards,
> --
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
>
>

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--acibql3y7ovkmvyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaZOQ9AAKCRDMOmT6rpmt
0tf7AQDXPoIYzicQeUoeqqXVPMOTQI08mSHXaelfkvE716R56wD/VkqipmoUM5T7
7U7qJt9nMZfyJSOd/p5RdeiJ92XG2AI=
=hliI
-----END PGP SIGNATURE-----

--acibql3y7ovkmvyd--

