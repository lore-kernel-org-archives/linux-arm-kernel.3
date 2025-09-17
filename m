Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63803CAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k861zx8HvENafvIxyUKI6fvgO7ZH+QPM1Q+vtjewfi8=; b=ItrckqUiyKLO7mG/H5kHnGXD/r
	hWmnCcObgfZo0WKrjaWKE955YmUZvoFpYOakYvn+1gDPe4IJX2whyWwbYWMBc9Fs6UslZuoMc85Bm
	y+hFaVDvjaHcTM4NNZSTvDS0m497fOwKkw8htj3gVSBiKUGRZBVpcj48pQkiJv05Y+5oggtSUB5nj
	vXrSjxVq6vlxuFBi7Zcal2NODC4Hcev9yS8xipYdyNQSqGthAg94jCgYZ2Q6DYSXRabGTAyKIQx6r
	FcNOwhZGm7oHLLMb0K7aIkrudMrn0iQxPSIlE4U31WB5x9lThroMIuyCGIqTB+133sxVAgqWLl87f
	yI6v8VqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyteA-0000000CUq8-2ArI;
	Wed, 17 Sep 2025 15:00:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyte9-0000000CUpJ-0m6d;
	Wed, 17 Sep 2025 15:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3406C601ED;
	Wed, 17 Sep 2025 15:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78850C4CEF5;
	Wed, 17 Sep 2025 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758121235;
	bh=HDiQWb20Rtx+E1H2UYAaRAIpBHG5/mnMO3quayCJMb8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kxMhbcJaCqlaesBAyz9ojQ5gfElOWK6fTHmyiSiuEcBm6WaKozjkyVJ5H7yzSBzM4
	 g9fV9aZ6h7kKG6tewZw5FxRV32BwoxJ1vea2SnKK7jrm3euzAAaOikKCaMllXeDDvz
	 rjL5bXi3jwKnQEYXVqHvgE5OFUo+CMWmQm8nUd2zfLQIn+0eg84FndzMwXsqbnhcPO
	 wEuE7ia+whWx3768oewU75PUQxQZyn/L0pPj73bR44EMcxhpt2hE6tDafjD2VqmEd3
	 Vy7DTOjjpS37zxbQo7axGtZObUvwwOyEorcPQFHMKNiFtEmvYToo1NNmz6WVviz8pQ
	 mq6LFmcvoX0fA==
Date: Wed, 17 Sep 2025 10:00:34 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Dragan Simic <dsimic@manjaro.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Quentin Schulz <quentin.schulz@cherry.de>, FUKAUMI Naoki <naoki@radxa.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250916080802.125-1-kernel@airkyi.com>
References: <20250916080802.125-1-kernel@airkyi.com>
Message-Id: <175812100320.2051529.8331047555950941186.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable DisplayPort for
 rk3588-evb2
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


On Tue, 16 Sep 2025 16:08:02 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The rk3588 evb2 board has a full size DisplayPort connector, enable
> for it.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../boot/dts/rockchip/rk3588-evb2-v10.dts     | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250915 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250916080802.125-1-kernel@airkyi.com:

arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: dp-con (dp-connector): type:0: 'full size' is not one of ['full-size', 'mini']
	from schema $id: http://devicetree.org/schemas/display/connector/dp-connector.yaml#






