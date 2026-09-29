Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C1CCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h8J0IOs4ABVh0RRJQWq2tQs9g6ThnkfheamgiiqUY4=; b=jxZdStglNdlXi3ghhvdOQE7R3A
	xWRJy6+H/4WV/e1WEUmeBm/OJKdezlEff1JLtcEygSQutmB/t3Zy7Z3u/6NeoQsB6NKFClhQ8f2hI
	XSFMQHPerPgrz1AgYz0B/1B0OJB7psy6JcPejZv8j19OCbhhbShZq13ceYN0r9OIzoXTMCmMxsd+e
	rLHvV1ILglnpwLViLyyPdm3VAFZ7E2L6RBXcdEFOtEae/Oba8ZM8/i6rKs5hebO4jV16Lf66ispCl
	NJthGvF+rim7LyyccGFJqzWqlg2Ai18OCbEPztyNeA18/mlQ4LD/hq2wGVuRBPSHNzSaDp6KTjCY6
	VzCXObag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUZO-000000032Ga-2hgZ;
	Tue, 29 Sep 2026 09:56:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUZN-000000032GU-3tQT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:56:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57A5F400C4;
	Tue, 29 Sep 2026 09:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B129B1F000FF;
	Tue, 29 Sep 2026 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790675777;
	bh=8h8J0IOs4ABVh0RRJQWq2tQs9g6ThnkfheamgiiqUY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PDLYn3Uwk8+LD47yZkI2u2eZQ7r/EjVT5S6AwaUZyFtUzuo9wXyFUftmpKv7PrkuP
	 UMvbgw0SpJihprGyGDajRJi4+W2KyA+OpU+te8rRyHwify1eFIJeWuVGxRA6GMKeru
	 2w07sD5+YI0fcW02DDbw9Gw+YgzNOiY+iGxVdrwLLR4BrkMfpMJBIRURy5iWaGGwtU
	 qHCA4Gslb6sNC9dvObCEx7yqDSKIjcSq5xFVtUHbe35eaj61nuX7c2D0BIQbrFGD4f
	 TIo7PxZo0gwblv2wil9LYFDQwiwOZwsIRU+xlP/NMfZCPUjY2i8xL/MbD/oJYqjVHM
	 DMkOIfvUKnySQ==
Message-ID: <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
Date: Tue, 29 Sep 2026 11:56:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>,
 Brian Norris <briannorris@google.com>,
 William McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-serial@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Brian Norris <briannorris@chromium.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <179067486422.102650.10176830320558486814.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> 
> On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
>> This series adds initial basic support for Laguna (Tensor G5 SoC)
>> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
>> 10 Pro XL) phones.
>>
>> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
>> 10a) were offshoots from the Samsung Exynos family. Laguna is an
>> entirely in-house Google designed SoC.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
>       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
>       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
>       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> [4/4] arm64: defconfig: enable Tensor G5 SoC family
>       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> 

This introduces new warnings:

/home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
Warning (avoid_unnecessary_addr_size):
/soc@0/interrupt-controller@5880000: unnecessary
#address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
or "ranges" property

https://krzk.eu/#/builders/28/builds/845

Probably you wanted address-cells=0?

Best regards,
Krzysztof

