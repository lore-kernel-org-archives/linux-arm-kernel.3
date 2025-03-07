Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F1FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXmp+EehIyww5byQ45WENGXAQcmCbvimFH0niSj8onI=; b=om7sfwUfE5GqAHPu4asV82Hd6z
	eph8xTvuYhE6pUAbU2Uy3hW/GzqyDMLHHqRr28NneXb8mLRgvF1h5kMzZ9CjzhEVuesSIMjvg87pD
	2/VrV6nsB0BUgFNDOq9UkUxGWY3ODfJHVl/sOwY7U5CwJGQfQchmK//g2hogME3V2t2peqJWD/drF
	/MG2gcLbGKWm/MHx8xlr/7cAUxXQ607yaefT20p3UFNalCWpCsetQcZlXhC+nJmeiF454E9nGmGLh
	86vcaHUNU4NjusGRTaNZyuseyhxPCQWQ27VxcT5Lk9cBKbYytmJm41Fn6DpVvupGta6A4anMMeGZF
	s9lcjK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqem1-0000000FX9K-1V8R;
	Fri, 07 Mar 2025 20:58:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqekO-0000000FWot-1aYE;
	Fri, 07 Mar 2025 20:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BF715C5E68;
	Fri,  7 Mar 2025 20:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BD1C4CED1;
	Fri,  7 Mar 2025 20:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741381000;
	bh=UAckJF2HilOwP3ulwN2y9cDVYluwjNJxb5hgmlPbQNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdyTEp5tVfRsF5XrBIraoKeIZVFoJJHn5Soc2r4VTWIrLUyQ/6TDXxiJSU/NsycTD
	 m2+G6Xmt8M3vzIkZm1H4eCfU1EAamcmn/TNMg6QZrAj1iUOG1Ix/Rn2PaSNG/CToXl
	 Tlqr7T/yfOqitnuCvvq7Umt4ZsLRPtzpWrVntH2d0at20Rqji3ahwtCtX4kUM4Ik/9
	 JzjuXSCB074GTNlIcJCn40Fp0t98h9y5znmRMKBUnXp42smm+Llmj3LghgHEFybXeE
	 ta0zndbOeSAFhfY3/o+oaWsDco/F0GXng6UXW6/QTVzhkhQ24qehrFaWCf5KKjAApu
	 +mlSejzy/1gLQ==
Date: Fri, 7 Mar 2025 14:56:38 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/7] ASoC: dt-bindings: add schema for rockchip SAI
 controllers
Message-ID: <20250307205638.GA595584-robh@kernel.org>
References: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
 <20250305-rk3576-sai-v1-3-64e6cf863e9a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-rk3576-sai-v1-3-64e6cf863e9a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_125644_526565_DBC7A916 
X-CRM114-Status: GOOD (  18.55  )
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

On Wed, Mar 05, 2025 at 10:24:23PM +0100, Nicolas Frattaroli wrote:
> Rockchip introduced a new audio controller called the "Serial Audio
> Interface", or "SAI" for short, on some of their newer SoCs. In
> particular, this controller is used several times on the RK3576 SoC.
> 
> Add a schema for it, with only an RK3576 compatible for now. Other SoCs
> may follow as mainline support for them lands.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../devicetree/bindings/sound/rockchip,sai.yaml    | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 157 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,sai.yaml b/Documentation/devicetree/bindings/sound/rockchip,sai.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8f5a292a7f2a6c737d983d00cbe40ec45bfa6249
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rockchip,sai.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/rockchip,sai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Serial Audio Interface Controller
> +
> +description:
> +  The Rockchip Serial Audio Interface (SAI) controller is a flexible audio
> +  controller that implements the I2S, I2S/TDM and the PDM standards.
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3576-sai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    minItems: 1
> +    maxItems: 2
> +    oneOf:
> +      - const: tx
> +      - const: rx
> +      - items:
> +          - const: tx
> +          - const: rx

You can simplify this to:

minItems: 1
items:
  - enum: [tx, rx]
  - const: rx

(By default, we require unique items, so '"rx", "rx"' won't be allowed.

Rob

