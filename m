Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D8ED2502E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo7DqW/cD8CLxZaJG8qtyU73tZb0c7FLMWQhIh+aTyc=; b=icog5w8Tf1KhkmhjYQs43poFeB
	CULyFOheyioLvayhGIzhnrEj6U/sWnB/pU3yRZb3JKxG0Cz6/mcYrwnhhnS4mPs3TVhJ3poFRJ5lU
	6Jo9Dvve/aVyrz5kOiEOMEDyp/20c1UEDeJ7EIGqJY0zMRAqrtxdrqtvYFVjVvSa4JjQelR5U7oJG
	6ujMym+9gX8Us5HAJLhAXw/ws4u3u/hYlY/k1mJVZRlZJG84nPJR4nKADN59hJMyyUGmLCzZuAH2z
	ogw2UXuuaOfjoO31NxdZwUp3Jb0Fm5Vkpp8O/8WsTnKFyvHB66p2kbu3qBE2PW35U20f0PxzqpF42
	durqQhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg1l-00000007KTu-3rvK;
	Tue, 13 Jan 2026 15:09:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg1h-00000007KT6-1Qoy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768316985; x=1799852985;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mWm4hq1Hv1HuICzUcA8TjHeSQFen69IUNRT4WJ1WzC8=;
  b=mnYCxXXBU8VtmEf1IVXX95XzBIWLtQjxRttXoywxdRDTYYFMuqOkcIQq
   WWlxn2UCoFz2AtHOgFCjg9yxKc+tVhmE3AVJe9Cpa+9qjNK7w7FszRQtE
   ba+K0+/+bz2l1vi3crGlA46GHBiISkXowzNKCHKmRCmW5VuheYNBKLtVF
   cverE60neJNXdk5yLiWt5dQinrd29t0TAYksyt5CqRIReruAykjcyaQ+W
   qE8uktyck7Wuu+rRnGLBiL6yO/eHc+sJGFZG6DBfOnP6HeHJmZwxGBSbP
   pQB/L87SbrHi7KspG7x3huPRAub8NIbo39G61THqgSHsZtNQ3g742dOmZ
   A==;
X-CSE-ConnectionGUID: DS+w9U6iTbeS6nVAsK830g==
X-CSE-MsgGUID: HHY0cOT1ROeGmB+exCIc6w==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="58772684"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2026 08:09:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Jan 2026 08:09:04 -0700
Received: from [10.159.205.69] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 13 Jan 2026 08:08:59 -0700
Message-ID: <ac304080-5d9a-4324-bfe9-e2a9da1c7d3f@microchip.com>
Date: Tue, 13 Jan 2026 16:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Conor Dooley" <conor.dooley@microchip.com>
References: <20260113-cpitchen-mainline_gfx2d-v5-0-9cdab8fa699b@microchip.com>
 <20260113-cpitchen-mainline_gfx2d-v5-1-9cdab8fa699b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-1-9cdab8fa699b@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_070945_391243_14B4A59C 
X-CRM114-Status: GOOD (  15.06  )
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

On 13/01/2026 at 14:10, Cyrille Pitchen wrote:
> The Microchip GFX2D GPU is embedded in the SAM9X60 and SAM9X7 SoC family.
> Describe how the GFX2D GPU is integrated in these SoCs, including
> register space, interrupt and clock.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../bindings/gpu/microchip,sam9x60-gfx2d.yaml      | 46 ++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml b/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0f223ddda694e7edbc9f25c68d17ef01897a55a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/microchip,sam9x60-gfx2d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip GFX2D GPU
> +
> +maintainers:
> +  - Cyrille Pitchen <cyrille.pitchen@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,sam9x60-gfx2d
> +      - microchip,sam9x7-gfx2d
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    gpu@f0018000 {
> +      compatible = "microchip,sam9x60-gfx2d";
> +      reg = <0xf0018000 0x4000>;

Nit: maybe lower the register map size.
But not blocking:
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> +      interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +      clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +    };
> +
> +...
> 


