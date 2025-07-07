Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900A6C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 03:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oesmI5ePY0ossKfajmISjSZfcDhggP0bYnh+lj+buoU=; b=vC/R4caSCBKqAtGjvRLIzAeeNN
	M/kFu/3/fH+TBcfvRMYs+0Qnco6X4rBXaVV+t4rUPpXJWlhcdD1x8/vCH23W0GsaioZN2BP/aqZdF
	OZ8CcDlrDP9q4yJv4cpEY+uQ5bw4n/sQk8lP6byj7zl76zpYkFPfx27eRwC/B+EKFdyL2Zg+NtlCA
	mfWtQirv0OGxIplDFDvxJBw0FYOQ9giN47kuEqXWAH4rckj+Ce0WMY3aqndLzw9OPNfi2qdK7Uodj
	4To9/FyO0HLpbGQSLKOveWbPt6u7HBp2B78OKexapgGdUu9fhc+us7biUao+XN7BxXejmO9iaLA4n
	8qoQaGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYch2-00000001JAH-2BSL;
	Mon, 07 Jul 2025 03:39:00 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYceg-00000001IyM-2iN3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 03:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oesmI5ePY0ossKfajmISjSZfcDhggP0bYnh+lj+buoU=;
	b=WQQQ3KmEPp5jU24e7Wc/uAmsDbH3yhApgLc+2F73BuqLtNc1F81JKBaS1t9AYL
	EMZO/hRhaD4y4BU4oiGN0kXBUJ5JWOER0NVuIOwWBTp+BEBaMe9FMf2SFK7gGRxO
	k05ARgRcGFX16oDqyWIoPV47YgrPs3HM7EG+x1D9F5CAs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXluOqQGtoLdp1AA--.56829S3;
	Mon, 07 Jul 2025 11:36:12 +0800 (CST)
Date: Mon, 7 Jul 2025 11:36:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx93-phycore-som: Add RPMsg overlay
Message-ID: <aGtAqi7JWbF5F-31@dragon>
References: <20250619063954.1730231-1-primoz.fiser@norik.com>
 <20250619063954.1730231-2-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619063954.1730231-2-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgCXluOqQGtoLdp1AA--.56829S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4UXw48tr13Jw48KrWfXwb_yoW5CF43pa
	92yFW5WFWIgF1xCr9xXrs2qa4DAws5Aayj9w1UWryUKrWUAry2krsxtrW3Wr4xZw4UAw40
	vFs3WFnFkFnxX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4WlgUUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAwwlWhrQKx8tgAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_203635_057484_C1EA24B3 
X-CRM114-Status: GOOD (  15.54  )
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

On Thu, Jun 19, 2025 at 08:39:51AM +0200, Primoz Fiser wrote:
> Add an overlay used for remote processor inter-core communication
> between A55 and M33 cores on the phyCORE-i.MX93 SoM based boards.
> 
> Overlay adds the required reserved memory regions and enables the
> mailbox unit and the M33 core for RPMsg (Remote Processor Messaging
> Framework).
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>  .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b473a23d120..08a1de299538 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> +
> +imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
> new file mode 100644
> index 000000000000..9200113c9ec3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Author: Primoz Fiser <primoz.fiser@norik.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		vdev0vring0: vdev0vring0@a4000000 {
> +			reg = <0 0xa4000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@a4008000 {
> +			reg = <0 0xa4008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: vdev1vring0@a4010000 {
> +			reg = <0 0xa4010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: vdev1vring1@a4018000 {
> +			reg = <0 0xa4018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@2021e000 {

Can we sort the node in order of unit-address?

Shawn

> +			reg = <0 0x2021e000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@a4020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0xa4020000 0 0x100000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&cm33 {
> +	mbox-names = "tx", "rx", "rxdb";
> +	mboxes = <&mu1 0 1>,
> +		 <&mu1 1 1>,
> +		 <&mu1 3 1>;
> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +		 <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	status = "okay";
> +};
> +
> +&mu1 {
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 


