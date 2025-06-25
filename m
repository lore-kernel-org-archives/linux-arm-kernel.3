Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15A6C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8Q5gDM0SPjJptdIBy/Xv2dEf/bwiSp+9czL27kjJW0=; b=MBLvz1JJ13Dk4YfF5WXe6LfYsH
	Zg6bpjIj5tJ5izgTCVyeEJiGSE5p4TjfmvLLZRzdIyESgNaXWWPyYT6WocN4TbmlqQA61eBTDcUDn
	5ZiVNtAhjQ3jFLX9CdAW3Gn9TvN9wxxHu1TrUaCXsiLTt+Jdphr35f0qYf48LLZIxEAPLevSL0EDf
	GnBIcH6Huuza2iTctq2DLFFiED/RG1PMv9u7fvoqQMXuHSzfLFwm9wEkRWRPrZAUFgbbNPl0wUwa/
	9DckUoYmeSSpRQGduimgJjmnvH2IKvIH/UMtr1cThhSrPQSE7IfgB67bUHgQx+kKW6AaSQspwS/ey
	prdp76Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXUQ-00000009x2j-3GNJ;
	Wed, 25 Jun 2025 21:17:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV38-00000009dKg-0xsd;
	Wed, 25 Jun 2025 18:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F73F61425;
	Wed, 25 Jun 2025 18:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31C9C4CEEE;
	Wed, 25 Jun 2025 18:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876844;
	bh=G0ZtbjjaXpwn9zFSPBNkvbd+Aj3mZgZ0xv6kXXcjdt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efojQDROTflqmTIAaXAItvhNnGdXHxQjO1uoj/C/j9dOY/+gAiwrk8mrGCTIQEZP7
	 nAScazUl5mDMqI+uRPvxQCsCPKvPdt7zjYdped3HC+re8L3VUNVEBffO2mf6BUHFwk
	 afr73TA+vf0s2FEYzn+qNfpU+3cQCDM9780QLVQvdxFMeLQa/YaRdDJyQ0G7exrp5E
	 aon2jMH2FgNTS9J7AoTcyA2r+W1AtLL4bfug4EOEWq+UmhXhQqWrbHVnmdWsRNEJkV
	 tsZJ5Nir+nfrwc1OioIEkj/V8wg3912PIHzZQR9M7Up/HCsneFfuEfQIrJCmJHJCu3
	 pKmUQtx+Afgjw==
Date: Wed, 25 Jun 2025 13:40:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing
 reg maxItems
Message-ID: <175087684357.1998777.17182209219488528393.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 03 Jun 2025 13:57:09 +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraint, so add missing maxItems to the "reg"
> property.  Since minItems=maxItems, the minItems is implied by dtschema
> so can be dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


