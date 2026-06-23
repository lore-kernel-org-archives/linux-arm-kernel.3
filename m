Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5107CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIwTC0VHw0jMFTXrlPYu0EBk9AhpcmV7JfkqaZxHCBE=; b=4bJAgFxczoA3rtVw1+bpNNAFkb
	/1vFG0QjKSVIO5/iE3WECThcIYWTdZsBWRINvthTadzTeR5HAm3buKzuLaM04Atzshnp4ii/Ch9fY
	9faAvxrIOhxyo8UHFYAl7t+2gpX1KqMjJz2xY0V384AL1T59QwbMxnOjMwPbd9cIwQJO4NQc/Lgwp
	gKy2Qy7UWsXNB8hrYwLNuT5x7rpR+GX5o9T0/BYpRwtxsVx3qvWLOwtkQKAWcYyb3kYv4i3VyCVw5
	zke/lV66TBlLz7Y0iS9In61D/+xKVcBWvqd5rOakHtCUdz4Sex0UZoV1gur7HX71ylmXks7JnETYS
	9l9ty1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwmd-00000005vmw-461o;
	Tue, 23 Jun 2026 08:47:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwmc-00000005vme-30Bg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:47:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11D5540199;
	Tue, 23 Jun 2026 08:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0538E1F000E9;
	Tue, 23 Jun 2026 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204421;
	bh=WIwTC0VHw0jMFTXrlPYu0EBk9AhpcmV7JfkqaZxHCBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jYxRw6uwNPYdz2dtcmIZFKkjSmnce0AkzA2cipbsc8XfB7+QQrrLm9S3oXC3rR2He
	 4+JUClOGBhD684EXgDlTruzwYKbBNBwS0fr2on/Ik4F5iHhGidQ/a6jLHJ1Ik2UclH
	 5O5c1XcsbmFL9/1NEmzqwfVClgVUnUUHHUvM/Y26f74bZYVDdNoSLWzODeIqcVchHV
	 rcVqwq/zWumw/mNQ+m3R1QQ9k+1Em/hi/DsP8BLjFIqwXq2evXe+5/FVqUhcSFaw2e
	 KdxXZzxudLMBrS1boAHEUv8hs0863UZrsaDIgBNeNw+kMFuLkM6nYyBe/dOBVAX9+y
	 H3zgr4szmz/0g==
Date: Tue, 23 Jun 2026 10:46:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: Add the actual power domains on U8500
Message-ID: <20260623-just-grinning-peccary-d661ca@quoll>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-2-eb5e50b1a588@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-2-eb5e50b1a588@kernel.org>
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

On Thu, Jun 18, 2026 at 07:00:48AM +0200, Linus Walleij wrote:
> This file has been left in an unfinished state just defining
> the root power domain for the U8500 SoC. Fix it up by adding
> the actual existing power domains in this SoC.
> 
> The PRCMU code and old regulator driver is mentioning some
> *_RET domains, this means "retention" and is a state in the
> domain and not a domain of its own.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

From/SoB mismatch.

> ---
>  include/dt-bindings/arm/ux500_pm_domains.h | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/arm/ux500_pm_domains.h b/include/dt-bindings/arm/ux500_pm_domains.h
> index 9bd764f0c9e6..1c168e59ac90 100644
> --- a/include/dt-bindings/arm/ux500_pm_domains.h
> +++ b/include/dt-bindings/arm/ux500_pm_domains.h
> @@ -8,8 +8,23 @@
>  #define _DT_BINDINGS_ARM_UX500_PM_DOMAINS_H
>  
>  #define DOMAIN_VAPE		0
> +#define DOMAIN_VARM		1
> +#define DOMAIN_VMODEM		2
> +#define DOMAIN_VPLL		3
> +#define DOMAIN_VSMPS1		4
> +#define DOMAIN_VSMPS2		5
> +#define DOMAIN_VSMPS3		6
> +#define DOMAIN_VRF1		7
> +#define DOMAIN_SVA_MMDSP	8
> +#define DOMAIN_SVA_PIPE		9
> +#define DOMAIN_SIA_MMDSP	10
> +#define DOMAIN_SIA_PIPE		11
> +#define DOMAIN_SGA		12
> +#define DOMAIN_B2R2_MCDE	13
> +#define DOMAIN_ESRAM_12		14
> +#define DOMAIN_ESRAM_34		15
>  
>  /* Number of PM domains. */
> -#define NR_DOMAINS		(DOMAIN_VAPE + 1)
> +#define NR_DOMAINS		(DOMAIN_ESRAM_34 + 1)

In a separate commit, instead you need to drop NR_DOMAINS and move them
to driver. If this changes, then it is not ABI. We did similarly for
many clock bindings/drivers.

Best regards,
Krzysztof


