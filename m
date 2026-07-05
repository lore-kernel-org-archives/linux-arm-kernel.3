Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 21:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbQNhdkctUVjCrWqgHp2lFDpL+jVLHEUAKKHow1V6ZY=; b=1GGiWYUdNuOW5OnuaIVI4T4ish
	DC+bFcMttyIChfDLsY2Lvo6JSvL9LWAudgNdJm/coIOBGJcg3GdhEin/c9Ywf5DpE/i03g+d6WkrU
	Z+bZ08Id2pZoc5kosdZwiAwi2yVUKkUvnMAw8qFByMXRPLCbuQNQuJ/WmZ7QLZXWI5QV0sG7oAKe7
	4SLXp/FyxQu6+T+kv+yYmkMg8KlyjEZz9SWBdDY+ZE86Cdj3SB6kx6CclNk8TNw6H1ONQMZNayInx
	Nf3F9rE9tswDNvYi8kdOd7rIY9LOVCpVSiUUbxEDRE/nVzyxTc2C2P3eayGYBekTh1rWmBb1YUqQH
	TlpWlBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUXh-0000000A4j1-2JRq;
	Sun, 05 Jul 2026 21:38:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUXa-0000000A4gC-2dwM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 21:38:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 52C30C8EC43;
	Sun,  5 Jul 2026 21:38:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FD77601A2;
	Sun,  5 Jul 2026 21:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9652E11BB95F0;
	Sun,  5 Jul 2026 23:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783287495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=nbQNhdkctUVjCrWqgHp2lFDpL+jVLHEUAKKHow1V6ZY=;
	b=db7Tpjhvy2P3I3L5rVTMzVybDeO2oVAJ6F9StSi9s5nFSsC/5W0Z7AS2zs8aUchOxNKvfH
	E2jzE0Wl+ZY4LXuBm255wWh6DVqGt7aCa6fGgZ/kwybMWnt/EBgZlhaOYGFQQKk/iEcH4E
	PZw9Wk38J5V7BxP7hdgC8mBkNafEP78/kLIzw03WqTC+2UkYZjVSicubiKr3CAYt+ayWfH
	x+XHtA4ZNekVaVIP5T8/5Rcqm5fgo6sUDeJ4Ea0CdIMq4PZlLgHRn4Qy5JHZZVielPSPWk
	WzZLcis48TfAJo/eBRauaHM+y+GchH1cHDMX1zcBfvxwo+vw+wa+mepI3Xd9RA==
Date: Sun, 5 Jul 2026 23:38:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Message-ID: <20260705213810296b48ef@mail.local>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_143818_860759_FE83C5F0 
X-CRM114-Status: GOOD (  13.33  )
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

On 02/07/2026 10:10:00+0200, Jerome Brunet wrote:
> On h616 and r329 chips, clock output names are never defined through DT and
> are not meant to be. Just disallow the property for those chips.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 9df5cdb6f63f..959a012c626f 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -175,6 +175,18 @@ allOf:
>          interrupts:
>            minItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun50i-h616-rtc
> +              - allwinner,sun50i-r329-rtc
> +
> +    then:
> +      properties:
> +        clock-output-names: false
> +
>  required:
>    - "#clock-cells"
>    - compatible
> 
> -- 
> 2.47.3
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

