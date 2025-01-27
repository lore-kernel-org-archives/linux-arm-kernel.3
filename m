Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE347C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWnhynaYs9UhLgD4QSl3asorXOnxX63sXit4/2adtOk=; b=Bos5wWaijxrRRnBIyVIz0hJ6pM
	cKjdkuMfczJ//+JVCKG3Y+lY2dN2wkJwufcUpBjGUbsJpnhUMHqxzL4Yn+g41SJzobCnKN8dM69E+
	Qq0l7WcZL7yWP24oAnSpfivj+wRpzUlONsRrzkU/9kSkGmwiTsQOeinHyHtjR0zexIZJX3Fh4rUnv
	nS5+/hIEAN5UT8nRpbbv46yChxBJiFJP+dJFzARLlL2XtWAybfRmyXwImg2CDmeQ076YcF4HonfWa
	ZcDeWtLobMur0t7mZHEJaadzE0JYddi25e3GDxpjVQ7ORfJsoAvJu5xPRXrIDq8IkkGxWvcAOvHw7
	eOsWE6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTIG-00000002xLi-3XTt;
	Mon, 27 Jan 2025 17:53:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTGv-00000002wfz-0Kae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 17:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D61F75C4A67;
	Mon, 27 Jan 2025 17:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C73EC4CEE3;
	Mon, 27 Jan 2025 17:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738000299;
	bh=IWnhynaYs9UhLgD4QSl3asorXOnxX63sXit4/2adtOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZihJJ26EhTE4kO3fmKWFGPAmlRrEkkMbw02V7USCY6o1gzHgUjbp0yAbIdKntb69M
	 BtLHFqyb5dV9E7jcbIMuell5x/Vem5WXvk8yeQRVDJebxVPYSGEsY3fe9hM7BKQA8Y
	 uYKUCgAl69IK1kJBnuE6mcon5LKH1lm+qsSIYx2S7+GuPYhygxRWt5LUOVnzXxPxcd
	 2AOMKTN17x6j11f1HS7EcbQWF2/9EjZv8FIIpAUM6mvOhrZUSLjARQrL6zhGoPiEX4
	 FnfKywpDpWQ5mP6YBQzvNZgblESRHr3fdCTHCgsqqDMroSzl/Lw/sE48YEH0XIZmt6
	 DhPP5xVOFoNVw==
Date: Mon, 27 Jan 2025 17:51:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
Message-ID: <20250127-antiquity-spelling-fd54076afe66@spud>
References: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
 <20250127-varsom6ul-concerto-dts-v2-1-4dac29256989@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cReqDgVidX28TjYo"
Content-Disposition: inline
In-Reply-To: <20250127-varsom6ul-concerto-dts-v2-1-4dac29256989@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_095141_160201_A4F558F6 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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


--cReqDgVidX28TjYo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 04:31:00PM +0100, Antonin Godard wrote:
> Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
> Concerto carrier board.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--cReqDgVidX28TjYo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5fHpgAKCRB4tDGHoIJi
0saFAQDHIIOY1ZLLliCFzyxW+U5lKPDJYiKB5mzQ8E2yHA7J2gD+OYMYk3bw/t4w
NWrIqwr7PCXzAQUakE//RoKJNUvNSg4=
=Xs+l
-----END PGP SIGNATURE-----

--cReqDgVidX28TjYo--

