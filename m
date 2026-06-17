Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE86CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORc6DNzCH93lgPn7FNZP6gSaQhoPVf/lEpdRrdeEA1M=; b=rggIGk5F2f1plwz0Qz+EGWtMps
	LW8RwdkEzE8Zc29iVXQLAzwlkOe5JzKspeH79hIRfchNI75vF7YhDHLrpOwWLxqFkT4Ip8/SW/4cO
	6lh0mVnP5Ax2hS6u6g3ZuV01JwjCMnWzwYN7T2M6099o8xa2FRpLKiy2ZZZKot2xFlFLJvpfPBPcx
	PakUyKDiHfjMvVpFBc09lac19kpWuC0gt6ZPDOdyzcGXNsASfhgOP+e80UsEq8pEWEpRIIHn5MEpU
	tu4HMWJ+sNvP3KBAQjcLjdrBKEGPcHalCkjb+6a5CcmGB+0GbAejYece3E8sbjjTWlnUOD+gCrkSf
	x2rG0JKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZu4Z-000000006ty-2UU7;
	Wed, 17 Jun 2026 17:29:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZu4X-000000006ti-2oRR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:29:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C33D56001D;
	Wed, 17 Jun 2026 17:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C681F000E9;
	Wed, 17 Jun 2026 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781717344;
	bh=ORc6DNzCH93lgPn7FNZP6gSaQhoPVf/lEpdRrdeEA1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IaQIJnXWnFEpQ6m9OyPThpigdPTXhQpQ65EacbncSTq46LAkJPwo5oeMrxpSkdDqN
	 DH220wstLSCjndi4ARBTz0mAWtDdUu54w3QA+71xPGS2i6u5bN+YwYlazkk/AYcwGr
	 fidRW1tKkOVWOUAXb9bzKvm3PQ20GnObT8GKT+Rbymogn+9/g2LT0RCR6TsYszOG6J
	 JME6uReUsk0ufmRaINYWFm/2cqFdSbXh0h2ooOBSN1I/PgrYhFL6FsuWzhJ1wswEKR
	 kYdIFKgnlN5GHcBVOTwg+ZAN75F9EglYc5jgtfhMQQvmKmfhv9WXMJzAeJqVb6VCru
	 YW9BqXBS4/h7w==
Date: Wed, 17 Jun 2026 10:29:03 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Add Fuad Tabba as a reviewer
Message-ID: <ajLZXw3m4QGaYeTa@kernel.org>
References: <20260617131237.2842619-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617131237.2842619-1-tabba@google.com>
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

On Wed, Jun 17, 2026 at 02:12:36PM +0100, Fuad Tabba wrote:
> I have been working on KVM/arm64 for a couple of years, mostly on
> pKVM, and am currently upstreaming protected guest support, with more
> to come later. I already review KVM/arm64 patches more broadly, and
> am happy to continue doing so in an official capacity.
> 
> Add myself to the KVM/arm64 reviewer list.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>

Welcome to the party! Marc, I'm guessing you'll take this as a fix so
Fuad can suffer through reviews ASAP :)

Acked-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc..61eb5dc2bd03 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13991,6 +13991,7 @@ F:	virt/kvm/*
>  KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
>  M:	Marc Zyngier <maz@kernel.org>
>  M:	Oliver Upton <oupton@kernel.org>
> +R:	Fuad Tabba <tabba@google.com>
>  R:	Joey Gouly <joey.gouly@arm.com>
>  R:	Suzuki K Poulose <suzuki.poulose@arm.com>
>  R:	Zenghui Yu <yuzenghui@huawei.com>
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

