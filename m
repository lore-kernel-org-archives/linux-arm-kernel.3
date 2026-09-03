Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625D8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IEfRem7zTAQCSbosICsgQsKH/8v0Vv91wZSp6AITMU=; b=va6JRNPf0iuJxPOk5isBnZtouv
	d9HxKhiYeccwyCwIq8fRpCOE2qFPHmbzFXLRXf/CSwKlpsHoN3ZB36LKFjFsFuXrR2NGKjs76+sBg
	ugjNb673hfhMJUmhmvmUIdjXyDcR72rarOAs0Dylxxmwvf9AxBd4SjVSTAjKIMjmRJNnT476sEEbB
	BsCAVQtB9I4ZB3q2lgIXbSfu5UXeHYuzOPsWm4QgSKCNM3eDJjBDRxBVw0IMCFxkpRJpzw9SO3NgM
	SUGbGUcBlD3lxpHBVLYHYWHaJYLdh3MWALTFbtGA0z3GNNWNDJaABFjvN7sg9d3M4pOpZUl3Waj7v
	Pfsp2byA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x245S-0000000Gzgw-2BmC;
	Thu, 03 Sep 2026 09:50:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x245R-0000000Gzgj-1dnS;
	Thu, 03 Sep 2026 09:50:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C79A04114F;
	Thu,  3 Sep 2026 09:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4171F000E9;
	Thu,  3 Sep 2026 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429024;
	bh=7IEfRem7zTAQCSbosICsgQsKH/8v0Vv91wZSp6AITMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b3ISe/U7RM7n/4cmXA1ZH4dFV3/JXBqCLF/2Zak2LXJ3h0dKjHezk//ZDr7WZHkOQ
	 cAtJT7YQoYTh4s8cOl5UifKOCqCqDOmbNl7KQa6FwJjBtFVskaPuERB+EgZWxXc+re
	 B2potJ0/vj+b8GFYIRL8B4ERvVVvzWlU1n+kNvQ/GljOzz7sr82N2VgjDvd08p7Bvy
	 IDQx91VtvobrsOk0TFtNt06Kx6im4+RS2xI0V6mSi45/R2XghCCBkoOTK7HOekBUCi
	 XpgY4ImxFAiAuXJnvh+VFLBOw8Pi2m1xm7PUpb90pQL5dBOudrPJ8/dObJck25j39Q
	 99FHRY4JWYUow==
Message-ID: <8e10a8c0-3648-47b5-9131-a1abdd7eb8c5@kernel.org>
Date: Thu, 3 Sep 2026 11:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
 <20260827-thundering-cream-saluki-dd05df@quoll>
 <CAPwA33K+XSRPDzv9xAcoPneUsp6A9OTwakJ1VJY=zXnHiH+5Wg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAPwA33K+XSRPDzv9xAcoPneUsp6A9OTwakJ1VJY=zXnHiH+5Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 28/08/2026 11:35, 楊智成 wrote:
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> (from the review of 2/7)
> 
>> Please link/show the upstream DTS using simultaneously transmitter and
>> receiver, where the consumer does not know with whom is it talking to.
> 
> I grepped the tree and found a device tree that has simultaneously
> transmitter and receiver. In the arch/arm/boot/dts/samsung/*,
> exynos4412-midas.dtsi enables csis_0, and exynos4412-galaxy-s3.dtsi, which
> includes it, enables dsi_0. Both consumers are declared in exynos4.dtsi,
> on the same phy node:
> 
>     dsi_0:  phys = <&mipi_phy 1>;
>     csis_0: phys = <&mipi_phy 0>;
> 
> Tracing that back, the provider is
> Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml and
> drivers/phy/samsung/phy-exynos-mipi-video.c.
> It registers several struct phy in one node, and the binding says:

Please do not bring 15 year old code as example how this should or could
be done.

And in Samsung - what makes you thinking this is the same phy? It's just
way how it was represented in PMU, which is controlling power of entire
SoC, including MIPI PHY0 and PHY1, even though there is only one device
node in the code. Why taking some random anti-pattern into discussion
here, really...

I want to see your upstream DTS code.


> 
>       For samsung,s5pv210-mipi-video-phy compatible PHYs the second cell in the
>       PHY specifier identifies the PHY and its meaning is as follows::
>         0 - MIPI CSIS 0,
>         1 - MIPI DSIM 0,
>         2 - MIPI CSIS 1,
>         3 - MIPI DSIM 1.
> 
> Resuming from the cover letter in v4, I treat this phy as one tx phy and one
> rx phy. Maybe I can follow this pattern and introduce phy 0 and phy 1 in
> rockchip,rk3588-mipi-dcphy.yaml, and add an enum for
> SAMSUNG_MIPI_DCPHY_TX/RX in the driver. The binding would then say:

But why is this one phy? Describe your hardware, show some diagrams from
user manual etc.


> 
>       Two cells select the mode and then one of the two PHYs that the
>       block contains:
>         0 - the transmitter, for a MIPI DSI host
>         1 - the receiver, for a MIPI CSI-2 host
> 
>       A single cell is equivalent to a second cell of 0.
> 
> In this way, I don't need to add PHY_TYPE_CSI/DSI to
> include/dt-bindings/phy/phy.h.
> And I think this will not go against the discussion in v2, where Michael pointed
> out that DSI and CSI are standard protocols and should not be named in
> a Rockchip
> specific header, and suggested introducing PHY_TYPE_CSI/DSI:
> 
>> How is that Rockchip specific? As you state above this is either MIPI
>> CSI or MIPI DSI, two perfectly standard protocols.
>>
>> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?
> 
> https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
> 
>> Where is any DTS using it? I did a search and no results of upstream
>> posting.
> 
> The user will be rk3588-base.dtsi. It adds csi0/1, which connect back
> to the existing vicap_mipi0/1 ports. It also sets #phy-cells

"Will" does not work that much because I doubt correctness of your
design and that DTS might never be sent upstream.

Post your complete upstream DTS.


Best regards,
Krzysztof

