Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74214C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VFa4gkN/MC1afzYI4GdGQGF4nVMqhTx+VvOx02Ma4I=; b=ylWxBYz4vs81PzZv9lDRQw5j2v
	X59l1KHlAPSGrmxCCJI/wmeJMqEX8s8C9/86svKa/yIpvQl402oUu8EwkaGc6Zjs3X/T40WENkJ2O
	cUQZ7KiOp+RgbOzK3eLMaBDn/Y51SkqCgaKbANq0Y2Hz3sl38NX8dUbA3NyUSO0xlRaYGpq2WYVBY
	QNRSq6B04xGVFHW7XbsoTZtZay5FZUFyT/K4ltx4RRhlTWltEb8VW+dhntqCUy+b11RD2kEeRru9s
	IDfp03tWNxXg/AbqRtT8vuW78pHS88LY6b60T/szRUvoOK15M3u2TV2qJxID6PRhw8Z/9lIgA/4UN
	LCv8fWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRRy-0000000C7rR-19Ly;
	Mon, 10 Aug 2026 14:58:02 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRRw-0000000C7qd-21Cw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:58:01 +0000
Received: from francesco-nb (93-35-5-212.ip52.fastwebnet.it [93.35.5.212])
	by mail11.truemail.it (Postfix) with ESMTPA id 27EF71F984;
	Mon, 10 Aug 2026 16:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786373878;
	bh=2VFa4gkN/MC1afzYI4GdGQGF4nVMqhTx+VvOx02Ma4I=; h=From:To:Subject;
	b=wqPpHJvguCOWz3azxcTJkLu8IeT87b6wUKuwgFapNDK2YwwNQkL5yZ05OpxhfSVH6
	 PTBkjeP8cfyKFzkC8B5HDUSMsLWMyfRQJnLbmwo11qUAqbSdK2CxZllX3nMt+Z0qQ6
	 qQIA9mm/kinVPTo3xq3MUEWnTLjYPcEvmkZxWhJnQsiwhzzsz03ScOWg/LOPvWqIah
	 RNB/pmgMVk1TzyWMc1wGy8bU+S2vmyq8mAiIW/H2IsKVTpVOpAe00Oj7elugN9gbuG
	 gTviMJjto/TXsUV9hD/juwCqlGKY5GiOPVHwIQK9rr8io2Ag6BBjpHQHWV01Q9BqS5
	 aZRruV3M65/vQ==
Date: Mon, 10 Aug 2026 16:57:55 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <20260810145755.GC81453@francesco-nb>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-5-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-5-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075800_679041_A0991EA0 
X-CRM114-Status: GOOD (  18.67  )
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

On Thu, Jul 30, 2026 at 09:34:12AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  3 +
>  .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4adf..3f98132f5a32 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -707,6 +707,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
> @@ -729,6 +730,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
>  
> +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> +
>  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 000000000000..bc02864c6f88
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + *
> + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> + * configuration for remoteproc and audio over rpmsg.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		memory-region = <&vdev0buffer>, <&vdev0vring0>,
> +				<&vdev0vring1>, <&rsc_table>;
> +		memory-region-names = "vdev0buffer", "vdev0vring0",
> +				      "vdev0vring1", "rsc-table";
> +	};

should we have a common dtsi, instead of having an overlay for each
board? something like arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi ?

the goal would be to avoid duplication, and to have the functionality
just working out of the box for all the boards that opt in for it.

Francesco


