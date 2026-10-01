Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6ACCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Lm+M8MVG2/j/DA3KhX8RKq6lO3WVRmuquhIWhMi/v0=; b=NeYtVYSjNV65EeVO2oPAONakkO
	60jh7LI+8N0ajvrApVimfZSKG0/8Y0ODn9+I+P5WQdcf9MnpJos7WaokRO4MOb3uDUOpwxhJseQsP
	ZePqKjNJ4MoVIHDPcjfP+iZHVSuEwqJOqBLllWU7AhbRG95UND+ZvEvQxIGL56rbR9KhwnhHtRDam
	Mbd2jOkrYw260FlqEzh6vOSu+dZuSMtfhAF2uuaAIezhIZ8EU1/koTxhH1bVS77rvJvb8ozmLSdKe
	ur6h8BpX6Lxu80fvefw9Ga8B1eI/Si3+3rYeBz2F7ha2JzOL+Ed4gvAvdfbrwIq/JCfNeYWTU6uMS
	grTrVgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLpC-0000000A2KR-16OQ;
	Thu, 01 Oct 2026 18:48:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLpB-0000000A2KL-1Sko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 18:48:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7B0660218;
	Thu,  1 Oct 2026 18:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE421F000FF;
	Thu,  1 Oct 2026 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790880488;
	bh=9Lm+M8MVG2/j/DA3KhX8RKq6lO3WVRmuquhIWhMi/v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bZ20jGkZHznyMIEhpnnAzGW75hk1BQkMfu2cHp8YVOazEL1VlT527GDs4WDbtbh0y
	 eGsUW5cf5fqfMkoMHPq99wXm8NeWgVNJLPLfto+SxMgFKAkSelYwRn6APWGRrtqVKv
	 FoJMqu74pwXtGjkMyKOpWCs7Q+wLQPz9AHqfOEKXerCKngzwF+Py90HMmcph5rkuwk
	 iwhtbxnDmi1L0Xe5kRi56YUJFvUuGumbgWu5E9828OST4/7rKLRgfF/Xb6+8uUBusj
	 BODm+oo3H2rR/NrOKMBBIqECSWBO787ePM4ojDUCGEgchV+mRsvJH+fz9CajwXRCSq
	 xOPc6tQVWB1bA==
Date: Thu, 1 Oct 2026 19:48:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Drew Fustini <fustini@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] dt-bindings: serial: Add Cortina Systems
 CS7542 UART
Message-ID: <20261001-depose-jawed-f58674109fe7@spud>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-6-4617c4463529@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1lectGXiRA3UGBbo"
Content-Disposition: inline
In-Reply-To: <20260930-b4-cs75xx-v1-6-4617c4463529@gmail.com>
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

--1lectGXiRA3UGBbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:00:05AM +0300, Fil Dunsky wrote:
> Add the binding for the UART found in the Cortina Systems CS75xx
> (Goldengate G2) SoCs such as the CS7542.
>=20
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/serial/cortina,cs7542-uart.yaml       | 50 ++++++++++++++++=
++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/cortina,cs7542-uart=
=2Eyaml b/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
> new file mode 100644
> index 00000000000..2f8bda97ff8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/cortina,cs7542-uart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cortina Systems CS7542 UART
> +
> +maintainers:
> +  - Fil Dunsky <filipp.dunsky@gmail.com>
> +
> +description:
> +  The UART found in the Cortina Systems CS75xx (Goldengate G2) SoCs. It =
has

Different SoCs need specific compatibles.
They can fall back to the cs7542.
pw-bot: changes-requested

Thanks,
Conor.

> +  transmit and receive FIFOs and a 24-bit baud rate divider running from=
 the
> +  peripheral (APB) clock.
> +
> +allOf:
> +  - $ref: serial.yaml#
> +
> +properties:
> +  compatible:
> +    const: cortina,cs7542-uart
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    serial@f0070110 {
> +        compatible =3D "cortina,cs7542-uart";
> +        reg =3D <0xf0070110 0x30>;
> +        interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&apb_clk>;
> +    };
>=20
> --=20
> 2.53.0
>=20

--1lectGXiRA3UGBbo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6q4wAKCRB4tDGHoIJi
0hm0AP94GGT1ED51TBPnDueYYfZC+gGoGhnv3U8yJmaowoaOkAD/Q0gGutHzijrB
16kj6FFFZcyk14oFJy5rp8uSc9d1vQo=
=IU4d
-----END PGP SIGNATURE-----

--1lectGXiRA3UGBbo--

