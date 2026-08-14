Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8787EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VNfwjyAnAmmzvSoAragiapp5OE9k6P2HCDQUcYZ/nE=; b=kiybxmqv7DOGX4T74ntIc+PyF+
	fhZrbYviDz55+G5ILT2E1vV9h0ego77ca2i53wYfwE5DUd4g9dEXJwOlF/0egSA3/Qaovw90Pks+e
	zaNqtcVDzKeBktfh2sbFFNOdTz3GeskkBZbyRUG/hewXLETxrJ6mQYNQzI+jiIES2Sg4DZ68dmRSl
	Et3qsRSzuf3AaXljuWPrihtf25sOoRRUjh0UefGIKzI9EP5eLrR6yS5C0hYbrl74erPyjLtgiCpCZ
	lDhipLO19w409b8JjLeH137pjh4keKlC5j5kp2Jd4MqbXORpDKh0MjLT9dz17xhhg7D2ok3GUModb
	YPwX8MAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoVI-00000002R7A-2vjU;
	Fri, 14 Aug 2026 09:47:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoVH-00000002R6f-2vbG;
	Fri, 14 Aug 2026 09:47:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 25FEE600C3;
	Fri, 14 Aug 2026 09:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4AC421F000E9;
	Fri, 14 Aug 2026 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700826;
	bh=4VNfwjyAnAmmzvSoAragiapp5OE9k6P2HCDQUcYZ/nE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=KaE4hbRFYnXB9fWew8qKlYmOTI45OoJACudCeD7ZCDSEtTYAlBGWbn1Xd4dU6qdFi
	 B4Z2eNUqqGbXSpu731qIqHVc6lijvlqqIxADlSTn+SM1A7lHtklDeZNBX0TMuhpLU9
	 iEW7Ha449bNdRRkpCqpchVMrDCQicyijWaam3oH6Mdt/8xwrBEanJjCqhhc6i0e+2w
	 KDXC66zMQDKXDo0lfStCOTAWodPu2SgTevFw6EZMA0lvRs+6D6LKnLd+syDrtWO5fo
	 dw6T2MuDeV/WS55nzvH4R53i0nwJlAv8ZZIwIgTXz6O9J8Fvhfp2gxCDpYDl/+hTjE
	 kbXOPk538L+4g==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:47:03 +0200
Message-Id: <DKOKKYUYF350.2OY5OV9GH1F9E@kernel.org>
Subject: Re: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
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

--6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d
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


--6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kFxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/inygF/QCxPNRTnZxAAYYBX7VV4otFVPDHl8UQn
3KGmBmWPJPi29sCxeM/SPxHfYh3R+ZXsAX9yNNX5lN2Qb2MM+S4vZR0rO4+sqdQp
5A3vaxGZmoFaystAJTAyMqUcLm66ZtuAdlY=
=jllR
-----END PGP SIGNATURE-----

--6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d--

