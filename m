Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6747BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZOb4Oup51mkztZb/UWtRpPWTGZ+DRoM9v65S3bfnts=; b=YIbz5OVcqzqb6DvWylq6mcWZhh
	Po4ZtKiwpxhTCuFH6L36nHPAy4HGf/jd50XBO21h9FeCTrvBYLYOzesHKXB+k2gqVbmcRbcWW6cFo
	1/nXiDz4oALEUXDIXpV9lJDMuJHArHbj3MX8++tk4X56+mJMODNo6V+kDSLM5TgDEC8QS8CvrIZyW
	i0yZy3mTWOTOhDjfCJy3GFoNKICwoJJViEDRW8A0Uz9+zMCK7TXFp/RtilI6kyIDfQQG13/VfFdJG
	sH8MRa8L5h3otUFocwR3qeyw1tgoPI4CRtxEGBveOBUMgYAMPDzJESaPlMNn+giMNtQqXaqGJotnK
	F0otfZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDzJ-0000000AbDL-3PWd;
	Mon, 16 Dec 2024 16:30:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDyB-0000000AayI-2kWY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA1815C5FDA;
	Mon, 16 Dec 2024 16:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76040C4CED0;
	Mon, 16 Dec 2024 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734366558;
	bh=eTH5PAJYArUjyYFUhkavXr9IHbyJp0cHmZVtDEdnjTA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Roi7m7tTvG8r+dOMRufBtBzf5LMU1seuLVmkSmHbU3rEmITSOGpJPXpjrhRr6X/Hw
	 HjJNiLkX/IW0bMxbpw8I7wXh2MYhrvMJhlBy9D5p7t7HDayiUqPKsRawGDGMovBNlS
	 avFCa7hVK+M+YD265Uh72h9hwn8tGEtfrsQuVmO6n24edW5BlwsRWomv+RYm5062dz
	 ITYKSdLGCLsY/0nuuRu3xeW+So58/l4eeCXi4FPGK0wtN10XmDGoDR4YfAIyqSobCa
	 EKeJEo+JrYhxJiit9foSGLVBy/GqYkyGTePRQtBGUgGQvaGbbHcSryDpo13zLU/db7
	 8vatbl3MVjO4w==
Date: Mon, 16 Dec 2024 10:29:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org, 
 krzk+dt@kernel.org, eajames@linux.ibm.com, joel@jms.id.au, 
 devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org
To: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20241213145037.3784931-1-ninad@linux.ibm.com>
References: <20241213145037.3784931-1-ninad@linux.ibm.com>
Message-Id: <173436597537.264948.12611164276777551472.robh@kernel.org>
Subject: Re: [PATCH v1 0/8] DTS updates for system1 BMC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_082919_780691_D5FF5416 
X-CRM114-Status: GOOD (  11.59  )
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


On Fri, 13 Dec 2024 08:50:26 -0600, Ninad Palsule wrote:
> Hello
> 
> Please review the patch set. It has various device tree changes for
> system1 BMC after hardware testing.
> 
> NINAD PALSULE (7):
>   ARM: dts: aspeed: system1: Add IPMB device
>   ARM: dts: aspeed: system1: Add GPIO line name
>   ARM: dts: aspeed: system1: Add RGMII support
>   ARM: dts: aspeed: system1: Reduce sgpio speed
>   ARM: dts: aspeed: system1: Update LED gpio name
>   ARM: dts: aspeed: system1: Remove VRs max8952
>   ARM: dts: aspeed: system1: Mark GPIO line high/low
> 
> Ninad Palsule (1):
>   ARM: dts: aspeed: system1: Disable gpio pull down
> 
>  .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 178 ++++++++++++------
>  1 file changed, 119 insertions(+), 59 deletions(-)
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20241213145037.3784931-1-ninad@linux.ibm.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: ethernet@1e660000: phy-mode:0: 'rgmii-rxid' is not one of ['rgmii', 'rmii']
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'fan_controller_reset', 'isolate_errs_cpu1', 'rtc_reset', 'srtc_reset' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: rtc_reset: $nodename:0: 'rtc_reset' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: srtc_reset: $nodename:0: 'srtc_reset' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: fan_controller_reset: $nodename:0: 'fan_controller_reset' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: isolate_errs_cpu1: $nodename:0: 'isolate_errs_cpu1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb@1e780000/bus@1e78a000/i2c@280/bmc_slave@10: failed to match any schema with compatible: ['ipmb-dev']






