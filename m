Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06005C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBGQ4dL6mRz4agiTt0D4ib2rg0LUW5HyTTZk9Q21lpk=; b=Tky8QwF8oLq2KN9yKs+VZlHhPb
	6nQw6cG+AL4FAveq3+O4ZHKG/k1W1PTk45GFjDSgY11yYiFFV8Rwt4FfmtNk/hzlAkHQCqNahTlFK
	rpj3jIrMWtUvH6ct1AvzjpBNkAZQCKtkyPML1j38iow1Jq3qhHV1GGridihhNKCu4CIIIXWu4cD0z
	SvVeuVdVofrStw9nEtW9YplN3GvQlBgcdEeP1EXNQ78vpSRMfGY36f/Od3RNyAAkbq8TZVSTcQ+tm
	5xF68LZUpnTns2NSgbyp38pmdXksj525JJeYrtP5/Fbl5ZaNpxiVQXxdQHsmB6yUxlFfk2WQLeXzn
	pimQInlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWfY-0000000AASA-0Yuw;
	Mon, 12 May 2025 17:10:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVt9-0000000A0lo-3YUE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09D455C547B;
	Mon, 12 May 2025 16:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4096C4CEE7;
	Mon, 12 May 2025 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747066823;
	bh=b5ymMBBwucx7+JF/datxr1WkwzE4Zs8iDCFOHv48tqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjysGgJzJJLphZ0edNmXQywCsu+ffDslXm+r0ytGgaxUaypHawC+Te0sEGQSW5FE7
	 h3Yn0kU5FjnoN3Iv2zwNmeQ3Q6+QEx5Nq6V3uqKl2GXXvTCsYJEe8E8WtH2Z/2CVnY
	 a5O3iLfMe/AlsxVbEq8ZCx76qgd6PfwXLxEgeuJLMOBX3tOY/ipPdnMeABgONzb8hc
	 r7Rvuwv/dd/b/arkXtedAVynMIsTqGMWPNZr5o5557B82zTv5tmPiLHmBpU+QS+jqU
	 kSX7rsdTwW+G7Dfj7eZzGfnPnhL0/Svge1/cY6g/ZpUcHacq2l6HCbF6ah+D8fvL16
	 D9MQqxMB1ee/A==
Date: Mon, 12 May 2025 17:20:17 +0100
From: Conor Dooley <conor@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
Message-ID: <20250512-mongoose-vacation-f81a56dd6c5d@spud>
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
 <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p3X005M6v+zmT/88"
Content-Disposition: inline
In-Reply-To: <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_092023_978948_3071BB63 
X-CRM114-Status: GOOD (  16.48  )
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


--p3X005M6v+zmT/88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:14:14AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The IOMUX Controller in i.MX9 family has Daisy chain that multi pads drive
> same module input pin. Each SoC has its own register offset, so
> introduce "nxp,iomuxc-daisy-off" property to specify the daisy register
> offset. With this property being parsed by driver, there is no need
> to hardcode the offset in pinctrl driver for each new SoC.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml      | 8 ++=
++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pi=
nctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinc=
trl.yaml
> index a96fc6cce502c10ab415e0b26bff1be8c3bc82f5..b5b2a9c8688a7f6525cdb6a32=
db22681f4f1a0b9 100644
> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.y=
aml
> @@ -13,6 +13,11 @@ maintainers:
>  allOf:
>    - $ref: /schemas/pinctrl/pinctrl.yaml
> =20
> +properties:
> +  nxp,iomuxc-daisy-off:

Same comment here as was left on the driver.
I also don't get why there's a property being introduced from something
you can determine based on the soc.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify the IOMUX Controller first Daisy register's off=
set
> +
>  patternProperties:
>    'grp$':
>      type: object
> @@ -51,3 +56,6 @@ patternProperties:
>        - fsl,pins
> =20
>  additionalProperties: true
> +
> +required:
> +  - nxp,iomuxc-daisy-off
>=20
> --=20
> 2.37.1
>=20

--p3X005M6v+zmT/88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIfwQAKCRB4tDGHoIJi
0khFAQC5DQ545yCr9AEOhKd8i29tmIKpIty6ZUOCeKl1lWVjdgD/ZzV9eDXWsx6D
TpQsgh7YeLJOZL4WeO+YJ6gCuuFgHwk=
=StPd
-----END PGP SIGNATURE-----

--p3X005M6v+zmT/88--

