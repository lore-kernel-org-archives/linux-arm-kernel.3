Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3717C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 01:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSBVJ/HRqS9Lf9qDswgY8VH0zHUnhdRJwmPFV0FziDE=; b=fjmfFXypgXbhltY9l2Ob4U1FmP
	1SopUj1Eira23NgEBxlD+kq8uUXZd5IiU1d2UlhdS9G02CfDVYOhhwhjABG7ULuHxWfANH0/RnLBz
	503ww5/vtxoqz3KIFQOlywrViCt1aZKPg2i1B9CZNzTyRXSKwHCnfs53uzbDf9lxn0nw783HccK45
	5acnHWY8hEKMIPa8w2QV6uLCxowii2tIMY1O919zMPFcnCwiXh5XXwAlCx2SFVm8L8wS1J9qeF45m
	indR3kNCm6IqrFBXc6l1PNZ/wCPk7bwhChAKSQxwnVh7dOwiFmIY5BwcVDgVwe6mL5A/SWHL1PDlz
	um8yFy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyL9w-0000000EaxY-1mea;
	Sat, 29 Mar 2025 01:38:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyL8D-0000000EanB-0m1a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 01:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1052A43056;
	Sat, 29 Mar 2025 01:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6478C4CEE4;
	Sat, 29 Mar 2025 01:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743212223;
	bh=o5gMyn/mlm4eQI/Dl0X9AbYok0h90x/eTaw9nzXxVOE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NxBdoQmZGTDH1AlPECrbDPD9Q2HdKGVHCD+APkAyVEB0q3uQbazXzYky6Uk/oQhz/
	 pdOGfSrTaKOgAc4VcVRZfAEeiI1qeZe5rcQqtMxARHt39JOCgb5oXdNc/2+oIqllVj
	 kPhKxEbmrxXvFX44pgNw4bTya/KBOWJsy0KjRBDxKq1Dz1p8lF3wAnWKakTdKgv4h0
	 WsD3vYjVelPUch+0ShOmeqVCeu6YY4m3tH0m3xXswnSorSpmpTv4rSzOOME1zfSw61
	 mcWfEv4Lhqbm3mkPpViVSSVrKEeRZWdoBKOdvvFdV+du49Rm3Q6ucakKlxEwxFgCHs
	 0O//k268HPjvw==
Date: Fri, 28 Mar 2025 20:37:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: davem@davemloft.net, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>, 
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Lukasz Majewski <lukma@denx.de>
In-Reply-To: <20250328133544.4149716-2-lukma@denx.de>
References: <20250328133544.4149716-1-lukma@denx.de>
 <20250328133544.4149716-2-lukma@denx.de>
Message-Id: <174321222112.2172775.16689010014876150131.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add MTIP L2 switch
 description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_183705_293231_D76D9575 
X-CRM114-Status: GOOD (  12.79  )
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


On Fri, 28 Mar 2025 14:35:41 +0100, Lukasz Majewski wrote:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - e.g. imx287.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v2:
> - Rename the file to match exactly the compatible
>   (nxp,imx287-mtip-switch)
> ---
>  .../bindings/net/nxp,imx287-mtip-switch.yaml  | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.example.dtb: /example-0/switch@800f0000: failed to match any schema with compatible: ['nxp,imx287-mtip-switch']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.example.dtb: ethernet-phy@0: interrupts: [[13], [2]] is too long
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.example.dtb: ethernet-phy@1: interrupts: [[13], [2]] is too long
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250328133544.4149716-2-lukma@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


