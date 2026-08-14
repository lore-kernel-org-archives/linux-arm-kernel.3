Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B4CC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9DHnRo6Yl7zS695EjdQJ7W6XFMnCyJt1gS3f3MuikU=; b=z0McNuWK0/K/vKCUjZ39b5O3+m
	iDCw8yT5f1fqcueduOyGdVJJg7yc1kdZxDu5vClKwPzCqJRo+2/3CBRzObPxz3xUJVhfIZtlGBDLq
	QVnEKn9OAFXo11iL3v03duPLoAYFnKmcomfZN3ChA3BE+JiQzhaSpUPr+XPFZgseWrhj6wRxAyUVG
	EjroLWYhDqOcIasgZLaX7NomzZpq2K4JOJy8sd90H9qqraWLjYqitO93qT9qDiQM6nTEqlbu5vG26
	NAhKFkAlN+wwcMMvQqq8eyIlkkx/0CdbXNHA3LaF66caFC4y/CM8jEiQepYHxsiW01rNOGsFTah86
	U3ohlutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoQO-00000002PuR-1x2m;
	Fri, 14 Aug 2026 09:42:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoQM-00000002Ptw-3wTw;
	Fri, 14 Aug 2026 09:42:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 5C90F407B9;
	Fri, 14 Aug 2026 09:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BCC871F000E9;
	Fri, 14 Aug 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700522;
	bh=N9DHnRo6Yl7zS695EjdQJ7W6XFMnCyJt1gS3f3MuikU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=AscQCVUdc5l7JMtPnrPXsYTnyuYJ77X4Pi0M7lK/FU/5REzCyVYW/WlALQO2YlJ9d
	 vbWzjH8PLFYTrRIV/fEYyaquOhckTiNi7b3sdKTYah14BjyC5torpD+RPThtAo3DtK
	 90qjLc214UZN5b80KurI2Chimnuft2b1YQA/Hm5RkBmwrBnSfYJ6OaQD4qZztkFhVD
	 6VI5ETwVY1dVZTbp8wzIsv02E9bm8mdjFLYkO0MkHzEpXXIPcmIL7ELLnstvvLRBRn
	 PwkQ+W3YHR5LlRJrd3dL0vOxtQ4kJQDfeL/Ft9G4HuatKvdd1onDZoEWcRqk4U0Z01
	 Fsiiz+kcxm6dA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:41:58 +0200
Message-Id: <DKOKH2Z53AWN.16GH2NERDWLJ0@kernel.org>
Subject: Re: [PATCH v3 07/23] mtd: spi-nor: Move the SFDP header structure
 to a C header
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
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

--56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> The sfdp_header structure is currently defined in sfdp.c, whereas the
> sfdp_parameter_header structure is defined in sfdp.h. In order to ease
> the reuse of this structure outside of the sfdp.c file, move this
> structure to the sfdp C header (.h).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>


--56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7i5hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ijBwGAnJR5F5WVhkrlmwqZ34C5fE4gUtbSczOg
hqFYERO7W3dNtZvMO6Se+c5+CO+4jH36AYD65O7dGrHfzrgJZYra9srRZes9Q6n1
v5MnhOMlNomR4XY1C3WPNOi4Kp5YEs5Pwvc=
=dKdU
-----END PGP SIGNATURE-----

--56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243--

