Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D66C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWz+imdVnkbTu/11eqAcvWDbo6t8+5/hRTqaRkt03Xs=; b=C1mllQBhIE+ohMJM3KWg7glstP
	SLqBJ1XE2UyHsv5sQZ/q0gHtGGuaYDQLL2etAVPbWovRXiJRBvvTfOZEX5/Ut+PT/UkZOTtc0a1ht
	r6HwlWrwzouH+px7Ohhrlney0wT6XDWxH0CbVa6VXR+nkRotFgYsohYWWtxhpcHcZm3/dkUbT7e3K
	No8rJIhxAfMzTMyFMxyLYKdZvaGD2CsBkbRBBFUE2oOnT/JxqbwSEmHRLN8anAb8NB/0LNrjseX9t
	vqDqOJeZT7C3YByCRlBVWVyJXuhK+7Td15+rGozojv+zkaOyFgzXZTLoLKKsjpX7c+DkaZD+8Wv78
	kmwVpOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoWR-00000002RbM-2dhp;
	Fri, 14 Aug 2026 09:48:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoWP-00000002Rar-3qnY;
	Fri, 14 Aug 2026 09:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 5F317600C3;
	Fri, 14 Aug 2026 09:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 882321F000E9;
	Fri, 14 Aug 2026 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700897;
	bh=VWz+imdVnkbTu/11eqAcvWDbo6t8+5/hRTqaRkt03Xs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=j+CZuGTflKvu56ukvMb6j8Fh+26sB80WXDPMEntQM3wu/RuEBFzds8N75ixmPI/qS
	 Se9GfVWqoD0rf+YnVRU8H7/gjG3Ol4tSFOXVPmeQEr6lwm456bNl82MiajfBD7YrlW
	 EbheSu4PvWYo3PiyKAXvdpSubjc6YlNuA5Yh5ZBAYBa70Ubd0808T7b73/nWq/l50a
	 8MYMhft7FrKPOuR7QszdOVuNwwZLgg5gs/NrFRVUSA/k7WWqhpvAysMKo+2lB6i2u6
	 /1TT+Ghd/SRgv6uwb5uwvf9juRIY5f6z+hbCd46HgGZ0WaRltPeXaQdrAVuRfXKjLT
	 BkfvTvW9x5IkA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:48:13 +0200
Message-Id: <DKOKLV5T1BNI.2CW9UBFLOD83Q@kernel.org>
Subject: Re: [PATCH v3 14/23] mtd: spi-nor: winbond: Add support for
 W25Q02RV-Q/N
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-14-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-14-b637cf120d5c@bootlin.com>
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

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8
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

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kXRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hWeQF9HWW8qaN8GBeNIv0SV2a0iTZpTSXMHutL
r3X5Y3AGtyacF1H9OcDzkxzubK+HQGOhAXwOSnUC1b12XjeRxcD9coh+bU1WVSpC
Iq9jvbkbTwFJfJ/cwJvxETi0KcUArg8uxMk=
=xmBz
-----END PGP SIGNATURE-----

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8--

