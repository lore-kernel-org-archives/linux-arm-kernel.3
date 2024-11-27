Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950EED6ACE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QgeoMwwQ/zVURUh+xBvGWm4PvAxraqTpa6YFOp8Un0=; b=l/jKUSLdgmjX6glZI+m0PT+Cpq
	JNi5Q27cuPrnzQxjsNsBFzmUV0qMDVZK60aCWebRbFrzZf+vqaAqzxlG4hNdvIwyFdElo35LnvblS
	KWh2fliN8TdxxFq2RfVc2UUdMUJdRd4pUG83F7qbhCzwf9a47OB55pJ94+QguAyJcB4yD+nYsqK7a
	dNzQLkUo603m+vMUSA0u1JnvsRQ/kxYuuUr1edCM746u8nxrrUD+QCqo0EDgV9PDrPY0bpQOhPjsm
	jSjNhfP7CCjVuY2NasTCoc6XQ0T1qFMlx3+4YX8/OK+n7DdhzuE3UuSTOqb/jwkMLx+NvBxEffU/x
	2PgrHseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJnK-0000000DToe-1fnx;
	Wed, 27 Nov 2024 15:17:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJmL-0000000DTdI-3BRo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 15:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0358CA40E70;
	Wed, 27 Nov 2024 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B01C4CED2;
	Wed, 27 Nov 2024 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732720592;
	bh=73uSU84WC159XIEa9x/EDBuom42dzuqTcTszbM/yk0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geo9siy/nYm1+nZ7+jxEfER0rrXEjzKbIryvpQmVcu/R9vrmoZ5I4CvT/NFNbajdm
	 8Mq8gKeYC8ptnH79jDB6rM4pcJS0aSSHg+IYdu6fl4+4XA3tGCYxYThGGUbvKqvvph
	 +gYT2sHHKwOLDuIc38gwd8Zd0sf86KLO8FQYBxCCCA43kDko9zgvs8xfqysxL27g8n
	 7ysDVIg6GGCg6C3oWyxW7AwI96XAr7d1AMDFpix2LPJYxIHxg58pjPrie8/H93fG8Z
	 EF1iiC+u7jv+PrECbwAdWe6VVxoV2SJWJ0JFIdoJH0N/3ll99sa4E6xTkd+79LNUIe
	 7/d2z3hBqE5cQ==
Date: Wed, 27 Nov 2024 09:16:30 -0600
From: Rob Herring <robh@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
Message-ID: <20241127151630.GA3515396-robh@kernel.org>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
 <20241127103031.1007893-2-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127103031.1007893-2-andrej.picej@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_071633_918945_DC0BBD8F 
X-CRM114-Status: GOOD (  18.24  )
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

On Wed, Nov 27, 2024 at 11:30:29AM +0100, Andrej Picej wrote:
> From: Janine Hagemann <j.hagemann@phytec.de>
> 
> Add an optional property to change LVDS output voltage. This depends on
> the connected display specifications. With this property we directly set
> the LVDS_VCOM (0x19) register.
> Better register property mapping would be quite tricky. Please check
> bridge's datasheet for details on how register values set the LVDS
> data lines and LVDS clock output voltage.
> 
> Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 48a97bb3e2e0..5b2c0c281824 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -58,6 +58,12 @@ properties:
>                    - const: 2
>                    - const: 3
>                    - const: 4
> +              ti,lvds-vcom:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description: LVDS output voltage configuration. This defines
> +                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
> +                  details on how register values set the LVDS data lines and
> +                  LVDS clock output voltage.

Constraints? 0 - 2^32 are all valid values?

>  
>        port@1:
>          $ref: /schemas/graph.yaml#/$defs/port-base
> @@ -78,6 +84,12 @@ properties:
>                    - const: 2
>                    - const: 3
>                    - const: 4
> +              ti,lvds-vcom:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description: LVDS output voltage configuration. This defines
> +                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
> +                  details on how register values set the LVDS data lines and
> +                  LVDS clock output voltage.

Never good to just have 2 copies of the same thing. Move the whole port 
schema to a $defs entry and add the property there. Then just $ref it:

  port@0:
    description: Video port for MIPI DSI Channel-A input
    $ref: '#/$defs/dsi-port'


$defs:
  dsi-port:
    $ref: /schemas/graph.yaml#/$defs/port-base
    unevaluatedProperties: false
    description: Video port for MIPI DSI inputs

    properties:
      endpoint:
        $ref: /schemas/media/video-interfaces.yaml#
        unevaluatedProperties: false

        properties:
          data-lanes:
            description: array of physical DSI data lane indexes.
            minItems: 1
            items:
              - const: 1
              - const: 2
              - const: 3
              - const: 4


