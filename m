Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4238CC55171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfyPXuzHFrgeP1BY9ER7yd6RDg+vnAlA5a1UueZqk9w=; b=xO63yt71xmNyHNjfw7SJa+MulH
	JxawxaESmUkw+SDNng/1zmSchyVNheyQwKPTDGWQrTH9ZXmGxZCWke8kc5fsFgN+bTf9n3PobyUvW
	NQ0CW0MKJFU4sKkJWk/S6S2amR5cwGFcJMQzKEagsw+82Jz9tLEeILq5Z+YGy56YfUUqtW+ECbEH4
	7B+EgOejnqSoGAuLeYYjsC/s1X8ZzTz4fqXNUXPI53Onu+4znkoGDU6W5SrkttAOL/p4L+TisP2jn
	Myu2bPp9kMUae+YzO+HpnIuoPjLEg3ZWKYL/iGP1qNciMtDid83gWtrN+8TJRWHMQGpYaIJCRXtXH
	xieDy/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpwCU-0000000Dhnb-0SyB;
	Fri, 31 Jul 2026 22:59:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpwCS-0000000DhnS-04RT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 22:59:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18280600DA;
	Fri, 31 Jul 2026 22:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72EA1F00AC4;
	Fri, 31 Jul 2026 22:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785538770;
	bh=MfyPXuzHFrgeP1BY9ER7yd6RDg+vnAlA5a1UueZqk9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bS9G3Tec/7Iy9FTjR8vc35fepxYxeZolPIHJV02pj2ppUGeoTRKcFKKGhRbqiSXew
	 HsOvWKZBgUpMdQ/eyCcedegXjjYiRJwoWtzh61y7pDRek2U2DCufuxMLjYuCaDsRD/
	 BPreSUDR6nrs8I/HbLH1ojemW4lQ3rlq1E/EpeW3aylLWZ/blntGAjantnwPuabuGd
	 GnBywAxhFeSOEeLz0MQySmdvT6qj4wfTxvDMR3vjK7GAyVSDUjaVtaKu6j+txfsZTq
	 EXoV9Rp/xNnSavV7kTsyHEVeIOUyVSX6W5j+3+zd5YL0q3iFt3WaFGvMJk/gFCOxNK
	 sWLwJX8xX0c0w==
Date: Fri, 31 Jul 2026 17:59:30 -0500
From: Rob Herring <robh@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port
 binding to support multiple pairs
Message-ID: <20260731225930.GA2098187-robh@kernel.org>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
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

On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> The existing binding exposed only a single generic audio-graph port,
> which cannot represent the individual pair endpoints.
> 
> Add a ports container that enumerates three named sub-ports:
>   port@0 -- pair A
>   port@1 -- pair B
>   port@2 -- pair C
> 
> Each sub-port references audio-graph-port.yaml as before.
> 
> For backwards compatibility, keep the old single port property but mark
> it deprecated. A schema constraint (not: required: [port, ports]) ensures
> that both forms cannot be used at the same time. Update the examples to
> show both the new ports form and the deprecated port form.
> 
> No existing upstream DTS file for fsl,imx-asrc uses the previously
> documented single 'port' node, so this change does not break any
> in-tree device tree.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../bindings/sound/fsl,imx-asrc.yaml          | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> index 608defc93c1e..18d252722aa8 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> @@ -78,9 +78,29 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: port for pair A
> +
> +      port@1:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: port for pair B
> +
> +      port@2:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: port for pair C
> +
>    port:
>      $ref: audio-graph-port.yaml#
>      unevaluatedProperties: false
> +    deprecated: true
> +    description: deprecated, use ports instead
>  
>    fsl,asrc-rate:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -125,6 +145,10 @@ required:
>    - fsl,asrc-width
>  
>  allOf:
> +  - not:
> +      required:
> +        - port
> +        - ports
>    - $ref: dai-common.yaml#
>    - if:
>        properties:
> @@ -188,3 +212,57 @@ examples:
>              };
>         };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +    asrc1: asrc@2034000 {

Drop unused label.

Presumably the existing example uses the deprecated 'port'. If so, just 
modify it to use ports and drop the deprecated part.

Rob

