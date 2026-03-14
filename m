Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72AA10706C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRB07cdJzB/tkrap4FE0HHlO3cJEFdlT5ADMGeesBcU=; b=kBdnrfGnFmsJYJPjYkAdrBPaur
	jO7dqQDOJ+0F8zm5f5KLRiPChwj+DkirHAh1hICUk5ljEamtbnh4KT11Xaw0EoCsaHKLxEen3W4sp
	JZ9PDGJLxsdokwCm1faWdsQSm0V4MyMFbD1+vaxkqeGgAN0fnYKW7Qi1vfyg2MRenYPN9TuI21tAi
	fDTJUGypp6dn1IvBopMJ3oOCZIndYIjbhmaZCCWOJCjoKSbmrZcUAVGxHH1P8F2lEd2F07ecGYlDJ
	hfIW87wZjzvZXbrHCD35L+HkBoLTp6W0YmAYcC2i9fsPeYDMre1HSP12VcSIi9ZB15FxkZCIIR2AG
	omDzP/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1M9P-00000001k3M-48ax;
	Sat, 14 Mar 2026 10:23:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1M9M-00000001k2y-3p8z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 10:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 133DD41A5E;
	Sat, 14 Mar 2026 10:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCA9C116C6;
	Sat, 14 Mar 2026 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773483795;
	bh=5PkAknHHM/kOX+aOCmxl/1qV4NYtdKOeDMzTVtjIgW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQZKEhRtm+fH056uWWAG9LnfwkY3iifEFZhSsmNoVk6WOzyn6lUXwKE3FCVQNsbYw
	 a3ZAloRiscW0UZofgoJDazvPz8inZJP1W7z/V2AZW8A8hNadAI9nJNapUlo73kwPsN
	 1wcpzYDFmP4nZ1JAWyzGGyL9EXZ8q4BRvbOuEA1fUIgMgTjHvE6PSlQXA7sqweISqL
	 nn6gi95nbCFr3cufZVhIR3yHTcRTVuvg13narL9U24Bb0UhvL2PMJLjFZOhP/T++dB
	 kshXcoKPv/q8Wiohwmuu7P0T0OnEad7OGQPuY2AGewC2IaoT36Y2enSeBNzJaLgpUx
	 ngiuA77++BW4g==
Date: Sat, 14 Mar 2026 11:23:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mmc: sdhci-of-aspeed : Add ast2700
 support
Message-ID: <20260314-naughty-tody-from-vega-116b3d@quoll>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
 <20260313-sdhci-v1-1-91cea19c8a67@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-sdhci-v1-1-91cea19c8a67@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_032316_973598_CE475474 
X-CRM114-Status: GOOD (  14.20  )
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

On Fri, Mar 13, 2026 at 01:27:56PM +0800, Ryan Chen wrote:
> Add the "aspeed,ast2700-sd-controller" compatible. The ast2700 sdhci
> controller requires an reset, so make the "resets" property mandatory
> for this compatible to reflect the hardware requirement.

Subject - there is never space before ':'

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index d24950ccea95..a2ff9a94db13 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -26,6 +26,7 @@ properties:
>        - aspeed,ast2400-sd-controller
>        - aspeed,ast2500-sd-controller
>        - aspeed,ast2600-sd-controller
> +      - aspeed,ast2700-sd-controller

Missing blank lines everywhere in your patchset.

>    reg:
>      maxItems: 1
>      description: Common configuration registers
> @@ -37,6 +38,20 @@ properties:
>    clocks:
>      maxItems: 1
>      description: The SD/SDIO controller clock gate

Blank line

> +  resets:
> +    maxItems: 1

Blank line, just open any other bindings. If this is because you used
LLM, then obviously NAK, because we should not waste time to review
unsupervised poor quality LLM output. It is your task to review it, not
ours.

