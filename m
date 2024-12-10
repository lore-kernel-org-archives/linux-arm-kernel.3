Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAA9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sp9u70YVXn5ZwwJNB0lCpDTHNIwFW1yXiQYono/11C8=; b=UMRfSM5XBEJQg8AONvKhjbWOxL
	g4846eyDk9iVBgOV5Fa8p9PTG5NTqKFCO4RUIeuEV25Xv26WT2lF5CEyD1Q0QyM7rno8DfaocQnYV
	ymmwpBSjLJYoHW2ZiGmel+EB0uTaBexTHhPWff0nhDLGSRHNVNxWl2V+xJJn7/i2YcoF7SrRWOXEf
	zBdyboGzSBzU17tAqRSB1wSUWdO5AUQAGtgiFQbp9C09DxUUE+5scAHzTwLuwgOzLxxzoFf78Lb04
	gkcue+egL1kGaEGmGey1UINrXJYkkao5eK2goK7edT+u+19LGGxL0GhDTyjcU4Ko4ahp/4CUJUjYJ
	YhEUg2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8Wf-0000000CyAw-1IWZ;
	Tue, 10 Dec 2024 22:16:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8Vb-0000000Cxrg-290z;
	Tue, 10 Dec 2024 22:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 344C55C5B5E;
	Tue, 10 Dec 2024 22:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351F7C4CED6;
	Tue, 10 Dec 2024 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733868910;
	bh=3x4SgvgxpD/lcEUf3nJ+mjH3qTFRRg7PIFRh0uDdLlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHc4FdumgPQ+I6A2FJ6RnWwGc0HaSnQsLrVKxDly7JbPsBhnwWvn72/Nn689Wuqkm
	 obCpEtWZitbcfbR65XcrDV/ZhF9KBPAoEvHEQ0gvmNkSJCwGbxyACOTAAc/sCcWNlD
	 nFZSD0zH2HLB+8Yv6/0Yh4Ie4n/whG3Nb3x/j2pxJdYenYJHFhg5TO2ufhJQRvGA4Q
	 +UFz8q5+HJMcMI66JctRNjv809VrNHAfyNTEDNrP3aUSdghd/CE2os5bhRmPMO/E15
	 6cTTsq0ykol5TEDftvEIQmGtULteXOkL2wj2Y4Eq1SfoRbPQ5x0XXoSTYOuunzSJwo
	 0B2TTlBlYVglA==
Date: Tue, 10 Dec 2024 16:15:08 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v6 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Message-ID: <20241210221508.GA550635-robh@kernel.org>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
 <20241209033923.3009629-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209033923.3009629-2-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_141511_635136_84C7E4A4 
X-CRM114-Status: GOOD (  15.94  )
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

On Mon, Dec 09, 2024 at 11:39:05AM +0800, Liu Ying wrote:
> Freescale i.MX8qxp Display Controller is implemented as construction set of
> building blocks with unified concept and standardized interfaces.  Document
> all existing processing units.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v6:
> * No change.
> 
> v5:
> * Document aliases for processing units which have multiple instances in
>   the Display Controller.  Drop Rob's previous R-b tag. (Maxime)
> 
> v4:
> * Collect Rob's R-b tag.
> 
> v3:
> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
> * Document all processing units. (Rob)
> 
> v2:
> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> * Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
> * Fix register range sizes in examples.
> 
>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++++++
>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++++++
>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++++++
>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++++++
>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++++++++
>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++++++
>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 ++++++++
>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 +++++
>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++++++
>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++++++
>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++++++
>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++++++++++
>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 +++++++
>  .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++++++++++
>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++++++
>  17 files changed, 1042 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
> new file mode 100644
> index 000000000000..7f800e72c3f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Display Controller Blit Blend Unit
> +
> +description: |
> +  Combines two input frames to a single output frame, all frames having the
> +  same dimension.
> +
> +  Each Blit Blend Unit device should have an alias in the aliases node, in the
> +  form of dc<x>-blitblend<y>, where <x> is an integer specifying the Display
> +  Controller instance and <y> is an integer specifying the Blit Blend Unit
> +  device instance.

That's really an abuse of aliases. If you need to describe connections 
between components, use the graph binding like everyone else does for 
display path components.

Rob

