Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E343E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwYcHAa5m0t3GDwYIhWh6yZx4eIHSOO+FkIVGkQeIsk=; b=hHkgi1yJ9l02bbWbqMxV0t3TKD
	j+P8sdJDkDdQmjXDHq8SUqVpaPD2Xz7amCqP1iBhTbzYzZlINedhUBG1IvPpyVl2P+kHebgstUFVd
	wLc61M3ColaQ9V5W2IJ8s6ugRw2WLRqyjIVJtuu7AJOJ+/+MvdrLhaZrYIChMq/6mYubxDL6RCJYp
	/TDzaAX8sr9TKC0ZIR1oBqJ0WoEIUan5TwulMXYbvqGd/zaBZYHtHKXRk/uow2VBdMhGIM/wZZLZ7
	+gf4JZPEFnWTmqcfjd8R0wM0GfLl0z78W1bInUPfx/8c0uy6ZzU2ydOh/L89May8vcB73PoX6Kq+2
	LQXQrzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcFU-0000000EWmn-3C4L;
	Tue, 17 Dec 2024 18:24:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcEP-0000000EWe1-1hp2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2720A40FA3;
	Tue, 17 Dec 2024 18:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9611AC4CED3;
	Tue, 17 Dec 2024 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459820;
	bh=qU4aI3iB2bKVYl8+6gmws2EPMCPT94DaUUUVjJQ/3F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBwVUpiVXznsUiiNF2b2/xUSvktYGLaZZzUWlIlnOLy7UoULd/XSSGEBJoXjcnAPm
	 xHMtRGd1viqaDL3J5VR8PwUpqiIgv7tBkUxjWwvRBBofZ0snDRG8FylfZ00HsAvbT8
	 Ixx1JuobyqPwYiMllzBhqYh/QcrVuF6D3FYKjlZyCNx2IgVZc+Ez388+nQzOeQXCpQ
	 YDYIOiMiaK0CPhfjTojUV8jdEIoeSiiKKN19+twKn5a+Ot5x9CozaESTHhGe5WkIZU
	 lwe/imWuRYz9u5S1n9UMbZ4gaH3xr7m+uJzqG3TnazCxQEoiyUGa34oaIL9BFkLJpb
	 iPpwqsaoFC+og==
Date: Tue, 17 Dec 2024 18:23:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: arm,gic: Correct VGIC
 interrupt description
Message-ID: <20241217-refresh-decency-bf5b9e1ac493@spud>
References: <20241217061226.14139-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q5T5qHJ4HblV4OaX"
Content-Disposition: inline
In-Reply-To: <20241217061226.14139-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_102341_519619_513991E8 
X-CRM114-Status: GOOD (  17.03  )
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


--q5T5qHJ4HblV4OaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 07:12:26AM +0100, Krzysztof Kozlowski wrote:
> The description of VGIC interrupt referenced obsolete "see below" after
> converting TXT to DT Schema in commit 66ed144f147a ("dt-bindings:
> interrupt-controller: Convert ARM GIC to json-schema"), because there is
> no dedicated "VGIC" chapter anymore below.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,g=
ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.ya=
ml
> index a2846e493497..7173c4b5a228 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
> @@ -110,8 +110,8 @@ properties:
> =20
>    interrupts:
>      description: Interrupt source of the parent interrupt controller on
> -      secondary GICs, or VGIC maintenance interrupt on primary GIC (see
> -      below).
> +      secondary GICs, or VGIC maintenance interrupt on primary GIC (see =
"GICv2
> +      with virtualization extensions" paragraph in the "reg" property).

I don't think things like this /should/ need a dt ack, even if they
weren't from a dt maintainer - but in case one's expected
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--q5T5qHJ4HblV4OaX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HBqAAKCRB4tDGHoIJi
0tV/AP0Wwmto6bZFtxfL8lxrdlvXGIEoKK7Agp7kMyPlfFvS+wD/UYF3nOvIOJDP
Stk2XSaKthz0Uw9kg+tRRO0ktYnG0wg=
=p5g/
-----END PGP SIGNATURE-----

--q5T5qHJ4HblV4OaX--

