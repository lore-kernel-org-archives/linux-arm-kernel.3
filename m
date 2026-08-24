Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3888FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m93WWasZDeL8P3xfxnXr9E+Q6j/e1mlv0XnZZsIFzXY=; b=J3Uz6/5XY/eGcfQ0fS64ow16re
	yo47K+PmpKmQ75PpyMZFXXcqiVx49ljDSlidf3jNrOL3QAxLTU5cIurPAKZSNAJpLjm/R9RfHFLzc
	rrSSwenOSykYiuaX2zci+vfHfpasHqBCc/BeWlqytO8jXAvMB77tjRRigs/9yGgFNP3euLGTsQ5+T
	/x9g6Q2k1d1y/OFqzOGOBXQDYQ7KG0J+cs/PsVuNOqOVYaogzaeFUi7J5o4wrl7g/poiskxUgyiyk
	9fl+KHE/tz649ZQRsofdMr8Wts3B7ptIDuhJ9cML6bZA47uZ7MmQvXHYTJlTxnna9IXoiawu7kJem
	3f7Ns36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWg2-0000000Gw55-2FAw;
	Mon, 24 Aug 2026 15:33:34 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWfz-0000000Gw4B-0MS5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:33:33 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 256EB2010D6;
	Mon, 24 Aug 2026 17:33:25 +0200 (CEST)
Message-ID: <699de61dc2bfebdf18cdb0e377d1ba63886b4e12.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] usb: gadget: udc: add Axiado AX3000 and AX3005
 UDC driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, Krutik Shah	
 <krutikshah@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Mon, 24 Aug 2026 17:33:25 +0200
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
	 <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_083331_279261_AE3E6BB7 
X-CRM114-Status: GOOD (  18.14  )
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

On Mo, 2026-08-17 at 22:57 -0700, Naveen Kumar Rajgiri Bassappa wrote:
> Add a driver for the USB device controller integrated into the Axiado
> AX3000 and AX3005 SoCs.
>=20
> The controller is based on the Corigine USB 3.1 device IP core and uses a=
n
> xHCI-like programming model with a command ring, an event ring, and
> per-endpoint transfer rings composed of Transfer Request Blocks (TRBs).
>=20
> The driver implements the USB gadget and endpoint operations, including
> endpoint enable and disable, request queue and dequeue, halt and wedge
> handling, and standard endpoint 0 control requests.
>=20
> It supports High-Speed and SuperSpeed operation, control, bulk,
> interrupt, and isochronous transfers, and scatter-gather requests.
>=20
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> ---
>  MAINTAINERS                      |    2 +
>  drivers/usb/gadget/udc/Kconfig   |   14 +
>  drivers/usb/gadget/udc/Makefile  |    1 +
>  drivers/usb/gadget/udc/crg_udc.c | 4491 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/usb/gadget/udc/crg_udc.h |  355 +++
>  5 files changed, 4863 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/gadget/udc/crg_udc.c b/drivers/usb/gadget/udc/cr=
g_udc.c
> new file mode 100644
> index 000000000000..bb3ed394d984
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg_udc.c
> @@ -0,0 +1,4491 @@
[...]
> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
> +{
> +	struct device *dev =3D crg_udc->dev;
> +	int ret;
> +
> +	crg_udc->clk =3D devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(crg_udc->clk))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
> +				     "failed to get clock\n");
> +
> +	ret =3D clk_prepare_enable(crg_udc->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk=
);
> +	if (ret)
> +		return ret;
> +
> +	crg_udc->rst =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(crg_udc->rst))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->rst),
> +				     "failed to get reset\n");
> +
> +	ret =3D reset_control_deassert(crg_udc->rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_reset_assert, crg_udc->rs=
t);
> +	if (ret)
> +		return ret;

This looks like it could be simplified with
devm_reset_control_get_optional_exclusive_deasserted()

regards
Philipp

