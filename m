Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F84E9A75E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6uvvEM8Q8RkAK0BRhim+FMr5vS+WhCd8Ae7ZnBCYfM=; b=jB08qpgGFTwJWK2meJfYgq+AjH
	Vtz0B0hRGsfep3Y0EsiNDKdZ91YcS82yyT7Wkc3Akf1u+z5eSShIT9O4D/WIWZSYNU1mE/jbr6yh/
	zgxYN0Zycl4I79mFxYCm++JPNrUHDUjO2yPBEQpV9G35Vk9bwHRPI/9nk34p5SZb0Ds4sC9OHI0IZ
	I/1IRWQrvJUfHCPJ9brfcHsOsuhmvDJ8+xubYd5gTSzI/kKyhzNMFRt9hiKIjbhwtymQEUf7olLby
	8b3YrVmH6MuLai4+oileAOgkbgzMN12mSZ7Ueqfb9eS+VUPNko/zxbGM69Xaj2EwCpbTElyoS4oQY
	XR4TGAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yvy-00000001D6i-1QFv;
	Tue, 24 Mar 2026 10:24:26 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yvv-00000001D6K-29dq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=S6uvvEM8Q8RkAK0BRhim+FMr5vS+WhCd8Ae7ZnBCYfM=; b=FrI/5Qh26/Bf0qI2wuHwMH5x1o
	l0ZcurgJMqFwdycKwHnU7AfnwWV6bVn3ESzW6v4BLnICtYS3M4Calj9U0lio62uJO4+cnP2WDDcbK
	TqKYfj+nvFnnAK/LEcwUc1Rt6F7wzJxC4hZICVGRevdq/UXEML4WVK1VKDGvM5vPslKqNpBMuQ+vk
	vJ9ZFIH4wqs3M480+9AEIz50WkRgbPM9d4o64BM2HZv3yg+Ks2fTLoKJaSC9uHldnkVrAVR1h7QHy
	iXF8bweU2MiIjMdXFLSaXLP+Ir6MrWioUiHnx+lu5xoYvqZuYAOre828JcY9CgbYZ1NlVIeHZ4cbX
	c6T9UXxQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4yvj-000E43-2Z;
	Tue, 24 Mar 2026 11:24:11 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4yvj-0006q3-0d;
	Tue, 24 Mar 2026 11:24:10 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Date: Tue, 24 Mar 2026 11:24:09 +0100
Message-ID: <6593091.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_032423_691015_F117C29A 
X-CRM114-Status: GOOD (  21.16  )
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

Hi,

Am Montag, 23. Februar 2026, 14:37:21 CET schrieb Bartosz Golaszewski:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

today I noticed the following warning running next-20260323:
> caam 30900000.crypto: No clock data provided for i.MX SoC

This happens when there is no matching against the soc_id.

Checking the source it turns out this patch is the cause that the SoC info
does not provide soc_id anymore.
next-20260323:
> $ grep . /sys/devices/soc0/*
> /sys/devices/soc0/family:Freescale i.MX
> /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> grep: /sys/devices/soc0/power: Is a directory
> /sys/devices/soc0/revision:unknown
> /sys/devices/soc0/serial_number:0000000000000000
> grep: /sys/devices/soc0/subsystem: Is a directory

reverting this patch (2524b293a59e586afd06358d0b191ab57208a920):
> $ grep . /sys/devices/soc0/*
> /sys/devices/soc0/family:Freescale i.MX
> /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> grep: /sys/devices/soc0/power: Is a directory
> /sys/devices/soc0/revision:1.1
> /sys/devices/soc0/serial_number:469677A693A4B8CE131D180033E44903
> /sys/devices/soc0/soc_id:i.MX8MP
> grep: /sys/devices/soc0/subsystem: Is a directory

soc_id is restored. Now that I write these lines I noticed that
serial_number also contained empty value which is restored with the revert.

Best regards,
Alexander

> ---
>  drivers/soc/imx/soc-imx8m.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 8e2322999f0996d2723768469c6893b0ea22eb9d..77763a107edbd11302017e3f6=
1ecb4369fda1ab0 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -226,7 +226,6 @@ static int imx8m_soc_probe(struct platform_device *pd=
ev)
>  	const struct imx8_soc_data *data;
>  	struct imx8_soc_drvdata *drvdata;
>  	struct device *dev =3D &pdev->dev;
> -	const struct of_device_id *id;
>  	struct soc_device *soc_dev;
>  	u32 soc_rev =3D 0;
>  	u64 soc_uid[2] =3D {0, 0};
> @@ -244,15 +243,11 @@ static int imx8m_soc_probe(struct platform_device *=
pdev)
> =20
>  	soc_dev_attr->family =3D "Freescale i.MX";
> =20
> -	ret =3D of_property_read_string(of_root, "model", &soc_dev_attr->machin=
e);
> +	ret =3D soc_attr_read_machine(soc_dev_attr);
>  	if (ret)
>  		return ret;
> =20
> -	id =3D of_match_node(imx8_soc_match, of_root);
> -	if (!id)
> -		return -ENODEV;
> -
> -	data =3D id->data;
> +	data =3D device_get_match_data(dev);
>  	if (data) {
>  		soc_dev_attr->soc_id =3D data->name;
>  		ret =3D imx8m_soc_prepare(pdev, data->ocotp_compatible);
> @@ -326,7 +321,7 @@ static int __init imx8_soc_init(void)
>  	int ret;
> =20
>  	/* No match means this is non-i.MX8M hardware, do nothing. */
> -	if (!of_match_node(imx8_soc_match, of_root))
> +	if (!of_machine_device_match(imx8_soc_match))
>  		return 0;
> =20
>  	ret =3D platform_driver_register(&imx8m_soc_driver);
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



