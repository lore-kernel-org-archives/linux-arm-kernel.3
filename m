Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA082E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xgkTWm6WVWbPhsRTEytxrJPzFZR1pfzXLi7iTV+RxI=; b=uqnf3boiP5Vm6OOxixFjID8yZY
	ezRM5KxCyQAh5eGP9l9tGFQTRygmZrp6hF2PqWvfZsFTWJBpNt7rY1Z9jKy4u0eNBvUPEVOdBpun0
	43ppwKXYHT7mGFy0f+lDpIG3LYPsFOMUpyKzUsUdNfK0H+9g/HQzbE5ACP1OKOMHEKf/3cCYPFhRg
	Gyt4K2csMhyBJrBhq9OfYInrHEtG52UjwhQ9R29/Tk6cBl/wK4EGTtI9gb4Z7HKVJ+Abr2WcxCgKS
	j3m7AiUY47DKqJp7+4zwkXgsMPnccX7s49aPyHXcQK5X/1LfPVUCLJ6XhCn/qn7G3m2WZMqSnAT3Z
	pbxK2mgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzLl-0000000DFmC-1Ho0;
	Thu, 09 Jan 2025 20:41:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzKX-0000000DFax-09d9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5AC6AA42514;
	Thu,  9 Jan 2025 20:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59551C4CED2;
	Thu,  9 Jan 2025 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736455235;
	bh=ikj+ol/J0ItDkKjNMRgfG7evuPqPFIjPQSs5ZvoBHeM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nRtfgtmDLr97EP+Kmm/gnRm4j1DvvHUbnBVe5tbyCowOToekCT8M7PxNtLqmgmuZ3
	 WQjG8pXkkF9fRJv2NYNWP9nTYohnbTEYHI5ZshvHBeyNy6XiJEiYq9V46Q5L6CS0FJ
	 rxSolVxAh0tKM4eDe3ec1ky4aHtBYcsMgmWlkBvla9HgEHgL10uV/T8er30m6DW6Hm
	 +FpJpvo2oGXo7O2jWy2Sp2fBnWsJOLe9hY6qM7zyELVrp/Du1AISlJfxCCLeriP8l3
	 TsANdK66ww5kY8a6PKXhTN0TBBXfNxH2jeg+zNxtXGp54YUUwfm9Q+6vpSeQa6rY08
	 Pc+JhqqsLWtpQ==
Date: Thu, 09 Jan 2025 14:40:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tero Kristo <kristo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250109-am62lx-v3-0-ef171e789527@ti.com>
References: <20250109-am62lx-v3-0-ef171e789527@ti.com>
Message-Id: <173645519141.4157421.14189685127901345595.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_124037_206209_818590E4 
X-CRM114-Status: GOOD (  24.44  )
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


On Thu, 09 Jan 2025 14:20:01 -0600, Bryan Brattlof wrote:
> Hello Everyone,
> 
> This small series adds the initial support (currently just a UART) for
> TI's AM62L SoC family.
> 
> The AM62L is a lite, low power and performance optimized family of
> application processors that are built for Linux application development.
> AM62L is well suited for a wide range of general-purpose applications
> with scalable ARM Cortex-A53 core performance and embedded features such
> as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower
> power management modes, and extensive security options for IP protection
> with the built-in security features.
> 
> Additionally, the AM62Lx devices includes an extensive set of
> peripherals that make it a well-suited for a broad range of industrial
> applications while offering intelligent features and optimized power
> architecture as well. In addition, the extensive set of peripherals
> included in AM62Lx enables system-level connectivity, such as: USB,
> MMC/SD, OSPI, CAN-FD and an ADC.
> 
> AM62L is a general purpose processor, however some of the applications
> well suited for it include: Human Machine Interfaces (HMI), Medical
> patient monitoring , Building automation, Smart secure gateways, Smart
> Thermostats, EV charging stations, Smart Metering, Solar energy and
> more.
> 
> Some highlights of AM62L SoC are:
>  - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to
>    1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total
>    of two external
>  - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
>  - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or
>    DPI (24-bit RGB LVCMOS)
>  - Multiple low power modes support, ex: Deep sleep and Standby
>  - Support for secure boot, Trusted Execution Environment (TEE) &
>    Cryptographic Acceleration
> 
> For more information check out our Technical Reference Manual (TRM)
> which is located here:
> 
> 	https://www.ti.com/lit/pdf/sprujb4
> 
> Happy Hacking
> ~Bryan
> 
> Changes in v1:
>  - switched to non-direct links so TRM updates are automatic
>  - fixed indentation issues with a few nodes
>  - separated bindings into a different patch
>  - removed current-speed property from main_uart0{}
>  - removed empty reserved-memory{} node
>  - removed serial2 from aliases{} node
>  - corrected the main_uart0{} pinmux
>  - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/
> 
> Changes in v2:
> - alphabetized phandles
> - corrected macro and node names for main_uart0 pinmux
> - Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Bryan Brattlof (1):
>       dt-bindings: arm: ti: Add binding for AM62L SoCs
> 
> Vignesh Raghavendra (2):
>       arm64: dts: ti: k3-am62l: add initial infrastructure
>       arm64: dts: ti: k3-am62l: add initial reference board file
> 
>  Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
>  arch/arm64/boot/dts/ti/Makefile                  |  3 +
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 43 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
>  8 files changed, 295 insertions(+)
> ---
> base-commit: 5532b8a9ce0e80514e37a1e082824934663580a3
> change-id: 20241220-am62lx-ca9498efd87e
> 
> Best regards,
> --
> Bryan Brattlof <bb@ti.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250109-am62lx-v3-0-ef171e789527@ti.com:

arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#






