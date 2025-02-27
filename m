Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38DBC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jgu3bQcQ5Vt6zZ/CZekVoI/v3BCKJ/5Y9Ufcxu9reiQ=; b=Ljr4r3nuDniaT4urdZ5FOkBaZk
	1ogkVhw/EEpB7mW3GjlxJDfN/Ybs9cs227K8twCW5wQKm9JLStQI5AdRMrwpO/FDwfJng15ILZSRx
	Kr1Yn1cHusCcx1J8YEOK6rma9MsqTpjUVYiMpenXMTsWeSIu3MjKuYeMKDNYcUnnE4jbG+VpLIlSZ
	4H+6U5pyGaU0YkWMMKgU+W/1cqsxM8P2deHnGBN6OAlqDvklhtiWgML24VhonSwxiBJK4ZMLwXvhh
	YfyRBRhghdqZpBgoZb8fVTmEYZiRJ/S8Gle5ZDzfsaIQ9Tbs8QaMCIyAqzcsF6fIs8qSB3EO8Hj3J
	iFRembNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhV-00000008UQd-2uIh;
	Thu, 27 Feb 2025 19:37:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfnV-00000007tr7-3ssA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:27:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260FE2C3A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 07:27:50 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FAE23F5A1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 07:27:34 -0800 (PST)
Date: Thu, 27 Feb 2025 15:27:30 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 01/10] arm64: Kconfig: Update description for
 CONFIG_ARCH_VEXPRESS
Message-ID: <Z8CEYheKAr3VJ8k5@e110455-lin.cambridge.arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-2-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221180349.1413089-2-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_072738_005751_3CF7FC29 
X-CRM114-Status: GOOD (  18.06  )
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

On Fri, Feb 21, 2025 at 06:03:40PM +0000, Vincenzo Frascino wrote:
> Update the description and contextually the help text of
> CONFIG_ARCH_VEXPRESS to reflect the inclusion of all ARM Ltd Platforms.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  arch/arm64/Kconfig.platforms | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 02f9248f7c84..c468c23b2bba 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -374,13 +374,12 @@ config ARCH_UNIPHIER
>  	  This enables support for Socionext UniPhier SoC family.
>  
>  config ARCH_VEXPRESS
> -	bool "ARMv8 software model (Versatile Express)"
> +	bool "ARM Ltd Platforms"
>  	select GPIOLIB
>  	select PM
>  	select PM_GENERIC_DOMAINS
>  	help
> -	  This enables support for the ARMv8 software model (Versatile
> -	  Express).
> +	  This enables support for the ARM Ltd Platforms.
>  
>  config ARCH_VISCONTI
>  	bool "Toshiba Visconti SoC Family"
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

