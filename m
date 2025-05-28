Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EFBC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxrpKzACoRVr1IvCK/iRdd0jRXIbTUSU3jXaSxyDMFU=; b=JeGscfvVp3V0sJdOTTVXm/Ccvm
	zx/47Ld8DD30nXBP/uU8JMH18L7K4XDm1udEy7KlzllcFcCJ0YAvMay/jPNT4aPvRQjx5xSkEgsBC
	ehvC+7NW9gJY+mDMd1VnBrt5GY4vUOQtHH/f3IThgEOb7kjgEdcfyNGjI7rOG8sQR6Q8SOLwqAM63
	jjzGF7/xvGwlPLwSnGG1yn7d9Fu0zpCmhByRKmKNNgXySlfkNtGOmxXf1zd8Ih5NftKQ0xvozNw6O
	gBteUiAON8RxsfMGI4eDH0QnP3pKVeOdZh5smr59bKwV59CMHHfqhfZOZzYI0jBRpmaJLu7xCLpyO
	TOV/fNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGCD-0000000D9d4-38d8;
	Wed, 28 May 2025 12:47:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG2B-0000000D8Ot-0Sy5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC8FB4ABFC;
	Wed, 28 May 2025 12:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FCDC4CEEF;
	Wed, 28 May 2025 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748435846;
	bh=lg8sZyhu+VcyjBMvGtdunsncF5V4pCoYU4qY7RIgnBE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ar1XT32kc6nKc9+yO0O4pmoQ+wXsKgf/itLWOesD9PbDFfKiCntexhnaw8jQPVJ6Z
	 bcy1+/TLY0zyD7KICkp+zchf4N2FlYDFJFPx7u/MncCD8JzjHY0zHBWv7poSPhKa19
	 aUEnrEiUtamygs5sLEOGllRgm+MaPKB/et6ivXfIIJ8EoSVaHtnmQ7UKZAAUq6PCe9
	 2idRs6QXrGYtyWufMqjDFK/QzttDmFw4fE9HjWUxGMfDf7ebbAEvQdHqMmNRaTZIfy
	 iDT6LOx0P4ecijsp9LW44EvtJeoWuL+g+0R7ceaGSNIr3AfxQui5GPfWaQcAvtlpHy
	 oo8SPeQgL/C2A==
Date: Wed, 28 May 2025 07:37:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, 
 linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 meng.li@windriver.com
To: Meng Li <Meng.Li@windriver.com>
In-Reply-To: <20250528111751.3505224-1-Meng.Li@windriver.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
Message-Id: <174843567469.3636722.5654586098186872724.robh@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_053727_170846_EA8D0DFE 
X-CRM114-Status: GOOD (  12.45  )
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


On Wed, 28 May 2025 19:17:51 +0800, Meng Li wrote:
> When verifying watchdog feature on NXP ls1046ardb board,
> it doesn't work. Because the big-endian is deleted by accident,
> add it back.
> 
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250528111751.3505224-1-Meng.Li@windriver.com:

arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#






