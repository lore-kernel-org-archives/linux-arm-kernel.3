Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9D8C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIE0LA9qDv9D0e16yPeWQF66GtF1oZC+TmU+kYtAQa0=; b=g0IjWlwfyWsTc+Pudc5n4CoG32
	FP3YUB7afNQfk0TfZajZGBaWchlZTLVtGc60ou2E1nomURuJRlB3208s1+S4mSlOnZbjoHJq/D1ue
	Rm/E5/R0d3LfaIDUvTpdIZdNJAA0HF2AADN6OWre63dN8aK+GLDCMFj9t7Lzz1rAuuCsR0OAHyaUd
	1s4m/z4+FrmD5yAzSR/uB9F5HJYrzPpU/Lr2loukJ8ElZQvt6JRRXfpPaOyr8iiu3o7LZdJSfrFI0
	Tini5Ts0/DXBAikrr4fxhW0N9T6tOJ9+7ebqyzEIdRWWg1QFgIotqKHk4cmNvgS7QUW4ZjCJCkFam
	WKZOjkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoVc-00000002RHN-4BNS;
	Fri, 14 Aug 2026 09:47:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoVb-00000002RGJ-3Gbn;
	Fri, 14 Aug 2026 09:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 5A6CA413AF;
	Fri, 14 Aug 2026 09:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B7ED01F000E9;
	Fri, 14 Aug 2026 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700847;
	bh=gIE0LA9qDv9D0e16yPeWQF66GtF1oZC+TmU+kYtAQa0=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=BSVa2eoB4ZF2wn6vEaCgd1kI7TdQ2p6H+99CPGZzgcHkn71GOJkXz3H367C7qfsrE
	 ulLZJW/LUkkKo8wmwsY8+0cjjCtK7ZFKUoCdEFm9X3grM7VFLyWpsVD+eLWIe+sBrv
	 Uyrpy4LiAwFEYWqi57+y6t9HDVyKjIo4AMJ2G2ssZtX7OOayCLxao21SPM9KIYPFnb
	 7IFsFZRiZ26Z1hTOt1yjdeztIVVaWibQpKRmUiEKw8jUH6liWcHxfpADLRJwpUgfXy
	 HTWZWyYL3SHa6564F5GQc3wI4VB2XYIcvXkLZMhM+dVMbaEu5eJ3Q2+TGtEQv9mT8T
	 2Qjb9BIY3gvcQ==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:47:23 +0200
Message-Id: <DKOKL8BG1W6I.2F1SN6BTV61BA@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 12/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-12-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-12-b637cf120d5c@bootlin.com>
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

--4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3
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

--4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kKxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iLTAF+JV+xGNTl07VQ2YUPXB1GqMoJKLRIUorA
bymmUGYSjAiGj1zf7O/SkHZKOqdjVnU2AYD919lqC3dlMcZjOU8bzIK+uGftP2xm
RMjlqd9p6UL1ZTSKk0lveRjOMmOwcHc94Vo=
=cWBF
-----END PGP SIGNATURE-----

--4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3--

