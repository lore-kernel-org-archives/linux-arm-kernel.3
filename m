Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B8CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nqi6ndzvBOlgTtBY+hRKwio60aQLK3AVnHRvI8S3l4=; b=xsyQjMgAVD3VhGwMPeH4557f69
	gzotR0G7VWLCuWV97/2kcG3Cks/OkUpz4nhodcY4YLgHo9Q5lvswyrxAJfbW370FuNdfXZ8AkBtls
	tBKyNLq/o7ZHsyTRypBt41wxY0VpFF6GN0LQ818Aa6D4iZ19EV4wySyx1JBVAptqmqx9aBvJfLLKS
	mV5+tjtRKK6y0N9X9BDD/eFM0X4eMfJDyZH1JiqAT3alB93fxftTXIsKqFzo+aa/FCR2bpAT5vGXE
	YvOVlSpmQcJRUnO3hJPSDSQ+SnAxOd56bGysGGc0t68HN0daVAb4alsTV+k+oevhdcDP/y1Z1fiji
	xHzWmd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqU-000000045Nq-20fe;
	Sat, 23 Aug 2025 06:35:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRzh-00000002eRV-3amk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:39:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EC91A58A68;
	Fri, 22 Aug 2025 13:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C458C113CF;
	Fri, 22 Aug 2025 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755869988;
	bh=6lls2PNqv82LA24JN17rWOxhT+KBp/xw1JLS07INPPU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hUU75Hmf/NOkMXHK7mzYKoStE7q2Eza75mREBzEjUfXfoP3AIklheGU0FjV2eHAEY
	 UPq585Ft6/G4Xhv52F43ySLRyr38rI0KBLlBaUMNk2FiDzXXNkD2g4iL4W0e2KPCXw
	 NSZIY+cZKT8qdyeCmwhpdFMh3eXcH9b/XruFvadtJ+B6GO0asik1ftd517tzTqM64a
	 tYI/beKAXzv9c9Ek2kVq/2iC6Cn/ktdAbHTJ5uQLO44Sn34QsAff1zbIb51LvaGucQ
	 Z0hdip00uq0aogFSKCplh8qU/MD891lGqh1NN6a25ZK/HHllQQvtRQHefJB2BlsPSA
	 hz1e7uW29jRTA==
Date: Fri, 22 Aug 2025 08:39:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>
In-Reply-To: <20250822061454.2610386-1-peteryin.openbmc@gmail.com>
References: <20250822061454.2610386-1-peteryin.openbmc@gmail.com>
Message-Id: <175586978615.3467242.392732396361998421.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Revise Meta(Facebook) Harma BMC(AST2600)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063949_959402_5298285A 
X-CRM114-Status: GOOD (  13.71  )
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


On Fri, 22 Aug 2025 14:14:50 +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
> 
> commit-id: 2236141ed3d6f31f53147c26208dafef6051ae43
> 
> v1 -> v2
>   - Patch 0002 - add power-12v-memory-good
> 
> v1
>   - Patch 0001 - add power monitor support
>   - Patch 0002 - revise gpio name
> 
> Peter Yin (2):
>   ARM: dts: aspeed: harma: add power monitor support
>   ARM: dts: aspeed: harma: revise gpio name
> 
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 27 ++++++++++++-------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> --
> 2.43.0
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
 Base: tags/v6.17-rc1-14-g326d25198112 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250822061454.2610386-1-peteryin.openbmc@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']






