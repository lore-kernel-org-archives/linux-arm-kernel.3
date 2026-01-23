Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEBFD74ED3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESpcAg2fcVYsDHIUG/LCWCw1kCC4W6m/Tqw/5WE7Kx0=; b=As6MQWBSHJYMW0XmArLDcWI2MU
	RV8uF9JK/QLjYcWRt2cse0FjzJiLo50/lmTTv9YWS+FuEeu5FhlEAjVXeUhv8JWPFOSVkw1qsXjbO
	0CkETrb8YJd/7Wni0vwbllooAoEkI0413drpYkG/4nS1cQvHGhEBFhrRpaJQWLHtZV9EejMX/dpFD
	nmIf7yi+vsgmP0wkkcqT2xrHV0B19fkt0wBHvHjvojO6uSc3uDkZVsdQyTdUgscgrpDFE0vjCQXFz
	I8Zi+MsfMR+w55jXtYw2K8QsGIV2oLx4OuEhHD+IVyRLLwTtgaH+5wrUxK4gzAPjlGTGsG1+FiNXr
	CeBVsN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjICL-000000092uF-2HY2;
	Fri, 23 Jan 2026 14:31:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjICI-000000092tj-3fMB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 14:31:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vjICF-0004yp-Il; Fri, 23 Jan 2026 15:31:35 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vjICE-0026nL-0E;
	Fri, 23 Jan 2026 15:31:33 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 252E54D6FA7;
	Fri, 23 Jan 2026 14:31:33 +0000 (UTC)
Date: Fri, 23 Jan 2026 15:31:32 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: mailhol@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] can: at91_can: Fix memory leak in at91_can_probe()
Message-ID: <20260123-hospitable-chinchilla-of-ampleness-3a3dc9-mkl@pengutronix.de>
References: <20260122114128.643752-1-zilin@seu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3jpayozdp2hz6erm"
Content-Disposition: inline
In-Reply-To: <20260122114128.643752-1-zilin@seu.edu.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_063138_911988_C8B53663 
X-CRM114-Status: GOOD (  16.17  )
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


--3jpayozdp2hz6erm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net] can: at91_can: Fix memory leak in at91_can_probe()
MIME-Version: 1.0

On 22.01.2026 11:41:28, Zilin Guan wrote:
> In at91_can_probe(), the dev structure is allocated via alloc_candev().
> However, if the subsequent call to devm_phy_optional_get() fails, the
> code jumps directly to exit_iounmap, missing the call to free_candev().
> This results in a memory leak of the allocated net_device structure.
>
> Fix this by jumping to the exit_free label instead, which ensures that
> free_candev() is called to properly release the memory.
>
> Compile tested only. Issue found using a prototype static analysis tool
> and code review.
>
> Fixes: 3ecc09856afb ("can: at91_can: add CAN transceiver support")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>

Applied to linux-can.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--3jpayozdp2hz6erm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmlzhkEACgkQDHRl3/mQ
kZx03ggAi3E2w9AI+DGs2tOuxHVLebgXoSpPUUIuIxhn8tXnC2AcMmA7SYWzCIQS
iltOSOnHrEkAMJ3Bc9OoX2i0URUhLx2GKqWe85nr4p8h45RMdIBQ3pvd9IQA+Fvw
0S3nVDlIlKiAWHTqhr2EsvYk9ScFKiycAkMnIF/kukQBHGA4ehtwpB0rwUBnFTz1
nctCk9n51pMUF6tDNCtWOmuEY4hIrGC/FEDA8W3TNSmm/Va/1gDyHpkLCAxUvOUj
/JhfcilvS2wvFADf9DgsQGSvh8qGhJ8XRHOQD+PllWJlD3VLc/BgxQZMJ2kVb77p
qx1a4m95wMVNIY4NO9gYv/ASK9lyZA==
=PTx7
-----END PGP SIGNATURE-----

--3jpayozdp2hz6erm--

