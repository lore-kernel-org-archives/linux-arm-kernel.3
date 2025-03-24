Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE68C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WIVcpjBC/lQY+F3Q9OHHemrJ++W8RAb8N2XPq+trw0=; b=N68pw85bfJgervMy5R2oey7jj9
	LnaLIbGFRcom7FDpNt/1rEViSfLeJB+rJse6JLPcrIkJr+vFze/aNEhG+XvI2wofgB0887acbSkij
	P6HQSSG7XkZR4AwnBLp/Ou/CzDeoaVHIIi7mb6WtWtpFPl7G8/QEKi3U48f556RYywuVWkDPTyfVK
	xZu4ryjewYEbDKV6f+2ukdLxhNBIBPReXCOw9czMSFwgoPonqaw7hM0ebKT5pJsUvosPOfvgL52EZ
	TlsUVb74753L43Xq6gXPRrPBUg7XSLWYK6+L/41mDFxSc/KQ1qLhmnic8u+7pfutR4GHux2ldP350
	rqnnfx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twof2-00000004DpB-0mRc;
	Mon, 24 Mar 2025 20:44:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twoPB-00000004Byd-1GIn;
	Mon, 24 Mar 2025 20:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 620154485D;
	Mon, 24 Mar 2025 20:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56685C4CEDD;
	Mon, 24 Mar 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742848096;
	bh=nraEfwXGNNYxOKREgx+klOuG419qOT50aasEjbGDBd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnNSYE68hBSBzyeGtTO8nd4tOOxSR0aog7akGaYiLwkG8num2NSKLgjJWh8uC3WuK
	 U06pjVmuTdST0N48/cGtLz1X/xbKBvuVyo38G1KyRqk5JRDML7T2ur0OiskHh+GacP
	 G7B/QgXENoJQLeeGgj3s9fP9hpjQxsPg5EAfU+QmH/ORmrU8nUC9sLfESe3SAjib5g
	 Z5ygHc7Z6x2ayebeHLhKEgKL+fioKExC6D233ds831t23wzaGpVtdNUtbH/M6eNGmt
	 LYI/cznIe/PeS+qM2oKj5D2MgTJ/BaX50rAh9BVbl6ZwXxuPu6LozGomPx5qwW6rwl
	 MRcHsdtysEnRg==
Date: Mon, 24 Mar 2025 15:28:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	David Heidelberg <david@ixit.cz>,
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: Correct indentation and style in DTS
 example
Message-ID: <174284809477.815772.5676101186306641286.robh@kernel.org>
References: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_132817_370758_62238657 
X-CRM114-Status: GOOD (  11.41  )
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


On Mon, 24 Mar 2025 13:52:50 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../iommu/allwinner,sun50i-h6-iommu.yaml      |  24 ++--
>  .../bindings/iommu/arm,smmu-v3.yaml           |  20 ++--
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 104 +++++++++---------
>  .../bindings/iommu/mediatek,iommu.yaml        |  18 +--
>  .../bindings/iommu/qcom,apq8064-iommu.yaml    |  20 ++--
>  5 files changed, 92 insertions(+), 94 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


