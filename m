Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1134ED6E2CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBEfVvqHameiV59xzeEBuapI8XhlxHfiCCudbJHYczg=; b=HSlkdIpI3zZxx9/tSOqGJCg5CO
	GYVWAoG5ld2V8/ZDwpXJru6rCpLiaoPXm3Utdgm6c+POq1d/j2u1Xxm2cM1Lk7e+hhb3o3JvDCS1w
	Xy5q58K/MXOpBzlvVPSa42WHi+RFZg/YVecy4yXEhic3q6AZw7GcCcHpB7ZPeCtbLGKrANeg6bCBn
	ocQ3e2UBePn1gyAJGNlRu42sZYd9Irwt5hc5ZX2LGyxD3v2f5aZh0+kOho4RFT+Sz889GLZuF+TIN
	6C18kHesRvgZHYVb+b2/N/HP5KxJhD4mhKs2Rb/8DlLZaK+iwvh2Sh1iDLgTWOB/BVyF70drx3jjO
	3+85x/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDfQH-0000000Ee67-2uVq;
	Wed, 20 Nov 2024 07:46:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDfPL-0000000Edte-1cms;
	Wed, 20 Nov 2024 07:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6937A42B9E;
	Wed, 20 Nov 2024 07:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DCFC4CECD;
	Wed, 20 Nov 2024 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732088749;
	bh=fjhBEYx2+afIi+KL8loGQ8+CDYzRWRrIJw9D5zLDK9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZaBgB2VIcQGe+Ss2zbba1wZONI2E0rh2QotSmj7sa81JjGRxAMy0L0I/H0ncP+OI
	 RQJnujcn6neY1JK16kne36IJ5EVN1fhAaOzBjyZE7d7eUoHM5yyJuRceZnJedb1ppU
	 aO3JLfvf5jP0+RjvRa/P+mHy5dd9hSZBzmMqjOPMFNoqDa2ARgsC+3IMEworbOUBP4
	 yrnfC6enJIDG+7TmDZT92rSP05zRssnEbp8WHS8dnGYxm0P/PPECFmzcV3Sf5jRau3
	 Z/NnjOzs7yLS23/NfHfn2RkbESSO9u7NxemRByy7jVu+nWZwGVMiPEAJ42HJadmhy7
	 OiQ0kE46HxaOw==
Date: Wed, 20 Nov 2024 08:45:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp related property
Message-ID: <mnbc33u3ohncqmhyftag26sttqif24mjadnlg2btx7tc3dmowj@6bfh2lb7ekud>
References: <20241120063701.8194-1-friday.yang@mediatek.com>
 <20241120063701.8194-2-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120063701.8194-2-friday.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_234551_551566_C16DE7E1 
X-CRM114-Status: GOOD (  18.76  )
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

On Wed, Nov 20, 2024 at 02:36:38PM +0800, Friday Yang wrote:
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index 2381660b324c..302c0f93b49d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -69,6 +69,18 @@ properties:
>      description: the hardware id of this larb. It's only required when this
>        hardware id is not consecutive from its M4U point of view.
> 
> +  resets:
> +    maxItems: 1
> +    description: This contains a phandle to the reset controller node and an index
> +      to a reset signal. SMI larbs need to get the reset controller by the node.

First sentence is 100% redundant. Arguments depend on the reset-cells,
not this binding.

> +      SMI could get the reset signal by the index number defined in the header
> +      include/dt-bindings/reset/mt8188-resets.h.

What? How this can depend on consumer? Drop entire description, it is
useless.

> +
> +  reset-names:
> +    const: larb
> +    description: The name of reset controller. SMI driver need to obtain the
> +      reset controller based on this.

Drop description, useless.

> +
>  required:
>    - compatible
>    - reg
> @@ -125,19 +137,38 @@ allOf:
>        required:
>          - mediatek,larb-id
> 
> +  - if:  # only for camera and image subsys
> +      properties:
> +        mediatek,smi:
> +            contains:

Never tested.

> +              enum:
> +                - smi_sub_common_img0_4x1
> +                - smi_sub_common_img1_4x1
> +                - smi_sub_common_cam_5x1
> +                - smi_sub_common_cam_8x1

Does not work. Test your code before you send it. No clue what you want
to achieve, so not sure how to help.


> +
> +    then:
> +      required:
> +        - resets
> +        - reset-names
> +
>  additionalProperties: false
> 
>  examples:
>    - |+
> -    #include <dt-bindings/clock/mt8173-clk.h>
> -    #include <dt-bindings/power/mt8173-power.h>
> -
> -    larb1: larb@16010000 {
> -      compatible = "mediatek,mt8173-smi-larb";
> -      reg = <0x16010000 0x1000>;
> -      mediatek,smi = <&smi_common>;
> -      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
> -      clocks = <&vdecsys CLK_VDEC_CKEN>,
> -               <&vdecsys CLK_VDEC_LARB_CKEN>;
> -      clock-names = "apb", "smi";
> +    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +    #include <dt-bindings/power/mediatek,mt8188-power.h>
> +    #include <dt-bindings/reset/mt8188-resets.h>

This is some total mess. Never tested, not correct. Sorry, run it
internally through some sort of review or internal checklist which will
ask you to test the code before sending.

Best regards,
Krzysztof


