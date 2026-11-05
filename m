Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F83606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zhtk36gE;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=GF7ywrzT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iu+wu+Zx/NtlCLRN5PCs/YxG7yDVrWiVNMra53EYeJw=; b=zhtk36gEzGUWsCZBgI+oNi2uJ7
	eUv5s73c15kqyofBovbh/m9eEsNmbzog8dE/qaOQ+S/eXYkEqR/odAAKjVit/nyiY6QjRpKzG8GSb
	tN6Zv/xqgz7qhbXcxYiej5YbVU8yi8GyX0srmKlD1kTYtyk6XOpHGALUHcs3Mb8K5GL7fsJaiag9t
	/SQLtcCHyoMLt/cj/vHh4dFc1AsKxTrBQbvY0/p5BncDxXa55IU8RxeYpgGJzQXir/NuvL7NRVOB/
	NTV5IujAGDzUOP0hBStxTnoNAdkSk6zP4c0pDFJ8C3RzBX0VrFQswiE7BBpVrjRfzjLcNrr2eAM5H
	tnMcYCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpX3-00000007peX-0PC6;
	Thu, 05 Nov 2026 04:57:01 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpX0-00000007pdv-0ZVW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:56:59 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EBCA740E0299;
	Thu,  5 Nov 2026 04:56:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wsGM9sTHQm2m; Thu,  5 Nov 2026 04:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793854612; bh=iu+wu+Zx/NtlCLRN5PCs/YxG7yDVrWiVNMra53EYeJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GF7ywrzTQZ6wEHZIFfdeWnirhkOvcOJFxiVrxYiRH0aY05M7xKyHS0sGBRA8n2s2M
	 dJd4WhV9WzQ7ochMxOUgRrEz5y0ZEpAJZEyg5fhjTFjQsbvQdbXiBsIDpPU+Z5SXwc
	 aX4fZUf1z9evJkNy1kfx+rK0gwfdlcYzYIkb6DzfqsK50kJZkmucFgt8Ds1QHsO7Ei
	 8HMFrbUKv9L3ljhBY6cGmdD1Uxbpofv7JdmHxvynTAT8c7WXMNnOPcxnHLvkSj4FGk
	 v1VMnL4Ubm+nit/kNnQRQ1eQn2Oa25hVosc1n4YQpXtCPYE07TuCORD1JdMEZRBva7
	 3/TbnXvQPR0LNPKgbOfsXm/X7oaLui5ok/ZO8UL1RM0pG7PnvI3cKS/jwReMNom5rB
	 SBNZB38/Te2XhJsQXjulGCVr2I2JhhMLoSUqFEtVPVf9fzTIX2E6WN33ScmJA78vMF
	 AzwexkNCTIW8c4d9d1R5GOAFi/mqLSCtnlfWONXnSaR7gbMmHJ4mZO1z1tXJk1vnjS
	 M4rJmM2CqEvRT5MdYzqeQBAZItq6Wd4AEqnlJlr+Ec9rIIgKDDQhvOmLiXmorhl+yx
	 khIdhO8MU5KywJeSCsJtkXM7qOc8DcSP5jM7bm/ejk9B0fV4bc9s7cM0DJRxU59RxO
	 C648Rd/lSWIroYXKWCf2ENgk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DAAA240E0184;
	Thu,  5 Nov 2026 04:56:37 +0000 (UTC)
Date: Wed, 4 Nov 2026 20:56:35 -0800
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v5 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Message-ID: <20261105045635.GBauwMg0oqd2tVPH-4@fat_crate.local>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_205658_367667_79BA4023 
X-CRM114-Status: GOOD (  17.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 07, 2026 at 02:13:23PM +0800, Ryan Chen wrote:
> The driver instantiates its own regmap purely as an MMIO wrapper: it has
> no register cache, uses custom .reg_read()/.reg_write() callbacks, and is
> not shared as a syscon with other drivers. So it brings nothing here
> beyond the spinlock that regmap takes around each access when fast_io is
> set.
> 
> Drop the regmap and access the registers directly with readl()/writel()
> under an explicit raw spinlock, held across the whole read-modify-write so
> the controller is unlocked once around the grouped writes rather than on
> every register write.
> 
> Annotate the register base with __guarded_by() so that, under
> CONFIG_WARN_CONTEXT_ANALYSIS, the compiler checks at build time that every
> hardware register access is performed while holding the lock.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> ---
> Changes in v2:
> - Take the register lock with the irqsave variant in init_csrows() and in
>   aspeed_probe(); the interrupt handler takes the same lock in hardirq
>   context.
> - Move the dev_dbg() of the interrupt status register out of the
>   raw_spinlock critical section in the interrupt handler.
> - Opt aspeed_edac.o into context analysis in drivers/edac/Makefile, so
>   that the __guarded_by() annotation is actually checked.
> - Note in the interrupt handler that the counter and interrupt flag
>   fields are read-only, so writing back the read value is harmless.
> ---
>  drivers/edac/Makefile      |   1 +
>  drivers/edac/aspeed_edac.c | 131 +++++++++++++++++----------------------------
>  2 files changed, 51 insertions(+), 81 deletions(-)

https://lore.kernel.org/r/sashiko-outbox-162667@kernel.org

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

