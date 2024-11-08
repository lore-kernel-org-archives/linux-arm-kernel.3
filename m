Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2619D5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgDRKlKXMcmqzIBoMBDS0f8kDIA58QcyTx7KPx2LAEw=; b=KR/d1joDvan4QSA+8bmfHB/g2B
	1u4zy73jgrxiToKqY1f/ia3P5mfy0BidJqIBrRif7qJS3lf/ypgOgYevzIPeOLILE2M3PLMjSHM+H
	iX34ripPYsjfhhS54XjgNW/Ohe31Jo/hdFdDKcioxPbQIJp0GKfNL6kzJcjGzLTP3gLHaq/phi9LH
	jB2zuUTMFReXysPD6/tJO4mf8tgY4NVYetB3lGPh/50/zHQmwHi7rw1pJ9NsJXZIih1OyOQa9Ux9i
	fzOMsXGCQrgwVKhKvyE92ZgKzWJpmYVC1a4OONxdA4UbMjOzev8gHP9rPBLPnruv6kn+G9Vm8UQju
	ZvYBIYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PKA-0000000Ajaj-2Dqa;
	Fri, 08 Nov 2024 13:46:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O9p-0000000AXT2-2kpO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27E36A4291A;
	Fri,  8 Nov 2024 12:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185C2C4CECD;
	Fri,  8 Nov 2024 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731069128;
	bh=OTSjLYZ9CZLdTvXs6M+Ao3qZ+7v2e9k19DVGtbucSic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thlXps8ZJocdFA3UPRDrvXaiiCEru2GJimSp8zo+cSiFyBtaPPVWIyjv57IESI9AF
	 O+xIRj7hmQNOrdrK2C4kxu+ngrYBxXEI2vtqxr1FKjF2RTeDqxUh9hTOhEm6zxWy9+
	 NmbH/K0z8F/UVdswFtDc7uGiKtR7enBggiINeMQdk6Lp1F4UuEW/B/K/y3xGkEc5xQ
	 QX8HnYdMQu/mpsx7Y1DEDpQjDI+XfRi5EfDAUult+xkXxwYgYqeG43PuRkTXq61bIe
	 kne8JaI1PlfgdR+0LoHJhCNE7vAuzNdvHmvs0//W4jVFSEQ4tS9iR+KnLt18rulb8p
	 yAX6LV9uPrztg==
Date: Fri, 8 Nov 2024 13:32:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: add stm32mp25 support for sai
Message-ID: <3nkoutm4uixuhetf5cputloooqzpvwhcnq6wklhu3euazmrybe@mjtjqnehfnvg>
References: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
 <20241107155143.1340523-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107155143.1340523-2-olivier.moysan@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_043209_776845_02BCD596 
X-CRM114-Status: GOOD (  14.86  )
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

On Thu, Nov 07, 2024 at 04:51:41PM +0100, Olivier Moysan wrote:
> Add STM32MP25 support for STM32 SAI peripheral,
> through "st,stm32mp25-sai" compatible.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/sound/st,stm32-sai.yaml          | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> index 68f97b462598..4a7129d0b157 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - st,stm32f4-sai
>        - st,stm32h7-sai
> +      - st,stm32mp25-sai
>  
>    reg:
>      items:
> @@ -43,9 +44,11 @@ properties:
>      const: 1
>  
>    clocks:
> +    minItems: 1
>      maxItems: 3
>  
>    clock-names:
> +    minItems: 1

This actually fixes the binding because it lacked minItems before :/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


