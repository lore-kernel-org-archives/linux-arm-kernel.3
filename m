Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB23FCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ1M0/j+tol6OkxMr0hlVrmoHe7gz9INi+eTrspZDLs=; b=Hh9MqquE9CHHGejv48Rk+ENlgv
	XsnwvS+UNeIjqe047vN3r9Q3xt3XBbC6OQAxPVowMwryCwPnnfxKpSH0wC8SWntwW+dyXcA1BZmEs
	irI1aoYOHPrOT2EGtUZK4t9YbZ/icouKOC2qM828InVAUhLeYmXt8WnTO4uRxK/A47q9AFF13+Rx9
	hhfX6BzcmFYTzNtFreEWT0vLhFgZjyB/mag/y7jc8WBhN+6JrwwhtgJ7R9YfLihS/y3/jf5zXYzEt
	pJOB9HqGWPVDI3v5cJqJbhm4m62sA6uaPiIJg2MSoUEnyu8IdvOVtJZgv+BLr8BJMcXCgoji9LuTL
	k16ROMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviuV-00000002KBX-3eil;
	Mon, 08 Sep 2025 20:56:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfcl-00000001BtT-0A93;
	Mon, 08 Sep 2025 17:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F3B1401A5;
	Mon,  8 Sep 2025 17:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB2AC4CEF1;
	Mon,  8 Sep 2025 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757352350;
	bh=vZ1M0/j+tol6OkxMr0hlVrmoHe7gz9INi+eTrspZDLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ua8VMQm28MuAxhVBQeMUZ/kS/mwfNcTKJVtB+tmxhMSSPfmmvYX473fO0xDcXAkUV
	 r3XuAzKa00wPhcEQWFiNdK5DtNogesLL27y5ZE2UEGscjc7/mZYCtvoWsacwfmRaBL
	 dlAQrYL7qHDRArakhLBvrjT/OmLOPp/xoFwcR25OcmHKw10TUdChRjHSlwo9+pIjjz
	 KUre8tIzV8gM2WMrikSXjU+ujqhYtuqywPxz5+DnHgi2yALDG8MJwKzSqBDpjNbVfG
	 RWOKc0ZtU2rdPg85cWhYmn1N4yHWOWL0DdQ7+dscYE9bN9kPKijevMCfQk7SmUZkQn
	 BM6GSz9zfjktw==
Date: Mon, 8 Sep 2025 18:25:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] regulator: dt-bindings: rpi-panel: Split 7" Raspberry
 Pi 720x1280 v2 binding
Message-ID: <20250908-punisher-doorbell-b616682bc682@spud>
References: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5hG/Mj9q8vHDhMA"
Content-Disposition: inline
In-Reply-To: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_102551_100167_42B752E0 
X-CRM114-Status: GOOD (  12.78  )
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


--z5hG/Mj9q8vHDhMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 05, 2025 at 09:16:30PM +0200, Marek Vasut wrote:
> The 5" and 7" Raspberry Pi 720x1280 Display 2 MCU is a bit more
> complex than the original Display 1 ATTINY88 and the binding is
> also a bit more demanding. Split the binding into separate file
> and fill in required gpio-controller, #gpio-cells and #pwm-cells
> which must be present for the V2 MCU. Include mention of the 5"
> panel in the description of Display 2, as the 5" panel uses the
> same MCU.
>=20
> Fixes: 6d09c6e474bd ("regulator: dt-bindings: rpi-panel: Add regulator fo=
r 7" Raspberry Pi 720x1280")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--z5hG/Mj9q8vHDhMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaL8RmQAKCRB4tDGHoIJi
0tNSAQDHvTZVxppVac9hVI+YGFCfXJ0VH5h0bbcu57iFtmsfBAEAxIMkY/eVkpPB
xh7DfBxcfZiL8+fcNFfZu5DnY8J4GA4=
=MQSa
-----END PGP SIGNATURE-----

--z5hG/Mj9q8vHDhMA--

