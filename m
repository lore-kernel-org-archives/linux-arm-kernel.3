Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C60CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbpNvVy+b63/KYDAfcS3lUCg6yGCw43wggduk23vMV8=; b=L46kSCwMeKa4xlOTK7iwkdPpIa
	RBMvSZddsB4rVw4r+AG2kr8/uPkXMxUz+qDrE/fagYdBxEI6wTQ9Xp+PiKxsf65HTWAoZyB1lLDTp
	C4EkGtbuOSn+mX+DYmExhrUsn5B4ZeBXJ1wWDrQ12TXl2mWH6J/uSe1+I1QBwIbmIC9+R/9yMuVHe
	pGxYfPh7WqRM0QHxFe6OZG5OpPDIkEw4ZA8LWdKR+VCt8EDlOVs7dh8wsfj8l6xjXS/pvtzdFg5fa
	qJ010YKZe/nFIFNtde2dNXaPGz2mkhs2I5FxktvHYgS7yxtVzSN5upawWSS6+ZBJOJd0mU35uhiWL
	A6fLuOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvjV-00000006TR9-1ayB;
	Thu, 23 Oct 2025 13:52:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvjR-00000006TQ0-0ThH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72D7549F9E;
	Thu, 23 Oct 2025 13:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323C2C4CEE7;
	Thu, 23 Oct 2025 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761227516;
	bh=DXeHBjKEeneTJZlQx6fpzgXCOREPFNRGyyrxXvEZiNk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ezmCck8HjERzYtIbyeAk8k8JFFC7WAL+MzMBmlQHocwoefe7nXgZFuSEJV7oHoNys
	 IJyxU4mnGm/kkFZMoj96m3/Cs8Z5GbcPhGHaqOBBgHWoSPpnHnqyNyFFDB68QmZttj
	 I2fN+FSPIb4Zy/ld+mJyvpcCRiDJm+P67+lzeFGuqopXhAs5Jn7jPmCumUZMzViHnJ
	 +CcYunoaVNrcd6BqZ+ajONsql5vxd3s8Y2G/gv5YDWXNU9ZJFEXoJ667oLAiiZn2Nm
	 i1XYz/fp29FGwj+xFwLisKahgfuRoM454NpgEs0ef+fYwq/FozPmLCX7eBlMb9WUEd
	 DFM6RI3YbNDzw==
Date: Thu, 23 Oct 2025 08:51:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
References: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
Message-Id: <176122700613.2723214.10060174362415881339.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: toshiba: tmpv7708: Align node names with
 DT bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_065157_189140_4984A613 
X-CRM114-Status: GOOD (  13.39  )
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


On Wed, 22 Oct 2025 15:36:17 +0200, Krzysztof Kozlowski wrote:
> DT bindings expect node names to follow certain pattern, dtbs_check
> warnings:
> 
>   tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl):
>     'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
>   tmpv7708-rm-mbrc.dtb pmux@24190000 (toshiba,tmpv7708-pinctrl):
>     $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
>   tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt):
>     $nodename:0: 'wdt@28330000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/toshiba/tmpv7708.dtsi      | 4 ++--
>  arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
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
 Base: tags/v6.18-rc1-10-gc35cf4fe4b85 (exact match)
 Base: tags/v6.18-rc1-10-gc35cf4fe4b85 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/toshiba/' for 20251022133616.74492-2-krzysztof.kozlowski@linaro.org:

arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_grp', 'pwm3_gpio19_grp'] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_grp', 'pwm3_gpio19_grp'] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml






