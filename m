Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE5CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRg5GaADWZStLFZAzOAMZ90kpKYQHW1OemAaQYv9H88=; b=stFXROayCV2Mn/xbes/yjVdmDQ
	LtIHd2DH0XhTOl9780sCb7lJCQFuD+h3xnDHT2WDXVzMDPdWG/AEPVvnwsrUp1ok450lNH46t4Qji
	jYi87RkOCGLR8MbHAwjC2ZJDHChIFQfDC4xhxDejb9+oq0eMEAC/8lXaR9o/qcXFa+iC1wIQNq3T5
	N7rWzzBJXUF/jYFwkGdiowZHhczvjveDRWfk+unFLDQpdCVIF7To9Vo4w0gS1Tj81Qji7ZEvnacd8
	G55iTIhHjKcI9GlN0tkAAq+NU0EamLwVJ1EDIJeobglllbyIQ8WqDjsoZI7STk6c9h3h1pcnxiHfZ
	t5i5/rvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kKX-0000000B7Nm-1n4Z;
	Mon, 22 Sep 2025 17:28:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kKP-0000000B7HQ-43a0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3332409F1;
	Mon, 22 Sep 2025 17:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E57EC113D0;
	Mon, 22 Sep 2025 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562073;
	bh=5lJB8tk6gm0Z5L41/sm06dw0UVyCuVO3QM5zofxo82Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tMz2p8UHjG++4yoSSDmd8BLseobavRr/kuYv1CdkCrzwNw2hGkZUbIk9VvAiT4vwM
	 bKDVbnaZyblQDAhZd/CCFRNpi9zXH+9mzv+Yw7sTRa+sQz9qvDLSMLqwwL00fZw26s
	 PFENvo/IrpZ0B0lZmC3p9m/pzJAfjAbocdtu6xeDEGhvIqIDLT/nfrGRYxOG5r1XFc
	 8teifN/vSdEC+ElO9DDwRCvY/G9a8FHcV3TnAhB8c5Q+I6Ko1DW5cQ2IXyBUSc571x
	 q7iVqu7jafE2GqqiLp/9BW1OlB+BCtwKalm5oSUiOCA7r3FNE1KnESXSia7SlOPQmZ
	 fGYz/HmfDX5Pg==
Date: Mon, 22 Sep 2025 12:27:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Stephen Boyd <sboyd@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
Message-Id: <175856184058.499994.8575309202132748563.robh@kernel.org>
Subject: Re: [PATCH v7 0/3] Register the STM32MP25 RCC driver as an access
 controller.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_102754_045874_329BB20A 
X-CRM114-Status: GOOD (  18.97  )
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


On Mon, 22 Sep 2025 10:12:17 +0200, Clément Le Goffic wrote:
> The STM32MP25 RCC peripheral as an access controller is allowed to know
> whether the clocks are secured or not.
> The STM32MP25 RCC peripheral knows about the clock secure configuration
> of all non RIF-aware peripheral.
> In parallel all the RIF-aware peripheral configuration information
> are known by the RIFSC peripheral which is already an access
> controller.
> 
> This v7 is a subset of the v6 and other prior versions, split to simplify
> the review and merging process.
> 
> Changes in v7:
> - None
> - Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com/
> 
> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> ---
> Clément Le Goffic (3):
>       dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
>       clk: stm32mp25: add firewall grant_access ops
>       arm64: dts: st: set rcc as an access-controller
> 
>  .../bindings/clock/st,stm32mp25-rcc.yaml           |  7 ++++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  1 +
>  drivers/clk/stm32/clk-stm32mp25.c                  | 40 +++++++++++++++++++++-
>  3 files changed, 47 insertions(+), 1 deletion(-)
> ---
> base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
> change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
> prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v7
> prerequisite-patch-id: 1ead960f405c7a2dcc9111acd0bb4c95ed33954f
> 
> Best regards,
> --
> Clément Le Goffic <legoffic.clement@gmail.com>
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
 Base: using specified base-commit 07e27ad16399afcd693be20211b0dfae63e0615f
 Deps: looking for dependencies matching 1 patch-ids
 Deps: Applying prerequisite patch: [PATCH v7] bus: firewall: move stm32_firewall header file in include folder

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com:

arch/arm64/boot/dts/st/stm32mp235f-dk.dtb: clock-controller@44200000 (st,stm32mp25-rcc): '#access-controller-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/st,stm32mp25-rcc.yaml#






