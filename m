Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A49C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7p43VGfb3bUIVfnjYJPEQrg/m2q3ZK4huMmdI2LR14=; b=WkP1th6hEJxCqtBBHdQWY4vR7H
	3TexTYIwmrEn9k6rSqE3rjTdP0heMO76wjogVgQJVi8SVLMkniQEC+83V/3Ph56482qB64ubqyc0O
	Xn0VjWRBEMTS5jSJWca7PksJ6p7iVAtIopQ/s3GcaiEIMCPTfiT/AxMCQolYov3Ee+jmAhP7RpMTx
	yZJdtXujw5G1YgK3LEXpVXuQ208+MqWoUj8EJu0HaPaOGEMekFbmX05vr0dCrGr57NyVoYW3++Csi
	c/YAPQXTq8Vjj1fOwX4LK34HkrcJ3xZc8lRWLD6BJ1Iid6T1ojAtFPQKXvmZOGnCXeTE84gAxclUw
	VR0co4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSS4-0000000CKdu-0xHl;
	Mon, 10 Aug 2026 16:02:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSS2-0000000CKdT-0Vmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:02:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB48600E2;
	Mon, 10 Aug 2026 16:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D2C1F00AC4;
	Mon, 10 Aug 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377726;
	bh=w7p43VGfb3bUIVfnjYJPEQrg/m2q3ZK4huMmdI2LR14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hVWKSlWea0NFTRlkHdkxXXtSYk6ZGTQm45LFzbXdo2ftzRFvRrbrdp+g90ypQnMTM
	 e4HhyifWyjioNidwSf2MUPN1M5pPSyJ1qsIuixqmoU2JDkQqrSM5L0+OodQLHd6WLs
	 DXAAWVdj6sCGagNMww81ZxcR7IHhybQlUTTa6KYWji5xJcv4FffmMH96+C26ORxCO/
	 /bq+23IBbxAT3tqpbxNgFZT4fwrkxSp8enPrwBU1fkejZjU/TJeHdBAhfjXNn06a3G
	 Gh41XIn1lavYGauCtavr3w/eABlXuAtxUua0PATJGe4ThLXpjfV6H1lLE9xm3p2lW5
	 yEPFgfICsmSzw==
Date: Mon, 10 Aug 2026 17:02:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Apple SoC CIO reset
Message-ID: <20260810-unveiled-specked-a856434db8df@spud>
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N2Sxqftfd7ROY7yz"
Content-Disposition: inline
In-Reply-To: <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
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

--N2Sxqftfd7ROY7yz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2026 at 02:16:02PM +0200, Sven Peter wrote:
> The CIO (USB4/Thunderbolt) blocks on Apple Silicon SoCs have a reset
> inside the power manager that has to be deasserted before their
> co-processor can be booted. On t8103 each port comes with a dedicated
> register page, represented as a standalone node. On t600x a single
> register shared by all ports of a die is located in the middle of the
> PMGR MMIO region instead, represented as a sub-node of the PMGR syscon.
>=20
> Signed-off-by: Sven Peter <sven@kernel.org>

Fix the sashiko complaint and then
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +  - |
> +    power-management@28e080000 {
> +        compatible =3D "apple,t6000-pmgr", "apple,pmgr", "syscon", "simp=
le-mfd";
> +        reg =3D <0x8e080000 0x1c000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        reset-controller@1a034 {
> +            compatible =3D "apple,t6000-cio-reset";
> +            reg =3D <0x1a034 0x4>;
> +            #reset-cells =3D <1>;
> +        };
> +    };

Probably the fix is actually moving this to the parent device bnding.

--N2Sxqftfd7ROY7yz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann1+gAKCRB4tDGHoIJi
0jBgAQDYWOEGR74Ds6KSZUGl/Cm2Kr3fF2JYxWhCO3HCFEXHvgD+N2kbKxt/f94d
E6xkauGWWWPsmeqbgKCFEXXuvtDnJQo=
=iapb
-----END PGP SIGNATURE-----

--N2Sxqftfd7ROY7yz--

