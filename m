Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B2BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/iLohVVhRWW+t4Q0gIAqFXpoSBQnwHFkJgd5Qpjpvo=; b=oTg9aKQ6CbkJ5RyvFs7rJeMI7F
	5gY8D3/SLGjt9gnRHadRvfvlTTEflYN6N2Ici6gI3Oz0kW9/T3yQsBJ1Jz4lHsN41AgRQLJ2SWs4Q
	FuNU0ElICBrOXJCak6l+9gJRCcd52RBtU/T8ww8rukWFz/NpppkAWsENF1IXAJSvS34uN5L9mdstF
	37xqFgLqMwvc5NhOoDmkfgftNBOTiGZdsKSdOV1C6Iez70w3xyRpnzc0ALUPlL8xfKL6HLCwJlJhD
	Mtf7iafBGk7xz3k9v1z7VMudVFAQo4HB8TeliLNLY3tdqoUURbjHOfZV/MXUPWalhP2zR8EdgScCh
	0BUAmRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBoJ-00000008vbj-1r7j;
	Wed, 12 Nov 2025 14:26:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBoH-00000008vaW-0V8V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:26:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFEF64442F;
	Wed, 12 Nov 2025 14:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E68DC4CEF5;
	Wed, 12 Nov 2025 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762957616;
	bh=qeuILCfLWad/qbdor3W9n5ZZy0hnPVSh5PPuu3qs/QE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qve7G4L0YkbRYzSqsV764xHqJipSwJLZHj1ww/HX7HeUzWhQmoOkvD06mELydd+6p
	 vBe+03Yks5anblHWanxMmaKRFLYdBRYE2LXOk5OQ86x+FvMwLA8KvRjGvoM1tzyXBI
	 1AqRNa1RCPCD7VE/h9+O5DF8MyE5DTdGzUrZExQwCa6paTArLe6ncDc48usZtCgQpa
	 wix5EmQQky48KVxL1DGT6rU5y3wEH3cvA3WJvTD9yLPDVZV2zxcy2Ps0tNJEOapc1p
	 Y2UnYtiOi+pELcNjbWhpdzUjKNXZxsSTGMh/D3rlKMZRaStt2gWo2lS+nbPDKX1T7q
	 YpgzTjAvTymzQ==
Date: Wed, 12 Nov 2025 08:26:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20251112-upstream_uboot_properties-v1-0-0b19133710e3@foss.st.com>
References: <20251112-upstream_uboot_properties-v1-0-0b19133710e3@foss.st.com>
Message-Id: <176295563590.1637939.3347883345967436731.robh@kernel.org>
Subject: Re: [PATCH 0/6] Add boot phase tags for STMicroelectronics boards
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_062657_197011_D6E07917 
X-CRM114-Status: GOOD (  17.11  )
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


On Wed, 12 Nov 2025 11:46:42 +0100, Patrice Chotard wrote:
> The bootph-all flag was introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across
> different boot phases.
> 
> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag
> to these nodes to support SD boot.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Patrice Chotard (6):
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
>       arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards
> 
>  arch/arm/boot/dts/st/stm32429i-eval.dts       | 11 +++++
>  arch/arm/boot/dts/st/stm32746g-eval.dts       | 10 +++++
>  arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi     | 12 ++++++
>  arch/arm/boot/dts/st/stm32f429-disco.dts      | 11 +++++
>  arch/arm/boot/dts/st/stm32f429.dtsi           |  9 ++++
>  arch/arm/boot/dts/st/stm32f469-disco.dts      | 12 ++++++
>  arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi     | 11 +++++
>  arch/arm/boot/dts/st/stm32f746-disco.dts      | 12 ++++++
>  arch/arm/boot/dts/st/stm32f746.dtsi           |  5 +++
>  arch/arm/boot/dts/st/stm32f769-disco.dts      | 12 ++++++
>  arch/arm/boot/dts/st/stm32h743.dtsi           | 19 +++++++++
>  arch/arm/boot/dts/st/stm32mp131.dtsi          | 21 ++++++++++
>  arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 11 +++++
>  arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      | 26 ++++++++++++
>  arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
>  arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
>  arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
>  arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 31 ++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp211.dtsi        |  7 ++++
>  arch/arm64/boot/dts/st/stm32mp215f-dk.dts     |  1 +
>  arch/arm64/boot/dts/st/stm32mp231.dtsi        | 22 ++++++++++
>  arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 11 +++++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 27 +++++++++++-
>  arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 11 +++++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 11 +++++
>  29 files changed, 541 insertions(+), 1 deletion(-)
> ---
> base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
> change-id: 20251112-upstream_uboot_properties-22480b0b4b1c
> 
> Best regards,
> --
> Patrice Chotard <patrice.chotard@foss.st.com>
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
 Base: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20251112-upstream_uboot_properties-v1-0-0b19133710e3@foss.st.com:

arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: pinctrl@50002000 (st,stm32mp157-pinctrl): qspi-bk1-0:pins1: 'pinmux' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: pinctrl@50002000 (st,stm32mp157-pinctrl): qspi-bk1-0:pins2: 'pinmux' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: pinctrl@50002000 (st,stm32mp157-pinctrl): qspi-bk2-0:pins1: 'pinmux' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: pinctrl@50002000 (st,stm32mp157-pinctrl): qspi-bk2-0:pins2: 'pinmux' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml






