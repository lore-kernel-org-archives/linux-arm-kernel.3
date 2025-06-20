Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2F4C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPvCPPMWre8gKapQM76kxEQscahxubiK8cL/rbbJAJU=; b=2NaCuS2Z488dDatjIBKdPe+4cg
	Aml/DjI/mA9FX7gvFoKGm2bSWHsvcjPp6wDSQIEwn47mjGPstJfQ0/g2RWR6X8SMDwdUF0ixwsPGw
	bMP4szcN9P+VlBYvAvnG9ticSJ7LMNNg3t74BfgK4YKSV3kopLeqLcO67BX4DUSjduFEsl8qKeqdh
	WAC8nfKWgtw7WEY1YqBjRikBycPzn/JK0E+nU1KFKXt9InxKMT93wgbOPiVxJ5ymDFQDAu7BaYvJs
	CgxiHYxtK8thC67IuURoNl0n6Ak2dVoWD4DFWExywKYRI8oaFd3UuVUAWH2+4QJYEO9++aM4+iQ92
	aGtPUJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSccp-0000000Fq68-0T5f;
	Fri, 20 Jun 2025 14:21:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScYw-0000000Fpj3-28ox
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 14:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64AED5C5F35;
	Fri, 20 Jun 2025 14:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA07C4CEE3;
	Fri, 20 Jun 2025 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750429069;
	bh=KPvCPPMWre8gKapQM76kxEQscahxubiK8cL/rbbJAJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZ6dtslt1Jp1miZRnCWarasA8latQYl4eaUeiJtcB+Y1xKJRFhFVBgbCzQbHIU5Eg
	 1AGTgHQsMWbcEZHFOvGO1nzvREQGdk9aFQZX0JUvnOt5B7aqHnez1Q4D0Y4MTfFZOG
	 KX97RGf3+fP/1p2q4A4GzqS4fKRobS9PuG2Fg9Psjsy9LWeRS+i4GzQal5Dy2UgaCB
	 Z5QiOogQ4tTyYn7kp4JwYhgrEH3nr1Nh4nXXVrEDiqJ1Fyxs52NPzZkjB5OwSMCNzf
	 PyWTUYk7Eh+JHeab3hvB/8LfhhC7wl2evP58goaLbcSwpyXaxmpudoVWMnC7lbH0AT
	 OSarEjQaX9Dwg==
Date: Fri, 20 Jun 2025 15:17:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing
 PPU0 reset
Message-ID: <20250620-stegosaur-subpanel-08403c80910b@spud>
References: <20250619171025.3359384-1-wens@kernel.org>
 <20250619171025.3359384-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P4JxWVq/o9oAhrtu"
Content-Disposition: inline
In-Reply-To: <20250619171025.3359384-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_071750_591111_E54E2889 
X-CRM114-Status: GOOD (  13.44  )
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


--P4JxWVq/o9oAhrtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 01:10:24AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.
>=20
> Add a reset entry for it at the end of the existing ones.
>=20
> Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner =
A523 CCUs")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--P4JxWVq/o9oAhrtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFVtiAAKCRB4tDGHoIJi
0sy4AP40BvUBHSqm1o/Bhr3FkdlzzrUWaAqywLNNtJtM6Hr3aQEA5Bxl0ai6zPbt
VeUnc2rD5TanorWC6N3/LX2DWqEu5gw=
=hFhO
-----END PGP SIGNATURE-----

--P4JxWVq/o9oAhrtu--

