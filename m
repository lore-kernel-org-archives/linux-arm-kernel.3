Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BDECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGBTf3XkAmT7xymUXanCSmqa2ddnelKdkvFsNSOV+Is=; b=qr4EpUSNrR8jLKPOztQB0ymRKF
	Liun3orvXUREU2pZgq0nnSKGx3hYVjDz6a9oxZgnMmZoCMGjGq2fVHs2PPq5bbbzHPpJf8gaImSzm
	htIgikELGS25b5kfhe/XZmk5Xbi5Oa8QJWejtWYuIjfVBD0wkPplhokXJbRayL/s8HGYjCuu6MRNT
	249FeTHKrIBdunAzIr3u6eqtdRvIuaZ+lVmIEFoFkoeZh74vIVQwl3kdSAMflVWEvVYnPMl1812mq
	O68C+gX26UX4vcbKXY7b+3PabKlvSjni10XQjrEiO9J2ATbr6x9Ja60zvpvRRlW3lUqp6QIH/Jq+t
	lV1kZ4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcL8-00000003jIm-08Na;
	Wed, 22 Oct 2025 17:09:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcL6-00000003jIU-2qfc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE2BE6054B;
	Wed, 22 Oct 2025 17:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E728C4CEE7;
	Wed, 22 Oct 2025 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761152970;
	bh=DEV3f1qr4I/J6PFM8ig4H0L1KWQJuTXPz1S0HlQRAFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0IwOI2FoPf81jk2UVHGMXtRwbk27NLpssxyrcg73JxP/henebG3qgsP/XDREXSgh
	 9ySyZGkQk2SAqJW9Cbh10wutSIiVlOpgEIRQT9bR9QJEEOX9Ex6pcHPDvPBcRI2KtL
	 sJzCiOt5IAa2A58RtlOiCSbwIrhUIGMLVAfu0RKrA2Ny55U66Ts+oUdatYY/UCtboZ
	 OVaARFJEf7f2bQs0YaPtY86EefNAGXgrVvkaPfFAWmIPsB+wUeQE7gLKyUN38iK/KT
	 n9j6vL4F03qIvcl5xZexi1HmMFCBPB/Jk4jms9UdzMkUEZjvEAIMzjP9Z1ZKgGZK9X
	 uJ6ANgHi3SFeQ==
Date: Wed, 22 Oct 2025 18:09:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: toshiba,visconti: Fix number
 of items in groups
Message-ID: <20251022-unblock-bolster-a68db7abea21@spud>
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jEiR7/UvURY53tPu"
Content-Disposition: inline
In-Reply-To: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
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


--jEiR7/UvURY53tPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:34:26PM +0200, Krzysztof Kozlowski wrote:
> The "groups" property can hold multiple entries (e.g.
> toshiba/tmpv7708-rm-mbrc.dts file), so allow that by dropping incorrect
> type (pinmux-node.yaml schema already defines that as string-array) and
> adding constraints for items.  This fixes dtbs_check warnings like:
>=20
>   toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctr=
l):
>     pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_=
grp', 'pwm3_gpio19_grp'] is too long
>=20
> Fixes: 1825c1fe0057 ("pinctrl: Add DT bindings for Toshiba Visconti TMPV7=
700 SoC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jEiR7/UvURY53tPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkPxQAKCRB4tDGHoIJi
0mHlAQCPnuNveKAFO8hQ6LEWORXLQB3dye0vywcucV2ehC2QfQD6AkB+iEzJLWkI
RxnecE2XQiF/7bDTAoTsDon6zVWieQM=
=LT1e
-----END PGP SIGNATURE-----

--jEiR7/UvURY53tPu--

