Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E86DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwfdphpnNxuajP1SfK7U6y2PR8IZ0jJwzcVdnBMd6nA=; b=i1rR8YLssypvtHdpvW3pm7207X
	hFumMecj6KHpFk50dt+9h8lieQmVfCM0PK17lFY/YZDPGYD6oishj70a3a3VNfdgQjfeYIyKDOUR1
	GhC19eq8L4OlyYHEserlF8aj7vyfA3yvQWygcPkSetM2op2Q2bnZfIxkx362mEpLVAbEY9X6HIDxX
	RJUuWPEoNWlZNnnoYz5nvnbcPq6s7wtpIEBSHF4W78ffTdc/SCHOcIEZRFqhp0OozWO5jNoRGGEcQ
	r4tWSc7nWigC4OOe5mme/bghjjIAUjwtJJPwCj90hFruS1SRQOUUuOFK+8QVtx7Wjmc8XnIjM/UsJ
	9xLYNCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Ou-00000007vpd-1JNX;
	Fri, 29 May 2026 16:49:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Or-00000007vpF-429w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:49:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70FC443C26;
	Fri, 29 May 2026 16:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4551F00893;
	Fri, 29 May 2026 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073371;
	bh=lwfdphpnNxuajP1SfK7U6y2PR8IZ0jJwzcVdnBMd6nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HYvhkWubGms+xcSqFGgV+A4XLqcgjZT85EHj4REmJI1M0I2vpo7geJNfgbRBHsgZp
	 whEMQVzUe0sflshBaReOWx8me6PbiLYCAzUz64zRIKjtze6K7Ugb4TEKlBuPG5grM0
	 004X6A+CdTQA2JJFGTdBCSpVSvJYkZdngo1ZdHC6grPPL3iQ5CpQkkdndBBfTfFFmE
	 XmTXmu3ah/6uGIXgrplvlL/KiP+YDKmgoo880MplkZT0JZjhLRIPmPWgcIqsW2+ZAr
	 X+9WYwmpLpWTpPuVHIzOi6WGa01c/ffbVZadih2j80+jqo+1eaAVKt/q20HRb39Vye
	 RVjkIeET8xq3w==
Date: Fri, 29 May 2026 17:49:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 2/5] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings.
Message-ID: <20260529-hypocrisy-clump-abf596df704d@spud>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-2-c7fe54ea388f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Itt2pNgWFbhrwYID"
Content-Disposition: inline
In-Reply-To: <20260529-zx29clk-v3-2-c7fe54ea388f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_094934_016114_FC1016F9 
X-CRM114-Status: GOOD (  10.41  )
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


--Itt2pNgWFbhrwYID
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:52:59AM +0300, Stefan D=F6singer wrote:
> +properties:
> +  compatible:
> +    const: zte,zx297520v3-lspclk
> +
> +  clocks:
> +    items:
> +      - description: Main PLL divided by 5 output from topclk (124.8 MHz)
> +      - description: Main PLL divided by 4 output from topclk (156 MHz)
> +      - description: Main PLL divided by 6 output from topclk (104 MHz)
> +      - description: Main PLL divided by 8 output from topclk (78 MHz)
> +      - description: Main PLL divided by 12 output from topclk (52 MHz)
> +      - description: Main oscillator output from topclk (26 MHz)
> +      - description: Timer oscillator output from topclk (32 KHz)
> +      - description: LSP pclk output from topclk (26 MHz)
> +      - description: TDM wclk mux output from topclk
> +      - description: DPLL divided by 4 output from topclk (122.88 MHz)
> +
> +  clock-names:
> +    items:
> +      - const: mpll_d5
> +      - const: mpll_d4
> +      - const: mpll_d6
> +      - const: mpll_d8
> +      - const: mpll_d12
> +      - const: osc26m
> +      - const: osc32k
> +      - const: pclk
> +      - const: tdm_wclk
> +      - const: dpll_d4
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  reg:
> +    items:
> +      - description: IO memory region of the LSP controller

Just make this "maxItems: 1".

Also, sort reg after compatible please.

Same comments apply here about the example and using _END defines.

pw-bot: changes-requested

Cheers,
Conor.

--Itt2pNgWFbhrwYID
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnDlgAKCRB4tDGHoIJi
0isBAP992+dVrtcpmiLKLuTlJrY2DJkqogyJJVFoNxdYD6jcXgD/b15qvDe703x3
bPfmU+yYyoX/O3iQkIUsVeePrR0mtwc=
=axFd
-----END PGP SIGNATURE-----

--Itt2pNgWFbhrwYID--

