Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD5AC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1Ckq0oXBzDA/rchm9JWufA260z/vvzQGCmcSj8XIkg=; b=MS1kGoTDPrH6zm9fRnWwJmFxXM
	FioR2hOe5R/usgv3msIrsMUIYy3aiGyaoDUGwG+QwjAivt67t5YvUnzSOhRk6pxUer39wjUk1NF3j
	iTS6jsHhQDJgCfTMqPToXWaa8FyfHA/Z+TLpdECRxPY5YmPENXQ/D1DhN5WIvSQpCFnTO8HYf1UpI
	xDu6XpylQZhUionK2gda/MgAmBpwAHg8hFXNjhX2r9mnD/h4CsfBB6gQHeAWXltqpGxxuVqOROzox
	AsJMdrCzIPns67iLpKbPBdQRTQnRGrtqbFibKeC0AmM7qj1SgYfYsw462b5fcLHak5myhIg/FoBP6
	3YQN0GuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMX4-0000000DYZb-3Ray;
	Tue, 05 Aug 2025 18:37:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLtY-0000000DU8j-1Lut;
	Tue, 05 Aug 2025 17:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA747449F4;
	Tue,  5 Aug 2025 17:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD950C4CEF0;
	Tue,  5 Aug 2025 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754416575;
	bh=xoZA+uUKJ8g3le1aL8FGyrdIWdGhhNTmI8dVLAWUCOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDIK0c9mv9LDR8SNvohHlyAKw9MYIIglVHWG/YpuE5escfKmrGg2Crfjd5kLYN1zl
	 woHNyxS2MJpmaPbLuo9GHFQ+4kbrR+e2DzHaYxE9nwEvYm3L7XxLX0XbeFvIFTQS6G
	 8HQWrzGRuF5hNcNyK5p60Jn5RB62l3qRRpyqx2q62fbW4pPXGuKND5FirUcOtm1vqw
	 hquOKXg+mjUhv2u5q1+bpO8JbP2vtXA1BbkCh+gRN3A832oQzhMnxmqMHM3kC2gRrE
	 xm8d+uQYNo0wZsh8JR5pO1dpV0l0CzHa8b4G6hHufnRPKv+3CW2mPARQ7tsCqFmWIn
	 EKMfnieV3CkcA==
Date: Tue, 5 Aug 2025 12:56:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: y.oudjana@protonmail.com, linux-pm@vger.kernel.org,
	mandyjh.liu@mediatek.com, linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	lihongbo22@huawei.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	ulf.hansson@linaro.org, mbrugger@suse.com, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, fshao@chromium.org, wenst@chromium.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 03/10] dt-bindings: power: mediatek: Document
 access-controllers property
Message-ID: <175441657381.2010253.3126745610510211797.robh@kernel.org>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
 <20250805074746.29457-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805074746.29457-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_105616_379353_73EF290D 
X-CRM114-Status: GOOD (  11.46  )
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


On Tue, 05 Aug 2025 09:47:39 +0200, AngeloGioacchino Del Regno wrote:
> Allow specifying access-controllers in the main power controller
> node and deprecate the old mediatek,infracfg, mediatek,infracfg-nao
> and mediatek,smi properties located in the children.
> 
> This is done in order to both simplify the power controller
> nodes and in preparation for adding support for new generation
> SoCs like MT8196/MT6991 and other variants, which will need
> to set protection on new busses.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml      | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


