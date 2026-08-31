Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CF0C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9TcYMvTdqJ2Fw8gCueJbjGL0zNKJuvdL3+TH7MgPr4=; b=tkmkU0YcZo+tMUSolQCPl1sl89
	TGmsxank0P3INRmGS9RWmQQ/qSzygS+l/yOuqFM6awanq5jBiHE8SZpk9YZzD2zWnf+nPDGVxrZU7
	pSUShaN21KkcUXvSgO+jC3QrMiGrB8SEG2q0hMvoLoX5I0ob0cYcK9eEyJZAK5O42f3sclQb9UNgb
	0hzg+KFj+8CHAwXmQDUkv7OrTBa0hB5UEEB77xHh3H4dEsQVIOkDLwoXQSfW1AlcdBolCHpEzaHf9
	fMF2JuY+hI5XJVqrrJMholmL+4FoAVfjOaP47OsSLLmyIE4bxg/L4t6Xg8XXzhp1xBt0Gd72d5CKZ
	GbG9KM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xpi-00000008xeo-1Mna;
	Mon, 31 Aug 2026 08:57:38 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xpf-00000008xdl-0ouQ;
	Mon, 31 Aug 2026 08:57:37 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 80188201D27;
	Mon, 31 Aug 2026 10:57:31 +0200 (CEST)
Message-ID: <0c53abedc1b58a141556627d4d68065638d22376.camel@pengutronix.de>
Subject: Re: [PATCH v1 3/4] usb: cdns3: Add CIX Sky1 glue driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hongliang Yang <hongliang.yang@cixtech.com>, peter.chen@kernel.org, 
	pawell@cadence.com, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org, rogerq@kernel.org,
 neil.armstrong@linaro.org, 	fugang.duan@cixtech.com,
 cix-kernel-upstream@cixtech.com, 	linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org, Gary
 Yang <gary.yang@cixtech.com>
Date: Mon, 31 Aug 2026 10:57:31 +0200
In-Reply-To: <20260831082309.3854507-4-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
	 <20260831082309.3854507-4-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_015735_388178_98F90996 
X-CRM114-Status: GOOD (  14.35  )
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

On Mo, 2026-08-31 at 16:23 +0800, Hongliang Yang wrote:
> Add glue layer for the Cadence USBSSP DRD controller on CIX Sky1
> SoCs. The glue driver handles platform-specific initialization
> including clocks, resets, and PHY configuration.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> Reviewed-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  drivers/usb/cdns3/Kconfig      |  13 +
>  drivers/usb/cdns3/Makefile     |   1 +
>  drivers/usb/cdns3/cdnsp-sky1.c | 682 +++++++++++++++++++++++++++++++++
>  drivers/usb/cdns3/cdnsp-sky1.h | 127 ++++++
>  4 files changed, 823 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h
>=20
[...]
> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 000000000000..3dd20451569e
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> @@ -0,0 +1,682 @@
[...]
> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	struct cdnsp_sky1 *data;
> +	int ret =3D 0;
> +	struct cdns3_platform_data *cdns_sky1_pdata;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->axi_base =3D devm_platform_ioremap_resource_byname(pdev, "axi_pro=
perty");
> +	if (IS_ERR(data->axi_base)) {
> +		dev_err(dev, "can't map IOMEM resource\n");
> +		return PTR_ERR(data->axi_base);
> +	}
> +	data->ctst_base =3D devm_platform_ioremap_resource_byname(pdev, "contro=
ller_status");
> +	if (IS_ERR(data->ctst_base)) {
> +		dev_err(dev, "can't map IOMEM resource\n");
> +		return PTR_ERR(data->ctst_base);
> +	}
> +	data->reset =3D devm_reset_control_get(&pdev->dev, "usb_reset");

Please use devm_reset_control_get_exclusive() directly.

regards
Philipp

