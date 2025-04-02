Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A11C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 06:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rhCDJeDfF81rYX6fwoxHO8jKf69CZebaVxU/tKHohM=; b=0D2X3SY8q76sFZTIdn8EfxtELH
	8eE1/Qn56jKxTOu3TmdioNDUHzC2/zQgHDHDvBUZfq3Ln3/2wCYWR1wkFQrc+D/s7FJAdD2PzTdP3
	iEuIbAoi+xicmFXRKh3URb4hOoa1w3JRnmL5hs1TUlXya5zO8dqQftnNru5xDS850ZFz7Mqp5hosQ
	8ggE5VINOwIXcAIMW13F7Ik8iPEhcCXZNfvwtiKpQBx6x5yHMpcy7pSWME7gjdya8b9F1k1C5IXwt
	9Kh6+70QV5l9ZhEo4uuzASpf1dePAKMPYoIROlCk6psLOCbyIwpp9puyJRkaI1NhV3QBbLawcSNQT
	PvHXXjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrz6-00000005I65-3Wyc;
	Wed, 02 Apr 2025 06:54:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrxL-00000005Hvi-17RN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 06:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33DF143882;
	Wed,  2 Apr 2025 06:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E10C4CEDD;
	Wed,  2 Apr 2025 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743576730;
	bh=Qy/1IpLmdqk0eoWiuuWOg2HuWfB63T6KL+1+HLO4yEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvHxLXR3FgbpId+ViaVyp4nkr/8eDd6JHBk4vUb4WFfJOPOk2znfCL5L7ZEUctQV6
	 Cz9CFdPTaFRk5gtUlYHmOgxCRAw77iKnZ+v02CHSGs5HJQleUhhGhTp9JXuTaD/VWr
	 mtmyEUjnmVW0m8iIzlzbxF5KM8oAnL3wb0Q1qHe2by94F/d+JZDFqv3Qjsdet6V830
	 3eQl+IY6yLdzW9M6Z8Yed5SCAJ1ujLmcN09jVMCC7VS+Fy9weRuda/4HjgqbqfXTSx
	 9125wOYgiBjAH6CXH59AVa8QcmB9Y0DsNKmbbx4yJ4Oo0VdyA8pY2HiIzbwwLa8ytZ
	 DR020zzg/ZzXg==
Date: Wed, 2 Apr 2025 08:52:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Message-ID: <20250402-toucanet-of-inspiring-aurora-e7ba6f@krzk-bin>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401154404.45932-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_235211_326813_42C9FBD1 
X-CRM114-Status: GOOD (  15.55  )
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

On Tue, Apr 01, 2025 at 11:43:59AM -0400, Laurentiu Mihalcea wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus@30df0000 {
> +        compatible = "fsl,imx8mp-aipstz";
> +        reg = <0x30df0000 0x10000>;
> +        power-domains = <&pgc_audio>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #access-controller-cells = <3>;
> +        ranges = <0x30c00000 0x30c00000 0x400000>;
> +
> +        dma-controller@30e00000 {
> +            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +            reg = <0x30e00000 0x10000>;
> +            #dma-cells = <3>;
> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> +                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +            clock-names = "ipg", "ahb";
> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +        };
> +    };
> diff --git a/include/dt-bindings/bus/imx-aipstz.h b/include/dt-bindings/bus/imx-aipstz.h
> new file mode 100644
> index 000000000000..b81b4654e00f
> --- /dev/null
> +++ b/include/dt-bindings/bus/imx-aipstz.h

Filename matching compatible, if this stays.

But more important, I do not see this being used - neither here in
example nor in the driver, so not a binding.

> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef _DT_BINDINGS_BUS_IMX_AIPSTZ_H
> +#define _DT_BINDINGS_BUS_IMX_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX_AIPSTZ_MASTER 0x0
> +#define IMX_AIPSTZ_PERIPH 0x1
> +
> +/* master configuration options */
> +#define IMX_AIPSTZ_MPL 0x1
> +#define IMX_AIPSTZ_MTW 0x2
> +#define IMX_AIPSTZ_MTR 0x4
> +#define IMX_AIPSTZ_MBW 0x8

IDs are not hex values. What do you exactly represent here?

Best regards,
Krzysztof


