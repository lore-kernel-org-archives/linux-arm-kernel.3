Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF36BCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izn8tD3knmQKpDmvYpbCFYhQmv4GOxqzLxWz7ITIx/8=; b=FLpj9qY47ghZ1Jd6ASkIixuaKT
	XomBpG0iSOH6mrAKwmsUIPwiyvK6jRyNtFVawhnFuQdKR8RdeqYK4HOj7Rqh41srxGvF3SrWC8gMp
	yRiwpHD9Yhs4DryxJEZLCKZMux6rEjN7sHQfmrlImyiCnhJtNyKdKHBLD0PN86gbsHZswYUyj4OrS
	/31vlv5k8GkRoyqnJ+zk5OsE/x0EwKg6uXGeFqfzqJM/cB9mPNlU1Cj77uKWB5yERqH8eNlhLLabj
	xkldnLXzR3o+/2JRaCJU1Xt+a2nuhKvAqal0MTeUdmvc1XLgG05NwFaOkWs2LzvuPVnb7qEoQV+S9
	+dXwpmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJJ9-00000001R5v-2sjg;
	Tue, 19 May 2026 12:12:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJJ7-00000001R5d-3hWW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07B3360126;
	Tue, 19 May 2026 12:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7746C2BCB3;
	Tue, 19 May 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779192740;
	bh=PY5v9q/zU3mQBasZr1wGDLSHhhHyMsH/H4J8jsOMV/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eH/4ZK0ItGFIp5KTHrHZq/REKO6GB9Sux38c4ea+zbgPmQvcxYgc6VTtueF0AOhNn
	 TReAVlu3CvekNewVXsGQs9jaHKysqgbDzeOmW+2X3FqXGTI1HwCEgvJsUI2ziAHpqL
	 2ygQBUz73e5yAertQCMXm8FYveR1irULhcCPx0rNd4QOayn4IvS7Fv+2UfQqPwaurP
	 MYTCeoILtx/j1cFZlPzwZqWoe31kQARTi5vwHmH8Vjx2JJ0OBGJ/hTLBDw6M6jkr2M
	 HKBcWOZWdM/7VVHgqQTaedsBO6omdZlFO7Ew7qoWhXMxDJo/8UwJGI11UrXKXRT0k7
	 yNy+23BqM9Yzw==
Date: Tue, 19 May 2026 13:12:16 +0100
From: Will Deacon <will@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM64: remove unnecessary architecture-specific
 <asm/device.h>
Message-ID: <agxToDJ6y_ciI1Oj@willie-the-truck>
References: <20260517025348.96906-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517025348.96906-1-enelsonmoore@gmail.com>
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

On Sat, May 16, 2026 at 07:53:42PM -0700, Ethan Nelson-Moore wrote:
> arch/arm64/include/asm/device.h is identical to
> include/asm-generic/device.h, and therefore the ARM64-specific version
> is unnecessary. Remove it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/arm64/include/asm/device.h | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/device.h
> 
> diff --git a/arch/arm64/include/asm/device.h b/arch/arm64/include/asm/device.h
> deleted file mode 100644
> index 996498751318..000000000000
> --- a/arch/arm64/include/asm/device.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2012 ARM Ltd.
> - */
> -#ifndef __ASM_DEVICE_H
> -#define __ASM_DEVICE_H
> -
> -struct dev_archdata {
> -};
> -
> -struct pdev_archdata {
> -};
> -
> -#endif

Do we need to add a generic-y entry to arch/arm64/include/asm/Kbuild
so that we pick up the asm-generic variant?

Will

