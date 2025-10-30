Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EB5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6t4nnSydPEiFFqxYgE96bA31PGu3ufP14mUFZTEjic=; b=4JLQ39GAG2pANO87nksfvpGhXw
	KW9WwG/NKUw2hYKwqNlL/a73zUs1JYUe/b1USUTNGpeEHxmSbVeT+CWN2kjVGzUgjE48cnCyZqAk8
	A2rnq4Pyru3d8Y+m+yYu1TVv6xHN+Dnrtv7kwcusRRd0K3geFvfp1ViADqVeI1KqZTdApc1Q2l2wA
	zl6GScuvUzdWlwUHeLuVdo/qz4khLJ7XSKw/GDwtd7HJkVH0lyJpizx5dYlO+h8L19qTL60sE4KWS
	pKbeeXPsy7GUKbaEjzlGqUleIAaabtxDsyXhja2au6MMx1RamO0xpwGP+6nOxk9aQxIO5KHUGcpa2
	3kC1EQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETxB-00000004KDy-3KyP;
	Thu, 30 Oct 2025 14:48:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETxA-00000004KDr-07g6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7457560216;
	Thu, 30 Oct 2025 14:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80093C4CEF8;
	Thu, 30 Oct 2025 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761835719;
	bh=3vowx96YOzVelswYWJ5+Sm7l2nM8OpWtXSk81n0c6GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uc/uCxaLOeJcIdSvuMhrWDdXXKMFOIxhe446YwqNUbSDsX8xbaxgm4B/ZFQxNPsFR
	 yEhtW1SzturSwVKEMhy19HOtH2TAKnS4X0vWcX1WDwdhkbmD8Zl4liW+euc2O28KAf
	 cf5jz7So3r07dp/I0nNNJh/Bi66WTSfwXT5OkQ4nuqp5EZEnSJ2QRCjg0rRKcYMl1C
	 /EEfmLzvaBEFqPMi+BnFcfWd84gRQ4TnlnKhUDGYbOyPkwFLoQBHb9rWZrQTlCxC2a
	 Coy76vZYv4qH7pI6/HcN2kTQY/MHGyYcQUz+wViDJS579N1LmMVf6sGM0uzM+SQULf
	 a9FL3xakqE8QA==
Date: Thu, 30 Oct 2025 14:48:34 +0000
From: Will Deacon <will@kernel.org>
To: shechenglong <shechenglong@xfusion.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stone.xulei@xfusion.com, chenjialong@xfusion.com,
	yuxiating@xfusion.com
Subject: Re: [PATCH v2 1/2] cpu:Remove the print when the
 CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY Kconfig option is disabled.
Message-ID: <aQN6wlpzSx9kbGqI@willie-the-truck>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20251029034554.1839-1-shechenglong@xfusion.com>
 <20251029034554.1839-2-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029034554.1839-2-shechenglong@xfusion.com>
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

On Wed, Oct 29, 2025 at 11:45:53AM +0800, shechenglong wrote:
> Following the pattern established with other Spectre mitigations,
> do not prints a message when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY
> Kconfig option is disabled.
> 
> Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250918064907.1832-1-shechenglong@xfusion.com/
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: shechenglong <shechenglong@xfusion.com>
> ---
>  arch/arm64/kernel/proton-pack.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index f9a32dfde006..d833b7c1bba8 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -1042,8 +1042,6 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
> 
>         if (arm64_get_spectre_v2_state() == SPECTRE_VULNERABLE) {
>                 /* No point mitigating Spectre-BHB alone. */
> -       } else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
> -               pr_info_once("spectre-bhb mitigation disabled by compile time option\n");
>         } else if (cpu_mitigations_off() || __nospectre_bhb) {
>                 pr_info_once("spectre-bhb mitigation disabled by command line option\n");
>         } else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {

I'm not able to apply this -- I think you've somehow converted some tabs
to spaces in the whitespace.

Please can you fix that and send a v3?

Will

