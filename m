Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009E5C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fjwkpaIW8d/RF5+xL6P9IlYEI/fbZI2/pMFcpOGU5M=; b=0qM0kKg6yhd3tiJZFJTjdt8HG0
	MovAnta3JVYsV2YYaT8K2/cgFcnEf+MZWSaKD1vmD2fPzqAu70cScOR19QoGYXjdO6AYEvIOcDKXw
	2OKuB5wyNPl1uVM/aEJO1ArFaCNuYdh2pXypeJOAMiGwJRUTq/lTUc521gHMv1DU76efZu5OWeasU
	Lo5k7rF/h+btz6Rzl4IoJo1gVpHVODQ/YoSxf5mNe5Omeh5/z1YbVNFQPM4UP6N9ZvGnii55ACFaG
	dZz10888AzjaowjZ+kHCmHjTMAhyCbhQZWXOmmmCZGQMEivEfdNxUcE7HGUue3PVK+bpCj2GvG8O2
	JUADo3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCQg-00000007C7v-1Bfx;
	Sun, 25 May 2025 14:34:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCOb-00000007Bw3-3eGY;
	Sun, 25 May 2025 14:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C46E45191;
	Sun, 25 May 2025 14:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1A4C4CEEA;
	Sun, 25 May 2025 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748183532;
	bh=gD3iutxq4pqSFaNAhKZd5QxYH52E0Fd1DVRC+e7CGL4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uT0d++RXL/JC2mIYgpix9YvqGiMzGu7LP9aCd2alUnLRCfE85To5H4yLZfezW+BGc
	 8P7I3HZzvJkYvgfeCaPJQ2HZOv8unzP+8g2mCLEPIN+Vrh8bhYEMQM70OsIpA/LSu9
	 EJGw4NeHe1nsa5kFpo0PCw1ESkMEjoHjJyZsJp+LfihOhpebU9f56GqMQGeCzqovwH
	 GskUhG7q89Yii89xmhbQxDbZxMwRrhiMcuUleKo2RSjsJdTMnAT4E+WDOlDpZhQKgv
	 Y0iSR9tFuU4YHof2FtaExlypoqntYdvLvx6wHudhQqFCA2FjJ1LHrj4iOw07yZO4Ky
	 +uIkGvRtdxglw==
Date: Sun, 25 May 2025 15:32:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Chukun Pan
 <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] dt-bindings: iio: adc: rockchip-saradc: Allow use
 of a power-domain
Message-ID: <20250525153201.51d733e3@jic23-huawei>
In-Reply-To: <20250518220707.669515-9-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
	<20250518220707.669515-9-jonas@kwiboo.se>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_073213_937609_BFC11C1D 
X-CRM114-Status: GOOD (  15.33  )
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

On Sun, 18 May 2025 22:06:55 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> The SARADC controller in most Rockchip SoCs are part or power domains

part of power

I can fix that whilst applying if nothing else comes up.


> that are always powered on, i.e. PD_BUS or PD_PERI.
> 
> On RK3528 the SARADC controller is part of the PD_VPU power domain.
> 
> Add support to describe power-domains for the SARADC controllers.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> index 41e0c56ef8e3..f776041fd08f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> @@ -47,6 +47,9 @@ properties:
>        - const: saradc
>        - const: apb_pclk
>  
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      maxItems: 1
>  


