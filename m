Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62631D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxN94/y+kmftv7NO4vo60abV9Ef2UWHVP7L48tWQuf8=; b=350b7L/U6VoYJvWB6meVhaAt9O
	z3j83VxcHP7Ik4JIcEzOJ9yk8W8ATXek5yUw4ioUJX9GgePV2Yv7+1Qaa5gSMK6JORLei1lr+A+h6
	aVEkg4bqq+I2RIipATJOjx8q5NU1nz4B7qJV3AX5OrOVpepmKIBM7/gZFrHHh+y4t8exIY4XrpYYg
	KFpX9OAUTAKB/TLrFPUgyj+jOB2cekwmUskxsOxkTCq3sc5iLEI1FNDobpZZfLmFsbDIpq9P0vHqX
	Ras9SFLZ3PYNs9bcVLxNwBP1e9osg637bxMe5OJ/eK4S9M0ll+ldVecfHjWgnR16KBTveHlTz0S0V
	6H/bRP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb9H-00000001DJ7-2rFQ;
	Mon, 11 Nov 2024 20:36:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb5O-00000001Cf3-36rI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69D38A40929;
	Mon, 11 Nov 2024 20:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912F6C4CECF;
	Mon, 11 Nov 2024 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357153;
	bh=RxN94/y+kmftv7NO4vo60abV9Ef2UWHVP7L48tWQuf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qORy36CgE47eGQqNg0II9Y4fFV6Jn+SbrWSJA9fYJSF5gzyLcEuuGd0Sm9UTNXIpc
	 V0OZP7BUC6gVtgwb+K9uXxddw6Hm4pVrcKfTZskZvTtaL3FLKE93Br9mR7/aTAb6+L
	 Ch8ANNjM+7tWJFUwuujd2h8emczi+lXZTeSHQVokv2jTpSunhQ5ZdE156D/QDW4Rzb
	 hKtMKbN8wb4RBQQAlMQxDdsEJwk8Ll65VFH6IKTTFL3p0+s3/vXmfqaVsUMWT/8A2V
	 2YPwZiLmhTuZ6mWguPBeM7tSEnNqUt4aNp4ZCNwC1V+6Vqmu8EBFuJDsrpggaYuxiZ
	 seJoNFbNBPRLQ==
Date: Mon, 11 Nov 2024 20:32:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Icenowy Zheng <uwu@icenowy.me>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: clk: sunxi-ng: add compatible for the
 A523 PRCM-CCU
Message-ID: <20241111-translate-paddling-388fb16627de@spud>
References: <20241111004722.10130-1-andre.przywara@arm.com>
 <20241111004722.10130-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z+LL5xLnfq6nr1NV"
Content-Disposition: inline
In-Reply-To: <20241111004722.10130-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123234_865952_B55651AE 
X-CRM114-Status: GOOD (  12.57  )
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


--z+LL5xLnfq6nr1NV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 12:47:20AM +0000, Andre Przywara wrote:
> The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> the PRCM R_CCU.
>=20
> Add the new compatible string, along with the required input clock
> lists. There is now an extra input clock (PLL_AUDIO), so add this to the
> list of allowed clocks and required it for the A523 PRCM CCU.
> Also add the DT binding headers, listing all the clocks with their ID
> numbers.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--z+LL5xLnfq6nr1NV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJp3AAKCRB4tDGHoIJi
0tg8AP9KvOEQLq3CCUEfpgzQTNT5IvSk90gPk1RIl15PW87w3AD+LIrvmqN6utyI
8aDgAHpRLD2CmAMPHNCw9wxBqHOGCQ0=
=Rauh
-----END PGP SIGNATURE-----

--z+LL5xLnfq6nr1NV--

