Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03884C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NRZUbtUucUhw0WkqpcYIAzHqGYCykdJeiO5IvMZwJk=; b=ikZreAxGqAaZHWkRG9T7R6K3FD
	b2g9pb8G2kwjoxR9pj8q0oJAw4msbsopBSL2wfDoVMRxHSvEeaNqM2TWFILQSe4w9C3ZSEhTGIKGl
	JUNb+et6Zpdo58f3J9jUQdR3X9cPmckkuta/HwArpMYz1z0d5FMWGlnpZH47MH9SsPaIOlpyDq62P
	1VyxPi1YjN+ajCErfviGJVFw7h6dEMxkhEFUQgrKeW7Jm2eL1zt4sD/cdfjBzRH4Bxa2VzL9zlFsz
	OAFUPT1zOibMZPudr11tMkNeg3cgXWbexwrjrFg9GawYrRbrRC4LcM9TRwQQMeHC1dSIxgDNoWoPZ
	ut5HEjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vkE-0000000G264-2MBi;
	Fri, 11 Sep 2026 07:32:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vkE-0000000G25g-04Cv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:32:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EED743931;
	Fri, 11 Sep 2026 07:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A9B1F000FF;
	Fri, 11 Sep 2026 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111941;
	bh=8NRZUbtUucUhw0WkqpcYIAzHqGYCykdJeiO5IvMZwJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=isZHds3RVUgkbzYmuIAs026IhkzEJjYNTCq2AR0SisNdLX5luwLSdo7hMZH1vZ7BK
	 S7Zv/7lj58eB4kRjCf5HQ+bEhViwArNhumUpObc6wDHv5JnYU2kxZhVNp3lRbuWsyv
	 pYwvHz5ZHk+EL9KGDBkCVNE4b1WL0OA7mJnuaBTU14yqMFS81WYOQi3vGQyQdqmrcb
	 /GUoxsu9j1vW4g/S9U9IHnJEiMlJJJZetc/hXbHTSjMRPkQFK7LYvz8Ss8qEQ6sDPE
	 7hQ1khoSdYUA8bAibBuCkGVvs66XfD4EQkBhRY/bwbhU24f3188rURADagzGszCnXY
	 cJ7NRveh+gkHA==
Date: Fri, 11 Sep 2026 09:32:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Message-ID: <20260911-sweet-industrious-stallion-b7a727@quoll>
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909182641.165383-2-marex@nabladev.com>
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

On Wed, Sep 09, 2026 at 08:26:05PM +0200, Marek Vasut wrote:
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +
> +#include "zynqmp.dtsi"
> +#include "zynqmp-clk-ccf.dtsi"
> +
> +/ {
> +	model = "ifm ZynqMP VHIP6 Evaluation Board";
> +	compatible = "ifm,zynqmp-vhip6-evalboard", "ifm,zynqmp-vhip6", "xlnx,zynqmp";
> +
> +	aliases {
> +		ethernet0 = &gem0;
> +		ethernet1 = &gem1;
> +		ethernet2 = &gem2;
> +		ethernet3 = &gem3;
> +		gpio0 = &gpio;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		rtc0 = &i2crtc;
> +		serial0 = &uart0;
> +		spi0 = &qspi;
> +		usb0 = &usb0;
> +		usb1 = &usb1;
> +	};
> +
> +	chosen {
> +		bootargs = "clk_ignore_unused";

You should not have such bootargs in mainline DTS. It ties DTS to
currecnt Linux driver implementation, not mentioning that it is
subjective choice. And once such bootargs appear, then they are tricky
to remove because users of DTS might rely on them.


Best regards,
Krzysztof


