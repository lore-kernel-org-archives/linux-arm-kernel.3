Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53566CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 19:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyP7F1Xha2voMis2aj0+DrxduNyDxpnm1/qx/F7xIpA=; b=IumjyXQeuqBlpsJZm0FYSKNoAB
	T2nKkvTZGUGbPjjWKeF+RgaokkpT+AGo19mWSxCJoRxsJqM9TDTVf8IJ+6dWtKmKlp68n3GOhOt2g
	55q4JMDPEuEXgkpse2eiYF8OGWTVnxdtcSZa1Jnexg8ujTKYtdj3l90RXMCEej/qqqMxmAvczgcl8
	GzRb161NcLw+QcOaEZGhrS+HKFDQWhsOUrA9481HhdMFAqaMAJqkb+v36477gZCibLlB1hgXMHunz
	yyBOBYUbp1N2jZms5eOhJ8Nam1F7q4TfeOjlNQN+rIsnSda/JLUMMcKd1orFZiiLW7Yngsyuu03tx
	ypVhf1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3feN-000000062MR-2iwA;
	Tue, 30 Sep 2025 19:04:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3feM-000000062Li-1B8q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 19:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46B7460626;
	Tue, 30 Sep 2025 19:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E5AC4CEF0;
	Tue, 30 Sep 2025 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759259073;
	bh=9bVp8kxtQwfBvNc0TU8eygqR9vHMmccEBPnRirmKR+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOA/xK7KBZ8v0V75Mej57U1x5cZ+4B9AteiPhmHWpO7gYz7EnKlNfIaU9IcrkF2u0
	 CFEP7naKm95hEkaa/Od6FwwCG29VBDiNbfJHdlcI1OHvU29Xn0hWIpUzR4zCHhT4sU
	 hDQG+chlxSeRhtmmhvnqxKpd9UO+pGUf0s02tMZ1yhtHYE9aaTe9j86d4m9qg7Zwqa
	 wcTsOIwBjPVD1W0HuUz09IkMjpSU3ROmGF9pHX7ztIirNEWS9Lmvld1bMqU67wTLEO
	 DZexBdTHmDj8VG0GaRwAmT8WwWqRkAhSKuLR86KRS2DuiK5oV1rK6gZCPZirliK18p
	 vopT1Ew3c7+EQ==
Date: Tue, 30 Sep 2025 20:04:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: support for brcmstb-hwspinlock
Message-ID: <20250930-showoff-herring-4b2a04611e9d@spud>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-3-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="82j1rXkJuErFh8c/"
Content-Disposition: inline
In-Reply-To: <20250929200628.3699525-3-kamal.dasu@broadcom.com>
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


--82j1rXkJuErFh8c/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 04:06:25PM -0400, Kamal Dasu wrote:
> Adding brcmstb-hwspinlock bindings.
>=20
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

You have two 1/3 patches in this series.

> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb=
-hwspinlock.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspin=
lock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinloc=
k.yaml
> new file mode 100644
> index 000000000000..f45399b4fe0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.ya=
ml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom settop Hardware Spinlock
> +
> +maintainers:
> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,brcmstb-hwspinlock
> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#hwlock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwlock@8404038 {
> +        compatible =3D "brcm,brcmstb-hwspinlock";
> +        reg =3D <0x8404038 0x40>;
> +        #hwlock-cells =3D <1>;
> +    };
> +
> --=20
> 2.34.1
>=20

--82j1rXkJuErFh8c/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwpvAAKCRB4tDGHoIJi
0nvbAQDNsPnAKiThkxtWiJAtsGypV9tPJibzu9eiHKqUnBJXzAD/YBVHVcuOZX3E
1xUGN7jzCNFqkG5lwlNdSD7Ut3juLAc=
=hEEo
-----END PGP SIGNATURE-----

--82j1rXkJuErFh8c/--

