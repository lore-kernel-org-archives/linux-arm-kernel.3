Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BF6F30923
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3QH1RuqqeGKgkqYKwc4vfVSFtJyu2Xx1dJOpnpW0gE=; b=t2+TiQQbckj0ehCX/p/t7b+7ya
	QouZ0YoEWu+55PUNq4LIOU/WSLdfS5L486WjY89T1LbGpzcjryuoRoPwZcip5nphsHGqvaWqWzyB/
	Qj41iV7kQym8ljC71/bIkb9i4ZdsqkcoP2TRjO3Q8TMNPn2hSkxxNwFfI3eUCH/CN4AKjpQHbl8cU
	osdFox4W5RZjLh48+l1Ka52RGc9zJ9+lgx1A7f+z7SRz8IgSbZIh5N4cB+CW70981vnQZpH/A034b
	4qMvVb5Gp5CHdG+8uuSke3bIk2LdHFPz70rK1zyewWokMNLod/BDxM+jwAJanmiMLr61IYDaU9Tab
	h7TeeggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy51K-00000001Nz3-2eBZ;
	Thu, 05 Mar 2026 09:29:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy51J-00000001NyP-1rFR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B389D61339;
	Thu,  5 Mar 2026 09:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7BCC116C6;
	Thu,  5 Mar 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772702964;
	bh=JT5toTgjzbgzKeoODHGgwKMDOSRkF8JApEv+ETaVYco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F43PK5AHHkCYeROZH0GYnlXo7VV109Y6s7h7ZSBUj4dft4uoo4Xuy4WIObA6q1SIv
	 HTZrdshzMY3/e4QnbVLBHo6+04Mv1XRSde6qTaharM5PN7eXmlh1Np5Py/S1T+kI6H
	 7l5nBud6kiIIKCk0hs+fPkkxa/h03azEm0JBabs1D2Br0WH6vDIT9cRQ1FROdo5oqE
	 HrT414pDICpuLWUvtzhj6u1pS01UAmnlqrfmCwxMVUVVfsHpkcnqWWg8tZ+m9XoiWM
	 kMTA5/ReE8TZ2avtrTkleUMJ83hV52H2aGXbCbDFpKK/qzvZZE1dbPybwJki+sWxJE
	 b08eSfzdMswXA==
Date: Thu, 5 Mar 2026 10:29:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pwm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: imx-tpm: keep channel state instead of counting
Message-ID: <aalMdTmQd075dcF1@monoceros>
References: <20260202104738.837016-1-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l3hiqyu24f3uothm"
Content-Disposition: inline
In-Reply-To: <20260202104738.837016-1-viorel.suman@oss.nxp.com>
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


--l3hiqyu24f3uothm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: imx-tpm: keep channel state instead of counting
MIME-Version: 1.0

Hello,

On Mon, Feb 02, 2026 at 12:47:38PM +0200, Viorel Suman (OSS) wrote:
> On a soft reset TPM PWM IP may preserve its internal state from
> previous runtime, therefore on a subsequent OS boot and driver
> probe "enable_count" value and TPM PWM IP internal channels
> "enabled" states may get unaligned. In consequence on a suspend/resume
> cycle the call "if (--tpm->enable_count =3D=3D 0)" may lead to
> "enable_count" overflow the system being blocked from entering
> suspend due to:
>=20
>    if (tpm->enable_count > 0)
>        return -EBUSY;
>=20
> Fix the problem by replacing counting logic with per-channel state
> handling and by aligning IP and driver state at probe.
>=20
> Signed-off-by: Viorel Suman (OSS) <viorel.suman@oss.nxp.com>

I wonder if the following change would be enough:

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 5b399de16d60..36f873133f94 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -352,7 +352,7 @@ static int pwm_imx_tpm_probe(struct platform_device *pd=
ev)
 	struct clk *clk;
 	void __iomem *base;
 	int ret;
-	unsigned int npwm;
+	unsigned int i, npwm;
 	u32 val;
=20
 	base =3D devm_platform_ioremap_resource(pdev, 0);
@@ -382,6 +382,12 @@ static int pwm_imx_tpm_probe(struct platform_device *p=
dev)
=20
 	mutex_init(&tpm->lock);
=20
+	for (i =3D 0; i < npwm; ++i) {
+		val =3D readl(base + PWM_IMX_TPM_CnSC(i));
+		if (FIELD_GET(PWM_IMX_TPM_CnSC_ELS, val))
+			++tpm->enable_count;
+	}
+
 	ret =3D devm_pwmchip_add(&pdev->dev, chip);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed to add PWM chip\n");

Best regards
Uwe

--l3hiqyu24f3uothm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmpTO8ACgkQj4D7WH0S
/k7Hrgf/Q+CV5g1n5H2m0Eoa2ED9scvifb8NzAU6vXnl5oRGdYwGSwBPx0kH5aoy
S9Jovt20o7JRkpzJ+8sSZ/QYsshiEDqrELV/kPkpvYHvGhUsbQ/38Vf7xs0ggh70
0kXlGmvOZw6iwmUILjMQD4/MoNgibQkL2HyittLb6IbuH2/meVm7lqipQ1YvRjTe
oeAMdnytVyjW8J0yl7rkHFtUsNSS57NxsiFo1cDWJfcBE1LXyGMlxkHL1s0YwCE4
kF4I0KKeK44djYQ6JG1rvFkVJPMZ39i3pYX42FSS7zGr9G/dRkj452+C3JaZWt7m
c+nOUaZ7FDkwn3kBIuLvwfmxRr1UaQ==
=d5zG
-----END PGP SIGNATURE-----

--l3hiqyu24f3uothm--

