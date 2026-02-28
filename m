Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01B2FEE4E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMwuMCZhE8UWennE1yJWXSzCbqUWiVeyPnm/DJr1mQ8=; b=dIWyEYTcAMDoM7TzkIOYydwlw3
	xvPq8sAQhll8dAGNtWjpjt3A936BpDgyg3Lj88wphGzoFLfiWkxWbTefg4rqbYwfrBIdlZynKn16E
	iFJcbMNTglmGVyXKVZdCCUq0KEfXugHhPcco93cC8mpH7BvlduF18VEhxd5mvLcZvLyT11pUZ2jFT
	H2uvj9GjDwqDxEtDnV/j3Q8OWtifGMPWqBkqIH5/82HhTyak9Q7wvNipa3hqrdAku5EHaaA9D1uF9
	tUQS01bEQ97J2vRnrKuNNw6jQDfe6R1rvhy80rX/dqwav6AU0IHPwRUhtQbjkKgsF4eU5FaMSThk5
	n1nYoTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIFc-00000009ltG-37og;
	Sat, 28 Feb 2026 11:12:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIFM-00000009lr5-2zNr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB2D56001D;
	Sat, 28 Feb 2026 11:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9BBC116D0;
	Sat, 28 Feb 2026 11:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772277151;
	bh=nLRrxszpvSY+0yk4jSIM9YoyXBlAYxZf7vJPBm1s4bY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1u6+7PA5r3BlisSxInQ3ULtJgGGhUBovE8u72FEpNFmvWh+t2+BqOCqaBX+w0Kjm
	 6zQpvvQN44xIARcwKgdX9KhXiLp+b4tCa4eMeJLTSqsf8nriHVepoYqczdP2RHXsVD
	 X8EZVojDZAqJdMGPKk1HrAgcizYCY3aB4UIykfF7RfCGwJkatCMuG4b0F6bTebppoq
	 a9OMdqFWud4K6E3GCb6Mp5sqnVaYB39P2DJRmB9tZQa0U3DdGpIFoK5+mm+XiSM/0T
	 9kHucfsye4QxE0l110lOJZRbMBJUrY75WM6NSi1sAxloU/y8fF1t+NpuSC3XAB6qYA
	 Cfflj1fPN/+3A==
Date: Sat, 28 Feb 2026 12:12:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 7/8] ARM: dts: Add a Raidsonic IB-4210-B DTS
Message-ID: <20260228-magnificent-swine-of-jest-03cfbd@quoll>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
 <20260228-gemini-dts-fixes-v1-7-0c6f6d0fb4bd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-gemini-dts-fixes-v1-7-0c6f6d0fb4bd@kernel.org>
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

On Sat, Feb 28, 2026 at 01:05:47AM +0100, Linus Walleij wrote:
> This adds a device tree for the Raidsonic IB-4210-B NAS, a slightly
> under-powered version of IB-4220-B with half the memory and
> the cheaper version of the SoC.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/boot/dts/gemini/Makefile            |   1 +
>  arch/arm/boot/dts/gemini/gemini-nas4210b.dts | 205 +++++++++++++++++++++++++++
>  2 files changed, 206 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/gemini/Makefile b/arch/arm/boot/dts/gemini/Makefile
> index d5d32f02e232..4722fb1bac49 100644
> --- a/arch/arm/boot/dts/gemini/Makefile
> +++ b/arch/arm/boot/dts/gemini/Makefile
> @@ -2,6 +2,7 @@
>  dtb-$(CONFIG_ARCH_GEMINI) += \
>  	gemini-dlink-dir-685.dtb \
>  	gemini-dlink-dns-313.dtb \
> +	gemini-nas4210b.dtb \
>  	gemini-nas4220b.dtb \
>  	gemini-ns2502.dtb \
>  	gemini-rut1xx.dtb \
> diff --git a/arch/arm/boot/dts/gemini/gemini-nas4210b.dts b/arch/arm/boot/dts/gemini/gemini-nas4210b.dts
> new file mode 100644
> index 000000000000..8bec57c8b7b1
> --- /dev/null
> +++ b/arch/arm/boot/dts/gemini/gemini-nas4210b.dts
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for the Gemini-based Raidsonic NAS IB-4210-B
> + * Based on the NAS Forum experiments by user "CptSpock".
> + */
> +
> +/dts-v1/;
> +
> +#include "gemini.dtsi"
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Raidsonic NAS IB-4210-B";
> +	compatible = "raidsonic,ib-4210-b", "cortina,gemini";

So here it is - that's a new compatible, not missing one.

Best regards,
Krzysztof


