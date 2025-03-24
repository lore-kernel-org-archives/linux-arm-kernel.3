Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3591C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=490tjTP+zBHMJFp1JZwf5WadXQiJjbWhYpIRQyQfJew=; b=gF/Od3conDu6mTvFTnOPXT9Cob
	PZvh2QbXJ0yxYfrI5TWGDYRPkAbri4dwGAshfnPzbMLkrv/zP42wyzHRkxG9JxEiMF9nb7M8pu/Ub
	D4BcFrTTim/JXOX89d2y0s3eTSonlIFSsDXAwQ2QPUK3uYCp6V0F6j07oPswESbHCU1S3zdRNq7Ws
	WYkYXOz/QQ6Uc9pS0cgzEsuRNGk2PTNPW92k6CmDTh1S+I4xBtVKtXg4wRyp3m2mfHWRQE0PSvogi
	/8rdpHGUm3qzy4bAirbysg+Fp78B32EqNTnv2fuSL7HJBOo9xBDMLw2PPrGX/jnMshwo1TCMmWLz6
	oeM1yMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkHm-00000003aMe-0FWe;
	Mon, 24 Mar 2025 16:04:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkG4-00000003aB6-3fVk;
	Mon, 24 Mar 2025 16:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36ABE6157F;
	Mon, 24 Mar 2025 16:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EC6C4CEDD;
	Mon, 24 Mar 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742832155;
	bh=lO70/EyOTHsSUCsToe3wwdpu/s9KqX41Qnit5o85758=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYwYfGSZVzY31upbyL96Mn2jcC6wRm9sskzWthKcQ05zB6hH9VZVivy37hpuecwwl
	 xc2cFdT2vZ5M7IjIYVJ6TZuD6OUHfwsb26FmHK6iijmHFu2rBYCrdXeACBHEqImCbu
	 OH06I7Goiyrr9tiCwAvThh7vEAbwwHqzkhjTRWGsDcDJ0Jhr/y6cL6cEme8Wz8+/pO
	 Yqe5AYNV3x7zfSs1n3TOg8GMJluf8wXbd9OiiqYwdjq0lhiy93wOFoWpfycs8xnFL0
	 5XqidcdArCoZQE38NAu06CxseJ9qKIeK02KWZG/Sk34UbSU9a6zm2heVsfXUyDqjPY
	 ew4royVay7aKw==
Date: Mon, 24 Mar 2025 11:02:34 -0500
From: Rob Herring <robh@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com,
	nancy.lin@mediatek.com, singo.chang@mediatek.com,
	xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
	sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 05/15] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Message-ID: <20250324160234.GA113887-robh@kernel.org>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-6-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321093435.94835-6-paul-pl.chen@mediatek.com>
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

On Fri, Mar 21, 2025 at 05:33:34PM +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> MediaTek display overlap output processor, namely OVL_OUTPROC
> or OUTPROC,handles the post-stage of pixel processing in the
> overlapping procedure.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> new file mode 100644
> index 000000000000..f42e9abc1436
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek display overlap output processor
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  MediaTek display overlap output processor, namely OVL_OUTPROC or OUTPROC,
> +  handles the post-stage of pixel processing in the overlapping procedure.
> +  OVL_OUTPROC manages pixels for gamma correction and ensures that pixel
> +  values are within the correct range.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-outproc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        disp_ovl0_outproc0: outproc@32970000 {

Drop unused labels.

> +            compatible = "mediatek,mt8196-outproc";
> +            reg = <0 0x32970000 0 0x1000>;
> +            clocks = <&ovlsys_config_clk 49>;
> +            interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
> +        };
> +    };
> -- 
> 2.45.2
> 

