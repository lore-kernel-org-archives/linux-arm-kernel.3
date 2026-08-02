Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E7EC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wr9KcQd5UOYPcDKO9OAtdsNMsJA9M3uNYC31Vb57iYw=; b=MOjlAEEs4dWOLBUuZAiPcd3Ktb
	bKnHbEsA+j4rE53kAOqxJc7Q8bjO/jFZCzbahvgRvvskr6PkzQX7gEgl6w4k0d0zxXTDIpyn59GIl
	bX9e/TmnUt5lJhoIHs04K8Ld5iZ8aXI8HpT2qT/LQYExiF9966PzxOrgBx053fzhp/dCtiW/8mt97
	OguxbFuIiKTN0TRl7BK/MakVTO900QjE2HqDck34vp78Wn5ZsO/2zJbHDb0f7D6bfb7N/Y7bqvcvz
	uZmC3F1RvecoXlZcQYK0T6BhUIIY4DKMJN52yV7us+hkcbSWQBgvNczMx3p2Nem0sa5Ht34TnmQKS
	Rwl3rpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqWeg-0000000FgqI-10rC;
	Sun, 02 Aug 2026 13:55:06 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqWeW-0000000Fgoi-4BH7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 13:55:04 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 452731300080;
	Sun,  2 Aug 2026 09:54:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 02 Aug 2026 09:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785678895; x=1785686095; bh=wr9KcQd5UO
	YPcDKO9OAtdsNMsJA9M3uNYC31Vb57iYw=; b=DplQdUY4k5pHQXGjL444hzwd6x
	Uq8dSWgKlS+OHbGSPASMrkkGChOSifHzzrcROinwlM/LbRiWRYwRepZ6NzEcq62J
	1kHQB8c+GkHsi8Xy5ozdjGTV0UT0VfrO/ZCcAJib89mL/KBFed3s24XJXa0y4XR9
	DmG07CgkJacT0R78Bx7D1e+PztPQNCrh105GK2Hel+sJVor6HeDuhC5/7cpoV6xQ
	YjNshJiU/Krc1H5FAlRgLVfjqKGUUyYNT0cH1WmnIhiPUbpRAix/RkmQXRlkVgbM
	acWu0zj9m3upJo6c++8sRnxmrgq5sK85QGKvzAIwtjybopnlu+AehCjw6D/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785678895; x=1785686095; bh=wr9KcQd5UOYPcDKO9OAtdsNMsJA9M3uNYC3
	1Vb57iYw=; b=XmXujbLftAvTzmIRsm3mJklvTHKNeuEFC/RkixKrfD0Mtz+K0QW
	CD+BrUdFEAD4GJLRGUY49krlo/4WFwreAYfzd1zd1jSIbtSciI8kGuFZaceRc7Vq
	Y7PRwikXC54QM3rLe6gMWLoYRglvL4ZRr6A9VOVKVHHvdoknMKisqi57ki0UBcCD
	pvxjVsXivQxijNKu/pxj8f87L++4SmL8+MWJ0WH9QeS5HEr2c81sKgpbnzrDaZwr
	tHKM4H159b94yLV8tQvs8KSWfraamvoV4njSnahvQMZGI0AU7fv5/OcqhV2/NQUd
	NbZ83SIH8TXlD3UwxfXv2cRw8IK6W6jyO3A==
X-ME-Sender: <xms:LkxvauCaoemi6ekbEL9n1F5lQzcO8jBhOXr2q22E3cdSKkDBc7sdiw>
    <xme:LkxvakHYhXc-hWPSL2n9ehREvUyQMNYpvZFqUp57Koi0HCHbm9AXAlBznGHY43fYy
    wtCSx1OlpFrZP5KmeYuogTxS-a6R57xJf5_41EDPpxNuQ4SqBl-f-eg>
X-ME-Received: <xmr:LkxvahkWLqzXMhat6N7CPn46vxNua51boNrAuicmbkwZty6wGHJpTGIjE6L5vRXbV6EZ6rGww3WMNVYpl201s2WGZivyDdDTvs8>
X-ME-Proxy-Cause: dmFkZTFlapO+z6cp3wvBebk5lTAia5phm9tTAKSNHefTMzPdePd5v+T7JVgHEkLB41y5Ob
    eSvN7viLYvrIAaqw29v6S68ef3GuIe/2QfmzPl60v9SPYjt+CGGoHIW4icP01WLKDzOc6C
    MiBlzN9g5EQDae7iZTKYWr2YlkWF31TgHFKA+LB0yLkroETBvzCa+CA0RRC4tNufFsVOkV
    rBdO8gOdXsYuegeK25nP42KabMus7xNwyQdViuVL8OaIh7kc5VQHPyc0zfTyon2d0FkYKU
    iKGSoWac7r1ZoY7PQNed9fLAr9J3ro1NKAbgYiWXJJ8jWVM7YjMG9Y3saYGTypBJmAoANg
    6oyVuzBsRLxCsCECJx6mzrLQKjXPPDHic5NrLn4ffrLwK0LVVeX1gZ0Xk2S6fP1r9ng8rS
    JictUazSi5ecwImXJh9ByzRm9cRSeuTXsMNeYC6L+UY13nPaxF/yi0rzjqeQDNB0/kfdwQ
    7KinW3spMgGWUzGBKXz+yv830VxsxGCoeMjdqciLz8LbA1UDF/b68vIYDiGFV4WePjXVRy
    Ljjjyl0eJI4aDHemiD5CRG+9GLw327mg51Vd9A4CxF++M/+65FvYbANoIyQ+nubqAvFiuR
    ZfkRufrt8jndKpUKNswRdOgYbLvXM/0Sva+kw0GvSxAUnmTFekcIuPPkf3+A
X-ME-Proxy: <xmx:LkxvahvS1sbdmvnJZ79bvRMoB4wNkKEXllAdwxfgsQmg_zYiyk3EMQ>
    <xmx:LkxvalPISx2OLXNqtyUDD7RWX9DKGenGyH6nXZGyL_U3bWBDAYDzoQ>
    <xmx:LkxvajqtZUL0UFkgWV4d3V9XSJ_CEH_wJ0DXe--DGmcfvHAzCkXYtA>
    <xmx:Lkxvau82rTgkUyaBlOMluJnPrylfJgR9EPqvuTQkmdXVMpX1Vqqqlg>
    <xmx:L0xval7YbN51x2-d2X3fl9RZ4c2iEFgHkPjz_Oa7-MvVDSfgkqY73WVC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 09:54:53 -0400 (EDT)
Date: Sun, 2 Aug 2026 15:54:52 +0200
From: Janne Grunau <j@jannau.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 9/9] arm64: dts: apple: Add minimal t8132 (M4) device
 trees
Message-ID: <20260802135452.GJ806854@robin.jannau.net>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
 <20260801-apple-m4-initial-devicetrees-v2-9-5cb07cc275da@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-9-5cb07cc275da@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_065457_078516_0D3B6662 
X-CRM114-Status: GOOD (  20.29  )
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

On Sat, Aug 01, 2026 at 11:40:39PM +0200, Yureka Lilian wrote:
> Added device trees for the following devices:
> - apple,j604 - MacBook Pro (14-inch, M4, 2024)
> - apple,j623 - iMac (24-inch, 2x USB-C, M4, 2024)
> - apple,j624 - iMac (24-inch, 4x USB-C, M4, 2024)
> - apple,j713 - MacBook Air (13-inch, M4, 2025)
> - apple,j715 - MacBook Air (15-inch, M4, 2025)
> - apple,j773g - Mac mini (M4, 2024)
> 
> The device trees have a minimal set of devices limited to CPU cores,
> interrupt controller, power states, watchdog, serial, pin controller,
> i2c and framebuffer.
> The device trees for the notebooks add a PWM controller for the keyboard
> LED illumination.
> 
> Using the macOS 26.6 iBoot/firmware, the Mac mini reliably boots on a
> single core using the stock kernel.
> Booting with smp requires avoiding the wfi and wfit instructions
> in the idle loop and `delay()` respectively, since those instructions
> cause a loss of architectural state on the secondary cores, and even
> then boot is unreliable.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  arch/arm64/boot/dts/apple/Makefile        |    6 +
>  arch/arm64/boot/dts/apple/t8132-j604.dts  |   35 +
>  arch/arm64/boot/dts/apple/t8132-j623.dts  |   18 +
>  arch/arm64/boot/dts/apple/t8132-j624.dts  |   18 +
>  arch/arm64/boot/dts/apple/t8132-j713.dts  |   35 +
>  arch/arm64/boot/dts/apple/t8132-j715.dts  |   35 +
>  arch/arm64/boot/dts/apple/t8132-j773g.dts |   25 +
>  arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |   48 ++
>  arch/arm64/boot/dts/apple/t8132-pmgr.dtsi | 1130 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8132.dtsi      |  447 ++++++++++++
>  10 files changed, 1797 insertions(+)

...

> diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
> new file mode 100644
> index 000000000000..6df6ccdda90e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t8132.dtsi
> @@ -0,0 +1,447 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Apple T8132 "M4" SoC
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <dt-bindings/interrupt-controller/apple-aic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/apple.h>
> +
> +/ {
> +	compatible = "apple,t8132", "apple,arm-platform";
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu_e0>;
> +				};
> +				core1 {
> +					cpu = <&cpu_e1>;
> +				};
> +				core2 {
> +					cpu = <&cpu_e2>;
> +				};
> +				core3 {
> +					cpu = <&cpu_e3>;
> +				};
> +				core4 {
> +					cpu = <&cpu_e4>;
> +				};
> +				core5 {
> +					cpu = <&cpu_e5>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu_p0>;
> +				};
> +				core1 {
> +					cpu = <&cpu_p1>;
> +				};
> +				core2 {
> +					cpu = <&cpu_p2>;
> +				};
> +				core3 {
> +					cpu = <&cpu_p3>;
> +				};
> +			};
> +		};
> +
> +		cpu_e0: cpu@0 {
> +			compatible = "apple,donan-e";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>;
> +			next-level-cache = <&l2_cache_0>;

missing "i-cache-size" and "d-cache-size". As far as I'm aware they
remain unchanged. 128kB i-cache, 64kB d-cache for the e-cores and 192kB
i-cache, 128kB d-cache for the p-cores

...

> +		pmgr_mini: power-management@388280000 {
> +			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x3 0x88280000 0 0x4000>;
> +			/* child nodes are added in t8132-pmgr.dtsi */
> +		};
> +
> +		wdt: watchdog@3882b0000 {
> +			compatible = "apple,t8132-wdt", "apple,t8103-wdt";
> +			reg = <0x3 0x882b0000 0x0 0x4000>;
> +			clocks = <&clkref>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 507 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_nub: pinctrl@3881f0000 {

out of order node, it belongs before pmgr_mini in unit-address order

Janne

