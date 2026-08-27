Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51F7C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USInVpt9Ng5yFt/QF3hDQ+uXdNq7DFvqcDl6JkdXsLw=; b=QEAst0J+8Bq8l8440htd+wSHKN
	m7h7F3QuLPOtQd1v7wYC+9Q6Td0LQAsqm9/PhIsPnZqgcvxk7TNIhLX9O707gPWCvMDxAmCEYcrX9
	pOsBn58llIWZvMJXDMib1DJbDZcYuXyqCjP5Ih9wUzSAH8asIii6Vh5Dm59h1hRCElb7HNNuF4MDy
	44InTlnPq166EBmb9G5wRMtTeKA90oVaUCpAJ+5b2TenPeeU7rm6evl+M8wFb6u5VtHdCop/1dhBr
	FFx5tSnk6gBd9t9CSIVGSqYcpNUgp/P04lHUzbvh9+Lziukuqp1xBGw9yTqHCwtFEdcT0CQKB1poM
	NiLbAEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wza6k-00000004345-1MoP;
	Thu, 27 Aug 2026 13:25:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wza6h-0000000433M-2X8V;
	Thu, 27 Aug 2026 13:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=USInVpt9Ng5yFt/QF3hDQ+uXdNq7DFvqcDl6JkdXsLw=; b=a8U/6YqBgfMZDVtk2DGVZgGIxx
	qz0ezVLpB1Hy064h27NZtGFanDcGy26KvecsRzawGY1iJDZ7n2q1e21ZsUX+AVltWshLDX+94/e0N
	N6h2i9HLz65jDCnpjHlGfQ4UewLZFh0jwRoMbdxhtsW2cvPmbj3S1KGjjwWKp/hshnZaGj9sBKhsX
	pz8EXeHnLr5QCR5BGGPnWpG4IJ+aErXNMzmue/6jW6Lga4vt3Mo7U2wTlJalhiGeQnM0tZeyyZnIa
	eELfBsc+JIk6Isp8PWL39OPXEHoCuwFjT+7r3bmWmdyPyN7TPNgxmdz+1j2Eg6OiCd9E6YkebP056
	G7OBIvSQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rudi Heitbaum <rudi@heitbaum.com>
Cc: linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rudi@heitbaum.com
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Date: Thu, 27 Aug 2026 15:25:23 +0200
Message-ID: <5096877.GXAFRqVoOG@phil>
In-Reply-To: <aouw7rH6FZxscUTO@0d3a7a881997>
References: <aouw7rH6FZxscUTO@0d3a7a881997>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_062527_645561_CC09A444 
X-CRM114-Status: GOOD (  19.22  )
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

Hi Rudi,

Am Montag, 24. August 2026, 04:52:02 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rudi Heitbaum:
> The rk1808 is the npu die in an rk3399pro package. It is wired to one
> of the usb3 controllers rather than to an external port, and it needs
> its reference clock running before it will boot, which is exactly what
> this driver exists to do for onboard devices.
>=20
> It takes no supply from the driver: the rails are sequenced elsewhere.
> Only the clock matters here, and that is already optional and handled
> generically.

the "elsewhere" might need a bit more explanation to verify it's the right
implementation. Even if the regulators are always-on or something, we
still want the supplies defined - for future uses.


Thanks
Heiko


> Two ids, because the die changes identity as it boots: 180a while it is
> in maskrom and then in the rockusb loader, 1808 once it is running.
>=20
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboar=
d_usb_dev.h
> index 3523f8f8a149..e07f509ac751 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -134,6 +134,12 @@ static const struct onboard_dev_pdata xmos_xvf3500_d=
ata =3D {
>  	.is_hub =3D false,
>  };
> =20
> +static const struct onboard_dev_pdata rockchip_rk1808_data =3D {
> +	.reset_us =3D 0,
> +	.num_supplies =3D 0,
> +	.is_hub =3D false,
> +};
> +
>  static const struct of_device_id onboard_dev_match[] =3D {
>  	{ .compatible =3D "usb-a-connector", .data =3D &usb_a_conn_data, },
>  	{ .compatible =3D "usb424,2412", .data =3D &microchip_usb424_data, },
> @@ -167,6 +173,8 @@ static const struct of_device_id onboard_dev_match[] =
=3D {
>  	{ .compatible =3D "usb2109,817", .data =3D &vialab_vl817_data, },
>  	{ .compatible =3D "usb2109,2817", .data =3D &vialab_vl817_data, },
>  	{ .compatible =3D "usb20b1,0013", .data =3D &xmos_xvf3500_data, },
> +	{ .compatible =3D "usb2207,1808", .data =3D &rockchip_rk1808_data, },
> +	{ .compatible =3D "usb2207,180a", .data =3D &rockchip_rk1808_data, },
>  	{ .compatible =3D "usb3431,6241", .data =3D &corechips_sl6341_data, },
>  	{ .compatible =3D "usb3431,6341", .data =3D &corechips_sl6341_data, },
>  	{ .compatible =3D "usb5986,1198", .data =3D &bison_intcamera_data, },
>=20





