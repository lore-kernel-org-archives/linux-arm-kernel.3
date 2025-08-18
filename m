Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF395CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhwtW8pIgb4JEmUiXOidb7C3oNrJiOE0aYqYpbsCY94=; b=cbtoEZR4rmElLUyAXp/5yEGpw6
	Q97ogAp280aHQXUcb6INfzxvfJV+Mg9e8s4ktUg9x52vp0is5WfmYvpzXePyen2VAj4De4DtoChV9
	LmMqEWmBJyDU3CQUrDpiZyX1X/C69lbmuh+GmrY0pdrO8fc5lkSypTMyn0xpA07jCBBaXUINX/wfN
	24VFffrS6SUDbQ94mYAYJpeGn4RdTNhNNvfMQ04zX6P8M+aa70N9DyuguMzXW27nFCT/x5p/VpRDx
	TLwibPEb3hTKXhf8KLq2HgCV3HLKFiZqt60H3tEd+s/agnW9Xmq4m4fBT7j8L0zBDwLg5BPydlt9l
	qmcGHEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo52L-00000008QWS-1GE5;
	Mon, 18 Aug 2025 18:56:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4XG-00000008KL4-1q7x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:24:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA49045FA6;
	Mon, 18 Aug 2025 18:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99635C116C6;
	Mon, 18 Aug 2025 18:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755541485;
	bh=IMZlLcdTbTR3iktUWRNqGf1wOuBejkJQOJ/LsettyZs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SUc8mv/lVOno1PAGFKwZuLSOoEzM3IW4grm4trlaunS9XR8J3BBX9MX20k9wvAWgn
	 sO4mwpW8v4tDrxWn0AMEKRMrKQMAY4d2DlRuxfEahCiWsrPZ/D8s01NIm77MIzOgH/
	 KXQFZLpxYpYgToyb8bPLcBRoVctG/RgRaLyzoz1OXucOa2HCHctO2Rn+NUSDGu8NL4
	 EgGAzLvu9WbkCuQZWYLEH/qjFuZd62k7UOglARMdB7jDVMYU+oB0wLYZ09mVN9dql0
	 Uaad7Pxu4liSsyvpPHmUS3X+mRl63TRBp35EyOTTPwLRdHsOlMjbjCQYq1F4eFOyLC
	 vXA0TwFsEDgYg==
Date: Mon, 18 Aug 2025 13:24:44 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Ciprian Costea <ciprianmarian.costea@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linaro-s32@linaro.org, 
 Matthias Brugger <mbrugger@suse.com>, Chester Lin <chester62515@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <cover.1755341000.git.dan.carpenter@linaro.org>
References: <cover.1755341000.git.dan.carpenter@linaro.org>
Message-Id: <175554055804.1719797.15716687112044430823.robh@kernel.org>
Subject: Re: [PATCH 0/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_112446_527068_D630644B 
X-CRM114-Status: GOOD (  15.55  )
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


On Sat, 16 Aug 2025 13:46:57 +0300, Dan Carpenter wrote:
> This driver provides a way to access the On Chip One-Time Programmable
> Controller (OCOTP) on the s32g chipset.  There are three versions of this
> chip but they're compatible.
> 
> Ciprian Costea (2):
>   dt-bindings: nvmem: Add the nxp,s32g-ocotp yaml file
>   nvmem: s32g-ocotp: Add driver for S32G OCOTP
> 
> Dan Carpenter (1):
>   arm64: dts: s32g: Add device tree information for the OCOTP driver
> 
>  .../bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml  |  57 ++++++
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |   7 +
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |   7 +
>  drivers/nvmem/Kconfig                         |  10 +
>  drivers/nvmem/Makefile                        |   2 +
>  drivers/nvmem/s32g-ocotp-nvmem.c              | 171 ++++++++++++++++++
>  6 files changed, 254 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml
>  create mode 100644 drivers/nvmem/s32g-ocotp-nvmem.c
> 
> --
> 2.47.2
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
 Base: remotes/korg/master-95-g90d970cade8e (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for cover.1755341000.git.dan.carpenter@linaro.org:

arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): compatible: 'oneOf' conditional failed, one must be fixed:
	['nxp,s32g2-ocotp'] is too short
	'nxp,s32g2-ocotp' is not one of ['nxp,s32g3-ocotp', 'nxp,s32r45-ocotp']
	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): compatible: 'oneOf' conditional failed, one must be fixed:
	['nxp,s32g2-ocotp'] is too short
	'nxp,s32g2-ocotp' is not one of ['nxp,s32g3-ocotp', 'nxp,s32r45-ocotp']
	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#






