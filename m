Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A4CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 21:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvE7HcSrm1TIupvk7fabk+Gqg2aIlpj0qnYEvjTM0ns=; b=0/st6yH3qSaMDMUsUNSZQHqP77
	Ge/lSJfLSldWyFOtccmhaM1EXTnuhbNnA2GMOo3i2Q5KVpejVh9Z5hN2nCmnnN0q2/KdcxlFolj0v
	++qSNM3Vudq/QS9c/BSEXfiFZA/1D4gtjWXGk14iY2qom1Xn3OTFQTK03jah/c0wG82Po3rKKLwgh
	mM8TJZnuO2+3PTPiAkuNs8a88fwKMWSFl5xqmkUe4iIUxwbOWa381c56QrshFwOvY8g114rUM/5xI
	LS3x1qrkFQzaT9CGI0RjouXdPrVt7wpiu+RVt2crZeW/DUmiptuyu4lRz+yhIJ2QXApmXb8NO9AgL
	ezVvNRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1ud-00000003Xqf-0gAN;
	Fri, 15 Aug 2025 21:24:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1pP-00000003XEO-12vi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 21:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FB5544D79;
	Fri, 15 Aug 2025 21:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C7EC4CEF8;
	Fri, 15 Aug 2025 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755292750;
	bh=K+r06jLu5/QfCZbN9piqdk/fiyOGa1TyF6QkY5xklXQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IsEt8QSynFtXD1ppIMy6AyN46/r047g46cJcO6Fnm0A0yh+84FoNWyizkrNntmYrF
	 ATInUU6ByuKliIMsIlocgSgfhe3f9NlYYwlHwfqu2l38TqT3oNT5wjjLvFz+ZXFzC2
	 2fCGv0bWrWRoWzkMr4mrdHq2+Zt0OWylWuHhgrAgWXxSyQGGz1ijTdIV92JC3bm4oL
	 GEokvA1QfeE6WIhntjac/k65bxdohAqh+eu6Dl1yGHAsfueEViFyG4JeH4OgelV5Pf
	 A+rmN0XB4RvY314InNBPak8WyZCgfHH0D7XfYVfoT8jdVlGDAWvmrOXO4gEFKfMC0a
	 yu7t2cPtj11Ew==
Date: Fri, 15 Aug 2025 16:19:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
To: Fred Chen <fredchen.openbmc@gmail.com>
In-Reply-To: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
References: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
Message-Id: <175529259974.3212367.16366822597087067588.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] Revise Meta Santabarbara devicetree
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_141911_311991_5E6E0594 
X-CRM114-Status: GOOD (  14.56  )
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


On Thu, 14 Aug 2025 21:16:56 +0800, Fred Chen wrote:
> Summary:
> Revise linux device tree entry related to Meta (Facebook) Santabarbara.
> 
> Change log
> v1 -> v2:
>   - add 'bmc_ready_noled' LED and update commit message
>   - add sgpio line name for leak detection
> v1:
>   - add sensor nodes for extension board
>   - add mctp node for NIC
>   - adjust LED configuration
> 
> Fred Chen (4):
>   ARM: dts: aspeed: santabarbara: add sensor support for extension
>     boards
>   ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
>   ARM: dts: aspeed: santabarbara: Adjust LED configuration
>   ARM: dts: aspeed: santabarbara: add sgpio line name for leak detection
> 
>  .../aspeed-bmc-facebook-santabarbara.dts      | 857 +++++++++++++++++-
>  1 file changed, 853 insertions(+), 4 deletions(-)
> 
> --
> 2.49.0
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
 Base: tags/v6.17-rc1-9-g8e4021078863 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250814131706.1567067-1-fredchen.openbmc@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: mctp@10 (mctp-i2c-controller): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/mctp-i2c-controller.yaml#






