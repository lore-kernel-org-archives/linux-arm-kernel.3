Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8ECC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw9famE/cdD1oKyq0RADQbeI52kOsmystMlqLu/eKYo=; b=fwEwObN+SgxTPmIaRvWoKud2V+
	IsjtwTWVMOjwW30q3dgCdx3hiEC0dhi+V8dCJbc1rR9WaB4EKiH9nbqjDyMqDPahWpOONJRNZdnAR
	ZuAA/n7Cy7/pniCope6XEJtc7qrJxenMPWQO6MQQBXoOhqc/NwzQcMx88X3W8SSDEY4szViLaTDh4
	LGCQj6ydYsb1BPm98YUsPNVrFiHkY9mEpj4If3ODrt5UA4/R20SMGyewwE3bmdA5aLQVKQR96J4nk
	3W8H56BXvrU6Bm8WFZ6vNQY0pvU/H28xmVsHDDi7HLtu8QBMeJSAPCPISe9aU3G7EGecZ58RD4peZ
	pttQdLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiny-0000000Dk2j-2Mp1;
	Tue, 11 Aug 2026 09:29:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinn-0000000Djnd-2ZU7;
	Tue, 11 Aug 2026 09:29:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ECE244391F;
	Tue, 11 Aug 2026 09:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA521F01566;
	Tue, 11 Aug 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786440582;
	bh=Yw9famE/cdD1oKyq0RADQbeI52kOsmystMlqLu/eKYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mLHMCmgkIiSnRZJ6x6zmy5eJpjxP/wYnjduhbgS7UpQFXsqqtRdW+sAOWRlM/6SWo
	 rl0xVyvjATCKz7U0W8FtZQV1TCaxjiSzJIHwGa6DJ35TvnDbXmfJNkpjjDNexvx2gY
	 AmkW6DA8dAXbevgQDfpsxXJffqWB3iEx0v5mT3n22QNsZSP8wdDG397wipLf1csmuT
	 wr01WFy98Sqh0cj8pEUETHOmaVpLycUso1NrYKVl+6zGkuRsLxwqXcs6zuQWg/FVWS
	 qxm0LK/jQSi6EeGveT11xgo2P9h0+8Y5FFP86s57Vq6+zfrC/EnJAF2tcHKN/9E4l7
	 gcpXlSnrQi/bA==
Date: Tue, 11 Aug 2026 10:29:35 +0100
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Peixoto <jpeixoto@osyx.tech>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jose@osyx.tech, davidmcerdeira@osyx.tech,
	corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	linux@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] virt: bao: add I/O dispatcher driver
Message-ID: <anrrf0J9C9zSrAgF@willie-the-truck>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
 <2190b6e083a2f2e0485b27e5e203647189bb1d1d.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2190b6e083a2f2e0485b27e5e203647189bb1d1d.1786010512.git.jpeixoto@osyx.tech>
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

On Fri, Aug 07, 2026 at 08:39:31AM +0100, João Peixoto wrote:
> Add the Bao I/O dispatcher, used by backend VMs to service I/O on behalf
> of frontend guests. It bridges Bao's Remote I/O mechanism to userspace
> VirtIO backend device models.
> 
> Each backend device has a contiguous shared-memory region for exchanging
> I/O buffers with its frontend and an interrupt the hypervisor uses to
> signal pending requests. Userspace drives the dispatcher through a set of
> ioctls on a misc character device.
> 
> Co-developed-by: José Martins <jose@osyx.tech>
> Signed-off-by: José Martins <jose@osyx.tech>
> Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
> Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
> Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
> ---
> diff --git a/arch/arm64/include/asm/bao.h b/arch/arm64/include/asm/bao.h
> index ab9b283168e3..1dc09a2c261b 100644
> --- a/arch/arm64/include/asm/bao.h
> +++ b/arch/arm64/include/asm/bao.h
> @@ -14,6 +14,7 @@
>  #define __ASM_ARM64_BAO_H
>  
>  #include <linux/arm-smccc.h>
> +#include <linux/bao.h>
>  
>  static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>  						   unsigned long ipcshmem_id)
> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>  	return res.a0;
>  }
>  
> +static inline unsigned long
> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
> +{
> +	register int x0 asm("x0") =
> +		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
> +				   ARM_SMCCC_OWNER_VENDOR_HYP, BAO_REMIO_HYPERCALL_ID);
> +	register u64 x1 asm("x1") = ctx->dm_id;
> +	register u64 x2 asm("x2") = ctx->addr;
> +	register u64 x3 asm("x3") = ctx->op;
> +	register u64 x4 asm("x4") = ctx->value;
> +	register u64 x5 asm("x5") = ctx->request_id;
> +	register u64 x6 asm("x6") = 0;
> +
> +	asm volatile("hvc 0\n\t"
> +		     : "=r"(x0), "=r"(x1), "=r"(x2), "=r"(x3), "=r"(x4),
> +		       "=r"(x5), "=r"(x6)
> +		     : "r"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x4), "r"(x5)
> +		     : "memory");
> +
> +	ctx->addr = x1;
> +	ctx->op = x2;
> +	ctx->value = x3;
> +	ctx->access_width = x4;
> +	ctx->request_id = x5;
> +	ctx->npend_req = x6;
> +
> +	return x0;
> +}

Why aren't you using SMCCC for this? You should be able to use that (like
you did for bao_ipcshmem_hypercall()) and then there would be no need to
add any code to arch/arm64/.

Will

