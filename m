Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA736CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=458JGkmDUnAD0XQKnKDk7C8t0pN4Ax7dLlfm59xLtrY=; b=RJmpG8EHIhokDw6kDL8NldJqj1
	TjzdZkbodEPkTip1FJnPfLeRfl7sFu4YktyDQfwPC9/m4G9FA2uK4MC+Sadey1lLN2ZOsZsSl8GIa
	9tVMF1QKF66XBfKKPeXtLFt7Xb+JQUoKV8OS3lcnj9K3K7X5AJzosHiFSo7TSdsrThxr1ZUUNd3IK
	1X39Mc90mdFDwQlaMLlTt2L9YZ/C2YWInqQqUIXkoa9dLP2gAvilwOpPT2eQ4gLkRT2Artowg0/fY
	PS2L2b5pTU56b9NzMlyfpqKqG09IFN8CsyYR+NClXCbvbcSzx2IEy35DDMbI1WGG2XsXql6LJa9Nl
	+k/h33nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mi5-00000009rRU-2uIo;
	Thu, 25 Sep 2025 14:12:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mi2-00000009rQ6-3XF3;
	Thu, 25 Sep 2025 14:12:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C1EF40522;
	Thu, 25 Sep 2025 14:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C787FC4CEF0;
	Thu, 25 Sep 2025 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809553;
	bh=h7xLn3JbQ44tHSWjgTil1jBLnAigdCGXSZlWVSiK9lw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uKHmwWPiAF26pecH3W9083RZX+cel1OzbqbxPPt9XyJNIippOCmR4KZyLlcoNab8O
	 7s3YmLQSeL4KJC4etojwVlSGD6mUVLbyKNfcLqdPU0KufuFFnQoelwStmvZQKH/EhY
	 vSAsFD6/FATRyQ87RSNOGE/zWgRNyI88bPI1PBUMw5xn4TGIXz3Dtx4z2wb3UJQBZN
	 /9o7gNeh+hVHspM8IRqskHmJhHqfxpe2a8D2uicY5ZDhoNEWf+oI9fyIp4D/z3SRDv
	 pl0GSB9flrxXRqnaa3fAEOyNHcLZunI1a/MgBWQ++2yFFv+WE3OAUMcC4EzdnLtRH2
	 +L359CtHBWxhQ==
Date: Thu, 25 Sep 2025 09:12:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kever.yang@rock-chips.com, krzk+dt@kernel.org, heiko@sntech.de, 
 alchark@gmail.com, linux-rockchip@lists.infradead.org, 
 didi.debian@cknow.org, pbrobinson@gmail.com, honyuenkwun@gmail.com, 
 naoki@radxa.com, mani@kernel.org, neil.armstrong@linaro.org, 
 linux-arm-kernel@lists.infradead.org, quentin.schulz@cherry.de, 
 jbx6244@gmail.com, conor+dt@kernel.org, dsimic@manjaro.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, inindev@gmail.com, 
 ivan8215145640@gmail.com
To: Liangbin Lian <jjm2473@gmail.com>
In-Reply-To: <20250925092037.13582-1-jjm2473@gmail.com>
References: <20250925092037.13582-1-jjm2473@gmail.com>
Message-Id: <175880949051.820269.9096832740960574577.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: introduce LinkEase EasePi
 R1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_071234_918598_315C73C3 
X-CRM114-Status: GOOD (  11.95  )
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


On Thu, 25 Sep 2025 17:20:34 +0800, Liangbin Lian wrote:
> LinkEase EasePi R1 [1] is a high-performance mini router.
> 
> Specification:
> - Rockchip RK3568
> - 2GB/4GB LPDDR4 RAM
> - 16GB on-board eMMC
> - 1x M.2 key for 2280 NVMe (PCIe 3.0)
> - 1x USB 3.0 Type-A
> - 1x USB 2.0 Type-C (for USB flashing)
> - 2x 1000 Base-T (native, RTL8211F)
> - 2x 2500 Base-T (PCIe, RTL8125B)
> - 1x HDMI 2.0 Output
> - 12v DC Jack
> - 1x Power key connected to PMIC
> - 2x LEDs (one static power supplied, one GPIO controlled)
> 
> [1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html
> 
> Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
> ---
> Changes in v2:
> - Change deprecated "rockchip,system-power-controller" to "system-power-controller"
> - Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473@gmail.com/
> 
> ---
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250925092037.13582-1-jjm2473@gmail.com:

arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: mmc@fe000000 (rockchip,rk3568-dw-mshc): status: 'oneOf' conditional failed, one must be fixed:
	['disable'] is not of type 'object'
	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: mmc@fe2b0000 (rockchip,rk3568-dw-mshc): status: 'oneOf' conditional failed, one must be fixed:
	['disable'] is not of type 'object'
	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#






