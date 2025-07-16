Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9573C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 08:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/W2VNJ7Z270wnanJbkwMOnat+PSp1Se1ASZo6lM7wA=; b=22fbO8TOzv0aGtnRC+1sgdHExu
	vHlfmqis1YGLUM0TkTypn/2XIvBeS2LVk3ya3JmHHCqB6ddD2c8O9z6j/tFLO++S8LjQ541MMOs1U
	yMbDe/d6nRih28qZ60ZmYSykXFyPBWWrniTJlK3cyHY144inHeBvwYTuQCkuXlc7jEQRAZi7go7Qx
	iByHK8xf6Ri36G/U3ToMQfytY9h42+I5GGVTfP+Kc0j38Lbwafmc1WCkZ0nIPlHHlsZYoGVmNMLRA
	CoQ84RrcmYbN0Vb+BihPzzdnQLDZ9AMgMDtXP6aTdwenQigXVNhys8FCPpUOOizmjAKCp2rEmdEux
	y5CtbQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxo6-00000007Cv0-3Djc;
	Wed, 16 Jul 2025 08:48:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxUe-00000007AZT-0hkr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 08:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D1E16115E;
	Wed, 16 Jul 2025 08:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C2CC4CEF6;
	Wed, 16 Jul 2025 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654479;
	bh=AuNQsZ23rKXcpc01jPxb/MFPAjRIiFTOghWtUQwr16M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAsqApLd7YMtfpyh7q9HBWLtpv59a+BdExG5ZbkY1W4xOPV2fgVn9Nnwmnh4o7VCh
	 wPurbQEYAmtPOoq/q0MzcifYKKUL4O7GC5HGXwSOrxAL66QQtsdM2iFdT2LB067sO3
	 jXO5zitGSt+jlv9t61SLlmqTGIbjQGjBMYdkLRhiR77iHuawbsKrRIOyCB2h4HwtnJ
	 C971yf7A03FuFngrET2q6LV/rG+uJ3AIBeoVsXtEgu73cdDexNVsl45vsyvY1cm1Cx
	 1hOETZh0jp4qnoKgGPnhlDVHT0yKDI8YTB3aqvLXIe1ULwV8jeygwnLlEB3PRFLDg2
	 adhk41lQTL0VQ==
Date: Wed, 16 Jul 2025 10:27:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 Add PCIe RC PERST# group
Message-ID: <20250716-provocative-worm-of-gallantry-3797f8@krzk-bin>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-5-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-5-jacky_chou@aspeedtech.com>
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

On Tue, Jul 15, 2025 at 11:43:14AM +0800, Jacky Chou wrote:
> Add PCIe PERST# group to support for PCIe RC.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> index 80974c46f3ef..5d7fbb1c72b7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> @@ -254,6 +254,7 @@ additionalProperties:
>          - WDTRST2
>          - WDTRST3
>          - WDTRST4
> +        - PCIERC1

What feedback Aspeed received about ordering lists? More than once?

Best regards,
Krzysztof


