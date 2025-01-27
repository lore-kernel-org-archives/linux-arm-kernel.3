Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F743C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/M1rTEa+bIe+ds99GfOS7hcfmBxk9/rC6AaxIZZm5Ks=; b=gDpsT0TrtqTK/vOiELcOl6h3oA
	Yj3jpq6upAI4H5WyC6ee3IONwQtms+KemqfHny07CkUWXQzyYrMqkDiqUUAuDEcAQyhmfeiFH5uKB
	QuSNCSiwvdKuBWR4W/ny8ZUpDq4F91KAR9MUMCSmCriNSY39UXxGyaYWd6PvxnbFpSZ/AKpyu84R6
	UNLRzrQG6GVgVTYS0dMqFqv3QsSYUQmCoymQl//XzImvDlp8bKJnwZnBQXEO552BZ9ssDDaksKYcD
	ab+nCt5kE46OdUEHqiI7U6zK9VPKVV7o/CXDCb5F82u7yd0Yrux/vi1l2WzantweLlc5LMRxQrfM5
	wPMtrSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXkh-00000003QPh-1egD;
	Mon, 27 Jan 2025 22:38:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXjN-00000003QHy-35wp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 132C65C5AAF;
	Mon, 27 Jan 2025 22:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6443C4CED2;
	Mon, 27 Jan 2025 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738017440;
	bh=Q15LT01SKkEFQ7s0hq0N1TkWUsaoeZM4yduP53hP4u0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bQtGzaPnRrUJCqC+vTx35sPL5jya7O1ggSd0wyDWIAKkWGhhQ+p6lyxYPjaCF8UFH
	 ZIvytX26MmRny0dg5RVRbgtvTqLVCG2VFuHBPRRB44qEVKbx5QXktzDMiixc16fetB
	 4yEV5Ha16sc2wMBEZFqBfKAczUqtHxR2OkxRH+451OZJ8G/SHgjLOlITmH4ZV/xDfS
	 z/Z/YLkxAAVV/RAJY7xc7vxNbBbR/OZX6n5E+0QWN7734D93DJVF2F6Ii+2vun0MeB
	 g1ipWsL92ApcZZmYzsDTLmUSpCIDJe7dVQPfVisuZOyQywqT7mAhAKRiq3QbJCCU+5
	 7bDlm8633wTmA==
Date: Mon, 27 Jan 2025 16:37:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hari Nagalla <hnagalla@ti.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Devarsh Thakkar <devarsht@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Judith Mendez <jm@ti.com>
In-Reply-To: <20250127221631.3974583-1-jm@ti.com>
References: <20250127221631.3974583-1-jm@ti.com>
Message-Id: <173801742334.1179786.10533536271725116340.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add R5F and C7xv device nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_143721_822993_EB422862 
X-CRM114-Status: GOOD (  12.48  )
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


On Mon, 27 Jan 2025 16:16:27 -0600, Judith Mendez wrote:
> For am62x and am62ax devices, this patch series adds device
> nodes for the R5 cores and C7xv DSP subsystem found in their
> respective voltage domain, based on the device TRMs [0][1].
> 
> Boot tested on am62x SK and am62ax SK boards.
> 
> [0] https://www.ti.com/lit/pdf/spruj16
> [1] https://www.ti.com/lit/pdf/spruiv7
> 
> Devarsh Thakkar (1):
>   arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
> 
> Hari Nagalla (2):
>   arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f node
>   arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
> 
> Jai Luthra (1):
>   arm64: dts: ti: k3-am62a-main: Add C7xv device node
> 
>  arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi  | 24 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 11 +++++++
>  arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi    | 36 +++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 23 +++++++++++++
>  4 files changed, 94 insertions(+)
> 
> --
> 2.48.0
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250127221631.3974583-1-jm@ti.com:

arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: dsp@7e000000: 'mboxes' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-dsp-rproc.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: dsp@7e000000: 'memory-region' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-dsp-rproc.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: dsp@7e000000: 'mboxes' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-dsp-rproc.yaml#
arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: dsp@7e000000: 'memory-region' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-dsp-rproc.yaml#






