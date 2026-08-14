Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9638C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bM8eT9aWTFiGSsSbxvoU+I54vT+vTRzOZoDrzISQlEw=; b=LScl3IVWSCs3FzziGJA7eXhj2k
	cpBnyCy+G2KjzIWsgngxIhvKbclF2v30Fk7YeIhayH0UL+HDIBgFx2y5GbAWt/4dpV/YKuO9lTwIY
	sayenojojFkWDZzEw8pg7ECHkxI4rlJNS3KVl4buickATahiEoswrOXwjdOXaufDfReqN/dRUpvPk
	0nMiIeERW9/ilns9VDwUMxmnjf42+F1F6hru/SA7uLWXd2XQJoZ56R8NjPjStpX+rpXj2V+O5rHgk
	rKDxzpHTsMyFX5A+0ve4+XSsWyYBjLjyoE3AUw+N9gpi1Z0nTxq/e4hsq1zvVfogFskaGo5iOGmTY
	LoCmpX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumNR-000000029ZH-1BXx;
	Fri, 14 Aug 2026 07:30:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumNQ-000000029Z4-1S9J;
	Fri, 14 Aug 2026 07:30:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 92D9C600C3;
	Fri, 14 Aug 2026 07:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B64371F000E9;
	Fri, 14 Aug 2026 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692651;
	bh=bM8eT9aWTFiGSsSbxvoU+I54vT+vTRzOZoDrzISQlEw=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=iO/Tm7d/uQCepDVKVuoWLea/mDfbjx4rmPpozAMg1UcMXQ8EXZnXRnzpKYZa9m9Vm
	 WF0CMtWn2UpIRzPrymaJHWGwmwGn1BxsNvfbDk4MFYPp1ac+GbySKO9OE3lTPV45yM
	 5DyacIeFvO+F8Ns4q0RMBJErrls78gHiVZ51iWJ0nd53blNj2R2Ki2BN36jg0WanKV
	 nkQb7zBXhZ6mBVLV1uT/zyxjVQfjZSN6lBjMwAnn75089+wGbCfq0dOFcTLiAY0p6E
	 4lGilHCKk1bKm9wj/5mIGvtriwP5zNVLIYrYOpLKILju2qww4dNsxy8tGvyol0qv/G
	 zwORsu5SUz1+A==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 09:30:47 +0200
Message-Id: <DKOHON3JP11L.1VAWG1VGCDUGM@kernel.org>
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
Subject: Re: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
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

--c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> The _BUGGY suffix is not super accurate. There is a behavior that indeed
> seems strange, but it is somewhat documented. The fact is, with this QER
> field the status register is considered 16-bit wide and if one writes
> the first 8 bits (SR1) without the next 8 bits (SR2) then the content of
> SR2 will be assumed to be 0x00 and will be cleared.
>
> Rename it BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR to align with the other
> namings (_NO_RD) and clarify the meaning of this field.
>
> No functional change.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>


--c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7EJxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hW7wGAy7PRiAZxI6sAkKTAtlaeeIsZHlw7yC5a
aI4j9dY5nHEwI1xVFmGzzsDFZJdA7XYLAXwIsynQLzZLwUduvu3QWxAKyH258VXd
MpcbIucfhmBPkBUHlwll4gMV3K8xhIxSmCA=
=ZwQI
-----END PGP SIGNATURE-----

--c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a--

