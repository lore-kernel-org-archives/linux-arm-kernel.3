Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA56D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PacqaamP/8fqa7HsRx8lxDrs65EWN7gZNQ9bZK866Q=; b=Z7GFUCddAPZXlgl79gvAYGKCVL
	L8/i1ZWwOcKLxIih9kncziSy81l0sKcy/OAoph46zW4jCPUx7lL+LACwfegPEwFsvI57uu0zUo2sF
	QvPTqsvj6hpojGWdCMa55whv/mkI6vx46J7D8zqfkfh/hRUhKmTOKk1R1dkT9Luyl27QKTE2b11gN
	V39Kypzhwu31gRG0jDh0i4vnkIcVHWJMLFkd1Qac7plqroD1ku5IvDDyxGR9Q+IIr15fa3umXnXJx
	D+xN8xiJGz3O0hCYW/9JJ+7pmIeYTCzUiLwvEWBjKt+44vzpucr3ijVOtQAT53NCYwmCKCBDSZKTj
	s/SIhVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSeq9-0000000DNM9-3N6C;
	Mon, 08 Dec 2025 17:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSeq4-0000000DNLh-47O8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 17:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EBC94400A;
	Mon,  8 Dec 2025 17:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61F5C4CEF1;
	Mon,  8 Dec 2025 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765214156;
	bh=fjQMhvzUh3wiORRTZ78WaQHW7FYwA9kge4oGJ9+Iwgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPan7WRcbKq5QNjWfxBcZSNm7sOLsHGvpqjhIefFBzbIpPBWq2MG59MSKVdLysyom
	 g7Op2nL3yMk4p7W7Aw7tan2hgvrUq9st7o4HGyBTaQOGuQ5eTWapjpnrYMj84gDdoR
	 ubSRoeC3PEiJS1wNnezrPpm6mNwabI7aaM2WJFO5kAZGRksta7HM/X3j30e8aStMhD
	 z/eF3KeJVhPVUmuEqn2UfrB/Qgd3SZgHl0Mtph2wHOp/GjUsN6qm9w+GZa/Re6FdIv
	 pLRi6+HM6R9rOfyeplhzAaS1yKLPbfeoAc9/oj+oWneYr2C+DVAho8yroE13pEgst2
	 JE+TOs/giNgMQ==
Date: Mon, 8 Dec 2025 17:15:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
Message-ID: <20251208-deprecate-privatize-c8ab771091b7@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pDWahq4ruA5O+qrF"
Content-Disposition: inline
In-Reply-To: <20251203122313.1287950-4-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_091557_068006_09C7022C 
X-CRM114-Status: GOOD (  13.80  )
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


--pDWahq4ruA5O+qrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> Add support for Microchip LAN969x switch SoC, including the EV23X71A
> EVB board.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  arch/arm64/boot/dts/microchip/Makefile        |   2 +
>  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>  arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>  3 files changed, 1245 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/lan969x.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts=
/microchip/Makefile
> index c6e0313eea0f..d02ac50aae79 100644
> --- a/arch/arm64/boot/dts/microchip/Makefile
> +++ b/arch/arm64/boot/dts/microchip/Makefile
> @@ -2,3 +2,5 @@
>  dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb125.dtb
>  dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
>  dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
> +

> +dtb-$(CONFIG_ARCH_LAN969X) +=3D lan9696-ev23x71a.dtb

ngl, I wonder why this config even exists, it's not meaningfully different
to ARCH_SPARX5.

--pDWahq4ruA5O+qrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTcHxgAKCRB4tDGHoIJi
0s2+AQDx39SaQhm0zytJWpmEZPuSOS8u320LlEtdvmYmDAppmQEAmgIqA6PvxFG3
w4rrmnny5VuydcS+WrxJO79IWsqBJw0=
=IBLP
-----END PGP SIGNATURE-----

--pDWahq4ruA5O+qrF--

