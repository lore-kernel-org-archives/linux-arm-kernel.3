Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEFCF532CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40hYrgHMhL5Y3sgIvyGDHr2DSh4JcFjI1IXGpM/589E=; b=475ezd1py4oQTOOeHNl3bX9Pfa
	4wut6b0NmnICBFthww7PqcPAO1oP4s+4nLWWdhdssTckpkpIoP4a5h8bFHW84Cy5MJUVLLbJD4135
	R8AkKQfyxZ05Acwk5PWySF+TOiSjfCN+AeWq3luyCtXjsp9VFRfckMZvecyoToZ0ixNejG9ZFN4Zu
	YhoU6gIvTbX9xUaavI6Rhgq+97Q556zpgQwtT6tzGd8G45Lq14MoZziw54RGMtqvAUQGLedMl/b5j
	PLEpEssFCD5TKThNdYGsbeDM5ILXP3f6EHd2ALPs/w3QUBLoo/I/X4Dmjnh49XXuZ4QzLNgVuEQma
	VgcpUQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sBL-00000000SZo-3Un8;
	Tue, 24 Mar 2026 03:11:51 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sBI-00000000SZI-2XB2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774321899;
	bh=40hYrgHMhL5Y3sgIvyGDHr2DSh4JcFjI1IXGpM/589E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E8hVtBNgBrNdvLlWQvKdjHzlxebKnv8/HKVeiS/DFd3RTyaMLM8i+lnyTJLUyqnr1
	 5oRE0irl1i5UBIeJ+/lz6onh2hv1Mg4d4Cj1xC8RNAAChpl7eoCItUni3F0TUoG7pT
	 brHVXfEIUCGD0f//XMqUytT4jc2dqB+rDmmnVmDTyrmHzYtoDbiu3sZBR2mXO1HPIv
	 vhuugmBNZWegkcJlc0y6P5gnPNRLuEbzAhlbYrORsfXNnOY1wetPJ3LqYkgse9r/On
	 c2JhmK/wPo2fBHKDGUjamOc/QPN5gwwp46CruZ/qVp5cVLwt2eEgG8Z1CQCe1jIElO
	 WFCplhl1kCfgw==
Received: from [192.168.72.167] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 605EF602C2;
	Tue, 24 Mar 2026 11:11:38 +0800 (AWST)
Message-ID: <405f6b1b4081ffb379a21bcdb5d2a8e81d2e2e3e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v27 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, andriy.shevchenko@linux.intel.com,
  Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Rayn Chen <rayn_chen@aspeedtech.com>, Philipp
 Zabel <p.zabel@pengutronix.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Tue, 24 Mar 2026 11:11:38 +0800
In-Reply-To: <20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com>
References: <20260324-upstream_i2c-v27-0-f19b511c8c28@aspeedtech.com>
	 <20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_201148_845886_8F2B1F6B 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Ryan,

> The AST2600 I2C controller supports three transfer modes (byte, buffer,
> DMA). Add "aspeed,transfer-mode" so DT can select the preferred transfer
> method per controller instance.

This patch does not add an aspeed,transfer-mode property.

> Also add the "aspeed,global-regs"
> phandle to reference the AST2600 global registers syscon/regmap used by
> the controller.
>=20
> These properties apply only to the AST2600 binding and are not part of
> the legacy binding, which uses a mixed controller/target register layout
> and does not have the split register blocks or these new configuration
> registers. Legacy DTs remain unchanged.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v27:
> - change aspeed,transfer-mode to aspeed,enable-dma.

What about all the previous changes?

> ---
> =C2=A0.../devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0 | 17 +++++++++++++++++
> =C2=A01 file changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> index de2c359037da..38da6fc6424f 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -37,6 +37,21 @@ properties:
> =C2=A0=C2=A0 resets:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> +=C2=A0 aspeed,enable-dma:
> +=C2=A0=C2=A0=C2=A0 type: boolean
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C bus enable dma mode transfer.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASPEED ast2600 platform equipped with 16 =
I2C controllers that share a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 single DMA engine. DTS files can specify =
the data transfer mode to/from
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the device, either DMA or programmed I/O.

As we had discussed: this does not define the transfer mode, only
whether DMA is available to the peripheral.

Why mention the 16 i2c controllers here?

Please keep this description simple and relevant to the specific purpose
of the property.

> +
> +=C2=A0 aspeed,global-regs:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle reference to the i2c global sysco=
n node, containing the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoC-common i2c register set.
> +
> =C2=A0required:
> =C2=A0=C2=A0 - reg
> =C2=A0=C2=A0 - compatible
> @@ -59,4 +74,6 @@ examples:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resets =3D <&syscon ASPE=
ED_RESET_I2C>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-frequency =3D <100=
000>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI =
110 IRQ_TYPE_LEVEL_HIGH>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed,global-regs =3D <&i2c_=
global>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed,transfer-mode =3D "buf=
fer";

This example does not match the binding.

Cheers,


Jeremy

