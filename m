Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5CFC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlVXC7W3Skpm9RYAW4sywASWkvrDuQ/ggS7YvWhRR1M=; b=w6A+auUX/ExKLpkNnzZYRI7Ya1
	ri3plxg1WttiXg8FF35Z48ACaW5RH1EfTJF3SkkraDuQ3cq9ATIQfPrHsRdjejVFK7VF6G7EX8eck
	qad5rrTd0zOwtNmBZJOfLsr78sjMHjoz9Nx1HoeexSJDfznL45wfmoUCL8BWs90d1/vlTtzu8pXz+
	yZRmStKJsBo2kiO0b6hzcZuAahPe+XfoKWrYtkrFaDswZuiCqTnkL5p5PDP/cABkgsE85OvUrSNoI
	Ke45RwVJ42ib9TdX7MoAZ/7kQK0Y1MP4rn2zz4L39vrszIdJljTBrauEbWo7aPykwRyZ4g7EG1kD0
	lZaVBoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkj3r-00000002RfW-3INA;
	Fri, 17 Jul 2026 13:57:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkj3q-00000002RfG-12tq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:57:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC446416B8;
	Fri, 17 Jul 2026 13:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7781F000E9;
	Fri, 17 Jul 2026 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296625;
	bh=FlVXC7W3Skpm9RYAW4sywASWkvrDuQ/ggS7YvWhRR1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DpXp5xnvOcGSK/b59TJd3pGVfNvqEa33XLlHCMM5tXbEJzi5jlLVuUYm0wPqAwVd7
	 Hq9lJjV4HVhyMaR/PGmEQaWskAQTqr8jWXaPl5KAw+xLKB+OCNh/zevrb1mUY4h+MO
	 8Nk/hzVwZ7FPx4MokAZn2CrpZS4ZIQLKVt1brZxC7nUDdZDnctRfm7x29CtbFL1/c3
	 iWbyfKIjK5z/eHkH5zxJXYQDZFUqc8YpoMMydLExEXqDGgBbVrcg3Q3Ce5va2p7a5O
	 yg2qdWick+4YI3M5aAwSHDjz1t5ch3o8nGaeOprYG0gYxVaqKwKw5Fre6h6sh7F/Lz
	 QoQ4OZt8Mu7EQ==
Date: Fri, 17 Jul 2026 08:57:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	vladimir.oltean@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: fsl,fpga-qixis: Add fsl,ls1021aqds-fpga
 compatible string
Message-ID: <178429662426.549410.11088440756266736676.robh@kernel.org>
References: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
 <20260708-ls-fpga-v1-1-06c8a099b2a5@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-ls-fpga-v1-1-06c8a099b2a5@nxp.com>
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


On Wed, 08 Jul 2026 14:55:13 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add fsl,ls1021aqds-fpga compatible string for ls1021a qds's FPGA on board
> controller chips, which connect CFI interface.
> 
> With following patches to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>         'bank-width', 'device-width' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>         /home/lizhi/source/linux-upstream-pci-ep-arm/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
>                 ['simple-mfd'] is too short
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


