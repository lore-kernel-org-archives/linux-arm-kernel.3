Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E34E63CA1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA4rcw4DNXd2qc7bsL606sYXS9LA8acWlPkcbuckatE=; b=Ib8BvxRfAYkcmmsi6wSfkj8zdg
	zUbF9gY7stvnw0GtWUJvZfM34sQlEBM/sQb0/DozIZXZm6nBhulMViOTCOUZ18U5ID5wNBZj6JXPi
	/Bv3Pa9kAHD6HfR22eX6X4pya2N2wJgnLp50WzDXPg/VyrmC95E2WSWHodJHDuAzJKQLWSQbr9Ap/
	j84xiG5nym1qqgRs84ADMvOA4GrSgU8C0j5SvcLub0fRCPSvyTvq/fHb1tZhLv+QvPpqIyVmktcZy
	2IYbIGXlfVJI1Hw+aMmRDnrU9VmtqqsycSuWK4m6zgpgFxPAHBNMV9A7gTeUjMl6mN5S8h9uLX+53
	p3zExJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyVx-0000000B8J9-3wqo;
	Sun, 25 Jan 2026 11:42:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyVv-0000000B8J3-2zSL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 11:42:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3C9360018;
	Sun, 25 Jan 2026 11:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD68C4CEF1;
	Sun, 25 Jan 2026 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769341362;
	bh=4DdLprG/N7B62TK2LkKPFjtgMnqQxVpNxf7Fn2cCd84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dTYlM7XMLjH+fCGMjb69wP2JlH+AS3ssBeZldr0a2T3sofB0ofge07nmOb9uFOIsa
	 TsRyz9MYQ+K0pbJ9hoIyQ/OpHkZyigK8AOKarVQoJyZwn4z+xV1LgtgpAJsmOBhRFR
	 8rquwBUSrag/f5EVMhYJ0O+gvS2ukd88UsJfl/bIaVKuxWWPUcdekkDkonbbIOCiJM
	 XC86ej2O5f51PNlByt1uuKmU/QhkaYuV8Czg0LyTfl/3S6Amb++1NC9cEMtdTnika6
	 AAG9Lq9mInJoGVudstMOxBMiL3ifQwlU8Pn19kAQs/9UeQZAVul0Fg5RYf+JQ2/xmi
	 Otdo7jSdLxu7A==
Message-ID: <5d4ef8fd-55c1-42c3-a18d-a262997ec302@kernel.org>
Date: Sun, 25 Jan 2026 12:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] irqchip/apple-aic: Add support for "apple,t8122-aic3"
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
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

On 25.01.26 12:08, Janne Grunau wrote:
> Introduce support for the new AICv3 hardware block in t8122 and t603x
> SoCs. AICv3 is similar to AICv2 but has an increased IRQ config offset.
> These MMIO offsets are coded as properties of the "aic,3" node in
> Apple's device tree. The actual offsets are the same for all SoCs
> starting from M3 through at least M5. So do not bother to follow suit
> but use AICv3 specific defines in the driver.
> The compatible string is SoC specific so future SoCs with AICv3 and
> different offsets would just use their own compatible string as base and
> add their new offsets.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   drivers/irqchip/irq-apple-aic.c | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
> index 3c70364e7cddd6ed6285595f136146ab04b897b2..f4efc325bebad1ae6119aa4eab47819a267da207 100644
> --- a/drivers/irqchip/irq-apple-aic.c
> +++ b/drivers/irqchip/irq-apple-aic.c
> @@ -54,6 +54,7 @@
>   #include <linux/irqdomain.h>
>   #include <linux/jump_label.h>
>   #include <linux/limits.h>
> +#include <linux/of.h>

Did we miss this include previously or why is it added now?

Looks good to me otherwise:

Reviewed-by: Sven Peter <sven@kernel.org>


Best,


Sven


