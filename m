Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056EECAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2sfWX5Agr9NLJVLwpach8+P3hXGVjKjXSbc6pGxJm0=; b=LuXCJcIHWVteDWyX+qJC2HM8uF
	uSEL1IBCyBJPHcxTqzuIqJNkQNnlDlYu4AvLwTrV2IeKID4RTMo8aLXiTRPM8PIevsIpWVqn+ltDF
	BhyH+7erZaIGU93uYNVaFUdQ+5bW90i3OIN7l2ZkBGeTkEnyFCFoUO1oQnreRMM4s7Riz8JX+nS4Y
	uSn/5E7V6m0ra3DnW/EcWB8jle7adO3/yhExLst0Qdr1NqIxRtEuq2pF48T/E6wInzCwujSdnJz2V
	PN9yLdbsQHkBn0QU+AP/0k0i54zR3cCmBDbe40HucJJuwx5Bm8/PmCfEjnKpg6XdQs36JsEz9MBBT
	CbnVBaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBY-00000004ojh-2Q4k;
	Tue, 09 Sep 2025 06:50:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhui-0000000213p-0vYf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:52:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115892F2E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 12:52:20 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29F683F694
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 12:52:28 -0700 (PDT)
Date: Mon, 8 Sep 2025 20:51:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Message-ID: <aL8z3go1ece81LQj@e110455-lin.cambridge.arm.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_125232_352297_D40E4A4B 
X-CRM114-Status: GOOD (  24.87  )
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

On Fri, Sep 05, 2025 at 12:22:57PM +0200, Nicolas Frattaroli wrote:
> The Mali-based GPU on the MediaTek MT8196 SoC is shackled to its concept
> of "MFlexGraphics", which in this iteration includes an embedded MCU
> that needs to be poked to power on the GPU, and is in charge of
> controlling all the clocks and regulators.
> 
> In return, it lets us omit the OPP tables from the device tree, as those
> can now be enumerated at runtime from the MCU.
> 
> Add the mediatek,mt8196-mali compatible, and a performance-controller
> property which points to a node representing such setups. It's required
> on mt8196 devices.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index a5b4e00217587c5d1f889094e2fff7b76e6148eb..6df802e900b744d226395c29f8d87fb6d3282d26 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - rockchip,rk3588-mali
> +              - mediatek,mt8196-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>  
>    reg:
> @@ -53,6 +54,13 @@ properties:
>    opp-table:
>      type: object
>  
> +  performance-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle of a device that controls this GPU's power and frequency,
> +      if any. If present, this is usually in the form of some specialised
> +      embedded MCU.
> +
>    power-domains:
>      minItems: 1
>      maxItems: 5
> @@ -91,7 +99,6 @@ required:
>    - interrupts
>    - interrupt-names
>    - clocks
> -  - mali-supply
>  
>  additionalProperties: false
>  
> @@ -105,9 +112,24 @@ allOf:
>        properties:
>          clocks:
>            minItems: 3
> +        performance-controller: false
>          power-domains:
>            maxItems: 1
>          power-domain-names: false
> +      required:
> +        - mali-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,mt8196-mali

s/rockchip/mediatek/

Best regards,
Liviu

> +    then:
> +      properties:
> +        mali-supply: false
> +        sram-supply: false
> +        operating-points-v2: false
> +      required:
> +        - performance-controller
>  
>  examples:
>    - |
> @@ -143,5 +165,17 @@ examples:
>              };
>          };
>      };
> +  - |
> +    gpu2: gpu@48000000 {
> +        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
> +        reg = <0x48000000 0x480000>;
> +        clocks = <&mfgpll 0>;
> +        clock-names = "core";
> +        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
> +        interrupt-names = "job", "mmu", "gpu";
> +        performance-controller = <&gpufreq>;
> +    };
>  
>  ...
> 
> -- 
> 2.51.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

