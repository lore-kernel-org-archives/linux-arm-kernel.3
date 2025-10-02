Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDD4CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 00:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQnj/MH7E0TvzbaiDh4uBcDLGHxhUHzflCeKBPJneVE=; b=wiLLzJphrmKz8G3KhK2urlDnui
	ybV94i6ebBV2UIGO95xRm0+8pRALaqlnjXtP2MbmfnDdYVq9zqIGAT8HgYDubjdFMG7q5tjkbQ9WN
	uPfEFGUJHCPcFw2HPRRXG4H23MieimStbZVAbj4bEYbaZzYCk96YpWaL9niHWm5uq8oOc/k9wf8bm
	FCgTz9FEuUDmmOZL6SEC2/wJNO8s8UerEvePNIMFif7yHLG8dUnTZIadZhWpJQ+xTfQ1+gnHn6e+A
	6ZBnE2ZmB62CCdn66l4rMjiDZjqcjZWo/T48kLSQmdYzVvxRhYP7TPDaWr9Q+45KkMannzPMHfoEV
	ema8lI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46qb-00000009HDB-1Hxo;
	Thu, 02 Oct 2025 00:07:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46qa-00000009HD1-1hPX;
	Thu, 02 Oct 2025 00:07:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CE3861FA1;
	Thu,  2 Oct 2025 00:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70B5C4CEF1;
	Thu,  2 Oct 2025 00:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759363619;
	bh=1FuJjw6+SnNP6zCgHm/VGK3WK8/MBmCfRNNHkgalick=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwJ9JpAzn6OY1Wsvrgw1d/8yf5zvRa4lzjxPTkXcRMxEJN/ZEB5O0GkN0C7GKiqrV
	 mkP8CqvKb3XwpUh6N77a9vY89TbVGvB4stcuAWdf4bO8FysKnBOaOCgJuqa1q41RJ9
	 lMLYmnZZ4uyQYJzXQuCj+tAdrIJUZfErGGLgNYaAM4uHR4pmdNHbpvYy2Sd3Z2OzLo
	 1DnRdYBfJ6Hl9iD6QH0UcicrlNPWz/8awjayr+PERqvxab6MNiwZGeHt8CXPfQtY5V
	 ugEl0kobslmbKzjGSQImNNYS9if0+NomZEGd1OeAn73N1X4JlkVa2nGBeWja8DO6mm
	 GfJFV+N6LSiow==
Date: Wed, 1 Oct 2025 19:06:57 -0500
From: Rob Herring <robh@kernel.org>
To: Zhengnan Chen <zhengnan.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Message-ID: <20251002000657.GA2511095-robh@kernel.org>
References: <20250919081014.14100-1-zhengnan.chen@mediatek.com>
 <20250919081014.14100-2-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919081014.14100-2-zhengnan.chen@mediatek.com>
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

On Fri, Sep 19, 2025 at 04:09:55PM +0800, Zhengnan Chen wrote:
> From: "zhengnan.chen" <zhengnan.chen@mediatek.com>

Please fix your name here so the S-o-b matches.

> 
> Add binding description for mt8189.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml       | 2 ++
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml         | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index 0762e0ff66ef..aac8368b210c 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -40,6 +40,8 @@ properties:
>            - mediatek,mt8186-smi-common
>            - mediatek,mt8188-smi-common-vdo
>            - mediatek,mt8188-smi-common-vpp
> +          - mediatek,mt8189-smi-common
> +          - mediatek,mt8189-smi-sub-common

Perhaps some explanation what 'sub-common' is compared to just 'common'.

>            - mediatek,mt8192-smi-common
>            - mediatek,mt8195-smi-common-vdo
>            - mediatek,mt8195-smi-common-vpp
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index 2e7fac4b5094..9a5dafd7c07e 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -27,6 +27,7 @@ properties:
>            - mediatek,mt8183-smi-larb
>            - mediatek,mt8186-smi-larb
>            - mediatek,mt8188-smi-larb
> +          - mediatek,mt8189-smi-larb
>            - mediatek,mt8192-smi-larb
>            - mediatek,mt8195-smi-larb
>  
> @@ -85,6 +86,7 @@ allOf:
>              - mediatek,mt8183-smi-larb
>              - mediatek,mt8186-smi-larb
>              - mediatek,mt8188-smi-larb
> +            - mediatek,mt8189-smi-larb
>              - mediatek,mt8195-smi-larb
>  
>      then:
> @@ -119,6 +121,7 @@ allOf:
>                - mediatek,mt6779-smi-larb
>                - mediatek,mt8186-smi-larb
>                - mediatek,mt8188-smi-larb
> +              - mediatek,mt8189-smi-larb
>                - mediatek,mt8192-smi-larb
>                - mediatek,mt8195-smi-larb
>  
> -- 
> 2.46.0
> 

