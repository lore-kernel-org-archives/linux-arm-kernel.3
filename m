Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE42BC7EE3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNSmynbN4CypUVCgPdo9K0JjhBHHrRUS4VUlnbwPz1g=; b=eqctX8Yn5uf2l2oXvXf9oFnwzx
	xvjponUzUM4/OM8WDiNXTY4rV8uP22JJle6HrrHbjhcugJ3tbit8reUPAGZS7NELP9rDk4RtCATuB
	zDrtKHwLgbJPZYiLQPAgC4Q/SPiv8Xym8ic3/HR4KX0qCG33RnELaJhxt8a2EyhYbKK1zsCNSvGIt
	BAMbISfkSasKZ5QXGK56sMj1rZCyRtsg+kdJ2OBuegB0xYPr/BYNkWIPrr8zVHO9pPIZRzbYNUgAO
	FyjxlA7X0wax8ZNsHZSG5z2aB5App0dG0z5C6/rWJT4RaExHr394nHFL/fWs7OfFZ5LQfgcV9lxMg
	U5S/qdJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4L8-0000000DwUM-0W1r;
	Fri, 27 Jun 2025 08:21:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4GX-0000000Dvty-21IE;
	Fri, 27 Jun 2025 08:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A264D6143C;
	Fri, 27 Jun 2025 08:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEBFC4CEE3;
	Fri, 27 Jun 2025 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012216;
	bh=U5s9iEMSbWh9IK7RltR780D3binhRP0cWZphzDzaaHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaRZCi9hyS1TFB/6tfgC0csFv4IxtOprlLG5DcPHHj16yXQENW0cUnsHdVsPv9cMx
	 t3N17ORjeqvREbx+w2UYGGLJ96P8ozvDNAKGtXAuLme9otsRCyt8vXjGoeUO+xawHI
	 7MTozUbELHLWy+ZIZeAXNyb+JSekvOdms4liIFvfEZoYo4cPrMqHLFfpUErfufmkso
	 ZLE6fD1VE96JOgNTFQkC0qbeDSmVzunJuSf2YgykOONTB0p9dhtkQ5DQ1oKg/crkWZ
	 yrI2mhw8Fb+5RqGfOVxjqOZqTutv2LzEX4aohTqxp434Wa4Ht0Mn9U14cht2jbrPQB
	 iywRgC33cR8IQ==
Date: Fri, 27 Jun 2025 10:16:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/6] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20250627-premium-clay-husky-9d32bc@krzk-bin>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-2-angelogioacchino.delregno@collabora.com>
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

On Tue, Jun 24, 2025 at 09:35:43AM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
> 
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6316-regulator.yaml  | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
> new file mode 100644
> index 000000000000..019c3c36997c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  The MediaTek MT6316 PMIC is fully controlled by SPMI interface; it features
> +  four step-down DC/DC (buck) converters and has multiple variants, providing
> +  different phase configurations. In particular:
> +  MT6316BP/VP:    2+2 Phase (buck 1+2, buck 3+4)
> +  MT6316CP/HP/KP: 3+1 Phase (buck 1+2+4, buck 3)
> +  MT6316DP/TP:    4+0 Phase (buck 1+2+3+4)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6316b-regulator
> +      - mediatek,mt6316c-regulator
> +      - mediatek,mt6316d-regulator
> +
> +  vbuck1234:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +

Here you define all regulators

> +additionalProperties: false

This goes to the end.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: mediatek,mt6316b-regulator
> +    then:
> +      patternProperties:
> +        "^vbuck(12|34)$":

Every device has different regulators, so there is little benefit in
keeping this in one schema file.

Best regards,
Krzysztof


