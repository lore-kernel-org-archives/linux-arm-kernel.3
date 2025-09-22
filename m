Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718DFCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdnrpcJTA6W80epIFVEr9RESMLojpwfSvbzWrohT1f4=; b=1tgpABPKItUcVXpDRhhDljw3Ft
	bS7rexpAzLeQDOgzTun/fEqj4k60wkKzgk0/RZGJ8EBpi8+enSQ7a3hGlpSirEi5WPoIHaKWeGg1c
	p2/ScO9S4NUfeU00bgmRegrAeKlBJKqgtclUNCba5e1UxjPt3Orb3XBCKMfxwM7UDxU1CLAKvlnKi
	c8p3nhw69H9MEZP6oe0q7ZZ2eccU5GlI7P94FO+bWJ2+oLGwAVHX9khrkIXB79cscdyFz5NPxkJ48
	Py4R1ZCsP1WdZolqEQ4GN0fPktoc1wyEYXz3faArfXSHGQu6Nyb0xfrvdFAKd/FZdA6oAUynRuXny
	WwW04Hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kMC-0000000B7vq-1WDi;
	Mon, 22 Sep 2025 17:29:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kMA-0000000B7vK-2r9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B4F240597;
	Mon, 22 Sep 2025 17:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136EEC4CEF0;
	Mon, 22 Sep 2025 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562182;
	bh=K/Qpa2ZzUrfkH4XTwu0ZRDbtZ4B/GhvgJeY/9kLT1io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ir755y/U6mFPdgo1dcGviCBDhxs4h7quyB+H5YAsO7sCRJyB9+TMKNiyouRj0u1Hu
	 OKPi4ybjXRSh1gvHvZ8uz7YvqjjIBruIOFfF7oLkzl12ZWxCTu3R6JArrnKSvQPYKI
	 U/7d/6UWmY7VehDcHKozqwHRL3Sjb90C2BLcoNtXofpZ6VRIyIGy//oKoFIDve1LW3
	 mnGkqLLi/oY7iCBTxQYw8E68TRTIqXIYqP0JFckZQB9uZAbsVlsSg53kHHeRkQWP7k
	 +w/kVgoEeaKEwvSwOJOUrUMlPXRxR7Gnyx/VJJOHjKZq4T/JKU8bIBM7sglBjdJG0U
	 zbVm2cYnWOwvw==
Date: Mon, 22 Sep 2025 12:29:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
	linux-sound@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: dma: Update ADMA bindings for tegra264
Message-ID: <175856218049.506615.12343384310941956562.robh@kernel.org>
References: <20250918102009.1519588-1-sheetal@nvidia.com>
 <20250918102009.1519588-2-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918102009.1519588-2-sheetal@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_102942_738068_76BC0336 
X-CRM114-Status: GOOD (  12.09  )
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


On Thu, 18 Sep 2025 15:50:06 +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> - Update ADMA device tree bindings for tegra264 to support up to 64
>   interrupt channels by setting 'interrupts' property maxItems to 64.
> - Also, update the 'allOf' conditional schema to ensure correct maxItems
>   for 'interrupts' based on compatible string, including tegra210 (22)
>   and tegra186 (32) ADMA controllers.
> 
> Signed-off-by: sheetal <sheetal@nvidia.com>
> ---
>  .../bindings/dma/nvidia,tegra210-adma.yaml        | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


