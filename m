Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYl6gHCrVR/A+/kiIdOxnWNF3Rfy3eS4XK9j6S8445s=; b=x7dYGBgUkcXn/RoV6W/UhG5Uru
	sIF/PGSrjtVYDYO4owlJVtyXPAjMZgj86T94zccPyNYcKAXsswp92w9xP4RGVgrPxfjx0bo0eSwzU
	sCPmLEWIVmrqk+yPuhq3lVq9JktvOvVDTm+R2ZzS/eW8ATQZn26MNp7bQpYwq518qCKsYg/73DFfu
	+EgNUIYiZcwPJzzmYYXCJQOfHjM+O7sypcMwHTe/H5jE5JwH1aM3jbnz1Qr4/Hkvp6siguWzqqG8M
	l/s+G0UNcQJFd9M5rf7j6A56VIVqdNjAUs7AHinIo/d9fenCkV6N0xWt5ECoXsRkwjxVw7uZD9CLm
	m8DDiOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqKw-00000006Ady-0Xpu;
	Fri, 01 Aug 2025 14:02:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqFz-00000006A0u-1MTq;
	Fri, 01 Aug 2025 13:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B08785C6770;
	Fri,  1 Aug 2025 13:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC78C4CEE7;
	Fri,  1 Aug 2025 13:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754056630;
	bh=ODFfb+QAAqr6E6So/c4wBLjAbythTMbcmohhbIRP7Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HYVLna3I2WaENWcmwrOtQHlnHx9n5kSO61/R3IwON8bfkhKmTH5gg/W51WKGenC6K
	 ftQW4jUfeVAezxjBp/tQ7NzkUv5moGiHVAXVR4J9jTWPOM5zUjtTg02uicu7kR01fP
	 ERq8Tw2/2u0crORVkjSpEhy+oe/bTUujY2qtq/SUWsiO+4Xd0anTZXK5F+B2g6X0mD
	 Zxx1SciqjzRF5V2A4rRKT9G5ICLCfr/yg+U4N5B0JzyyrUpSqCFJYT4ON/zDMjEO0M
	 JwYPSGKiowhLEUtZWPO7atEaRjk2FhNhs3lu+4rMkVDgR/lkVY5NplpQzBQG1quCFJ
	 woym3/NjsyI3g==
Date: Fri, 1 Aug 2025 08:57:09 -0500
From: Rob Herring <robh@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de,
	richardcochran@gmail.com, guangjie.song@mediatek.com,
	wenst@chromium.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	kernel@collabora.com,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v3 09/27] dt-bindings: clock: mediatek: Describe MT8196
 clock controllers
Message-ID: <20250801135604.GA3045005-robh@kernel.org>
References: <20250730105653.64910-1-laura.nao@collabora.com>
 <20250730105653.64910-10-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730105653.64910-10-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_065711_442053_6BD1F28D 
X-CRM114-Status: GOOD (  17.56  )
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

On Wed, Jul 30, 2025 at 12:56:35PM +0200, Laura Nao wrote:
> Add new binding documentation for system clocks, functional clocks and
> PEXTP0/1 and UFS reset controllers on MediaTek MT8196.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt8196-clock.yaml |  86 ++
>  .../clock/mediatek,mt8196-sys-clock.yaml      |  81 ++
>  .../dt-bindings/clock/mediatek,mt8196-clock.h | 802 ++++++++++++++++++
>  .../reset/mediatek,mt8196-resets.h            |  26 +
>  4 files changed, 995 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8196-clock.h
>  create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
> new file mode 100644
> index 000000000000..03ee0dff464b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt8196-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Functional Clock Controller for MT8196
> +
> +maintainers:
> +  - Guangjie Song <guangjie.song@mediatek.com>
> +  - Laura Nao <laura.nao@collabora.com>
> +
> +description: |
> +  The clock architecture in MediaTek SoCs is structured like below:
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The device nodes provide clock gate control in different IP blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8196-imp-iic-wrap-c
> +          - mediatek,mt8196-imp-iic-wrap-e
> +          - mediatek,mt8196-imp-iic-wrap-n
> +          - mediatek,mt8196-imp-iic-wrap-w
> +          - mediatek,mt8196-mdpsys0
> +          - mediatek,mt8196-mdpsys1
> +          - mediatek,mt8196-pericfg-ao
> +          - mediatek,mt8196-pextp0cfg-ao
> +          - mediatek,mt8196-pextp1cfg-ao
> +          - mediatek,mt8196-ufscfg-ao
> +          - mediatek,mt8196-vencsys
> +          - mediatek,mt8196-vencsys-c1
> +          - mediatek,mt8196-vencsys-c2
> +          - mediatek,mt8196-vdecsys
> +          - mediatek,mt8196-vdecsys-soc
> +          - mediatek,mt8196-vdisp-ao
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      Reset lines for PEXTP0/1 and UFS blocks.
> +
> +  mediatek,hardware-voter:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      On the MT8196 SoC, a Hardware Voter (HWV) backed by a fixed-function
> +      MCU manages clock and power domain control across the AP and other
> +      remote processors. By aggregating their votes, it ensures clocks are
> +      safely enabled/disabled and power domains are active before register
> +      access.

I thought this was going away based on v2 discussion?

Rob


