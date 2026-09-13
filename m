Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60698C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL5xIJ06x6sWaYiDzKO+L8oTIfl/IJqCehJ4SatDQuY=; b=owaXp8uBIPuz/58SgydtRKDCMR
	VAW4ZyKqzC5m6Se0D72/jHQiV/65wCLBWJHVGfvuvP/ok6nKZ13pmhHpQZK5Le2WlrVActpbwC2m0
	s2pgYCF536L8PpVgwej8UtFOHCkubVbnd/ODnxlW7+TfReyC8Ac0VwWtCniSn8Knnmq+ZQ1sHP4hW
	SyDoacEEXy5IjmcZd4TqS54p264O7QtQPUMWsEeBOZsF5pqK0ZL+YKxX3r61+BstoVE2SgTxOozs7
	+M6ikFqGNjHhRdL36gN0QaboVIU8F/8mKC1FWRer8VzEGFzCq1gBbWa+dRdRzIih1Kgvhrw4AuMV9
	m4u8BlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g1g-00000001X0z-3cMA;
	Sun, 13 Sep 2026 08:57:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g1f-00000001X0k-39G8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 08:57:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0B8360DA4;
	Sun, 13 Sep 2026 08:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C451F000FF;
	Sun, 13 Sep 2026 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289846;
	bh=BL5xIJ06x6sWaYiDzKO+L8oTIfl/IJqCehJ4SatDQuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B9tjk92Cg1BLQGLcILMt+xCPA+7vurr2DIzXOTUdMUO5nU3wTtn/UJML9VbfAGI0O
	 qRUuirqbG7fmat/slz2H0gbc5+I2/0qrAzZ/UVMTbQA1fuqa2gzjZemqU/5GxECDgZ
	 1JoHHRAckRtCA2LoUJ9aXR5lDtl642+/79JvNCE33Qj5hVAmSXKFDdUSNxQRXgrjVh
	 Efs4ztI+68hGF0RvNANFOvN68qdcvFuF+8e7u+NPF3Z3cTC0HvlekB1EFyuSSCo0w5
	 cFc9UIbeDbZ2PRdaDNb4J6dki/AVUj3UcfxVi3b4GHUsdXEdoLh28xZWkuSnc+BUjJ
	 78HdGxQAGTwWg==
Message-ID: <17349991-bfff-4e6d-9176-dd6ce6bc20ac@kernel.org>
Date: Sun, 13 Sep 2026 10:57:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] arm64: dts: apple: t8122: Fix most property-order
 dt-style-check issues
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
 <20260909-apple-dts-m3-dt-style-check-v1-10-4c546e2d9d51@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-10-4c546e2d9d51@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 9/9/26 12:27, Janne Grunau wrote:
> t8122-pmgr.dtsi is left unchanged because future additions or
> modifications will be sparse.
>
> Not fixed are
>
> | [property-order] property 'd-cache-size' out of canonical order (should sort before 'enable-method')
>
> for all CPU nodes to keep cache related properties together. A blank
> line is added before 'd-cache-size' to attenuate this grouping for human
> consumption.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
[...]
>   
>   			status = "disabled";
> @@ -270,16 +278,16 @@ fpwm1: pwm@2a1044000 {
>   		serial0: serial@2a1200000 {
>   			compatible = "apple,s5l-uart";
>   			reg = <0x2 0xa1200000 0x0 0x1000>;
> -			reg-io-width = <4>;
> +			clocks = <&clkref>, <&clkref>;
> +			clock-names = "uart", "clk_uart_baud0";
>   			interrupt-parent = <&aic>;
>   			interrupts = <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>;
>   			/*
>   			 * TODO: figure out the clocking properly, there may
>   			 * be a third selectable clock.
>   			 */
> -			clocks = <&clkref>, <&clkref>;
> -			clock-names = "uart", "clk_uart_baud0";

Please also move the comment so that it stays together with clocks = ...;



Sven


