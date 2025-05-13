Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAVXiN1gBWeAfioFtEn06VsB6e0wDZ/zzbMkstl/hhs=; b=NSGR1/ILC8QF+SxzkvsOV+cgb5
	nTHlyUNjjLYwHB5pGq3idIqRzr4cF9qLXeviHA7C3BbwTynerjrD/oprvGqo0gyrEHMcRONgiW4WI
	VlJ9sy+6IEE2gOYccf/QkbAKBmQz2cd1JzibjNgT3t0FTdNRpmrkEneZBTNPnyxZH/ZDAyQrqYGFq
	a3NGnzIq5mZtRbD03B73RpuueqTE0EUQUUppGZV9BVBw10MA5i6h5T636vus7nmjzLFI7ompG3BbQ
	QaPNxs/rV/1ddFqwnlDD6cjDbzpFMsy7BBHz0M130d4nQgiBKevnyM+7UferU9kx2OB67LydQQgpZ
	xcAG2ABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtJR-0000000D4Pd-3mmS;
	Tue, 13 May 2025 17:21:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEt5c-0000000D1sV-2bae;
	Tue, 13 May 2025 17:06:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8822A4DA6C;
	Tue, 13 May 2025 17:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46810C4CEED;
	Tue, 13 May 2025 17:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747156007;
	bh=GuuUrOBDBLtQJTivMZS9Eor4DSDf3u+U86Nys8bePDI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l4N9AqEqFmYpOf1eS+C/6LqddeqrbI3zLDv3XxYt8GepWQNyzq2TZrDHdS9Vj0kco
	 uMQJJ0x1caJRkZ5lNsoRDCEbkf7zTsvl9ZtuB/iuQTul9YL/13kxdThbVD39+bN5pt
	 5+YwJzOZTRuRoJKQGKCBuF1hTgZ3mZeKTn4GqB3rlnj9AlVGSGtluuY5uWRHtVxtQ/
	 Q1M4O2N0Xgu9wIM8v8OUf2hf1jlVWgzjlFIiteU38xzXlnSI4khQPbEcCxP5ORDZbs
	 f99OaUvivtcpWILQiw9uAfUiRTOvwTY2ngZQdnGV81GQMs9MzUhUNYrrzksTd0s2pZ
	 JXjyX+ATuKN/A==
Date: Tue, 13 May 2025 12:06:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Conor Dooley <conor+dt@kernel.org>, Fred Bloggs <f.blogs@napier.co.nz>
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250513153044.167187-1-i@chainsx.cn>
References: <20250513153044.167187-1-i@chainsx.cn>
Message-Id: <174715590563.2918523.6781766383894838049.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add support for Firefly
 Station-M3/ROC-RK3588S-PC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_100648_737292_D18AC694 
X-CRM114-Status: GOOD (  16.86  )
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


On Tue, 13 May 2025 23:30:42 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Changes in v2:
> - Add support for Firefly ROC-RK3588S-PC
> - Fix rgmii delays
> 
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 910 ++++++++++++++++++
>  3 files changed, 916 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> 
> --
> 2.34.1
> 
> 
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
 Base: tags/next-20250513 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250513153044.167187-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: leds: leds-gpio: {'rockchip,pins': [[3, 10, 0, 259], [1, 29, 0, 259], [3, 16, 0, 259]], 'phandle': 273} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: leds (gpio-leds): 'power', 'user', 'user1' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#






