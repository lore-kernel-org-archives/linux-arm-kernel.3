Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D954FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 20:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsMO0GXil4Y39VGyYS3yPNRKTq+vkTy7NUC6d/1AgqI=; b=Sz2oXKBXG3RcLmR8MEOu1HNF+P
	R88dW3y8+HmTpv8nj+tKaQTldzTAfF3n1W4TnhVYVERVyiDLxxD8zT4w2Gl7cggchfZQUODPXy+od
	zQryj6tuc1Yn1kw84xXjDvrvOpSRhVoR+l3i52qWQOW9hOzlKAsA+8lFkPSAOL1UPEMdlCOKnzBw3
	GyF9E8NX2IYcpdGVsXDa1WxSvwDNTAuEYnR29Gr77nEmr/GwOd7nkPbpXYzJBkYHDki9lPlRBZwQl
	johEoCF6S5tMkH4RUam+hj0jETyxY4q5PjrzTbFvK/V1ZjspRv8Jt2exbMmi8nMiJTjqU0DRBmwpd
	OJ7vUWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkr2n-0000000F0BU-1Uub;
	Wed, 19 Feb 2025 20:51:45 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkr1J-0000000Ezqq-2FZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 20:50:14 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9445D40E0202;
	Wed, 19 Feb 2025 20:50:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D-KgR2PAqKU0; Wed, 19 Feb 2025 20:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739998206; bh=VsMO0GXil4Y39VGyYS3yPNRKTq+vkTy7NUC6d/1AgqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuA3um8aGktrJ32KgcNJizRtEgCUunE+Gmrari3ssYwlFLPY/NuNsg8hsyP+eQ7Rf
	 mkta1lEX8k2ThRL9bF6sjiro1J8rpqOpV9Q/DrU4K88okgGBpId1SYN+DZSPPuqZqk
	 lYvsE2zZ4YqhXctYCS4VPTNQ3N4SjRtWH9VzQ+qIGBenTIvMSm9iyQ8fkRoCt61YaD
	 JR+ebQkmUi1iUA4IR4DheIl06djzfI2623hNtFYEmKmkGDNRgMg0kDJEiAMnoPOQWc
	 Y9IL5K0PCAIQzJfNVYttfXRPtEBRIe6WdxiozGYQrtZl1NTdhtviOedDv4tUkmQC/D
	 Ei0LQoNIJq6FdtMcxNka8dxHeqBV9+dORJ2ee+vYFPqJi6zotxhkQ5eKpQ6kI0rOYn
	 8zPPdrVMnJ86svwMWX1fSljG8bNZJ76Fedw7NO4mkZcoL4fglzxtkGxW9HU9cai3gD
	 vmGTPjBHcOhrjg21Rd6tUlb1UUmgTrxN6j2t9pkjj4VPFcOAtkli8475l86oufjWhb
	 C/pyDq4Pp5xcT4G9qJja+R3fGl423SPj6j2IQYH23jmNuIn8hzL7S3+Ft1gEbIkOP6
	 BeS6UKU9n83RonNjFfFOPCmVCl+qjVQenS8aY5EHILsa6KN4cql99ojVsC9lgKbo20
	 C+XiLETYHCTntRzas46ZWMeo=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8B87040E0191;
	Wed, 19 Feb 2025 20:49:50 +0000 (UTC)
Date: Wed, 19 Feb 2025 21:49:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com, baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	lenb@kernel.org, tony.luck@intel.com, yazen.ghannam@amd.com,
	Tyler Baicar <baicar@os.amperecomputing.com>
Subject: Re: [PATCH v3 1/5] ACPI/RAS/AEST: Initial AEST driver
Message-ID: <20250219204945.GRZ7ZD6a4tEBboxYrH@fat_crate.local>
References: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
 <20250115084228.107573-2-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115084228.107573-2-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_125013_734662_FF2D0F7C 
X-CRM114-Status: GOOD (  14.45  )
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

Just some cursory review...

On Wed, Jan 15, 2025 at 04:42:24PM +0800, Ruidong Tian wrote:
> Add support for parsing the ARM Error Source Table and basic handling of
> errors reported through both memory mapped and system register interfaces.
> 
> Assume system register interfaces are only registered with private
> peripheral interrupts (PPIs); otherwise there is no guarantee the
> core handling the error is the core which took the error and has the
> syndrome info in its system registers.
> 
> In kernel-first mode, all configuration is controlled by kernel, include
> CE ce_threshold and interrupt enable/disable.
> 
> All detected errors will be processed as follow:
>   - CE, DE: use a workqueue to log this hare errors.
>   - UER, UEO: log it and call memory_failun workquee.
>   - UC, UEU: panic in irq context.


Use a spellchecker for all your text.

In addition, use AI to check your English formulations.

> Signed-off-by: Tyler Baicar <baicar@os.amperecomputing.com>
> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>

Who's the author: Tyler or you?

That's denoted with the From: field.

Make sure you go over Documentation/process/submitting-patches.rst for basic
mistakes.

> ---
>  MAINTAINERS                  |  10 +
>  arch/arm64/include/asm/ras.h |  95 ++++
>  drivers/acpi/arm64/Kconfig   |  11 +
>  drivers/acpi/arm64/Makefile  |   1 +
>  drivers/acpi/arm64/aest.c    | 335 ++++++++++++
>  drivers/acpi/arm64/init.c    |   2 +
>  drivers/acpi/arm64/init.h    |   1 +
>  drivers/ras/Kconfig          |   1 +
>  drivers/ras/Makefile         |   1 +
>  drivers/ras/aest/Kconfig     |  17 +
>  drivers/ras/aest/Makefile    |   5 +
>  drivers/ras/aest/aest-core.c | 976 +++++++++++++++++++++++++++++++++++
>  drivers/ras/aest/aest.h      | 323 ++++++++++++
>  include/linux/acpi_aest.h    |  68 +++
>  include/linux/cpuhotplug.h   |   1 +
>  include/linux/ras.h          |   8 +
>  16 files changed, 1855 insertions(+)

This patch is huuge and unreviewable: split it.

Also, I see issues like:

check_for_todos: WARNING: drivers/ras/aest/aest-core.c:207: Hunk contains unfinished TODO:
+               /* TODO: translate Logical Addresses to System Physical Addresses */


check_for_todos: WARNING: drivers/ras/aest/aest-core.c:446: Hunk contains unfinished TODO:
+       //TODO: Support 32B CEC threshold.

A TODO tells me that patch is not ready for upstream.

Also, get rid of all // comments in drivers/ras/ and use normal /* style.

Enough for now.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

