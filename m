Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597D5D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XetprvIlafsxWdc+tOHGHUnscI2nULcuWWz5s5qNx3o=; b=tL3fykKxjlyFahSCP5KyD9ASwl
	YzOb5Ewky9oqgVU13ZpqbVPZyoP/xEsuj3242RmM+mQek3/aD2KVhaNVV5bnQPzZB3J4XI6aSj66V
	U07gEdD+S64/BDjF91vYTel6wKoes73gJLuVdk4FsKMJVzyTn7DwRVSJwlkwDeQqVSK4cz7yt0H3s
	upZj3jPhhc9HWqqXrDZDcwN5AzaY7A7k5AUH1mBHMQIS+1WV2Ruhw+iPXXuQfSPFscotRdVvfKVnT
	fxCbcBZjrKK/Z2LfR4L/wUoNuI+LyVLdE/wic3KwHK2jZACMjBPqflwjU3W7gp1jOdUOiTxvecOLF
	K/gKbWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaSO-000000016jz-2H1W;
	Mon, 11 Nov 2024 19:52:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaMd-000000015wV-3TLM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A15A4A40537;
	Mon, 11 Nov 2024 19:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EBFC4CECF;
	Mon, 11 Nov 2024 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731354378;
	bh=RTX8JtmfQXicA6NSmzoFj+EWO3qXcohs8dzjns8VwpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkYuYxdZWNHKM3Tkh62KdVOx8gsraV/by+6vW/t2oO9qo3Rzu32kwu7cfwZxbvvUw
	 V24fkCBzbu3iXCUUNeMhfckeBPIi6odWs1HfRW2QjP7pTGTn8pBX2QO1Mg0h6rYHOS
	 KRsnABD/ktmkV2LzLFNoe1HOGEEMGCb6KQXse81WnCczF56avB/ksVdpjTpS8sFjOZ
	 w2FTlXbN16huJrk+19UmXhRgqNpPRk3YiRsMRbACH+0Mv2v5qw2SWR9t36W1aM7mAo
	 vEUtzoenEcjQLGDtgedzh8vSR/M5ti9BGBpGTJULEO/f6/p6Sr31u1XgWDrLctPuIh
	 npUaEo7b41bKg==
Date: Mon, 11 Nov 2024 19:46:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/3] dt-bindings: ata: ahci-platform: add missing
 iommus property
Message-ID: <20241111-pasted-primarily-7f665b0b2fa4@spud>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iY8L1hmlHO5MfZf9"
Content-Disposition: inline
In-Reply-To: <20241109094623.37518-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_114620_183869_6CC2F07F 
X-CRM114-Status: GOOD (  10.46  )
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


--iY8L1hmlHO5MfZf9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2024 at 10:46:21AM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> fix dtbs_check errors in following files:
>=20
> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: sata@540000:
>   Unevaluated properties are not allowed ('iommus' was unexpected)
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iY8L1hmlHO5MfZf9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJfBQAKCRB4tDGHoIJi
0kZYAP49wOpCPn1XV1CuML8Mzii0hAR7itUchMtHNweyWK5AEAD/WWr+kQyWWHM7
kPsQBx1TogUJmrldrEIbDvuBrCcWjgE=
=UM60
-----END PGP SIGNATURE-----

--iY8L1hmlHO5MfZf9--

