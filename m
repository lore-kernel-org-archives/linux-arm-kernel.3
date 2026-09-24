Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEADC9831D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QnLQKdVs59WnyvZJejYLL5JWNbJS94oGp7Pxe0iKxI=; b=RKnOgMeeYjC1MeH/zNY00gFHLz
	jZ42mxsCCBUBhz52xlqf6itQ1Jf3rx8g60390YYCoLb+q8xTq2F8Okl86Aea754qTRyYr8kd+RcWd
	41JRtlMlOrSz2egBFHCqwah++PkuabMLcLvlaKUoYE62C4M8fJ9Pz2a+6FOdZIepfc3awlk38hCpa
	IaLWaAadCktQTL7dPRcpaaBAL457G7ohBxmQbxKLPj5pCRXK4dKz5Qjw1sJzjrk32bakBwgKc8v5D
	lj8uSPkfBIyam5Z5wtaQ2kAQEloWqWGxR5xjThtGROxx31t43weCoTD2Ht+7KvoE7o2xVjEu0Xrqt
	PmxJ51uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iyb-0000000B1U6-2RvY;
	Thu, 24 Sep 2026 12:55:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iyZ-0000000B1Sx-0ZPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:55:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8FDE152B;
	Thu, 24 Sep 2026 05:54:54 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436243F86C;
	Thu, 24 Sep 2026 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790254498; bh=aWV7PEMYjMS6Fa0gt8KRQnHPb2wOFgC/5kQomSEy/t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sE7U6I9hopp3qF+bsG556752RndTtqc79LGscXR6qhlL0GRwOUSNviMC2mBGiBnxm
	 1PP6n5OarQPMDA4H1vCHAhAezpby9eImipwm8AeQn3bpBtZe59x4oZfAVUx9q3c+Zk
	 +USydU570tjM5UbJAgsPRCH/K7czyiGjd3bRO29o=
Date: Thu, 24 Sep 2026 13:54:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andreas Grapentin <gra@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: Use proper include variant
Message-ID: <arUdntLjLT6BD6zJ@J2N7QTR9R3>
References: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_055459_224694_66CAD5D1 
X-CRM114-Status: GOOD (  22.76  )
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

On Thu, Sep 24, 2026 at 12:57:18PM +0200, Steffen Eiden wrote:
> Use <> for including the sysreg header as it is not discoverable from
> the current directory.
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

I'm surprised that happens to work today, but evidently it does.

Mark.

> ---
> This is just a spin off from [1]. There is no in-series dependency for
> this patch and it fixes a minor issue. Using " for the include file does
> not break anything (now) but it is not right as well. For [1] we need
> this to correctly transform the includes to a new path for the
> s390-generated version of this file.
> 
> 	Steffen
> 
> [1] https://lore.kernel.org/all/20260918133107.1042730-1-seiden@linux.ibm.com/
> ---
>  arch/arm64/include/asm/sysreg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 7aa08d59d494..4bfdac9401bd 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -173,7 +173,7 @@
>   * come from here. The header relies on the definition of sys_reg()
>   * earlier in this file.
>   */
> -#include "asm/sysreg-defs.h"
> +#include <asm/sysreg-defs.h>
>  
>  /*
>   * System registers, organised loosely by encoding but grouped together
> 
> 
> 

