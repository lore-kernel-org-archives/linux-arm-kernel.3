Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693FBCD0400
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEtqyhHFlJ1WvLqPuQrEw0wInhE9y38YMy47CO62mtg=; b=16jI36dVrbo5yBeVkq1TsxFXr8
	3tSD0rrkxLSKmBGXBtOWArdtG9eMtgJvbSVN5VSUsOZIQt+Vjt6zqrDtRLKN7cC/aCS4SRSCjPavD
	w7RfNSxE0quS5wg1friZB93cuyzlpDmScaKW685XaY7uPJabVkfwuQxPy9DZj843R+3tYt7T4QcgY
	b/EFtz+EcnKJoxILBNq4Q2KnVcnQ7lL/fucPMXI5jBhEJqJEggL9ipMT+ikRb/HteLl24HfmRlFJ9
	EnXV5JXDdLttiNPKgZtdEMg1Z/SLlDHlfAOksw7EPHAdVXauxAyDH99Y2Z2I5jZ2QtYVisl1P+PTy
	dfWh5/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrXO-0000000C4yq-1R9r;
	Mon, 05 Jan 2026 20:50:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrXL-0000000C4yE-1YOC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A892C43D93;
	Mon,  5 Jan 2026 20:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E772C116D0;
	Mon,  5 Jan 2026 20:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767646246;
	bh=StZ+laIIWUpzjNiZmWa66KU0AI8ALEKo0e8HnuDDwLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUjV/ZZ50vLDuim+vLOZ2fezLm8yKeLgcIqy+ugbNGlKCUo6pIbJ2NEXGDOXukhnF
	 fpoH5c20r9DPSBEdlpbjMu9fUkH9tEGYSxFRceaayEmDD9T+xidm7kyLMc6B5ydXBM
	 joCYfYOaDtVQQI5aaEtNPzqPOyx4ygksZrjVQWvjok4EwD8lKKzMkMBujO0aQhXf6j
	 3hySEkp4lQx46+sOADoB4bFMVDoQnKFKX1O30La9013C9mcY3WNA+rYwg2CBOS5eqS
	 Q+i0FsFOahdzt6VQOONeD8g8DEifMu9ec2BN1iyZz5PgSKycj5ndXVHwo1WhCfJcsH
	 +vJBW13pocZOw==
Date: Mon, 5 Jan 2026 20:50:41 +0000
From: Will Deacon <will@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Kees Cook <kees@kernel.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, maz@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: deprecate redundant ARM64_USE_LSE_ATOMICS
Message-ID: <aVwkIYMyoe7OpeUh@willie-the-truck>
References: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_125047_446999_B111A5C5 
X-CRM114-Status: GOOD (  25.43  )
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

[+Marc]

On Tue, Dec 23, 2025 at 12:07:30PM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Currently, the config options ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS
> are equivalent, i.e., ARM64_LSE_ATOMICS is true if and only if
> ARM64_USE_LSE_ATOMICS is true.
> 
> Prior to commit 395af861377d ("arm64: Move the LSE gas support detection to
> Kconfig")---included in v5.6-rc1---only the config option ARM64_LSE_ATOMICS
> was defined, and the check for gas support was done in the Makefile. This
> mentioned commit then introduces the config option ARM64_USE_LSE_ATOMICS to
> be the promptable option, and changes the semantics of ARM64_LSE_ATOMICS to
> check for the gas support.
> 
> Note that there is then some minor refactoring in commit 2decad92f473
> ("arm64: mte: Ensure TIF_MTE_ASYNC_FAULT is set atomically"), putting this
> gas support check into its own config option AS_HAS_LSE_ATOMICS, but the
> logic remains the same. Since every binutils version defined suitable for
> kernel compilation then eventually included the required support, the
> config option AS_HAS_LSE_ATOMICS and the dependency was dropped with
> commit 2555d4c68720 ("arm64: drop binutils version checks"). This then
> makes ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS equivalent. Hence, one
> of the two config options can be dropped now.
> 
> Considerations for the decision which config option to drop:
> 
>   - ARM64_USE_LSE_ATOMICS is promptable by the user since its introduction
>     in 2020. So there might be some Kconfig fragments that define this
>     config option and expect that this then implies ARM64_LSE_ATOMICS to be
>     set. However, within the kernel tree, there is no existing config file
>     referring to that option. So, it is unlikely to be widely used.
>   - ARM64_LSE_ATOMICS is used in nine places within the arm64 directory in
>     the current kernel tree.
>   - ARM64_USE_LSE_ATOMICS is the only config option that contains the infix
>     string _USE_ to enable support and use of an arm64 architectural
>     feature. However, there is not a very stringent and consistent naming
>     convention for Kconfig options throughout the kernel tree anyway.
>   - The use of the transitional attribute allows to simplify transitioning
>     to a different Kconfig symbol name, but also adds some intermediate
>     definition to be removed later eventually.
> 
> After thoughtful consideration, keep ARM_LSE_ATOMICS and remove
> ARM64_USE_LSE_ATOMICS in a two-step approach, first deprecate
> ARM64_USE_LSE_ATOMICS with the transitional attribute here and then plan
> to completely remove it in two or three years with a further dedicated
> commit then.

Marc was talking about removing ARM64_LSE_ATOMICS entirely the other day
after it bit him with a KVM change. If all supported assemblers understand
the LSE instructions, let's just do that?

Will

