Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA67CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2zp4t4NyTHWHTKgbsdObniAY39EXm7EQZMRjqNl5/Y=; b=EH2ngA17mJIcYsXU7rLPzF1nXx
	UG7x8IiaBcsgKwRhs7Y/4kApRnj9NSZLHw3Mou/K5qW8wXf27q0wE7jLHd2NzKE6fsx68icy00hVx
	Mgvr7QxAtp5P0gLhbdKw9DcwoHQW0Bp/L3tNyelUWWX2YeI6C2AzPoe/8xhSkihtBrqoZqsbjXI4l
	V3zecLqOXXtY+YzUMNMrMVA7mWgZEfeUoCOUodcLFusNr8LI4KlCR1adzad/0nWKiRG9MqV6yi4OF
	PI4MyXe9t6C6PNIcb4A2E0Ddcr8R7PovDahSPW/jt5jZra7NlhzgWBPLhae1CDIhF6zC3d+98K3CR
	hV7/kWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLAV-0000000BIqL-2pl9;
	Mon, 12 Oct 2026 18:54:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLAU-0000000BIqB-2Lgx;
	Mon, 12 Oct 2026 18:54:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0CFA60142;
	Mon, 12 Oct 2026 18:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D18F1F0089B;
	Mon, 12 Oct 2026 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831277;
	bh=l2zp4t4NyTHWHTKgbsdObniAY39EXm7EQZMRjqNl5/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QvEE5ZPENu7PNxG06VtqOrBJ9I+4/4AvOSce4C6PgW1JhTezsdxcBc5OFRgf7tKXe
	 uNaVspMFklqOciONRUFo9ovRO0fX8FHiWTlXEgnaJpSSQV7nBUmajlK678Jczj+ZLy
	 CU+1EMdvfFcAStiHOslndLlC8/KnyFMixWDmR4D4gudeBQY4eBCFQinb14X3x2CCxp
	 8udDd04Q8OMo8sF6mH4hp87AnNiRX2BkSoHP+EAD3oDz6flQ4fdOSvhnnETifVCwUa
	 1U6L5HRjHs1VXwQP+zioa0qRD15ccFovMB3KraCwUkWvyvxnhzS/AgVqWGSrESsIyN
	 VF/wIIpWxWLGA==
Date: Mon, 12 Oct 2026 19:54:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gary.yang@cixtech.com, fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org, Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Message-ID: <20261012-founding-stench-55cff46fe1a3@spud>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
 <20261012123618.648930-2-Luo.Liu@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q6HPCk6NTpYhk7J2"
Content-Disposition: inline
In-Reply-To: <20261012123618.648930-2-Luo.Liu@cixtech.com>
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

--q6HPCk6NTpYhk7J2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 08:36:16PM +0800, Luo Liu wrote:
> Document the dedicated DisplayPort PHY on CIX Sky1, including the
> optional cix,external-dp board property for external connector swing.
> Add a MAINTAINERS entry for the binding and driver.
>=20
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
>  .../bindings/phy/cix,sky1-dp-phy.yaml         | 53 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy=
=2Eyaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b=
/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> new file mode 100644
> index 000000000000..c6914cab74e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cix,sky1-dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 DisplayPort PHY
> +
> +maintainers:
> +  - Luo Liu <Luo.Liu@cixtech.com>
> +
> +description:
> +  The CIX Sky1 DP PHY provides the PMA/CDB register interface for the
> +  dedicated DisplayPort instance on CIX Sky1.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-dp-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  resets:
> +    maxItems: 1
> +    description: PHY hardware reset
> +
> +  cix,external-dp:
> +    type: boolean
> +    description:
> +      Use voltage swing values suitable for an external DisplayPort
> +      connector instead of the default low-voltage values.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - resets

A reset but no clocks? That's a bit hard to believe.

Seems fine otherwise, unless I am missing some sort of common property
for the voltage swing stuff.

Thanks,
Conor.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    phy@1414c000 {
> +        compatible =3D "cix,sky1-dp-phy";
> +        reg =3D <0x1414c000 0x4000>;
> +        resets =3D <&s5_syscon SKY1_DP_PHY_RST_N>;
> +        #phy-cells =3D <0>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..b46d0f4220a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6360,6 +6360,14 @@ M:	Satish Kharat <satishkh@cisco.com>
>  S:	Supported
>  F:	drivers/infiniband/hw/usnic/
> =20
> +CIX SKY1 DISPLAYPORT PHY DRIVER
> +M:	Luo Liu <Luo.Liu@cixtech.com>
> +R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> +L:	linux-phy@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> +F:	drivers/phy/cix/
> +
>  CLANG CONTEXT ANALYSIS
>  M:	Marco Elver <elver@google.com>
>  R:	Bart Van Assche <bvanassche@acm.org>
> --=20
> 2.25.1
>=20

--q6HPCk6NTpYhk7J2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0s6AAKCRB4tDGHoIJi
0iXrAQDtZlLwnBeXrt0sJP/AohrnXaoa1UW1wN5d8Yjkimco7AEA1Aly54IhsVhf
2zcuFqWPKZ7+HlGCLNIbW0h8KFKPPQA=
=oFLx
-----END PGP SIGNATURE-----

--q6HPCk6NTpYhk7J2--

