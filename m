Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C63AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNbDigF2oPjptlxozxNZ5Wl3Qx9ew2XJtlfa1zqW1Hw=; b=4Wh83rJGXv0d8ww6MBKPCBNfTU
	BpkWZH4tYGHar+WL/crcLGPqiH/0VmNWwHbxfm2BL7Q/ShO9sktktLO5wwSU2iw6HiOzw7VyefW79
	2iMwucO4trRWzQNDqVF+ceUH2D/byHcfCP0QWgyNZJTgN5217uAZiwC7OCus4FxNcl/ITFNF5GCa+
	JJb7u+NmO9ngxYUuolqpZzCQPFMUsjbbrI5pyiNQ60uFQzD23ko6/yhUjWBQIoF/C5vItlzHAmytB
	eD3n15lVqhDoBie+GLv8X9xrZ+ycravWY53PaCDomA5IG6pIlAJlD+ctwdK1dQBBg+hT4Ts4bTRq+
	WzovKiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVonZ-0000000BLo7-3Uxt;
	Thu, 09 Jan 2025 09:25:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVomK-0000000BLVx-3qKZ;
	Thu, 09 Jan 2025 09:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22366A415EB;
	Thu,  9 Jan 2025 09:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887A8C4CED2;
	Thu,  9 Jan 2025 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414675;
	bh=zYI5/a4+nQDm4Qrb21GJl+lHZp/djig8Ib4inXwAMOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoXyB59clN1btqwzo6+Y9QiuFzUI+eig6LNvziN4YaR2SldPrmJityt8X5f0jqZuL
	 ib6EtzfQPsgv8Dq+vpekJjJd8BooFL1NqwI5td5TxD1buKRSLmebrlTaipFxmn5NXj
	 2NSWdic3zThWezhOMoK41ORMFeTiMgiOATeLsHrffXxIveekKaH/zUtF3+9rUSffur
	 CBOVPvlaUxHjheJTOL0BMsAAKnmKE8YvlMTX3BQMe/e/9guHOWQGEARhPbot5C28JO
	 cKBsAWEBUy9Hfawp3c/IavJddZmb72sHXuK6M5c4NnSIMdyex8DtI8kU8xKo3FXoDG
	 BG5qfDcKslkLw==
Date: Thu, 9 Jan 2025 09:24:29 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
Message-ID: <20250109092429.GC6763@google.com>
References: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_012437_023339_AA48C7E5 
X-CRM114-Status: GOOD (  13.78  )
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

On Tue, 07 Jan 2025, Krzysztof Kozlowski wrote:

> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This applies cleanly on v6.13-rc6 and on next-20250107, so I expect no
> conflicts between Rob's tree and other maintainers' trees.
> 
> Rob,
> Can you apply it to DT tree?
> ---
>  .../arm/arm,trace-buffer-extension.yaml       |  10 +-
>  .../bindings/arm/stm32/st,mlahb.yaml          |  20 +-
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  42 ++--
>  ...ntel,ixp4xx-network-processing-engine.yaml |  52 ++---
>  .../bindings/fpga/xlnx,versal-fpga.yaml       |   2 +-
>  .../bindings/interconnect/qcom,rpmh.yaml      |  28 +--
>  .../bindings/iommu/riscv,iommu.yaml           |   6 +-

>  .../devicetree/bindings/leds/leds-mt6360.yaml | 195 +++++++++---------

Acked-by: Lee Jones <lee@kernel.org>

>  .../devicetree/bindings/mips/brcm/soc.yaml    |  42 ++--
>  .../misc/intel,ixp4xx-ahb-queue-manager.yaml  |   6 +-
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  78 +++----
>  .../bindings/mtd/technologic,nand.yaml        |   2 +-
>  .../bindings/nvmem/amlogic,meson6-efuse.yaml  |   2 +-
>  .../bindings/pci/ti,j721e-pci-ep.yaml         |  34 +--
>  .../bindings/power/reset/qcom,pon.yaml        |  62 +++---
>  .../nvidia,tegra264-bpmp-shmem.yaml           |  15 +-
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  22 +-
>  .../amlogic/amlogic,meson-gx-hhi-sysctrl.yaml |  26 +--
>  .../bindings/soc/qcom/qcom,eud.yaml           |  38 ++--
>  .../bindings/soc/ti/wkup-m3-ipc.yaml          |  32 +--
>  20 files changed, 357 insertions(+), 357 deletions(-)

-- 
Lee Jones [李琼斯]

