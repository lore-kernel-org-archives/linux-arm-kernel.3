Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp5Z9iTH+ugecgyteyY+wMw9FDVhLK20NW464bjciOY=; b=ZXWm4JRfKjY7phVwzDVwOzxzVK
	p048vYvdwmuhpM99Ojw4sx7ap0g35fzlrpzjVlmrYP44qd8dGKeWMAlIUy3rOHVPyMcln67ITka1d
	TdJlC9PdLJXzkTASOyB1+lRNZSQADcTiibHjLGE7Od/r5CFw8KKuRh52Rk5fzGfvk1tmKn3xO9ylU
	LWiODCuobuRsEbkHx3S37eBa2vWrqUQDpqiCC9qWc8xjt2EtoOWti+f63JfJntwt4UkzJ6KpukGFN
	N5CabJGKvLKDslBeprtPMDXYYcOfu9jDl7sFVRaTJFR7tKao0OyHMUFrGFK0UYjPVmpI6U+JNw2VJ
	Z2yXzwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufERJ-00000009Qig-3Oai;
	Fri, 25 Jul 2025 09:10:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEOq-00000009QVl-1G6h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lp5Z9iTH+ugecgyteyY+wMw9FDVhLK20NW464bjciOY=; b=U7Ux1+UTOOBLVFWeNvZ1LYBq4G
	sS9UgAN7zUZWKWn4drP3pitmFQmIx9UmmoQDDvzbvEoUr731eiz7C+b8wIZItA/QEA9jnJtMpZa3z
	9lNW4USW6c89aICyrodbuMP7SYh0Z5oPwJBgzupGZ9aMq35XWQNfHt4nyOZm5ZRUb98i2VnzqS1cM
	dWRyfEwMSbDueGtu9E2uzKzhehLhAvUID33OLyv82Ew5iWrAbzLeUWBQevSkSHvvPhxqDEgz6TBtO
	tArbcH2RsZEQME6uOr1J6iTTa2wKU6x1XLmGNBYzJDa6Qe8aJbWhaVjntrCQwLbXkBr+CqZIBbX2y
	NnLvR+0g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56256)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ufEOl-0004Zz-27;
	Fri, 25 Jul 2025 10:07:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ufEOi-0001di-3A;
	Fri, 25 Jul 2025 10:07:25 +0100
Date: Fri, 25 Jul 2025 10:07:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, kees@kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250723 arm atags_to_fdt.c undefined reference to
 `__sanitizer_cov_stack_depth'
Message-ID: <aINJTDD3je4XJ6VO@shell.armlinux.org.uk>
References: <CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_020732_337303_36406495 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, Jul 25, 2025 at 01:59:02PM +0530, Naresh Kamboju wrote:
> Regressions noticed while building arm builds with gcc-13 and gcc-8
> toolchains on the Linux next-20250723 to next-20250725 tags.
> 
> First seen on the Linux next-20250723
> Good: next-20250722
> Bad:  next-20250723 and next-20250725
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> ## Build regressions
> * arm, build
>   - gcc-13-lkftconfig-hardening
>   - gcc-8-lkftconfig-hardening
> 
> Build regression: next-20250723 arm atags_to_fdt.c undefined reference
> to `__sanitizer_cov_stack_depth'

"cov" suggests "coverty", and that the symbol is not available in the
kernel suggests that coverty isn't supported.

Maybe some kind of new support has been added, but no one has told the
arm developers, and thus bits needed for it aren't present.

Honestly, I'm not going to worry about it. If someone wishes to
contribute 32-bit arm support, then fine, otherwise I'll just ignore
this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

