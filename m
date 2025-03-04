Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05173C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=123AE4mEestBvfU1L/+MjGDDP43aLbfD60uKdIvqxgg=; b=WYn4hiHciFb2GtkJ74kKY3Aclh
	CC9/A5mckCgVD6OFLIiEPMKTZOIGvG9XlOtEEVqaLbpm/UvMPxisMtupueiumxuFAHDRZnfTYkSQh
	ZjG/unZnwxL8e+41Wi7zoX6MT8f5nI2pnxleMIbr9LhGZHlb+cO8kD9z7elVDs7hwqT0FuDTv4N8t
	65ZDlIupqbnbe4CAfiHD0gc4d5EH/C1gONi1doicM1kTD2Z4fp8y3dh/+mOm8JtMnuaNf47nX8qzr
	sSXZLfX94Ypn2ulsmJ9DF7v8wZAQJELYLYG873a0HTTQta3rHmRTYnLzxe92bAzQGesOaTYpbtd2U
	VwQdL+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXj3-00000005ybr-4A0R;
	Tue, 04 Mar 2025 19:14:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpV9c-00000005R1b-0QKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D5C45C5EEF;
	Tue,  4 Mar 2025 16:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A20C4CEFF;
	Tue,  4 Mar 2025 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741105798;
	bh=gynFhESbDtrj69l9vqy5ZqEBuAk+kaMQBtKyg7Ndc6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfMsgv5LapGGy3xlQdJo1Izu+fujpQxnfRCXT0t9G1XzhJMd4VY6W7ZkWl1kX48E9
	 T1a+3o+OSddgcp+wavhJjDSOcc+WRUkFYAkwKkx/F67+sHByi98ZObydrmf7fTR12F
	 php4EpOxzPVacbbTmoN427DcCs9c/IKsNy02UkCpMghKy8vpoIYza7G5l6sI+1BHBh
	 B08BNppLJnJx2ZQKnDYIG9YJWI43/2b61Q2pxqjn5KqAVVMALRpXdTtp/v5AQLvfHw
	 v06XOh6OXN1r2M8I/haxZbpLOULSuyEYShoYM21UtsPJFfcjEt8AzkKDGmyYnW7sWD
	 /0+W7tsIlxUSw==
Date: Tue, 4 Mar 2025 16:29:53 +0000
From: Conor Dooley <conor@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: Add Microchip emc2305 yaml
 schema
Message-ID: <20250304-serving-stem-e059361db2b8@spud>
References: <20250304162136.1963384-1-florin.leotescu@oss.nxp.com>
 <20250304162136.1963384-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xnIqZbRCysQNs4BG"
Content-Disposition: inline
In-Reply-To: <20250304162136.1963384-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_083000_223380_C91C49EC 
X-CRM114-Status: GOOD (  17.47  )
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


--xnIqZbRCysQNs4BG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 06:21:34PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>=20
> Introduce yaml schema for Microchip emc2305 pwm fan controller.
>=20
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml     | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc=
2305.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> new file mode 100644
> index 000000000000..cac0075a65bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2305 SMBus compliant PWM fan controller
> +
> +maintainers:
> +  - Michael Shych <michaelsh@nvidia.com>
> +
> +description: |
> +  Microchip EMC2301/2/3/5 pwm controller which supports up
> +  to five programmable fan control circuits
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,emc2301
> +      - microchip,emc2302
> +      - microchip,emc2303
> +      - microchip,emc2305

Driver has no match data etc, suggesting all of these are compatible.
Please pick one as a fallback compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg

Missing descriptions of the fans, no?
See max6639 for an example.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        emc2301: pwm@2f {

The emc2301 label here can be dropped, it is not used.
The nodename should be "fan-controller", not pwm here I guess.

Cheers,
Conor.

> +            compatible =3D "microchip,emc2301";
> +            reg =3D <0x2f>;
> +        };
> +    };
> --=20
> 2.34.1
>=20

--xnIqZbRCysQNs4BG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8cqgQAKCRB4tDGHoIJi
0tl1AQCWUg3opyNCLRMufBSW7mDK6VYOlwUhf8VqZoYesvshgQD9HTXB/SxZHAYY
OHING0K8g/FBO22knM89/3x4tRYM0wM=
=oh90
-----END PGP SIGNATURE-----

--xnIqZbRCysQNs4BG--

