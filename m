Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F54CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSwdva4lZfA0DwmksikZDP+x3qY56W4YYVTlzUGHS5I=; b=kG55tBm9oEPlvRkEfdvKIfaVHD
	jt8S9+oOBFKpbbO9ybIscN3vu+gRKGsr826bl5HpYhVzUyf3pqwmyisfk0I5W+fdyhGwEshDi4Soh
	49KufBMAiFBAgRNmFVsWZswdrTCA16lrr5a97ZARbibERmUVEtpeTsgEbhABujdVil6l+RmV1URJt
	4kBOEx0dpQ8SX+T2xs3Dc3T3IP6aEVxpWMj9z2BIKns0GltvB7hEMpjeltalwoQobhQxN3E+0Hp3Y
	/xFzrF/33y/bfksuMqpC5mDF5YUzsMjnqRHCZKztBJkfJC6DYHHcP/Dfn5Upp9eCeM36Rs6TdorG/
	/MVSxO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBDf-00000003j0D-1q6S;
	Wed, 27 May 2026 10:10:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBDc-00000003iyU-36mx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:10:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD03169C;
	Wed, 27 May 2026 03:10:25 -0700 (PDT)
Received: from [10.1.38.169] (e121487-lin.cambridge.arm.com [10.1.38.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FC323F7D8;
	Wed, 27 May 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779876630; bh=jzeLhz2a6Zamxi++A3SvLG1E0JdfhURZoHMnNCLeFzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hkWQ4ZPAAgkQFFXqsQ6BuC+udJPCK3XUNTH2KhHVCjkOE0p/hfdLgNuZ398zv2W3c
	 rn/zSF6GPkto869UyJKMdZhIuA2iUXqflxcP0KrfUCmdUvRDT1y60HIj7d4RVrWcwA
	 hzwWFYZkvfpF61CO6dR3TKefiljovE0gCgJBn6hE=
Message-ID: <8c36ddb9-bc54-4c68-ba34-bb5ac5912427@arm.com>
Date: Wed, 27 May 2026 11:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] KVM: arm64: Don't include <asm/fpsimdmacros.h>
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-2-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260521132556.584676-2-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_031033_002906_E5204128 
X-CRM114-Status: GOOD (  15.00  )
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

On 5/21/26 14:25, Mark Rutland wrote:
> There's no need for hyp/entry.S to include <asm/fpsimdmacros.h>.
> 
> The fpsimd macros have never been used by code in hyp/entry.S, and were
> instead used by code in hyp/fpsimd.S.
> 
> Remove the unnecessary include.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/entry.S | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
> index 11a10d8f5beb2..308100ed25de9 100644
> --- a/arch/arm64/kvm/hyp/entry.S
> +++ b/arch/arm64/kvm/hyp/entry.S
> @@ -8,7 +8,6 @@
>  
>  #include <asm/alternative.h>
>  #include <asm/assembler.h>
> -#include <asm/fpsimdmacros.h>
>  #include <asm/kvm.h>
>  #include <asm/kvm_arm.h>
>  #include <asm/kvm_asm.h>
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

