Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99029C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+NtRvec8F8aekKuz6iezeEslYswvJ60lH8RuxMxcZU=; b=iQ2mWE82KgIoCpSzZWiQ0WScpD
	f7wFiToVdOwRfw/EXw0b9ytXqcjX8aGhlfvVkcuW1pLzlSY1IT+8J48rIAhhMsB1qVfo6HjFMONFh
	sZRH1lKnRApBjmLQFCUTLavF3S/lYts5n0mxSRWP21hbeKGffCW2Z0IJRfr1q1LC+9fjbflVYknQI
	9zZKIXQIWEq7RCd7LNAG29IakWiYox0oIJDITQspNFVk7yWQ0Ff8v6yUO0dsLbwN00jL8YvX+VixB
	f9Ty78xQeHDDIYakQkoIwoGATxWXqGeP1SERyPAG6kTX1+ABqGOdLV7A/PcA2NcDmUxwjHV/LzVJT
	gtL7TOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkXX-00000001gGm-1Xfq;
	Thu, 09 Jul 2026 08:55:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX4-00000001f1A-0cor
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:54:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B656243F84;
	Thu,  9 Jul 2026 08:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2D41F0155C;
	Thu,  9 Jul 2026 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587297;
	bh=E+NtRvec8F8aekKuz6iezeEslYswvJ60lH8RuxMxcZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ev/MX5jc/Q/G6Qw04KbVPZw5mRQE+925mjjdbilnfAAOVJNfB1vqvULVLTCS81vKk
	 wN2ytgPlflg25QwFvcSP2Mv0/Og4TU7H5c3xEcu8NHXE2ECgL5+5plo48ZJQVghFzF
	 ARE7QFfwFhP2oxWPJQtYxV8h4ax//Sd33HlQF2Bo5rtU+5NcVs10Z9Cev8yw3fQhzM
	 74/hC6VBgPCPGTR9nk/d7uzrDgXFSYvRHsdwaKfU4yNLh06rO1EPX2L5jhL+ypVDGJ
	 d3Hgo4aJ7/3SoluWgBzvIxxhHBj0j/dKNRgKt+m0jpCu4Y9TGMHVfy4bB/NJB0jyl8
	 5sg4Dq9ZRwf1A==
Date: Thu, 9 Jul 2026 10:54:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
Message-ID: <20260709-shaggy-discreet-dodo-e5ffbb@quoll>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <501428d6a6cb1548bf357c25313dbc319724ead2.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <501428d6a6cb1548bf357c25313dbc319724ead2.1783524645.git.gregoire.layet@9elements.com>
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

On Wed, Jul 08, 2026 at 03:35:54PM +0000, Gr=C3=A9goire Layet wrote:
> The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
> The ASPEED AST2600 can be used as a PCI device.
> 2 Virtual UART can be exposed to the host via this PCI device.
> These are 8250-compatible register sets and can be used to have UART
> communication between the PCI BMC and the host.
>=20
> This boolean can be set to specify if a VUART is used over PCI. A VUART
> over PCI needs a syscon phandle. The syscon gives a regmap to the SCU,
> which is used to set the enable bits of the PCI device.
> On the aspeed's chips, the clocks phandle already points at the SCU node.
> But deriving the regmap from the clock provider would misuse the clocks
> binding. An explicit syscon phandle states the dependency directly.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index 8f22121381fc..2ea8981bba80 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -27,6 +27,16 @@ allOf:
>              enum:
>                - aspeed,ast2500-vuart
>                - aspeed,ast2600-vuart
> +  - if:
> +      required:
> +        - aspeed,vuart-over-pci
> +    then:
> +      required:
> +        - syscon
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-vuart

else:
=2E..
disallow new properties (see example-schema)

>    - if:
>        properties:
>          compatible:
> @@ -223,6 +233,12 @@ properties:
>            - const: uartclk
>            - const: reg
> =20
> +  syscon:

That's explicitly forbidden by writing bindings (and mentioned as the
antipattern in my older talks about DT).

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the SCU syscon, used to enable the VUART over the BMC P=
CI
> +      device. Only applicable to aspeed,ast2600-vuart.
> +
>    dmas:
>      minItems: 1
>      maxItems: 4
> @@ -316,6 +332,12 @@ properties:
>        polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
>        applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
> =20
> +  aspeed,vuart-over-pci:
> +    type: boolean
> +    description:
> +      Enable the VUART over the BMC PCI device. Only applicable to
> +      aspeed,ast2600-vuart.
> +
>  required:
>    - reg
>    - interrupts
> --=20
> 2.54.0
>=20

