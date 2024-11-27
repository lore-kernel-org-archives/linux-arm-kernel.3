Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D6ED609A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apZY2jaHvTNc4U3ylUr5D3vyZVo+OeQankAYKv1wegI=; b=YwDE84V+pg+jjRiJUe9CUBMIxD
	fp/xbJEqXIuSR/DlGLsIOjSKL8bognMxWz0r3T8hpmsEDVeD9Tg0UjwpepLzuQFweXn7u9oh6ssso
	l8DQ6CnyE7CGop0eon0VM4vtpxmxw0nW55UVNMXq7jKRsxpb3WzVCy9jdzo24ce6GK0sHSW+JwroW
	zT5WKrA8ppjDvJq4fMN1LznC1//t8nG2s2fx6C/pI/f60hvxZ4icUIeuc31ALkCyd1B/QgsejgQ2m
	ATAlnpiVU1eENqYyeDpKld8lJo7GWVoCxqjQkjZbWpoJiJB7BBccbAEn+ZNZzhIN6HCw18hh8DM9G
	AVparTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCRs-0000000CR4b-05Ci;
	Wed, 27 Nov 2024 07:26:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCQt-0000000CQqI-1PNx;
	Wed, 27 Nov 2024 07:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFD1CA4008C;
	Wed, 27 Nov 2024 07:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908BFC4CECC;
	Wed, 27 Nov 2024 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732692354;
	bh=pGn4kfUpOcmSqIS3vciAoVzfQoYoykNksqMjg/m4A7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkPR3K+q9/8URcH8C1V9tbKnvOkEYNvce4wjGS+JjcSOtIg5zBrEcLGV/FjQpBoiI
	 ipMIk0Tc4GMhmo6IlkpOsvurupAzoNNZHQEq+E7eCOQfXaC6JFVUstjXQkXMK4tukD
	 sGMvEigQ0Ibn2NNbdGs+L3Q2e2/rJci+OmZXZjvLUYPBOE+I1Bp+4RXrhd1yBtCPdr
	 YSXXYfuzl8PblXfiBkBASVJgPZHNHeJItzyM6T4Vxv+/ePAzlaPIhmJtK4GgqD/vqW
	 edPmHNHnOp1pAjmOYklohnnAMTkXUVLMa+XSIFzxtaSpP4RBlyV0DUOTJkx65xXVwN
	 Skzfg2Zxdd5Zg==
Date: Wed, 27 Nov 2024 08:25:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	mripard@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
	alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v19 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <b6m4c5qbjbwdwuycunhoe6hj3akmqb257havourydry4wlrmkn@hmzkyodyqz4n>
References: <cover.1732627815.git.Sandor.yu@nxp.com>
 <e495a40a0add052d4f8cdeb4a81ea7408cdccaf6.1732627815.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e495a40a0add052d4f8cdeb4a81ea7408cdccaf6.1732627815.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_232555_502905_395F87C0 
X-CRM114-Status: GOOD (  16.07  )
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

On Tue, Nov 26, 2024 at 10:11:48PM +0800, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v18->v19:
> - move data-lanes property to endpoint of port@1
> 
> v17->v18:
> - remove lane-mapping and replace it with data-lanes
> - remove r-b tag as property changed.
> 
> v16->v17:
> - Add lane-mapping property
> 
> v9->v16:
>  *No change
> 
>  .../display/bridge/cdns,mhdp8501.yaml         | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> new file mode 100644
> index 0000000000000..24abd8447a28c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP8501 DP/HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mhdp8501
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP8501 DP/HDMI APB clock.
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      phandle to the DP/HDMI PHY
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug cable plugin.
> +      - description: Hotplug cable plugout.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port from display controller output.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Output port to DisplayPort or HDMI connector.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes

Drop, not needed.

> +                minItems: 4
> +                maxItems: 4
> +                description: Lane reordering for HDMI or DisplayPort interface.

Blank line

> +            required:
> +              - data-lanes

Blank line

Best regards,
Krzysztof


