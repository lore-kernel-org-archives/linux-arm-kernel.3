Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFEFD711BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/AffSHqqxRyvwLltAWtZ3dimjw1PH9WFP2WYOkSB+U=; b=oWwbQajXqs/fqGejyv95aZTSQx
	Yvx1nkYnk01+qIBtLcbdXbcptSHwP/Y63XM8R78Cv4+0HQBzvwz+m39qj/B+wjgBvmnOY5VhAsY2m
	T+CzqtlE3jM6mnQeW5DBAa8tYQiAJ3llNY8vmB1gZb0LvG9v0Lzg1Z/toPD+HNmoVW1kJHNuMTDt1
	3vCdgTqfxsL4mitZxZkdFdASTfhQOny+oM5OHvmyma8+Dy5yeLhg2KYcrtM7BaBiKfhpYQcu4uneT
	XHelsNQ7XDuElKsbQp3flOzfdi/pfszRgjcjdInl6ORh+lYFq5bqSBbtc5+6ZRL8Ccgc/vd3fpoPg
	oUqQkkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnD1-0000000FlkJ-3aWC;
	Wed, 20 Nov 2024 16:05:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnAK-0000000FlAL-376U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:02:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5376D5C5D84;
	Wed, 20 Nov 2024 16:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D178CC4CECD;
	Wed, 20 Nov 2024 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118572;
	bh=dbCtaGhVDNU6himXRK3WCjgYx8s5bxzWGTwYnWP6vB4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pell6VCd6UZc+0BIha68xjZq69MtKDESlQTygDNEgZFG3kjM5XmepJsshwtFU9eRc
	 ODAjIm2DLVBqGGkVOF7jjtSPKYAv5XojQhmVlxi4loGmozf7eiRt8uVL2z6jnbYWxk
	 HOo/79lrtnXMd9z5O10kXp8rJyuX4QmZXbfesmLTRfUVfZzp6HWUfk8v23ZSZdXuYG
	 OKqhZT6Xirujv2xkzzGoSi5zDtu4mze2A6mNO8HgaksVTQPH6V2m6FKuToBGEPAKxB
	 BDsW6UDFteVnEUmzpauxDQDP14ZeYo3R1lxMJCIBsVWVuTbQs2FymmRAU5P2B2ZNmI
	 ndvjK7duAuBnQ==
Date: Wed, 20 Nov 2024 10:02:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: iuliana.prodan@nxp.com, kernel@pengutronix.de, daniel.baluta@gmail.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, frank.li@nxp.com, 
 laurentiu.mihalcea@nxp.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, shengjiu.wang@nxp.com, s.hauer@pengutronix.de, 
 aisheng.dong@nxp.com, krzk+dt@kernel.org, festevam@gmail.com
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20241120135859.3133984-1-daniel.baluta@nxp.com>
References: <20241120135859.3133984-1-daniel.baluta@nxp.com>
Message-Id: <173211841141.1124481.13198183587928963879.robh@kernel.org>
Subject: Re: [PATCH 0/5] Configure imx8mp dsp node for rproc usage
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_080252_828664_F76C925D 
X-CRM114-Status: GOOD (  16.73  )
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


On Wed, 20 Nov 2024 15:58:53 +0200, Daniel Baluta wrote:
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:
> 	- rproc/rpmsg framework, used to load for example Zephyr samples
> 	- Sound Open Firmware, used to enable various audio processing
> 	  pipelines.
> 
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk preffers to control audio IPs from Linux side.
> 
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
> 
> This patch series configures and enables dsp node to be used with rproc.
> 
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
>   arm64: dts: Add dsp rproc related mem regions
> 
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  6 +++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 23 ++++++++++++--------
>  2 files changed, 20 insertions(+), 9 deletions(-)
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


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-evk.dtb' for 20241120135859.3133984-1-daniel.baluta@nxp.com:

arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#






