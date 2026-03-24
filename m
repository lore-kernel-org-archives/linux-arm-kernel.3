Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0F0E9A745
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQBMEQkOGomWtbZc34txK3gtQx2i8UOCAJBqKxbTLgQ=; b=P4btW9MOnFI3otDp+ISbwURF9y
	+PpfkZNiK0Nzq/ZM9m9ahgqN1DT2jQIzbRhcVgeEG/uSqx2mAWeI9W18+aLi4iGPG+Apr7voJ6E2f
	9gbItGMsDRS4z5X7pOOdQXHGPM5+OQKqFUhCzYoUwPSxii4E2PZxuSxOSpL8ruRqXbfmEDp8/32fZ
	qpjl6ptAzgaVxDPzUxmuLUdH1LlRN83snilCzD6YsATrGFjyt2wuuaonKx9WZss2FVrw0GzcsQ7RM
	asvg0ADH2W0AQd7Ism2w6FcueB7PLXV5XDyGk5MlORSYiGegTS20mv78doYzW+BWZF1cvLbJcaN0u
	0Unc1ZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xuO-000000014bq-16m9;
	Tue, 24 Mar 2026 09:18:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xuN-000000014bZ-28nO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 998F9600AC;
	Tue, 24 Mar 2026 09:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8945C19424;
	Tue, 24 Mar 2026 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774343922;
	bh=fTToTCeqKsTMNulzFcYvH6PKgjLpHenJDrE6QA1hWQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIZLB5RD1I4Qk4hu2XjXbcURmOnU3oCku+n5RK3oL7lYxipe8yDa8E1ijlm4oobNM
	 snnfFJO7TOTEKuqMMcJ8MBjQLjaklfhWSNN8RrGcHo9S7bwHodCI7DxQIODvY2YzTd
	 mL1MM8Zyunkp5+ijM0Moy9M59hq1Z22nb5h0FUC7WsC+Ext/NhFh3A2lSGlpoFuXQd
	 L+BKCsrnoJP43Sue6txCkucm/IhOXlf5CNSGmkebXF5MO2yL+iRxPpblG1n9340JqQ
	 UcDqC5WzlkJ1OVHbIKV0zXigNydsO4Wi2TwT37sB21ePdY6KEiPtZOrZPAKybncVA4
	 F+Cl1Tyr5uKZQ==
Date: Tue, 24 Mar 2026 10:18:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Marie Verdun <verdun@hpe.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: Kconfig: Add ARCH_HPE_GSC platform
Message-ID: <20260324-bright-tuna-from-uranus-ce0dd5@quoll>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
 <20260323194223.683487-3-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323194223.683487-3-nick.hawkins@hpe.com>
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

On Mon, Mar 23, 2026 at 02:42:22PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the ARCH_HPE menuconfig group and ARCH_HPE_GSC config for the
> HPE GSC ARM64 BMC SoC.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm64/Kconfig.platforms | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 54eb1d7fd419..4bbc27bb9b7b 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -168,6 +168,29 @@ config ARCH_HISI
>  	help
>  	  This enables support for Hisilicon ARMv8 SoC family
>  
> +

No need for multiple blank lines.

> +menuconfig ARCH_HPE
> +	bool "HPE SoC Support"
> +	help
> +	  This enables support for HPE ARM-based SoC chips used
> +	  on HPE servers.  HPE SoCs serve as the Baseboard
> +	  Management Controller (BMC) providing out-of-band server
> +	  management.
> +
> +if ARCH_HPE
> +
> +config ARCH_HPE_GSC

Sorry, you don't get multiple ARCHs per vendor. Look at this file at
other entries to see how it should be created.

Best regards,
Krzysztof


