Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8F7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvoJgb1rSDJx5ivvSSrj92M236sh7CndDsijhFLoD1w=; b=xzQHZxLaMSjCcezPsq8qTozEGx
	S91Vi/Iz4Q07I8GIJktrPEAlSDf9FWNxKwBMGb/NOw9YOwvFLTs+chz0FAMAi2unQfVpLWDt38I2N
	+HMV9qx8jnspkPGs60tsyu3tApRtu2y4yP65K/z6zqejUT2EgS2U7Ww/0p9SO4tJ+gLR+CaFWLpjd
	KEVWjuCJHG+Zi0KDSO3vk4ENtV4VRriOXOFEiC5fkR6tMF+i+M2NB5UorA9Z8DtkFiEk/58qkrx+K
	PTdsZDgar60mNtIwhItm0XtT0iKmDhTA6/9l46HQ6py+3Wh3RFy3XvoXPIc2V6jHpemr7aevNL7pZ
	RRzop3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVFc-0000000AOkS-0Cgy;
	Thu, 13 Feb 2025 09:11:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV7Y-0000000ANCH-19lz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 410F55C4DB7;
	Thu, 13 Feb 2025 09:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E39C4CED1;
	Thu, 13 Feb 2025 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739437375;
	bh=qJUGS5aMNlI3ACxeGXL55sT5mPp48KgzgEP7Ar9ldlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3iWvDypjZL41SnTlfB9/DhnZgwBi8RYF8WEjUJ5LBFgxYRxWYhblp0osEcb8Gdv9
	 nB/Lpa7WN788G5cy8ooLGj+rxipdcx3BUftPR2DUx/73mV1v12FOKUUSXer4eGJt7d
	 kv0qYZSpVKvdqD0lmfGZHsakRBEspK7XZ8qRK8THDYKTwW0g+up2uhMuwN06UXNs16
	 4XpykJJ5yb4LpWMgBLSJR4n5hO5A3T1dnB7qTu3jwG0YjoaV9STafcatIFkbXnNu9g
	 6h/KfB1GHjjArGzXGeYPWIruSJ7LlgLRXsjsYFVmV6Wg6XJLdkKoSux1AuFM0q1/cE
	 +eXTpQNw0+pWA==
Date: Thu, 13 Feb 2025 10:02:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 07/10] arm64: Kconfig: expand STM32 Armv8 SoC with
 STM32MP21 SoCs family
Message-ID: <20250213-polite-spiked-dingo-ce0f3a@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-7-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-7-e8ef1e666c5e@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_010256_355358_033FA9ED 
X-CRM114-Status: GOOD (  13.39  )
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

On Mon, Feb 10, 2025 at 04:21:01PM +0100, Amelie Delaunay wrote:
> Expand config ARCH_STM32 with the new STM32MP21 SoCs family which is
> composed of STM32MP211, STM32MP213 and STM32MP215 SoCs.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm64/Kconfig.platforms | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 844a39620cfea8bfc031a545d85e33894ef20994..f788dbc09c9eb6f5801758ccf6b0ffe50a96090e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -325,6 +325,8 @@ config ARCH_STM32
>  			- STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>  		- STM32MP23:
>  			- STM32MP231, STM32MP233, STM32MP235.
> +		- STM32MP21:

Squash it with previous patch and keep some sort of order.

> +			- STM32MP211, STM32MP213, STM32MP215.
>  
>  config ARCH_SYNQUACER
>  	bool "Socionext SynQuacer SoC Family"
> 
> -- 
> 2.25.1
> 

