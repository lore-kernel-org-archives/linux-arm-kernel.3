Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05D6C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zGhfeNWutZIS/N5QgFqSZYigMtDnoHfxo8qfq1LWHs=; b=Ztd+x8MOuoMRWcm6ubxkqkZqr+
	stoiFoqzU6uMqZe3J4cx97Af3BTvc9NU6sjTP4T8CfmcTBe1mmMdGh8Lv4LtE2xF38OxC4LYNImrT
	0qHj5LXXncFBrViQcHtMtKTyUwLdSf0WKyCS4AWIqUGcPQHcRyjNfNGOcToaRGtklEuzC2FoSZpzZ
	I55Hl8JP07BtynPeAtKnmJ2+PdM2z/x8SjuWFBoiWAU4QEUGdoey+tP5qFK0IELhtR8AgOLxUTgvk
	oecVDH9bqDpS7gWTDv0pqAedrr74RSCStv/tsSU/ML3TBuYcI6OkSZxVJejpXATL3Z5aPZHHHpH9R
	9TXg43Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4NP-0000000DwsP-0WKQ;
	Fri, 27 Jun 2025 08:24:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4IF-0000000Dw6B-0VOv;
	Fri, 27 Jun 2025 08:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8546E6143F;
	Fri, 27 Jun 2025 08:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9D9C4CEE3;
	Fri, 27 Jun 2025 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012322;
	bh=/o9ZO57wn41Pket5Wzm+vGinxIbfR+TSFjHBB2eIaw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqPvWOJUhq4fNqUaLX6/zVEbiJ2ufRXlXJd7iW5yx4AHgsSLPzllrYXxv9XZzT9+2
	 G8WzmyyT9tjvwtDSzZU5k8kzB1IgZ+LVupkvMVDDxDg125evJNNdWpdryOPa+WFEXY
	 Ln8Msa63aBbT1ragSp1KsJhOg7xOtAHByGSVqQjoxkwoyAAq0p7KfuxvnY5DjOcWns
	 OGbi+1/L12w6tXsfPCFRZQXn/MccoPSWkQF+5WKzwAgZNWNU+7XuEYnyuIFkVETk53
	 3U05TSllX4qHMt7Qc1RzWLDIPF/o9mQp3I7Spdz1Lz0nfnrddAvc0AoP0qbi/8q1D9
	 wTS106R9JjfuA==
Date: Fri, 27 Jun 2025 10:18:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
Message-ID: <20250627-neon-hidden-sheep-ed8dae@krzk-bin>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>
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

On Tue, Jun 24, 2025 at 09:35:45AM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6373 PMICs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6363-regulator.yaml  | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> new file mode 100644
> index 000000000000..f866c89c56f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6363 PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) regulators
> +  and can optionally provide overcurrent warnings with one ocp interrupt
> +  for each voltage regulator.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6363-regulator
> +
> +  interrupts:
> +    description: Overcurrent warning interrupts

Are you sure interrupts are physically not connected?

> +    minItems: 1
> +    maxItems: 36
> +
> +  interrupt-names:
> +    description:
> +      Names for the overcurrent interrupts are the same as the name
> +      of a regulator (hence the same as each regulator's node name).
> +      For example, the interrupt name for regulator vs2 will be "vs2".

You need to define the items or pattern if this is really flexible in
the hardware (not drivers).

Best regards,
Krzysztof


