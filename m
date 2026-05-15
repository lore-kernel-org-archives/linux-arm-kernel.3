Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29ADCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aayYoNLtll9vIlj3Cz7JPL/gvE55Wlr9M7CvBFYsFzs=; b=lfJgupl565vlApt6tmcmllX9EY
	cpICazZc1ko5I2LLcuHEz+y5oAwH/w4oZ1Ugj7y5UbpZ0H2UkvzzKmWX+vx388rVTXyLl2KRMdwbK
	9dZutF5U1ageUB8amFQ5wkJcUB1aCkF9ZXsKgIWtFzCIUZ/qhvxN4NTOdtYJcOBTFPQLyJeEiu7oF
	R6eMMDX/ca3cHstHMJV1zc4KrVnJ0xydUm0gP8lkvEoL1JrC+d+GkZpRa833FUyJPkPG9mSVoywa9
	mHz9QK/nH69M21I/lxnHJRH622qVBNHZA0GBY8wvXb/2UsZvh6LM/P3Tx+/susgRgFrTpP4qJ24n2
	JwjwNApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnd5-00000007hdz-021Q;
	Fri, 15 May 2026 08:10:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnd3-00000007hdh-1HO8;
	Fri, 15 May 2026 08:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A054160581;
	Fri, 15 May 2026 08:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C324BC2BCB0;
	Fri, 15 May 2026 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832640;
	bh=gBhbHi0NNHhrL8d6+VY3N6+g1i4FaaoCLvTGFtKl2Pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIisNbMahMfMg8P1xFwMV8fkdAzB6JeAP7J9qN5JVAv5AShhQ8A8hhuuUTJddX5U8
	 +Kwfsy0yYf5LNChgUD9xOIUIifMjt0yZ1b7MDrzkkimPaAl4pYsyFB+xZscVPfokaF
	 5J2wpPRuU/079FaRMfblnDwVCNVD/NtwUyOLl1Iagm/bkzjtQyUmQsOFyC+vhbhUpP
	 cFmilDV+dk1luUGRU3W0jGx3DrOKwt0nQsllZ7EE8lYu1wpqTlsVTG5HfObLeH0TRC
	 YMTa6Iuhi90/xDMngx62lOddNQRWofgO9AHB32hn4twFPbiA10Ia6aJgV6y3KhsRYY
	 cKzaHo8xoGOVQ==
Date: Fri, 15 May 2026 10:10:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] dt-bindings: clock: Add Amlogic A9 peripherals
 clock controller
Message-ID: <20260515-augmented-cyber-puffin-4db20f@quoll>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-3-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-3-41cb4071b7c9@amlogic.com>
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

On Mon, May 11, 2026 at 08:47:25PM +0800, Jian Hu wrote:
> Add the peripherals clock controller dt-bindings for the Amlogic A9
> SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../clock/amlogic,a9-peripherals-clkc.yaml         | 150 +++++++++
>  .../clock/amlogic,a9-peripherals-clkc.h            | 352 +++++++++++++++++++++
>  2 files changed, 502 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
> new file mode 100644
> index 000000000000..97e2c44d8630
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a9-peripherals-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A9 Series Peripherals Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a9-peripherals-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    minItems: 20

I don't think so. How they could be optional in silicon? How does
exactly work from silicon point of view?

> +    items:
> +      - description: input oscillator
> +      - description: input fclk div 2
> +      - description: input fclk div 3
> +      - description: input fclk div 4
> +      - description: input fclk div 5
> +      - description: input fclk div 7
> +      - description: input fclk div 2p5
> +      - description: input sys clk
> +      - description: input gp1 pll
> +      - description: input gp2 pll
> +      - description: input sys pll div 16
> +      - description: input cpu clk div 16
> +      - description: input a78 clk div 16
> +      - description: input dsu clk div 16
> +      - description: input rtc clk
> +      - description: input gp0 pll
> +      - description: input hifi0 pll
> +      - description: input hifi1 pll
> +      - description: input mclk0 pll
> +      - description: input mclk1 pll
> +      - description: input video1 pll (optional)
> +      - description: input video2 pll (optional)
> +      - description: input hdmi out2 clk (optional)
> +      - description: input hdmi pixel clk (optional)
> +      - description: input pixel0 pll (optional)
> +      - description: input pixel1 pll (optional)
> +      - description: input usb2 drd clk (optional)
> +      - description: external input rmii oscillator (optional)
> +
> +  clock-names:
> +    minItems: 20
> +    items:
> +      - const: xtal
> +      - const: fdiv2
> +      - const: fdiv3
> +      - const: fdiv4
> +      - const: fdiv5
> +      - const: fdiv7
> +      - const: fdiv2p5
> +      - const: sys
> +      - const: gp1
> +      - const: gp2
> +      - const: sysplldiv16
> +      - const: cpudiv16
> +      - const: a78div16
> +      - const: dsudiv16
> +      - const: rtc
> +      - const: gp0
> +      - const: hifi0
> +      - const: hifi1
> +      - const: mclk0
> +      - const: mclk1
> +      - const: vid1
> +      - const: vid2
> +      - const: hdmiout2
> +      - const: hdmipix
> +      - const: pix0
> +      - const: pix1
> +      - const: u2drd
> +      - const: ext_rmii
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb4 {

Same comments as other patches. Do not come with your own style, but
adjust to mainline. Do you see this anywhere?

git grep apb4 -- Documentation/devicetree/bindings/clock/

So why coming with something COMPLETELY different?

Best regards,
Krzysztof


