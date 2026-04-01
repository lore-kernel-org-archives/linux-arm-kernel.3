Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5C2D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNv7Zo01afEfQzSPWefT3fcY/lusNnKpSCVi6YGL+cU=; b=WFMUYmjX0XlAsTuPsOqWMEpx3K
	aWlimcih9tk7q/zVCKCBTiCl95C794kfZfcMqRsuAQ/XxDvIUbvMQYh9LPUAlOokgQ+z6jWYLQ5t3
	WrY0dqbW6XbH7BGZZbgi/CSrf5vQQI0HprNk9gUJapXeek4Nx3i3mHhQumHbAA8CgV4lOrRHF3kA9
	QSMxbA10ElDgWKQWWE73+b0Ke3Ybud1CfVscFhx3bSSUQNgSTQuJJ7kFMhxoebwH9UaisN8JSWj8d
	oyNvU0x51jKXwHonWW/HQcCYnAyXwB4sVaokFu+HXkh1SgcB3eix5F760ly6HxYRO89wDcnLTknOB
	u0xkgqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qI9-0000000EFPT-2OHc;
	Wed, 01 Apr 2026 07:47:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qI7-0000000EFPI-2dWN;
	Wed, 01 Apr 2026 07:47:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5CE060121;
	Wed,  1 Apr 2026 07:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC25C4CEF7;
	Wed,  1 Apr 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029626;
	bh=lzWX3iUS0cGBKwvQbYvLCMFCiE+hsgup2maX2G5+fRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q33gf0na9FgTmniWilMtyme65kNyXWY9hOXQH8PxqqvxmVLF5KQEqlgUNp0iPFCHK
	 7yveG1omdQbPZYX0MEnCX++PN4kKVLtgtTkXriqw/Qaihm54nLe44MTucaoxSzDsOx
	 xPH32/6bukn0lJdOJlayInKBvOiqh9TwLtoko1l1bfVc7K8YVmoUVMPtCaCY2gz7De
	 n3rT3QP8D81tRPwoK/eCH10H54E3g6BrYQi47q3P/1CZMa13B0ZQE/A1IezUg/Axp2
	 8DoM//zzJE6+Lf2sLjXIRQMIeemZJu5BCHGjY3rOwvaRieW1mGzX8LpoxL10m+d1PK
	 FExdQDBX0tfWw==
Date: Wed, 1 Apr 2026 09:47:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afaerber@suse.com, tychang@realtek.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH 1/3] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Message-ID: <20260401-idealistic-grinning-wallaby-8c3cd5@quoll>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
 <20260331113835.3510341-2-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331113835.3510341-2-eleanor.lin@realtek.com>
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

On Tue, Mar 31, 2026 at 07:38:33PM +0800, Yu-Chun Lin wrote:
> +  reg:
> +    items:
> +      - description: GPIO controller registers
> +      - description: GPIO interrupt registers
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt number of the assert GPIO interrupt, which is
> +                     triggered when there is a rising edge.
> +      - description: Interrupt number of the deassert GPIO interrupt, which is
> +                     triggered when there is a falling edge.
> +      - description: Interrupt number of the level-sensitive GPIO interrupt,
> +                     triggered by a configured logic level.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-ranges
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@89120 {
> +      compatible = "realtek,rtd1625-isom-gpio";
> +      reg = <0x89120 0x10>,

0x10 feels very short range.

> +            <0x89100 0x20>;

And this means it's continuous. Are you sure these are two separate
address spaces?

Best regards,
Krzysztof


