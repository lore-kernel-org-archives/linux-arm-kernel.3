Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0626C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKUES4VcsmJdL3FqTEgJifFWx2SilAMHf+bjiSb8+Bs=; b=gOjXDOs0K5Ri8w/3HuPmOErsHP
	XlCT+xBR8xRp379q3Ie1mvofxM0iMTBsyORwN1fkbFivBAN+8ekyoXTwqYyhWqDITyWp8tvoZQCUN
	27zKojlQTUksEETEriQZp4z+CJIZKIjJJujklCVfVJyg1hEchAQ0DMT/k53N+b0/BI6+Pv0C6MAm3
	uxltspl1oYeMZjdI2dx03SwSXslexQCvnvbZPcvcSXc4d7kJ/kRv/uyu2HiU3QoYYxslEhUuigJJL
	2cz4eUC4UKanqnbGbXyYi4vGa45nqR3KeolsKxV36bNnsRtKjqSEdm9odf6k/mIFK8ziVhR+cfjIY
	EJHuNVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5C9-00000006lIo-1gCp;
	Tue, 11 Mar 2025 19:23:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts59K-00000006kto-4ALz;
	Tue, 11 Mar 2025 19:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB323A460D0;
	Tue, 11 Mar 2025 19:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2667BC4CEE9;
	Tue, 11 Mar 2025 19:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741720821;
	bh=kcpuPf65uj8+Xtj1e9eOmZyXND0tqkIgzzMQ+yLTfRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnzpMvk0sZD2ybFPnFuUmHST+AHXtX+XKsjOttTZFgArB5KLfUeESvN6y3+9+rnvV
	 zvBj0jTFY0ExBrdPpeJKq76DplD1a30rUmSPJFLcPBG3mS/lYfSKymTCjNF7SrQY2/
	 zfE7Z3vjDtaCDNORb4zfB/ZhF8mBtDq2Wa8R2kC8NXHwXd6druJpSOsDpOI85Z3k3a
	 Jd7VGh5yRZmaTG5uABfqNuOwqiaD9WrGSpRlxkGqXqs7yOJjoFX794Bfj+8N5dk85d
	 1CsQpuPwHE2QYmpwVFE4iOCRfCvzB2jrBT+bCeiE1cltEk5loeXcgCKrrtNdP/QIrZ
	 3A7illovJkQUw==
Date: Tue, 11 Mar 2025 14:20:19 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 03/13] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Message-ID: <20250311192019.GA4067643-robh@kernel.org>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122023_174672_2E277D6D 
X-CRM114-Status: GOOD (  19.57  )
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

On Sun, Mar 09, 2025 at 06:26:48PM +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.
> 
> Each internal PHY might require calibration with the fused EFUSE on
> the switch exposed by the Airoha AN8855 SoC NVMEM.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 105 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> new file mode 100644
> index 000000000000..63bcbebd6a29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Gigabit Switch
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  Airoha AN8855 is a 5-port Gigabit Switch.
> +
> +  It does expose the 5 Internal PHYs on the MDIO bus and each port
> +  can access the Switch register space by configurting the PHY page.
> +
> +  Each internal PHY might require calibration with the fused EFUSE on
> +  the switch exposed by the Airoha AN8855 SoC NVMEM.
> +
> +$ref: dsa.yaml#

This needs to be:

dsa.yaml#/$defs/ethernet-ports

As that restricts custom properties.

> +
> +properties:
> +  compatible:
> +    const: airoha,an8855-switch
> +
> +  reset-gpios:
> +    description:
> +      GPIO to be used to reset the whole device
> +    maxItems: 1
> +
> +  airoha,ext-surge:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Calibrate the internal PHY with the calibration values stored in EFUSE
> +      for the r50Ohm values.

Should you be using nvmem binding to the efuse block? Or the efuses are 
within this block?

> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false

