Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE67CFD355
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0p2lRZkpOk2a28vRoB1dR4NXQCClzyYJSUw9JSscK8=; b=eQWBCbtKgWARQDYwYOQhtEeYz0
	JjGR2WxiapW9yHHiv7RYYDOtqGdKeZ7YSJFzhQ+9rbAp04DUfyCZR+l98NclQ+2KFCqxpeUidIpzj
	n36xzP1ghgsB0VtFUbp2DEf5ZnPaJ5s2EAaVDf02zxpPhjyO45Ee/cH+VpA7fMRnT9+JXs+eG07nt
	BwB6pZTgbNzajBunLPT01ExSmcOGvIDhtOJimjmoq7L2/whi1Y1c189E/cG7tUbgzogcc6HTUKV0e
	mRZMNF9TTAjy6veoRp87Yq9X/QkztlLNK9IfZ0XTKzecEJ+On1KaE2b5n4uHLk/l0+yZkLzFLM3iS
	yXwKHoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNcdZ-0000000CGiF-3uuG;
	Mon, 24 Nov 2025 19:54:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNcdZ-0000000CGi9-01Cx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:54:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DCDE60176;
	Mon, 24 Nov 2025 19:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED14AC4CEF1;
	Mon, 24 Nov 2025 19:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764014051;
	bh=aqYGCylftG4n34vFp2YDxaQ0gvVm2+Ucd6juMUnbdH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsEZv88btRm7/47X28fIarHWo+b0iqRpuaSB1yRCFykz06CdZGHwCiZDu7u0RDfG6
	 xJD8o0SNZvuCVkI7tSzz08fuhzxNeQwNL8KBelf2TVp4bSgG8BNllTpUehW7MQR95B
	 gJKFFtfhLIzhBPvN+5E6IWzlme47NFIWCjSHGmdGT8WHRF2mtYv3ZryXbkTbyPmMbV
	 aDCjH+RwFZ7EnovXySFAToYJSV8d2c3kASpOO+Z0EkRTysrD5UczLOxkJ6yQz4AvZI
	 7WTQ/fB578lyzlYgDsrA+ls0Nw8hrBoJRZv/raLQu0iiO4mxChIw05l7zb5vZHjEnG
	 sX+Ng5VJAOUiw==
Date: Mon, 24 Nov 2025 19:54:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: add sky1 reset controller
Message-ID: <20251124-selector-blemish-ec6e9a356bc6@spud>
References: <20251124063235.952136-1-gary.yang@cixtech.com>
 <20251124063235.952136-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NQdqw7ZhS252Q4Tg"
Content-Disposition: inline
In-Reply-To: <20251124063235.952136-2-gary.yang@cixtech.com>
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


--NQdqw7ZhS252Q4Tg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 02:32:33PM +0800, Gary Yang wrote:
> There are two reset controllers on Cix sky1 Soc.
> One is located in S0 domain, and the other is located
> in S5 domain.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/reset/cix,sky1-rst.yaml          |  50 ++++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  3 files changed, 256 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.=
yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
>=20
> diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml b/=
Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> new file mode 100644
> index 000000000000..a28f938a283d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cix,sky1-rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Reset Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description: |
> +  CIX Sky1 reset controller can be used to reset various set of peripher=
als.
> +  There are two reset controllers, one is located in S0 domain, the other
> +  is located in S5 domain.
> +
> +  See also:
> +  - include/dt-bindings/reset/cix,sky1-rst.h
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cix,sky1-rst
> +          - cix,sky1-rst-fch

You've not addressed my v2 commentary:
https://lore.kernel.org/all/20251114-problem-overbook-383f8e45cd0b@spud/
I asked what else the device does, but you didn't answer me. Dropping the
syscon doesn't make sense if the device genuinely has other functions.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/cix,sky1-rst.h>
> +    reset-controller@16000304 {
> +      compatible =3D "cix,sky1-rst";

> +      reg =3D <0x16000304 0xc>,
> +            <0x16000400 0x10>,
> +            <0x16000800 0x8>;

This is also highly suspect, and I believe what you had before was
probably much more realistic.
Do things properly and fully *now*, rather than pay the price of
unravelling it all later. I just did this for one of my own platforms,
and putting in the effort to completely describe stuff up front is
actually worth it rather than having to refactor years down the line.

Cheers,
Conor.

pw-bot: changes-requested

--NQdqw7ZhS252Q4Tg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSS33wAKCRB4tDGHoIJi
0qjPAP0TKyB3SLz/gAESdaMCcF6Nz1jYmasqDMd9fKquarCclQD/X7cLKFVCcE01
NfvuPhXgRc1fiveDtw3Y4mRz/thHuQ8=
=Y9Qo
-----END PGP SIGNATURE-----

--NQdqw7ZhS252Q4Tg--

