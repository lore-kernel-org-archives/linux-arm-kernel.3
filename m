Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A9CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AZFghz+RNQCbq2ZIEb8z7RSEcxe+KsWfb8rITQo3NQ=; b=1JaJxFF2gu90iYo5s0yTyGsTk4
	LaAze1FJpPg4EqOU3GvbpwIKMlNEeR7VQsGXa7bz+ZR32C/COdC2jQx3ghABkQr/wu/5ldJiPxHkr
	XtLYaXTAdjEFmYnIwdhdQ0qPJ1uIYGDSVu0MXpe/aU+Wpav2qev0k8jUkuzcnm/Vs0m0x5xJMBimJ
	3tWyVewSMTc+CR+Ta02x+rkrkIjfpr7lgjMkvqWar1xK3GSxxsORF36P0tzJW+3WBY6H3l+Bv3Vef
	7WZiNxXhGg8a6qrZbzxZO7Vltk+j79K1PdcHYt9BEUzfZdw8LwWi8cwNtbWngM0qAxbV8Z2zWNZSC
	OpvE/+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoV8-00000002R1v-0eJg;
	Fri, 14 Aug 2026 09:46:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoV6-00000002R1K-0ka8;
	Fri, 14 Aug 2026 09:46:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 9E3C760204;
	Fri, 14 Aug 2026 09:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C948B1F000E9;
	Fri, 14 Aug 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700815;
	bh=0AZFghz+RNQCbq2ZIEb8z7RSEcxe+KsWfb8rITQo3NQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=FS/lIb9pReWZN+TBA9qUqNXEeoyBSx11+UkZvshZV3Cv/XOvCuwib9zn3PVyDW1/9
	 X3iRNEvnNmQEXwIJWkdzIDezyGojOIBRPUFbnXC03aE5IF9ZtnMVnX1ppkpbRBF9E6
	 GumPsLr2iIE+Ci7x7VR1i5RKsg9Gei1WvYx0DLx48dTi68L1PpISOKHRZzgUKXIhNN
	 Y8wDzt22pWopz0wslvEt+ydn3aa9PNwmX5PolYOGM4vvWpusk24yvz4aJJE0DukW89
	 Sm7ds2t0gUcjtjqlq8GN40H5A3QujKevyn4AWA4FVJEtLTJIy+3Ar+XAWE/brBo9EN
	 qEVZ8tNZpf3SQ==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:46:51 +0200
Message-Id: <DKOKKTM4UCIG.14QV6331B2K7U@kernel.org>
Subject: Re: [PATCH v3 10/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-Q/N
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-10-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-10-b637cf120d5c@bootlin.com>
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

--6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>


--6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kCxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iQhQF8Dq0tnx9H3Tajs78NLFbZ6ehFxTFzeQVV
wHXTXMvleJrsJjYRFYlSCT3a6sd4lWUwAYCrA5ptxBmrpjFIMiwHNB91GFyHB/1x
WCnpHPFLC7pb0UwBhbLXY8gO2kf2+GTyeig=
=vSOF
-----END PGP SIGNATURE-----

--6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130--

