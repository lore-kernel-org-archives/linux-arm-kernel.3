Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02122C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxLFZkpOuKi4mROW2vapDOhHxudyF5mRfONiow0CF+0=; b=mb7SUICh9N3UDGadY36NyeJSez
	aWIwEQY2idTJwEbRMj7fABYYkl46Qi0xGedr8G0g0wdtf6usQ2sH2xXJTRH0w97ECkDpRTBpQeEuB
	q/sh5dvSiZWzVM8vYs/hXa+SGmICkBLqFcAbX0X5z9nocakYIHBiRHRcg8tuwkgv3ACc81EQzDzCZ
	a+Mlbr+e9E4E/LdAgKF6k1uzTp7e+N/fhoNLoVEAYgHs/MG6iflEBRb6kog16Rg3ht7MOISoZDnwC
	mCqMG/byqNG1R44GHi0Yu33FrCqisBnzTUPfG+iHKjbpeKonmyTAR+9k9+J4MAow12tl+nuqRwQew
	Mkxthi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP3n-00000001S6w-0ykm;
	Tue, 04 Feb 2025 19:58:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOpQ-00000001Of4-1rQX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 156795C6672;
	Tue,  4 Feb 2025 19:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF8BC4CEDF;
	Tue,  4 Feb 2025 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738698203;
	bh=OxLFZkpOuKi4mROW2vapDOhHxudyF5mRfONiow0CF+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGHOEtxqdAQU8YotL4e98GbgQmk7mPn18e+HS3j6b5SYDPEmtFhS1t1QJRGhr0vEP
	 Ik7PncdOwgFyb3/fMybjSURGqxAr63XYXOXlJthV9hmGNtgFCcpN9yVVYVr+LwiZJ1
	 E8DeD4JjJ0r2M2VLQ2B1l6Vgrz+hTzfQ1+ic/HBGx8EjWv0p4XUEgjSzDZ6cveWIuZ
	 BSM7Hs2bAuiMjCblqFJ2aucIrDsydT+E8apE2TJkXZj8EuHj4YysrGa74LHFLsMu4U
	 ImMuWIrnVNsAZEw7OYi3Ra/tuz3ZoF95u5u7w1WetNCQ+uol2+2oe5F0EWIK7FNNq7
	 BxSbEwYdTnnSA==
Date: Tue, 4 Feb 2025 19:43:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 0/2] arm64: zynqmp: Move firmware constants from binding
 to platform
Message-ID: <20250204-onto-gliding-465a003ae66a@spud>
References: <cover.1738600745.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="myTze9WqxmEx6DIV"
Content-Disposition: inline
In-Reply-To: <cover.1738600745.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114324_581246_078A8B86 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: "open list:XILINX AMS DRIVER" <linux-iio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Eric Dumazet <edumazet@google.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Shyam Pandey <radhey.shyam.pandey@amd.com>, Michael Tretter <m.tretter@pengutronix.de>, Rob Herring <robh@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, michal.simek@xilinx.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, Mark Brown <broonie@kernel.org>, git@xilinx.com, "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Harini Katakam <harini.katakam@amd.com>, monstr@monstr.eu, "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)" <linux-ide@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>, Mubin Sayyed <mubin.sayyed@amd.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--myTze9WqxmEx6DIV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 05:39:09PM +0100, Michal Simek wrote:
> Hi,
>=20
> Based on discussion done long time ago
> https://lore.kernel.org/all/5353872c-56a3-98f9-7f22-ec1f6c2ccdc8@linaro.o=
rg/
> it is better to deprecate firmware contants which are not used in any code
> and it's only purpose is to use macros in dt files.
>=20
> There is no reason to be the part of dt bindings but it should be kept
> there with adding deprecated warning.
>=20
> I want to see if this is the right way to go. If yes, I will also do the
> same changes in other headers which contain only constans which are not
> used in any code.

Ye, I think this is a good approach to take.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--myTze9WqxmEx6DIV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Jt0gAKCRB4tDGHoIJi
0iwjAQDHM3pyWDtIVQUJpum7sJq5YpFWOQPxf+3QWxHiauCquQEA83V6o0+XcqG0
ckSZUheRIaEO1eK0Y6KNH88lItDmUAE=
=SMqC
-----END PGP SIGNATURE-----

--myTze9WqxmEx6DIV--

