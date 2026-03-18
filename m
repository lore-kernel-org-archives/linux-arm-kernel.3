Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BD9FCD0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 07:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u8xsagI/WB7hps/pkrbDM3dKjKxb1MRxDzd+RMK+IM=; b=IDJvleke8N8x6/YJdLuu6L9b3k
	0OuHrJl9J9S7V2VILwnYOxlvZFYIYKkQUg1HOu4utziCC2Uk24mPYUw8DlMG2+VwZqSz/XuYKOpJb
	laLcrYxes/AkZ3VmHpoTwsAS4rL3XlBW258GiN++iU53IzRMxMNTxrQw38TM3/xNakCkhlNhJ9K8l
	d5pKsgty2IWy6SrMQ9pIrGpZsoiUoJ+AUPzcDrVaJTXrWnxZuOfxi79X6stzAPKqOr0M1vIYWnNsE
	Fe5LdNISfwpCxBl8O+5K1vwqAtdzyLEsfpq3xghA7XvqXrn90qjH3gO2QY4cY48ddSn7+LtdtINKh
	vFJePinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lk5-00000007xmW-3yKW;
	Wed, 18 Mar 2026 07:55:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lk4-00000007xlU-17oJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 07:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FA85600AE;
	Wed, 18 Mar 2026 07:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73269C19421;
	Wed, 18 Mar 2026 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773820499;
	bh=N6cd1DK0Kllt8jT0L6RRnZfk0S+Wf0Q5OKZrj6RgUR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrmaJoSLYjPRCs7DRpxicubv3U5QaPhq+488+AQX8dcYmEavnuAOs2G76mN5fFOIq
	 6bpAl2gVrXOgbV4z0l9rTcTULZKFmGYPPMmJ4JFwvFZ2iIa0UAOB+qXWu+MzVap2dc
	 x5UwJCt97AiEpGSl7jyRpvVUUI/aho9cN6IG71u5w8Frm3CNbSGOvh14b3ZR5tPBtm
	 xVVODjI+b67MdwHxPFaDGAttosT4cTffNeiXeudYIWxeY0JPWa2UxgGkXloXxCS4xv
	 BTk4MBcsyYnj63QpdwFnQjKcwdk8w5dwiO4fqFOC13f0fncEZR5NaXP2dC0nfoztVX
	 kzfkTOHd2/V0w==
Date: Wed, 18 Mar 2026 08:54:56 +0100
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
Subject: Re: [PATCH v2 1/2] mmc: dt-bindings: sdhci-of-aspeed: Add AST2700
 fallback compatibles
Message-ID: <20260318-abiding-sloppy-poodle-efd3e5@quoll>
References: <20260317-sdhci-v2-0-39b1f063061b@aspeedtech.com>
 <20260317-sdhci-v2-1-39b1f063061b@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-sdhci-v2-1-39b1f063061b@aspeedtech.com>
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

On Tue, Mar 17, 2026 at 01:56:42PM +0800, Ryan Chen wrote:
> Describe AST2700 as compatible with the existing AST2600 SD controller
> and SDHCI bindings by requiring fallback compatibles in the device tree.
> 
> Also require `resets` on the AST2700 SD controller node.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v2:
> - add missing blank line
> - modify ast2700 compatible items const

Why?

> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml      | 39 +++++++++++++++++-----
>  1 file changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index d24950ccea95..9c8e068964a1 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -22,10 +22,14 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum:
> -      - aspeed,ast2400-sd-controller
> -      - aspeed,ast2500-sd-controller
> -      - aspeed,ast2600-sd-controller
> +    oneOf:
> +      - const: aspeed,ast2400-sd-controller
> +      - const: aspeed,ast2500-sd-controller
> +      - const: aspeed,ast2600-sd-controller

No, previous code was correct.

Is this some microslop LLM product? I questioned style last time and now
we got random changes without explanation.

Please confirm - did you use any LLM microslop tools to create this
patch? Please also confirm - who internally reviewed this patch before
posting?

Best regards,
Krzysztof


