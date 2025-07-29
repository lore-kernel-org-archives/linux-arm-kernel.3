Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB99C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHqgFY+gayy2GZvTyvV7FSRSsazhmou5VtCdHkpvFGY=; b=Ug9+wAqPko8e+/2mI8WYX9jLbR
	7lbJG6a577yNt6YIfhHr6zdRClIshRYYy80XdCF/CrWh/wzG70TmS2k7K4l/JvfOiLRlJISg/3OgT
	/Iw1sWU0WH+AC9DL+lkHbPqXZXkaX+DO0Oe2U7J7ZwnQb+cPh1y7578llgmMSpWEqWX4GXbQfABuW
	MsEE0HprZBPcJAvDiPbsi2d+os4DC+BvXN8XQl4wSecIw71Og72Kw73sxrjmypqxP5tz+Cs4zTAfi
	YJfq3nO8YNmqNySlXKb4TMrsqIprh1wPkMBIEMnQq6h8e35HqNTrrzlIqzD/7tFVjysdyTMQWx7fm
	M/Nmv6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguOg-00000000MHY-0rsz;
	Wed, 30 Jul 2025 00:10:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtvv-00000000Jkw-3vEa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 23:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1894D60008;
	Tue, 29 Jul 2025 23:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FC0C4CEF6;
	Tue, 29 Jul 2025 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753832434;
	bh=wyEt2fkgpUhHTrACpazhdhQaWVGoe9NGCw65Llk9rNA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pUJn1kRfSR10kP/BkVHd3TvO+QCQMODJt9U6F5ONDV+SNQ7RSSrJwHhdFE0fT2p5g
	 BpcXDnJkXvLsX/+U9KuUqjKurQzqqrs4x81WaZxxB9ogLEphNaylOuXA1mFdjJZpSR
	 VIpO0HkHSDuA8FYdU9/ol0OVtXTSJXbRcY587YqkyS1Wcu+5Lh0PE6nOxcSjx/eCVA
	 l1jAVEwNocNnVdCdxW0mIBENV/JYWJV2sEi9Sn++FyZ9Yn6DFlXNm0i5m6uK/kBLjs
	 C+0fuj3tpbLFzVhDTBb8BH+EHS3/ocK9GujUpV8ae8L1wh2+li3p5prShi618b/ted
	 YxAQB4i+7n2LA==
Date: Tue, 29 Jul 2025 18:40:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>
In-Reply-To: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
References: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
Message-Id: <175383135828.1119152.922768974777985804.robh@kernel.org>
Subject: Re: [PATCH v1 0/3] Revise Meta Santabarbara devicetree
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


On Tue, 29 Jul 2025 17:13:42 +0800, Fred Chen wrote:
> Summary:
> Revise linux device tree entry related to Meta (Facebook) Santabarbara.
> - add sensor nodes for extension board
> - add mctp node for NIC
> - adjust LED configuration
> Base on branch for-next
> 
> Fred Chen (3):
>   ARM: dts: aspeed: santabarbara: add sensor support for extension
>     boards
>   ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
>   ARM: dts: aspeed: santabarbara: Adjust LED configuration
> 
>  .../aspeed-bmc-facebook-santabarbara.dts      | 840 +++++++++++++++++-
>  1 file changed, 839 insertions(+), 1 deletion(-)
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
 Base: tags/next-20250729 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250729091351.3964939-1-fredchen.openbmc@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: mctp@10 (mctp-i2c-controller): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/mctp-i2c-controller.yaml#






