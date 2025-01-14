Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65322C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 00:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nv1n3IX3FvNykPuOIjcw+oLHABPWxmq5UkbLXrubgrw=; b=l6SLR9/Yewak/+EgyiV0kCvuw7
	9WMvcfUUHLbepZTJIPzfCtyxOG7KYBLsN0vTFFIC0dgMhRQJ/D9TfgmjPubi/U7klPT1JD+qgEhHf
	PnF7IvYLrEyRXU5oM1dOF/+0iYrtkoE2rjQxMJ2/0iAVtvqmxLPj7CsZIqfK4QIY3istrMSW+GdSg
	ha5/n3BOU7yQvr76guFkzaH9ix7Tk2gGku/vb8CUsTfkZsTbPF+XezMcNVUEBubXqXjDc/VHBQS8Q
	WO3+B+yLCLTPejAk2QDE+oq0CWI4LhGk7CO22UVdb/hpueUyGshYigXcy+x7KOrvXLBP5kvf7uvkL
	GRR+Ayhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXURe-000000070Tk-0AXS;
	Tue, 14 Jan 2025 00:06:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUQO-000000070Hl-0EjM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 00:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A42035C57A5;
	Tue, 14 Jan 2025 00:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16401C4CED6;
	Tue, 14 Jan 2025 00:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736813091;
	bh=NrgMw8h+fitbqMNvG385KgsvxtlRiPe0cIHOPL1U6Vg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=r1CZwdgdgX6W24ySZ8xoXJ8FoA5BU2ZIs96Owad1lg66t2hErixPRqi7xRpLfRYxO
	 gIIDE4jFe2Y4VCxtIxUGYQkqnrAscy0Qm2AQPXxTD21BMEn42/lV6wvtBNAV3AEvNS
	 4hEd0zFUO5CZdG59s//mzyXiiS0+uyB8z0LpreNyb6KCXYQWTx0pruRUJZuBa424Sa
	 rZujphiQsDzskqZgYyE5hM8gdJVddaBo8u3KgiRnZFcfO4PbRA6nldsVeqwd3YaxSV
	 fNXd8vhlPcZ+I0mvN+gaetlnJrkAUeYc8Wd6TK+6dk8lGTda6C1HUAGSa2Fgo+2mpi
	 FHUAF1ejMU8rQ==
Date: Mon, 13 Jan 2025 18:04:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
Message-Id: <173681284597.3684963.16712339968479881126.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: add imx95_15x15_evk boards support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_160452_137033_7FC7BD75 
X-CRM114-Status: GOOD (  13.20  )
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


On Mon, 13 Jan 2025 13:01:58 -0500, Frank Li wrote:
> Add related binding doc.
> 
> Add imx95_15x15_evk boards, which have big difference with imx95_19x19_evk
> boards.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (4):
>       dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
>       arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
>       arm64: dts: imx95: Add i3c1 and i3c2
>       arm64: dts: imx95: Add imx95-15x15-evk support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml    |    1 +
>  arch/arm64/boot/dts/freescale/Makefile            |    1 +
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1064 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi          |   27 +
>  4 files changed, 1093 insertions(+)
> ---
> base-commit: 1300d5fe48f1e09a9a7d2dfe3b2e74be8ccaa322
> change-id: 20250110-imx95_15x15-6a64db8c0187
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com:

arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: i3c@42520000: Unevaluated properties are not allowed ('inctrl-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/i3c/silvaco,i3c-master.yaml#






