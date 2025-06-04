Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CD1C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDzZxSS5pAgakySOmEnisQPJw33Ve8a4ggUYF0KCQNs=; b=3YpxKxD35grSm2TRdwJj7CF89+
	1qCUukF6JiK0nYmBX6jYAnOEpDlaTLCwy6itdLr2v3S6AqtY7sUJbqIkQn9ti6JJhEU7FAueUBWWV
	3Knvi43Avg2qQvwclSQgOoQdm2xXSx9akwjWOzGEIWaERcuGoG+qtI8ZWj77apVj1XO5uoB97CpfO
	PuoqQHGBOWgZJaNOhI3UBlO2wvSjAauFgkEpbH5VoHINlddLTEvaePqiDGZ5CrFpUTwXePyWo+1L9
	UHCmaE0KLKH8GEJJQKRK3RJiZOgPrtIOuLZ1gLRVEUeY2mv3eneoVYRKq+Ec9+cUUVGUYD3zuPmJp
	cDkfDpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMojS-0000000DWM3-0pS3;
	Wed, 04 Jun 2025 14:04:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uModD-0000000DVQt-44lA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 13:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A456A505DA;
	Wed,  4 Jun 2025 13:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53EAC4CEE7;
	Wed,  4 Jun 2025 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749045495;
	bh=Bqg4UfN3rwgsslMdb/hy9V7kMIKcpgx0adtAHnyJeUs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tg77kAutQJ/i6IUyrsf2GE8fEIsvU219l2sdKoIoRAC6JETM9rVTYIV68AW2dBrcW
	 nqnVR35PKl1LR08tz56gg+2vlOb6jQKagLUbN5oSLccDBz3rTM+0xMq0LzCAZ4zdKN
	 /ntFtovHrpxFd6VhG+x+/cNPsCtvMFhMvx1/lKQBCSZOLBR7xO+z7Jpu6YQLT4ZndJ
	 baaqSOUPtLwPRjFRf6KRqAYqT9BWWsIS7z/4JowUzsxjc5K9YD0NAO3jRyTSZYxofX
	 JGh/7z4z/eOyspMzW3sHy5LLClo5pho5ySsFsUaJ6JtJEDBIcFyV/HwLX5tu+Z9fnC
	 cs78vQ2MfZicg==
Date: Wed, 04 Jun 2025 08:58:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, kristo@kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, r-donadkar@ti.com, 
 linux-kernel@vger.kernel.org, vigneshr@ti.com, nm@ti.com, 
 devicetree@vger.kernel.org
To: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250604104656.38752-1-j-choudhary@ti.com>
References: <20250604104656.38752-1-j-choudhary@ti.com>
Message-Id: <174904540135.3869675.422953390616565367.robh@kernel.org>
Subject: Re: [PATCH 0/3] Enable audio support for J721S2-EVM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_065816_138190_E11105E4 
X-CRM114-Status: GOOD (  16.40  )
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


On Wed, 04 Jun 2025 16:16:53 +0530, Jayesh Choudhary wrote:
> These 3 patches add the support to enable audio on J721S2-EVM.
> 
> This required the i2c-mux support[0] which is now in linux tree.
> 
> Now, this series ***depends upon only one dts change[1]*** to ensure there
> are no dtbs_check warnings (no functional issues):
> "ti,j721e-system-controller.yaml" refers to "ti,am654-ehrpwm-tbclk.yaml"
> for clock-controller nodes, but for audio we need "ti,am62-audio-refclk".
> When scm_conf is "simple-bus", there are no such warnings.
> 
> Test log: https://gist.github.com/Jayesh2000/840c19ef8f9b7f0f75dedd015ccbf98a
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fc829dbde9bf1f349631c677a85e08782037ecf
> [1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/
> 
> 
> Jayesh Choudhary (3):
>   arm64: dts: ti: k3-j721s2-main: Add McASP nodes
>   arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
>   arm64: dts: ti: k3-j721s2-common-proc-board: Enable analog audio
>     support
> 
>  .../dts/ti/k3-j721s2-common-proc-board.dts    | 131 ++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  99 +++++++++++++
>  2 files changed, 230 insertions(+)
> 
> --
> 2.34.1
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
 Base: tags/next-20250604 (best guess, 1/2 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250604104656.38752-1-j-choudhary@ti.com:

arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:#clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:compatible:0: 'ti,am62-audio-refclk' is not one of ['ti,am654-ehrpwm-tbclk', 'ti,am64-epwm-tbclk', 'ti,am62-epwm-tbclk']
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:#clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:compatible:0: 'ti,am62-audio-refclk' is not one of ['ti,am654-ehrpwm-tbclk', 'ti,am64-epwm-tbclk', 'ti,am62-epwm-tbclk']
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:#clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:compatible:0: 'ti,am62-audio-refclk' is not one of ['ti,am654-ehrpwm-tbclk', 'ti,am64-epwm-tbclk', 'ti,am62-epwm-tbclk']
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#






