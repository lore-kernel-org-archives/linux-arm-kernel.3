Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CC6C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTd55XSjBlK7tycaWv1f9MJVNEygTe6OuGK/9U8Ys74=; b=m3mn90VK+nVYLeHE/kqfSPydO5
	z3G+VZCbzzafRyntn/bgdySLdTA7n/DxjEAi+wnEuzAO7MyCzcTT7yP7QbkKl9EYNF91GpyooJ39x
	dkU1zogoj3qIFJ4jTB2l/jywd0eRxc8PbQv2bXUXZeovCDYFwv9tFtaXdq7Xrg3teY4327AR+8qbe
	aS795mLMcRhm4y4lvNNbKqdi6JKn+iqORmmVdwOWU0/1BOc5463bBCrzhp1TNYWUr3gVDThhR05LM
	rgQ0qQhobdKACVUeVQxzffqpvM0KeeSOVFqledOjqDSqAwyiUPKf9qmP598NuLlDe+PqIUXi1aoP2
	OiWgA4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8RI-0000000CnuM-20xo;
	Fri, 28 Feb 2025 22:02:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8GM-0000000CmJV-2pf1;
	Fri, 28 Feb 2025 21:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC0105C6542;
	Fri, 28 Feb 2025 21:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6AAC4CED6;
	Fri, 28 Feb 2025 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779477;
	bh=MpxAPzTlZ5GUX0OOzjchOn8f8pXXh+0IM+v+xJd4WWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFJExWtH2LCBe7zjInr9DuNEQHLDHXLiJBc3/HwBevOdhVxqXOryyZLBeVOEU1/O3
	 Fse/CqUmQ2d/liVgpd2ZXuqL6ntJ5N1aNoevYQBSUczjhsGZdz8UWsCCb9sCOZ64Ia
	 V3v75TzQM6ILLwp/YzYnXPrgWnrw2X+BNXymwVyUjdSsNkMNxcynq7pekl8uGa61rp
	 YUluNc1Ho4kqxCSXsuPfa6GilbamXY8OCXa+uFQcgJE5nAtyz4cbfZSri/9CDpWXI+
	 V1RFBZPCwaa4VMS43U6SMlg50kUWi4gkaeLQRKgYb49aZ5PfMcn2A7OjjMEkuClObu
	 XAwNgq0DExw/g==
Date: Fri, 28 Feb 2025 15:51:15 -0600
From: Rob Herring <robh@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: meson: Add audio power domain
 for s4 soc
Message-ID: <20250228215115.GA3756522-robh@kernel.org>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
 <20250228-audio_drvier-v3-1-dbfd30507e4c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-audio_drvier-v3-1-dbfd30507e4c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_135118_757053_FA3FA2EB 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, Feb 28, 2025 at 04:04:09PM +0800, jiebing chen wrote:
> Audio power domain found on S4 device. It need to enable before audio work.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4ceab82389167079c2258a9acff51a76..364783c6f7572b09d57de2b35d33adb7bcf7db18 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -21,6 +21,7 @@ properties:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> +      - amlogic,s4-audio-clkc
>  
>    '#clock-cells':
>      const: 1
> @@ -100,6 +101,9 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    description: audio controller power

You have to define how many (maxItems).

> +
>  required:
>    - compatible
>    - '#clock-cells'
> @@ -116,12 +120,26 @@ allOf:
>              enum:
>                - amlogic,g12a-audio-clkc
>                - amlogic,sm1-audio-clkc
> +              - amlogic,s4-audio-clkc
>      then:
>        required:
>          - '#reset-cells'
>      else:
>        properties:
>          '#reset-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +
> +    else:
> +      properties:
> +        power-domains: false
>  
>  additionalProperties: false
>  
> 
> -- 
> 2.43.0
> 

