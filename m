Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAE2C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ke4COQunqDR3lxUvY5aqlltkaiCg4JiggLABHSyx8V8=; b=PQzj9eAw9IKNw8hX1fA7/tDENS
	cpG7Rxln2PvfUrfGFw+Qe9gxBOI9XVXo1duufBTF+ptx1aeMQiAPtNOznKjRinr8WvNhyTAP7JVyq
	81eJfw69Fde0cJbbImE7qTGLxA50SO4dPw5jyD/j+aRjGyvNbSkdRFeGBZnIERSxoj6bZYVGHVU+8
	SWtcHf0Gzgi7poovGdN95KXDDJMf47+zAbX0GAhUWbZddzFalF2rRgKO+hmhzmWmipmcnc6v7RGeE
	rW9UUnCFS+cv3Do0iHYRAzdZ0x6NSBce51myArU2ZdXBgWIhv608NK9a8khp2drQq2xfwtFdDLPBB
	2tXwofxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mUQ-00000009akM-0hkj;
	Thu, 10 Apr 2025 07:38:22 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lun-00000009SUC-0BUC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:01:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF99C102E6212;
	Thu, 10 Apr 2025 09:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744268489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ke4COQunqDR3lxUvY5aqlltkaiCg4JiggLABHSyx8V8=;
	b=TTf7i5o3D9L8Fas3kA9NFBG5bcQVMIfm+cwjppivUDOdsDYXFwipiJCcmihiM6qQTJZAdG
	zaNgrLyYHuYfoTJuaoTd6jIOqycU4JiBPEm42oyx3Ew0/4lVlHHem8vbjskenSQZH/no3L
	EN0A6J8N3n9CQ4uGtz9NEwzmc07hhHdQV6vFd/dtbsaSYpjooi2rvr4mFJ/ws+tH+9vXzu
	wjZTFpfXub4MEA3TcyKen+arfsHEfQZ/cqfVLkZFYCoupsy1RQmOhtZtsV4g80yAOcfBAw
	/qWGKoPDH9TKe9BxdJ3vbwbuqMDECubOO3PDSSOn1W2VCmJXhwWxgspuTb9aDQ==
Date: Thu, 10 Apr 2025 09:01:22 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next v4 5/5] ARM: mxs_defconfig: Enable
 CONFIG_FEC_MTIP_L2SW to support MTIP L2 switch
Message-ID: <20250410090122.0e4cadef@wsk>
In-Reply-To: <c67ad9fa-6255-48e8-9537-2fceb0510127@gmx.net>
References: <20250407145157.3626463-1-lukma@denx.de>
	<20250407145157.3626463-6-lukma@denx.de>
	<c67ad9fa-6255-48e8-9537-2fceb0510127@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/64h1Hw0ZQWwTItAXL0wqZ.X";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000133_380116_3D3645E0 
X-CRM114-Status: GOOD (  28.30  )
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

--Sig_/64h1Hw0ZQWwTItAXL0wqZ.X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Hi Lukasz,
>=20
> Am 07.04.25 um 16:51 schrieb Lukasz Majewski:
> > This patch enables support for More Than IP switch available on some
> > imx28[7] devices.
> >
> > Signed-off-by: Lukasz Majewski <lukma@denx.de> =20
> thanks adding the driver to mxs_defconfig. Unfortunately it's not
> possible for reviewers to identify the relevant changes,

Could you be more specific here?
As fair as I see - there is only 14 LOCs changed for review.

Please also be aware that MTIP L2 switch driver has some dependencies -
on e.g. SWITCHDEV and BRIDGE, which had to be enabled to allow the
former one to be active.

> also the
> commit messages doesn't provide further information.
>=20

What kind of extra information shall I provide? IMHO the patch is
self-explaining.

> In general there are two approaches to solves this:
> 1) prepend an additional patch which synchronizes mxs_defconfig with
> current mainline
> 2) manually create the relevant changes against mxs_defconfig
>=20
> The decision about the approaches is up to the maintainer.

I took the linux-next's (or net-next) mxs defconfig (cp it to be
.config)

Then run CROSS_COMPILE=3D ... make ARCH=3Darm menuconfig
Enabled all the relevant Kconfig options and run

CROSS_COMPILE=3D ... make ARCH=3Darm savedefconfig
and copy defconfig to mxs_defconfig.
Then I used git to prepare the patch.

Isn't the above procedure correct?


>=20
> Btw driver review will follow ...
>=20
> Regards
> > ---
> > Changes for v4:
> > - New patch
> > ---
> >   arch/arm/configs/mxs_defconfig | 14 +++-----------
> >   1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm/configs/mxs_defconfig
> > b/arch/arm/configs/mxs_defconfig index d8a6e43c401e..4dc4306c035f
> > 100644 --- a/arch/arm/configs/mxs_defconfig
> > +++ b/arch/arm/configs/mxs_defconfig
> > @@ -32,11 +32,10 @@ CONFIG_INET=3Dy
> >   CONFIG_IP_PNP=3Dy
> >   CONFIG_IP_PNP_DHCP=3Dy
> >   CONFIG_SYN_COOKIES=3Dy
> > -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> > -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> > -# CONFIG_INET_XFRM_MODE_BEET is not set
> >   # CONFIG_INET_DIAG is not set
> >   # CONFIG_IPV6 is not set
> > +CONFIG_BRIDGE=3Dy
> > +CONFIG_NET_SWITCHDEV=3Dy
> >   CONFIG_CAN=3Dm
> >   # CONFIG_WIRELESS is not set
> >   CONFIG_DEVTMPFS=3Dy
> > @@ -45,7 +44,6 @@ CONFIG_MTD=3Dy
> >   CONFIG_MTD_CMDLINE_PARTS=3Dy
> >   CONFIG_MTD_BLOCK=3Dy
> >   CONFIG_MTD_DATAFLASH=3Dy
> > -CONFIG_MTD_M25P80=3Dy
> >   CONFIG_MTD_SST25L=3Dy
> >   CONFIG_MTD_RAW_NAND=3Dy
> >   CONFIG_MTD_NAND_GPMI_NAND=3Dy
> > @@ -56,11 +54,11 @@ CONFIG_EEPROM_AT24=3Dy
> >   CONFIG_SCSI=3Dy
> >   CONFIG_BLK_DEV_SD=3Dy
> >   CONFIG_NETDEVICES=3Dy
> > +CONFIG_FEC_MTIP_L2SW=3Dy
> >   CONFIG_ENC28J60=3Dy
> >   CONFIG_ICPLUS_PHY=3Dy
> >   CONFIG_MICREL_PHY=3Dy
> >   CONFIG_REALTEK_PHY=3Dy
> > -CONFIG_SMSC_PHY=3Dy
> >   CONFIG_CAN_FLEXCAN=3Dm
> >   CONFIG_USB_USBNET=3Dy
> >   CONFIG_USB_NET_SMSC95XX=3Dy
> > @@ -77,13 +75,11 @@ CONFIG_SERIAL_AMBA_PL011=3Dy
> >   CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
> >   CONFIG_SERIAL_MXS_AUART=3Dy
> >   # CONFIG_HW_RANDOM is not set
> > -# CONFIG_I2C_COMPAT is not set
> >   CONFIG_I2C_CHARDEV=3Dy
> >   CONFIG_I2C_MXS=3Dy
> >   CONFIG_SPI=3Dy
> >   CONFIG_SPI_GPIO=3Dm
> >   CONFIG_SPI_MXS=3Dy
> > -CONFIG_GPIO_SYSFS=3Dy
> >   # CONFIG_HWMON is not set
> >   CONFIG_WATCHDOG=3Dy
> >   CONFIG_STMP3XXX_RTC_WATCHDOG=3Dy
> > @@ -138,10 +134,6 @@ CONFIG_PWM_MXS=3Dy
> >   CONFIG_NVMEM_MXS_OCOTP=3Dy
> >   CONFIG_EXT4_FS=3Dy
> >   # CONFIG_DNOTIFY is not set
> > -CONFIG_NETFS_SUPPORT=3Dm
> > -CONFIG_FSCACHE=3Dy
> > -CONFIG_FSCACHE_STATS=3Dy
> > -CONFIG_CACHEFILES=3Dm
> >   CONFIG_VFAT_FS=3Dy
> >   CONFIG_TMPFS=3Dy
> >   CONFIG_TMPFS_POSIX_ACL=3Dy =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/64h1Hw0ZQWwTItAXL0wqZ.X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmf3bMIACgkQAR8vZIA0
zr1Djgf+NAPPtq9pLf3qrKtXaDfV+UOsNC/46Iy4s1emMVq/Wo4voyPw1z0vAl8D
WaMFD9hff7d/fmvPVCpAARDaixQEbBh140fR31b8heDyNQ8oSYa/u3edJ6pCUUFF
mrLrpx0kgcIBAYNeB8nCfdmjd4sipiljHklYe9oKdfxkaFO2/1892nPmbbgwM6bU
T9I0nhQH3GVdLkxbWnwI9zUdzZOkEN2TcW4ZoGrnonF4ZWW//ZV0nmPpNNPN60Nm
/2gKJb6NIuXEKZ84YX4wZS4qJYRaarnaYuXifx4tgfjcu4V+4nbWP8NWJWe/Y2hm
jrXBNj+DcLFIvTAZSuSuCc1EGNRZ2g==
=PBZj
-----END PGP SIGNATURE-----

--Sig_/64h1Hw0ZQWwTItAXL0wqZ.X--

