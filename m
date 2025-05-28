Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309F5C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ar6+UGlx7i35qjqCjtgl7syXXY6PuRLuDpi5GbEzWg=; b=B8Ue6BWiI1GFL8678zIhk0gGI9
	BuBVrjCI0mNg8hbPz3cpSCU0p51BdeCRSi4tqJJ4bi3bMX7K3bVkToRyU0X4HB03GtLbaEDWbHHad
	+UAFq4+5y/3FgWNzy/C/yQx8OoRkXV46INPYJ82XHQNENmPsBfmdN64q+4Q/0RpsTMDvn8gAPfnig
	HldrUz6QpJJeZ6NBCiHX13T3aqlakNmM2+q+b4QlLGW7NQ7zPoTvR2qWjeeeDTJhcYq0JfnxtvH2r
	JvOk9eacyl7/N7UQ/xaY8Wq2Hu7HqNfcBld/4SGPxZNe+Vy2NC1YebEdIfQJf7QHUnAHFkDpEH2hZ
	ATyDINsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG80-0000000D9Fd-0xbw;
	Wed, 28 May 2025 12:43:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG27-0000000D8NE-0vwj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD0F64ABEE;
	Wed, 28 May 2025 12:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C89C4CEED;
	Wed, 28 May 2025 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748435842;
	bh=SwIjqVSvohQeuyiIN8uNmg4HfM55OQFRpt3e7TbxcD8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l6LFxqXiYbmvXE3d5oHFaMP/IYEtmIuQvHyEgP6i6Es59vyX6G2tFH2EcmgX7USz/
	 Zu6iviFZKESD6T/0kAU3SH4M36aqdUcxo8UgN23bVEa8j/It5Wsa+vhJiiJAbEz1KB
	 eNxeZhYiuxt98pGsccMpFYSxY5unPEoP5HwZZyvyJ/516Bg8dWHj2vVg/rryoi//cn
	 d0LrmR94N9X0hEen2iqLYbHl64HvCktAfuzI8nm7On4v2iFbYvlfFrUmWr8MyBGKYj
	 KABb26JvVbeuD3QnC/YcYfKG6nZOZArcd2miZTJ4gVuBVYSqDL0wiL8dAVDu5hY6JH
	 XyqFwilZK4pqQ==
Date: Wed, 28 May 2025 07:37:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Ge Gordon <gordon.ge@bst.ai>, 
 linux-kernel@vger.kernel.org, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org
To: Albert Yang <yangzh0906@thundersoft.com>
In-Reply-To: <20250528085457.481372-1-yangzh0906@thundersoft.com>
References: <20250528085457.481372-1-yangzh0906@thundersoft.com>
Message-Id: <174843567439.3636671.2589475239055731550.robh@kernel.org>
Subject: Re: [PATCH v1 6/9] arm64: dts: bst: add support for Black Sesame
 Technologies C1200 CDCU1.0 board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_053723_387574_DBAADD43 
X-CRM114-Status: GOOD (  16.54  )
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


On Wed, 28 May 2025 16:54:57 +0800, Albert Yang wrote:
> Add device tree support for the Black Sesame Technologies (BST) C1200
> CDCU1.0 ADAS 4C2G platform. This platform is based on the BST C1200 SoC
> family.
> 
> The changes include:
> - Adding a new BST device tree directory
> - Adding Makefile entries to build the BST platform device trees
> - Adding the device tree for the BST C1200 CDCU1.0 ADAS 4C2G board
> 
> This board features a quad-core Cortex-A78 CPU, and various peripherals
> including UART, MMC, watchdog timer, and interrupt controller.
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/bst/Makefile              |  10 ++
>  .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  44 ++++++
>  arch/arm64/boot/dts/bst/bstc1200.dtsi         | 130 ++++++++++++++++++
>  4 files changed, 185 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/bst/Makefile
>  create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
>  create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi
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
 Base: tags/next-20250528 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/bst/' for 20250528085457.481372-1-yangzh0906@thundersoft.com:

arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: /: failed to match any schema with compatible: ['bst,c1200']
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@0 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@1 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@2 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@3 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: /soc@0/dwmmc0@22200000: failed to match any schema with compatible: ['bst,dwcmshc-sdhci']






