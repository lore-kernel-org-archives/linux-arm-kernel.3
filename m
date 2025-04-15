Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D36C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93ewRw/AuXBm453L+29rWHx4DYAHBNomlgKeByeTfPE=; b=ZGXl2DQlEbPlVRzKQBoVtjjmnP
	0DkaTlvwVhwIDgPJ8F3ZOEDcMc2632m4M/ES7yfc3DtsJtOdSvGUTdsXJYOEEHVF3Os0ri/xMG7Jx
	lheacUh/+jwRTVBCnhZvunWpFoNBqVVxvC74VnGKToggNDgWRlGtQBCn6cS05mwLQiWrQgW/QE3qr
	77VFOC7R9DuNmv+N2w6O92fDvEIhwOl/NDtZkDxd0cOJFaEt8CNpV5hvmjBO1pQLtevWgdeMuT5hQ
	CPte7U4UwD+dJ62P7urPUwOmgSV8q3EbfM5uNEbnKBkRTfVB8jg7L65P0UftE7X0YUeVX9/1K2KSn
	B84ILvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gnk-000000060c6-36LC;
	Tue, 15 Apr 2025 13:58:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4geg-00000005yRg-11Dt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:48:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6344015A1;
	Tue, 15 Apr 2025 06:48:45 -0700 (PDT)
Received: from gentoo-vm (unknown [10.57.44.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B2B13F59E;
	Tue, 15 Apr 2025 06:48:44 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:48:38 +0000
From: Kajetan Puchalski <kajetan.puchalski@arm.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, maz@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Fugang Duan <fugang.duan@cixtech.com>, 
	Guomin Chen <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <7cnhezft5jzvtdjx6m2vjmtaxgla33j4fynd6ef4c6b7dh5pvo@4cbxewawilqp>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415072724.3565533-10-peter.chen@cixtech.com>
User-Agent: NeoMutt/20250109-134-7b7c50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_064850_320472_E20998A1 
X-CRM114-Status: GOOD (  13.86  )
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

On Tue, Apr 15, 2025 at 03:27:23PM +0800, Peter Chen wrote:
> CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> and Orion O6 is the motherboard launched by Radxa. See below for
> detail:
> https://docs.radxa.com/en/orion/o6/getting-started/introduction
> In this commit, it adds sky1 base, mailbox, clock (scmi firmware baseed)
> and uart, and the kernel could boot up to console.

The commit message style is supposed to be in imperative tone, i.e. "Add sky1 base".

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---

I've tested this on my own Orion O6 with 6.15-rc2, the UART does work and the kernel
does boot up to the expected point. Feel free to add the tag if you'd like.

Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>

> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "sky1.dtsi"
> +/ {
> +	model = "Radxa Orion O6";
> +	compatible = "radxa,orion-o6", "cix,sky1";
> +
> +	aliases {
> +		serial2 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x28000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};

