Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0662CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+Inrmqw00myrXAABuHCDzCK8frcOclwP7NRuFhp1tM=; b=dCQNacfyrXjoMjEL5wBW2afuCo
	3TywFUvmG4SFP+f+8Z9Mb8pMozDgPiOkweW1WjWS3XSCVhereA8xir2pdy7VKJblCzl93eqQkQ7Uo
	8P/cBy/dzeEQLnLg6w23Vei3UCeesjo+kqUQWblsvyCptkpV3sZeS+GiigxiQpOXCT4JBEhxAKTes
	lXlh7Mou5jNEjb7NSRCNWvwsXzuGtWicESoLhHfwVnALOLhApySGNpqfsfP6nXCyao+wh2lTerLys
	Wlz8yiaoVgh26cymYslLCmWhftvi/kF9L1fk7QvdKiaos0EBOe9YL8azw0IJeoxCxDVtHUfSZlUA4
	9+SqlHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LU0-00000004TcK-1CIl;
	Thu, 16 Oct 2025 10:45:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LTx-00000004Tbd-0now
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 10:45:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9LTW-0003LT-FW; Thu, 16 Oct 2025 12:44:50 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9LTV-003sP0-11;
	Thu, 16 Oct 2025 12:44:49 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9LTV-000000006MN-0w7x;
	Thu, 16 Oct 2025 12:44:49 +0200
Message-ID: <47112ace39ea096242e68659d67a401e931abf3a.camel@pengutronix.de>
Subject: Re: [PATCH usb-next v2 5/5] usb: dwc3: Add Apple Silicon DWC3 glue
 layer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa	
 <neal@gompa.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 16 Oct 2025 12:44:49 +0200
In-Reply-To: <20251015-b4-aplpe-dwc3-v2-5-cbd65a2d511a@kernel.org>
References: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
	 <20251015-b4-aplpe-dwc3-v2-5-cbd65a2d511a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_034517_226898_F1D1B626 
X-CRM114-Status: GOOD (  21.88  )
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

On Mi, 2025-10-15 at 15:40 +0000, Sven Peter wrote:
> The dwc3 controller present on Apple Silicon SoCs like the M1 requires
> a specific order of operations synchronized between its PHY and its
> Type-C controller. Specifically, the PHY first has to go through initial
> bringup (which requires knowledge of the lane mode and orientation)
> before dwc3 itself can be brought up and can then finalize the PHY
> configuration.
> Additionally, dwc3 has to be teared down and re-initialized whenever
> the cable is changed due to hardware quirks that prevent a new device
> from being recognized and due to the PHY being unable to switch lane
> mode or orientation while dwc3 is up and running.
>=20
> These controllers also have a Apple-specific MMIO region after the
> common dwc3 region where some controls have to be updated. PHY bringup
> and shutdown also requires SUSPHY to be enabled for the ports to work
> correctly.
>=20
> In the future, this driver will also gain support for USB3-via-USB4
> tunneling which will require additional tweaks.
>=20
> Add a glue driver that takes of all of these constraints.
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/usb/dwc3/Kconfig      |  11 +
>  drivers/usb/dwc3/Makefile     |   1 +
>  drivers/usb/dwc3/dwc3-apple.c | 489 ++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 502 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.=
c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6e41bd0e34f461b0c3db9b8a6=
46116458ff816b6
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -0,0 +1,489 @@
[...]
> +static int dwc3_apple_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct dwc3_apple *appledwc;
> +	int ret;
> +
> +	appledwc =3D devm_kzalloc(&pdev->dev, sizeof(*appledwc), GFP_KERNEL);
> +	if (!appledwc)
> +		return -ENOMEM;
> +
> +	appledwc->dev =3D &pdev->dev;
> +	mutex_init(&appledwc->lock);
> +
> +	appledwc->resets =3D devm_reset_control_array_get_exclusive(dev);

Why is this using an array? The bindings say there is only a single
reset.

regards
Philipp

