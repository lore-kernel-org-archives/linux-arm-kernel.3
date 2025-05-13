Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A36C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBHabA+dsKPkDBhTVjTBudn+6NZzF9i93maXvsPuPYA=; b=QCxJdHRVQ8qITO7h59p1f28cqh
	sZ1E9ejnRv0x9QrUfN3gDx2zuAt22zFyJ6T1cK3Xh0YsJWp4jVzlt1xGmhKGgKjJSQouEe5x/XfkR
	hg5m/nFHB2U8CyY/EwIsPtu5b6i0xT1M6cOA2UUd66dpcoucd8aCkUVRGqBoejX+PuGSPL4ba8kIS
	hNZYcIlKJBK3iSRRSbs6tYTwiAdO2FQHWmalTN3hiATtst+crMZKTMcACnYuMR+DFwIEaXHa/sCny
	jtTXg4P2o9IN7UhS8z5gkA3POFvlvmWqs67rXm8U3D/vHiIfbkRd+CI54uALz/S5urcydX1OQSR4c
	pE0k1yTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqDE-0000000CZ4c-169a;
	Tue, 13 May 2025 14:02:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqAi-0000000CYiG-02Tb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:59:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72C44168F;
	Tue, 13 May 2025 06:59:40 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B27C3F5A1;
	Tue, 13 May 2025 06:59:50 -0700 (PDT)
Date: Tue, 13 May 2025 14:59:47 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Update comment regarding values in __boot_cpu_mode
Message-ID: <aCNQU74Qx2Cb4L9j@e133380.arm.com>
References: <20250513124525.677736-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513124525.677736-1-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_065952_107264_62AC4F8F 
X-CRM114-Status: GOOD (  19.46  )
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

Hi,

On Tue, May 13, 2025 at 01:45:25PM +0100, Ben Horgan wrote:
> The values stored in __boot_cpu_mode were changed without updating the
> comment. Rectify that.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

FWIW,

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

(I find the actual __boot_cpu_mode[] behaviour a bit of a puzzle, but
the updated comment looks good.)

Cheers
---Dave

> ---
> 
> The discrepancy was introduced in commit 828e9834e9a5 ("arm64: head:
> create a new function for setting the boot_cpu_mode flag").
> 
>  arch/arm64/include/asm/virt.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
> index ebf4a9f943ed..aa280f356b96 100644
> --- a/arch/arm64/include/asm/virt.h
> +++ b/arch/arm64/include/asm/virt.h
> @@ -67,7 +67,8 @@
>   * __boot_cpu_mode records what mode CPUs were booted in.
>   * A correctly-implemented bootloader must start all CPUs in the same mode:
>   * In this case, both 32bit halves of __boot_cpu_mode will contain the
> - * same value (either 0 if booted in EL1, BOOT_CPU_MODE_EL2 if booted in EL2).
> + * same value (either BOOT_CPU_MODE_EL1 if booted in EL1, BOOT_CPU_MODE_EL2 if
> + * booted in EL2).
>   *
>   * Should the bootloader fail to do this, the two values will be different.
>   * This allows the kernel to flag an error when the secondaries have come up.
> -- 
> 2.43.0
> 
> 

