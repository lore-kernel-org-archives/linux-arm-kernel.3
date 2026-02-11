Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADC4ECD6F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 22:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhSF0zpLdipzJZjJCUFYY41qbV34Ejxs5N+aQAKJAtM=; b=VRGkUYrlk1lUN4n8/03X56u7xJ
	0fiPCV3RhAZBtwfPdnq+3GBc7A2DqNQftV0oBeMdDjO09oY9eIBOVV2QcDRdR7KgMNLzZn7Z01TPj
	6vtafePLkbJm5eas2IWTjhKoJb+VVjYLQDyF6vspUSHG08oKUwReIkCWGSHllk1b08ayXHxFBiw1G
	78UF1NhlHgMYK/FDo6Ry3scDWtMOrzX1DzuXgx+n0L9N/5RobbT0evoPRQPRR+o113ZJ4EpyimbuX
	O+exjO9BcY1SUqc04+n7gMJ4qgRFTvasOULCP4I0tMjvOCcYmmcZCwLVlJPodUe8a30ATIiisEALo
	jRn8t68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIM9-00000001712-0mSX;
	Wed, 11 Feb 2026 22:06:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIM7-0000000170u-3d0A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 22:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5A1660051;
	Wed, 11 Feb 2026 22:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D99C4CEF7;
	Wed, 11 Feb 2026 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770847601;
	bh=3cqHJl/1uA6t/SIESkJGSB05Ihy6w0r2cxN0FHOjukM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffIzkTsAeE4chBfMhbAUwI10kdgxScHRI/p6YywmRGaVtCIURafR6vvKvyC3b1EQA
	 QM12uf0VWuA90lhe+ihdWQVhN9WX69lDujEzqrPZ4UmtJF8sR5xXMW5x49RQc/Y4nJ
	 J93kAS7v+cR2Jl3uh1uZQP6uhkJAlMFTuvNZs2tZN315CZfH04q4E1N9lnty1m0Pnf
	 evh+CHeAepcgCBcJZWnyKso52GZ1vjJlEDnEpPmE1YEnHEKNnP7bUcakzsj1siKPly
	 bVMX9bTUCfvesrFFr/tyboztWgxyBarFXbOI+Xe9mlsByjxDO/TUMosCYKxfbfqBY9
	 PIQ/io0P5Rxyw==
Date: Wed, 11 Feb 2026 16:06:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
Message-ID: <177084759873.3973046.826103980569808616.robh@kernel.org>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
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


On Wed, 11 Feb 2026 17:28:24 +0800, Joy Zou wrote:
> Add documentation for the dma-channel-mask property in the fsl-edma
> binding. This property uses an inverted bit definition: bit value 0
> indicates the channel is available, while bit value 1 indicates
> unavailable.
> 
> That was already used widely for i.MX8, i.MX9. Correcting the definition
> will break backward compatibility. This reversal only impacts the eDMA
> dts node and driver, and doesn't impact DMA consumer. Therefore,
> keep the inverted definition.
> 
> Also add a note at the top of the binding to highlight this inverted
> definition to prevent confusion.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


