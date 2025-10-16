Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEADCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCKDaP2E6LQYfJGhm56QksLR9UcrDqfdm1Zm/gfgJFU=; b=ORJGJY2m+ZTXbbo0V2yj+Zb89p
	xth/OClQ8zz1YcVo7n7DQ8WBSLt88sKEZUxSmn5XeJcZIf2f4oWsD9zQdzUtG2dfsUGGh9ZMGY5Zd
	EsKnW2sim4K6/2g4nrpmxRcviQ358pHZPFaQ1LqoeeKfcxHJo1eq6Hck2Zz3DjogKEQcO88UEVRQ9
	CskVDdqSQ6xsJDfMDZfeTM1R5EtBk1UmlfW3uMTCWuYzWLfvkigs0+G4AwiOK6A2A1r2wTwLFrrbz
	n7KBm7yJIblZyrLX8SIM0YkQCiZjPuDGSOS9UgIr7af3OPHosR6RDbJlA8CkEhN+Af9fdUYVboZlX
	TNam3RyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WH4-0000000631a-2sKR;
	Thu, 16 Oct 2025 22:16:42 +0000
Received: from tarta.nabijaczleweli.xyz ([139.28.40.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WH1-0000000630u-2CYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 22:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202505; t=1760652315;
	bh=6xXkQoRP59P9/QSzLhB8Pi+zN/sRFE2OjwpBeL58xAY=;
	h=Date:From:To:Subject:From;
	b=cblxN/lNw7e20nEkHStssOGRuv0pjjiVxNdGrdim49QbiP4xtKLec7yDI77Oyg9rB
	 XvKshoRhxBkzEQv04E2bTPgJV1SoU+RU3oC+crV0xrH60RlYBaS3+lLLxp0DvJNr1d
	 4WDFK3iz3ASGagI7GDZSh17k9O+ldSmNy34aRcWctAZ9AyGktWTFL4hlTqP6un9bfC
	 aeV7+ZRSPfRtIKMFMhBbXizI9qtpxxRYuBRTiHKbhQxlOJBIMN1CaU65Q/u85Td+C7
	 oDYovz9SSvAv9+XUCqu+9XmlBlo2zMxs+ahbU9BokzJ+FV8xSKiFA6NMSKIiliUwhm
	 I8U9oUoM5IpyA==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 1B000953E;
	Fri, 17 Oct 2025 00:05:15 +0200 (CEST)
Date: Fri, 17 Oct 2025 00:05:14 +0200
From: Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
To: Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Richard Purdie <rpurdie@rpsys.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: pxa: unset apm_get_power_status on unload
Message-ID: <6nsmky5xtzyb2kgw26x5sfihrdtr2lmzjev3quohwrckrgm2zh@tarta.nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kqrnnraapgtonbmr"
Content-Disposition: inline
User-Agent: NeoMutt/20231221-2-4202cf-dirty
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_151639_713670_D0975776 
X-CRM114-Status: GOOD (  14.07  )
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


--kqrnnraapgtonbmr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The API for apm_get_power_status is "call it if it isn't NULL".
If the module is unloaded and it's not unset,
reading /proc/apm will jump into unloaded kernel memory.

Unset it on unload like drivers/macintosh/apm_emu.c.

Also, use the forward declaration from apm-emulation.h.

Fixes: 078abcf95cdb ("[ARM] 3096/1: Add SharpSL Zaurus power and battery ma=
nagement core driver")
Fixes: b7557de41a04 ("[ARM] 3228/1: SharpSL: Move PM code to arch/arm/commo=
n")
Fixes: 78731d33c186 ("[ARM] pxa/sharpsl_pm: merge the two sharpsl_pm.c sinc=
e it's now pxa specific")
Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 arch/arm/mach-pxa/sharpsl_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/sharpsl_pm.c b/arch/arm/mach-pxa/sharpsl_pm.c
index 71b282b146d0..cc6eba5419c8 100644
--- a/arch/arm/mach-pxa/sharpsl_pm.c
+++ b/arch/arm/mach-pxa/sharpsl_pm.c
@@ -795,8 +795,6 @@ static ssize_t battery_voltage_show(struct device *dev,=
 struct device_attribute
 static DEVICE_ATTR_RO(battery_percentage);
 static DEVICE_ATTR_RO(battery_voltage);
=20
-extern void (*apm_get_power_status)(struct apm_power_info *);
-
 static void sharpsl_apm_get_power_status(struct apm_power_info *info)
 {
 	info->ac_line_status =3D sharpsl_pm.battstat.ac_status;
@@ -892,6 +890,9 @@ static void sharpsl_pm_remove(struct platform_device *p=
dev)
 {
 	suspend_set_ops(NULL);
=20
+	if (apm_get_power_status =3D=3D sharpsl_apm_get_power_status)
+		apm_get_power_status =3D NULL;
+
 	device_remove_file(&pdev->dev, &dev_attr_battery_percentage);
 	device_remove_file(&pdev->dev, &dev_attr_battery_voltage);
=20
--=20
2.39.5

--kqrnnraapgtonbmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmjxbBoACgkQvP0LAY0m
WPGw+A/+NnOX9+q6q3bEpQE7Y8XV52SNVJPjJyfnNpuhHdvRKA0VTKCeiryq0kw7
dXgzli2fDC4CUJG3LzkmnnHpgbCBamrIpY8hbpWqRmg2EPdmKvt7A9zfCDbBK1OK
UhRQPD+lwWhVxu/o6mxU2Apb8sFSGwYxGwvyeiLufP/R2va2To2V3VoeC+leFHhf
CAvF63jGoZjwOZJShpthvW+lHoW4TNmnfDBIGd0ZcRuwTXpkKXb+CNm7eqtegA0E
4SQAopfv5MPO9ILKAW9URIgwvDIAtn+a5aYPx74En3vrPLfbn04P4jO+nXSBZgyf
MJsrCEBGHUYCd5TKVrTBkJ1+t7WQD00an5UR9KOVMBhadj5UOGCj1J58zBaj+8ZK
te6pJrbJYqlKnLuaPteVp6sm/q+XsLDeZf7rdle0RZr+4X8WzirD7GJ6qewTzZjK
wOiCkMM+YEr4peRQLZxDaxy2LLwk7SN+cNwAxmxlVpq/EL3r3RRTUbkTqpHrFcDj
e+l0uzCqYXmoft+cj51TX7NydQxTsHkSZzObhCVPvmvs0KwHuulkMbH2xJ1OiiT+
Vnb0UBBpp8tQIAR7MD+yRh0sWyus3IINZTL9132MmNoWtGNNUaRz/Vop8Toyq2AF
BAu4onr7ieruVGHRvBHUQ1urmlK2uXOJjQw8BRtjW+5TqANb+/g=
=qiHP
-----END PGP SIGNATURE-----

--kqrnnraapgtonbmr--

