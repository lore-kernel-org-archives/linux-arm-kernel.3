Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D03C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0xom2YM8lyIFaJb7oErSmb3c+ED4OylfqTb0GgwBno=; b=KQIg+Aot6bB/f2gDGm+crpfXFH
	JnPA3HZYXo4IuqUz2cYz/2ICkWgcldXtqc7OVfCw0tVUdseVu5cksFWOAgy+9qpmXgbZf5imnO6lO
	MnLHKzXQzoegmXITd+pD8L2sA8thLZEFxFu/nnVXH2fMVy1vwGRZC7x+lvtOXhEJTvhkwA2V2XZbe
	KynFZUDo1Nc/7WSWA/17SyE3G+ffWZeSwvXkXaDIgNb+jOxFudfjZV3PDdl5YJewBq6S4YsOgIaOq
	YAzsnAR0mi8NkPN8wxyxKKMAWQoUMRR8Yw1287Qy6Z4OoukEtmpCXxBRz7/ldgDfP4rvMDXyhfb/a
	CtyIrLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jme-0000000C80P-2gal;
	Thu, 17 Apr 2025 07:35:40 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jkn-0000000C7XV-14Pr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 07:33:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B7671039EF2C;
	Thu, 17 Apr 2025 09:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744875222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=u0xom2YM8lyIFaJb7oErSmb3c+ED4OylfqTb0GgwBno=;
	b=CvG1tcL+b+zgb41GwvC6m4xQO6vjuPOzgoQvrY3Bfr/iRSLdc0WvXYEYX/csfLcpbI0Grp
	vReiazhemuD55KwSeOpMUWTcwxQ4R/DRW5P9KfLigaANWxhDDauvPPAfbeYHgoqf9cjiIb
	ZlKzSvJmhXXY2iHGQSFe8sufvWb5gOimRy3Va0qL0UvxGaSDP6BdBSh8PW9REt4d6KaqWn
	2tvTZxQK8P6aM67FQVbQUkppSmvfBEXTaF2ScUJwOcKdf+po/vTAT5O18Ih1hA3egO1/h6
	jW/72nVBQgjd9dped8D3rBLs9j3SwJmTkUuBT8yqCFfijlbtG+8oElzHaKOq4w==
Date: Thu, 17 Apr 2025 09:33:38 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Simon Horman
 <horms@kernel.org>
Subject: Re: [net-next v5 5/6] ARM: mxs_defconfig: Update mxs_defconfig to
 6.15-rc1
Message-ID: <20250417093338.0990e37f@wsk>
In-Reply-To: <41ea023e-d19d-40f1-b268-37292c9e15de@gmx.net>
References: <20250414140128.390400-1-lukma@denx.de>
	<20250414140128.390400-6-lukma@denx.de>
	<41ea023e-d19d-40f1-b268-37292c9e15de@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a2Zuo_5mcQkE7xKuvovt9yS";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_003345_580233_D567994A 
X-CRM114-Status: GOOD (  29.27  )
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

--Sig_/a2Zuo_5mcQkE7xKuvovt9yS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Hi Lukasz,
>=20
> Am 14.04.25 um 16:01 schrieb Lukasz Majewski:
> > This file is the updated version of mxs_defconfig for the v6.15-rc1
> > linux-next. =20
> thanks for sending this as a separate patch. Unfortunately it's not
> that simple by replacing the existing mxs_defconfig. We need to
> double-check all changes to settings, which was enabled before. This
> should also include a short note for every setting in the commit log,
> otherwise every reviewer has to do this job. I'll help you here by
> adding comments ...
> >
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >
> > Changes for v5:
> > - New patch
> > ---
> >   arch/arm/configs/mxs_defconfig | 11 -----------
> >   1 file changed, 11 deletions(-)
> >
> > diff --git a/arch/arm/configs/mxs_defconfig
> > b/arch/arm/configs/mxs_defconfig index c76d66135abb..91723fdd3c04
> > 100644 --- a/arch/arm/configs/mxs_defconfig
> > +++ b/arch/arm/configs/mxs_defconfig
> > @@ -32,9 +32,6 @@ CONFIG_INET=3Dy
> >   CONFIG_IP_PNP=3Dy
> >   CONFIG_IP_PNP_DHCP=3Dy
> >   CONFIG_SYN_COOKIES=3Dy
> > -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> > -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> > -# CONFIG_INET_XFRM_MODE_BEET is not set
> >   # CONFIG_INET_DIAG is not set
> >   # CONFIG_IPV6 is not set
> >   CONFIG_CAN=3Dm
> > @@ -45,7 +42,6 @@ CONFIG_MTD=3Dy
> >   CONFIG_MTD_CMDLINE_PARTS=3Dy
> >   CONFIG_MTD_BLOCK=3Dy
> >   CONFIG_MTD_DATAFLASH=3Dy
> > -CONFIG_MTD_M25P80=3Dy =20
> This is safe because it has been replaced MTD_SPI_NOR, which is still=20
> enabled.
> >   CONFIG_MTD_SST25L=3Dy
> >   CONFIG_MTD_RAW_NAND=3Dy
> >   CONFIG_MTD_NAND_GPMI_NAND=3Dy
> > @@ -60,7 +56,6 @@ CONFIG_ENC28J60=3Dy
> >   CONFIG_ICPLUS_PHY=3Dy
> >   CONFIG_MICREL_PHY=3Dy
> >   CONFIG_REALTEK_PHY=3Dy
> > -CONFIG_SMSC_PHY=3Dy =20
> This is okay, because it's enabled implicit by USB_NET_SMSC95XX.
> >   CONFIG_CAN_FLEXCAN=3Dm
> >   CONFIG_USB_USBNET=3Dy
> >   CONFIG_USB_NET_SMSC95XX=3Dy
> > @@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=3Dy
> >   CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
> >   CONFIG_SERIAL_MXS_AUART=3Dy
> >   # CONFIG_HW_RANDOM is not set
> > -# CONFIG_I2C_COMPAT is not set
> >   CONFIG_I2C_CHARDEV=3Dy
> >   CONFIG_I2C_MXS=3Dy
> >   CONFIG_SPI=3Dy
> >   CONFIG_SPI_GPIO=3Dm
> >   CONFIG_SPI_MXS=3Dy
> > -CONFIG_GPIO_SYSFS=3Dy =20
> This also okay, because it has been deprecated by moving to EXPERT
> and its replacement GPIO_CDEV is enabled by default.
> >   # CONFIG_HWMON is not set
> >   CONFIG_WATCHDOG=3Dy
> >   CONFIG_STMP3XXX_RTC_WATCHDOG=3Dy
> > @@ -138,10 +131,6 @@ CONFIG_PWM_MXS=3Dy
> >   CONFIG_NVMEM_MXS_OCOTP=3Dy
> >   CONFIG_EXT4_FS=3Dy
> >   # CONFIG_DNOTIFY is not set
> > -CONFIG_NETFS_SUPPORT=3Dm
> > -CONFIG_FSCACHE=3Dy
> > -CONFIG_FSCACHE_STATS=3Dy
> > -CONFIG_CACHEFILES=3Dm =20
> This is unintended, even it's not your fault Lukasz. NETFS_SUPPORT
> isn't user select-able anymore, so it's dropped. AFAIU this comes
> from NFS support, so i think we need to enable CONFIG_NFS_FSCACHE
> here. Otherwise this caching feature get lost. Since this is a
> bugfix, this should be separate patch before the syncronization.
>=20
> @Shawn @Fabio what's your opinion?
> >   CONFIG_VFAT_FS=3Dy
> >   CONFIG_TMPFS=3Dy
> >   CONFIG_TMPFS_POSIX_ACL=3Dy =20
>=20

Stefan, I will add your comments in next version of this patch.
Moreover, I'm going to introduce new patch with the NFS_FSCACHE enabled.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/a2Zuo_5mcQkE7xKuvovt9yS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgArtIACgkQAR8vZIA0
zr0QsggA43pyZpG7jnH/6DRTCiYI+DqNL055w+1AQPvbmQvmW7/iJpPEJtFbRDJr
dz30fj3dMp27htfUPT4jhtvhJRZ27lCO2aHDb7xzLQGzFpGe0/4UYuNyZ5oo9c8t
HXVF/JWZhdQEiRIUomXaPcZaC9ZKHc71XSP/euaoM601NTRSp2emaLrukGklnWFB
bd42VvXnntJ+7+8UBqfEv9PWibWtYJOIrEKN5wnQ4wG24TPZ5aJRk+fW/HitKVxy
ZegQ6H3kTZa1CtLq9iXa9/9DC2CZvHZm0AVy3Yu4ARH6EpXK+/EKuFqIAevPBSra
fsnhejZQdfkbg/ae/X11ConafcHPpg==
=Ztk9
-----END PGP SIGNATURE-----

--Sig_/a2Zuo_5mcQkE7xKuvovt9yS--

