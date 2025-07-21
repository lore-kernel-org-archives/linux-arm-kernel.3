Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D11FC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sN8MJ1ihkVUzlJVBBvhi0gCkpUEIkqNwpczuIfgkWY=; b=AbQFtuEYX9tJ/sPugl9pDVob5w
	ARbFeoiIjSw0ab7eavsYDBE8e6RTVVtCmKzoTBZeRdXg5GQZ2Y1bzlINS616bAr69GEDXSXEIXSFL
	xRmonFlDEPyuhm1Qo4Z4pQm5YxSLIZdK2MZdaLBsr5zQ2m9E5AL89QItEsL6yhJt3pG3MpgByRDpM
	Ny2D2I8o/KjNvB5+M1ud3xCc9r/+brUa5Ghfc0X4PSnaonrV74kXVODFlkm1MtbjN3oChILys1FL6
	XUD0mxXy1LSNZzNqf9mwK6pYmqEpuxF2B8DuZ2atCfJ6EmzeNzd0PPERRdPmQ9nz+WNhO0tm4vo7Y
	0dgO5iIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpUm-0000000HEyR-0TLh;
	Mon, 21 Jul 2025 12:19:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udo8A-0000000H09d-0y8T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:52:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E000153B;
	Mon, 21 Jul 2025 03:52:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D72B3F59E;
	Mon, 21 Jul 2025 03:52:21 -0700 (PDT)
Date: Mon, 21 Jul 2025 11:52:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] arm64/Kconfig: add LSUI Kconfig
Message-ID: <aH4b4G2DSxG5FnHb@J2N7QTR9R3>
References: <20250721083618.2743569-1-yeoreum.yun@arm.com>
 <20250721083618.2743569-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721083618.2743569-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_035226_317218_A20FB9C3 
X-CRM114-Status: GOOD (  18.19  )
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

On Mon, Jul 21, 2025 at 09:36:14AM +0100, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
> It's enough to add CONFIG_AS_HAS_LSUI only because the code for LUSI uses

Nit: s/LUSI/LSUI/

> indiviual `.arch_extension` entries.

Nit: s/indiviual/individual/

> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 393d71124f5d..c0beb44ed5b8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2238,6 +2238,15 @@ config ARM64_GCS
>  
>  endmenu # "v9.4 architectural features"
>  
> +config AS_HAS_LSUI
> +	def_bool $(as-instr,.arch_extension lsui)
> +	help
> +	 Unprivileged Load Store is an extension to introduce unprivileged
> +	 variants of load and store instructions so that clearing PSTATE.PAN
> +	 is never required in privileged mode.
> +	 This feature is available with clang version 20 and later and not yet
> +	 supported by gcc.

I don't think we need to describe the feature in detail for the AS_HAS_*
config symbol; I think all we need to say is:

	Supported by LLVM 20 and later, not yet supported by GNU AS.

Otherwise this looks fine.

Mark.

> +
>  config ARM64_SVE
>  	bool "ARM Scalable Vector Extension support"
>  	default y
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 
> 

