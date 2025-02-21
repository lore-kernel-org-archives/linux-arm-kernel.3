Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C25FC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrQdUP2pVBfaqvbD1Pj+xn4HL9Yw6HIAFb35wr8C/Ns=; b=4Fxks4ZHNCs2XTr3i5wu7ARIAG
	PBKBm/J/cckS3wpuF+3ZDuHo4KEjzylsgOB5TWW2E83geJItui7ZCU5ZfQsA1zPBhYf+hdf8ehMkO
	VldtccFdaj080vgiS1+uHZjefnMRgCm5gzyPFKs84lQNxlzkg93PMuhmh8ep2QDX40QD2LyHkZdQ2
	6Dou9Ot7Cz5WHbXsqUcCksTFmUAI7yCv5myNWKNTWvfLg6GDrlEKX0cHFuCkvuR0U715LgvD56Gk/
	7GO2kr3DgrJgd/6RNNxTa0a4diewE2dY08vSp+k0BOVnFBloaoK/MEINp67ynQ/MAK0gSZ/UqM8ko
	7454kneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbbU-000000072Uv-0xI7;
	Fri, 21 Feb 2025 22:34:40 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlba1-000000072B3-0mga;
	Fri, 21 Feb 2025 22:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86382682D3;
	Fri, 21 Feb 2025 22:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D05C4CEEA;
	Fri, 21 Feb 2025 22:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740177187;
	bh=jhNLKKmZdBg6gC6tf7E+ph0/0dRu9QCUxQqNNWqYgC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYjhTcwwqkB+c0oQIgk5fXqY7qD4VMlHaawaWAbdLAgVxTx4vfF28H23IGQVv6/wW
	 F5djNnKngrl0f+naFDP4anowjcC+UUlJBfW2G90yCVkA8fnDxg9wUaVQUhJE5Rftwe
	 x6hyPuSRyFIIAjNBIj9ZU2BH0iHb2D5wtYv/wOgzovzxXuOuy365iHa/Ztyb5Vlnuw
	 C0VTKNpHdMGINUOuHbM3InaaOMmyisQGF6ZmDQbkC7iPgj1+zH7el90AjnSPPCFqc3
	 osWpNaSTdCDmB23MaI9DbNlpajc5ecKR025rkdU3EETMUctdciuGxyoF/ejPSHz9AM
	 vlLgeM8y2HUSQ==
Date: Fri, 21 Feb 2025 16:33:06 -0600
From: Rob Herring <robh@kernel.org>
To: "bo.kong" <bo.kong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	zhaoyuan.chen@mediatek.com, teddy.chen@mediatek.com
Subject: Re: [PATCH v4 1/4] media: dt-bindings: add MT8188 AIE
Message-ID: <20250221223306.GA190439-robh@kernel.org>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
 <20250220070114.15015-2-bo.kong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220070114.15015-2-bo.kong@mediatek.com>
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

On Thu, Feb 20, 2025 at 02:59:50PM +0800, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> Add YAML device tree bindings for MT8188 AIE.
> 
> Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> ---
> Changes in v4:
> 1. Remove address-cells and size-cells
> 2. Remove larb12 related content
> 3. Update id content
> 
> Changes in v3:
> None
> 
> Changes in v2:
> 1. Fix coding style
> ---
>  .../bindings/media/mediatek,mt8188-aie.yaml   | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> new file mode 100644
> index 000000000000..232b5afc2ad3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8188-aie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The AI Engine Unit of MediaTek Camera System
> +
> +maintainers:
> +  - Bo Kong <bo.kong@mediatek.com>
> +
> +description:
> +  AIE(AI Engine) is one of the units in mt8188 ISP which
> +  provides hardware accelerated face detection function,
> +  it can detect different sizes of faces in a raw image.

Wrap lines at 80 char.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8188-aie
> +
> +  reg:
> +    maxItems: 1
> +    description: Physical base address and length of the register space.

Drop description. That's every 'reg' entry.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Must contain the local arbiters in the current SoCs, see
> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +      for details.
> +
> +  iommus:
> +    maxItems: 4
> +    description:
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.

It's not really clear what the 4 entries are. Like any other property, 
the order should be defined.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for imgsys main ipe
> +      - description: clock for ipe fdvt
> +      - description: clock for ipe top
> +
> +  clock-names:
> +    items:
> +      - const: img_ipe
> +      - const: ipe_fdvt
> +      - const: ipe_top
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
> +    #include <dt-bindings/power/mediatek,mt8188-power.h>
> +    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +    aie@15310000 {
> +      compatible = "mediatek,mt8188-aie";
> +      reg = <0x15310000 0x1000>;
> +      interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
> +      iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
> +               <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
> +               <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
> +               <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
> +      power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
> +      clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
> +               <&ipesys CLK_IPE_FDVT>,
> +               <&ipesys CLK_IPESYS_TOP>;
> +      clock-names = "img_ipe",
> +                    "ipe_fdvt",
> +                    "ipe_top";
> +    };
> -- 
> 2.45.2
> 

