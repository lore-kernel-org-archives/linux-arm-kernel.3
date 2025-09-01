Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16520CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKgqT1w/VEUCkm48eJIBeL+6VGtQLqJ3Y3UE5zziOOU=; b=TWTEKjrT32HFYQ6PPN7y/vfV9b
	re1gU7W+0ISZzjTUYtoBxDMiilOJEloD8G7GYnciUHgsc5HicVAoc5V52B2/YeKEyMNGNaNYlLvCZ
	gT61KAJ08arDltWMimrzgfUxk+duqYz8pNO57y4SCQP14F0E9QF61VO3/1+K/9cPK8iM5nCMiA+ZN
	NhJml8w2PbwUKbP9B28hxKoo8vxJqLzuhrN5Y4nE8z/s6djAZSD3Y+Mt5Oj9BEzRVkxOVHie5/Ua/
	VIERBj8J6zRQ4xkhoxENa6gDKIGR9K5iVXc/9J7yj05RfJlIN1xFsLP5/JuflU0vTTkixG4uwT65O
	VvTIiziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnB-0000000EI3Z-1h5G;
	Mon, 01 Sep 2025 23:18:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut9fN-0000000DcEu-0wT8;
	Mon, 01 Sep 2025 18:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52D2260008;
	Mon,  1 Sep 2025 18:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F084C4CEF0;
	Mon,  1 Sep 2025 18:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756752847;
	bh=Xi7uJgeT47v5WYcTiHi2K9OVW5hfR4RMt06x+KdFnog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e63V08Qnr70i/tV4xWOR8B5RSztHrVzdM3ydH2V1ggNY8gNaiGtWogePeB7RR0/0O
	 MfrcDP3qJZLfXGA/6gJlHPTTm7CHEvCcMfFDIpFT7kqTFAaPHzDYKZHKEPvFzKYSlp
	 2qhTimTNpTzgQB85Sr8wNXxOLfSaNVbktR+1QjNJe79YcsWIDIb2synEt2oplOtXvO
	 Y6a9sDZ7n2tx3V+oNQaGcy3pimB8Swsudv97Hl+XW6djS3V/1ktd8NGgg6mi/IALSs
	 RCRWQXuiAVOjZlE221VncgOw4grGKxGgpbsbhOmaWErFsJNWxZptPTGtTOadpmYpU6
	 AkXRkQi7HjkZQ==
Date: Mon, 1 Sep 2025 19:54:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA105X/1048
Message-ID: <20250901-diligent-dreaded-59b9ad5c3976@spud>
References: <20250901-can-v4-0-e42b5fe2cf9e@nxp.com>
 <20250901-can-v4-1-e42b5fe2cf9e@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FeGVNRkXCgteXrc9"
Content-Disposition: inline
In-Reply-To: <20250901-can-v4-1-e42b5fe2cf9e@nxp.com>
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


--FeGVNRkXCgteXrc9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2025 at 11:18:11AM +0800, Peng Fan wrote:
> The TJA105[1,7] is a high-speed CAN transceiver which is a pin-compatible
> alternative for TI TCAN1043 with sleep mode supported, and has a compatib=
le
> programming model, therefore use ti,tcan1043 as fallback compatible.
>=20
> The TJA1048 is a dual high-speed CAN transceiver with sleep mode supporte=
d.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/phy/ti,tcan104x-can.yaml   | 30 ++++++++++++++++=
++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b=
/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> index 4a8c3829d85d3c4a4963750d03567c1c345beb91..f8e0c24856a2ba83b5c988b24=
6464f47e11a032f 100644
> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> @@ -19,18 +19,25 @@ properties:
>            - enum:
>                - microchip,ata6561
>            - const: ti,tcan1042
> +      - items:
> +          - enum:
> +              - nxp,tja1051
> +              - nxp,tja1057
> +          - const: ti,tcan1043
>        - enum:
>            - ti,tcan1042
>            - ti,tcan1043
> +          - nxp,tja1048
>            - nxp,tjr1443
> =20
>    '#phy-cells':
> -    const: 0
> +    enum: [0, 1]
> =20
>    standby-gpios:
>      description:
>        gpio node to toggle standby signal on transceiver
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

You're adding a second standby gpio, which one is which?
I assume you mean that item 1 is stbn1 and item 2 is stbn 2 for tja1048.
Might be kinda obvious, but I think it should be mentioned.

tja105{1,7} don't have a standby gpio, but they do have a silent mode.
silent mode seems fundamentally different to standby, since the receiver
still works. Seems like that should be handled differently, no?

> =20
>    enable-gpios:
>      description:
> @@ -53,6 +60,25 @@ required:
>    - compatible
>    - '#phy-cells'
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,tja1048
> +    then:
> +      properties:
> +        '#phy-cells':
> +          const: 1
> +        standby-gpios:
> +          minItems: 2
> +    else:
> +      properties:
> +        '#phy-cells':
> +          const: 0
> +        standby-gpios:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.37.1
>=20

--FeGVNRkXCgteXrc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLXryQAKCRB4tDGHoIJi
0udxAP9nOX9SHvGfe+kYTOpLO/W11mN1b3yO33WzvHLUTObYXQD/WIoItvlF1YeL
S0+fgQThRA5/J2UGH/Qksz2gTzAzMQA=
=FTGQ
-----END PGP SIGNATURE-----

--FeGVNRkXCgteXrc9--

