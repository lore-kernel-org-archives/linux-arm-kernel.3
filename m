Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86731C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 23:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlvdSHby1FNRTJd6hif/ji1ScLJza+a/vRSPFDTIrU8=; b=EPqO17Vu5+Tn1kbRCMmLlGMIX3
	8hPFq5odrlwK7+mqicQJKptSA4NAtM/MeQ+c7P6Tz4Ljcoe+YCxPXLy7waMoUFLBuV673+dxalC9h
	xThTvMvzBiDF+jzcVvCaFcI/cvVFE89DRlS5xmllqZp2qtnmR03f9+yDZbiM6Cjn6cPjbcOtedx1G
	Pc+NsGj7pxvMuh3TyXSbosmMEjUAMiEkVzaOaE8PAwZ/dWJ8ThTYe4cgtCi9K7xbAQqpdIDY2Ne6M
	135weVlnuhV+0knY/5BLquyJT3oNPtf3bmkdCB4oZJZvh9fYk2ht5Y4rktXoWfqlrKpDr0QmnE4t6
	N+AlLVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1wGO-00000002Lw4-1nf3;
	Mon, 07 Apr 2025 23:52:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1wEc-00000002LhC-1zBO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 23:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FA8D43FE4;
	Mon,  7 Apr 2025 23:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1E8C4CEDD;
	Mon,  7 Apr 2025 23:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069834;
	bh=C91TU6EiUXUNu4pLkJLVbWTW2q/Tk5LKELt/9k63UA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rdTVhS5ZF/q6VWszeFbbLbHPed6Ap/IcFPv6CxsDSjmCGcUNsMcss9fMKz35lKM4r
	 gUYc8CUOwsFMhpig1Pib33mNQ489qn1dxjZxElN87LCE/M0k5SjHwWevgNGtIN08kW
	 OL/s1N7bZNiBZaI4T83DibO+THYU/FHWHoOc1avJ7EOcqBnLTxjmTgNDc0DF414qP5
	 aFU3+h2P05ujvoagU9cgbYofsebjs52hkmGYDvS6QBgeDY2MfuU2RAfZbcIFwm+b5O
	 CgHcrdXvHIKYSNGrotA7bG7FGZbgln3w7Rxlo7f3ZI+PaojoncZyjuihh/dTYfqSJX
	 wDRsljzjVTS4g==
Date: Mon, 7 Apr 2025 18:50:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Joy Zou <joy.zou@nxp.com>, dmaengine@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: fsl-edma: increase maxItems of
 interrupts and interrupt-names
Message-ID: <174406980425.184285.7437048033861841180.robh@kernel.org>
References: <20250407-edma_err-v2-0-9d7e5b77fcc4@nxp.com>
 <20250407-edma_err-v2-1-9d7e5b77fcc4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-edma_err-v2-1-9d7e5b77fcc4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_165034_532436_85894091 
X-CRM114-Status: GOOD (  12.23  )
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


On Mon, 07 Apr 2025 12:46:35 -0400, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> The edma controller support optional error interrupt, so update interrupts
> and interrupt-names's maxItems.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>




