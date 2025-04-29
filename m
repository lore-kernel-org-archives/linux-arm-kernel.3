Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF67CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JhqFvD4G1KWxWhTFgrX2oGSItNM23jjkmuvL4PHemA=; b=ofNu2f954djGUhWR1+3Yc3GMWf
	mOzSDNN3jpxc/3y7e753gwDJ3XZZmSb5yYMRf1dl5nNcJ7k8MwYFla+0qakfQHsS2p6svBZ+R7Uai
	GtRJhesxCE+w4bTEyPTnAeShKRbp8caTLIgLpYDQd6nKsW1enTrnDd1w//IvoGwxSBZcFNlaoQlUz
	4eZNSxWah3yS/XUiNs4JVeHK2boUN22T9ycJmkkJ8TOC6NuridwH40vepW4ajvTLO0Ze0zqOpkq5f
	sCzsFPkLzES/JjiyoAB3VAwYjbmDLU9uGP/8jdpVBjzGhBc6nwm59nJ1uvhmAGE4GrCYxtq4BMAd0
	EU8IUU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ri9-0000000Alk0-3J9l;
	Tue, 29 Apr 2025 20:37:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYn-0000000AkTl-3qe2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A854A4C0BA;
	Tue, 29 Apr 2025 20:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706D1C4CEE3;
	Tue, 29 Apr 2025 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958489;
	bh=L9mbN09+6CLVblJuXVYcAm85xyL6UqkEzO7ZghXXv1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kUKKWxmqtu3Ye20oTlvA100lvRoMNSe/kK8UvwbpX5qB1r5KYSQs5ceataoyWA/by
	 zQ9/592okKhggqO46uxOq4vj+9T3VAweL1BS9ptmfudz++URq78o24/HtLsTsbNJg7
	 BsomvLDfpcM4a9UBEcbvAdfw6/AaSR99zj+65Sf+V+fg/Gfp2xvFlMplguAicXIfMS
	 FlkbCV8cWxixY80qbs8mkvKEWE88Xlxao7VuYPKd59JuWfX/NAGCGHqcS9tEhc2vzQ
	 vV2XBc+yeqi+yVbIr2k0qj+iufXnz9TT1M3abC14iFV8Pp2Aa/5PZYIg+IztmlExJ0
	 Kf4zaCqvUEQoA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Biggers <ebiggers@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Kconfig: remove unnecessary selection of CRC32
Date: Tue, 29 Apr 2025 21:27:46 +0100
Message-Id: <174594004029.473481.4442846222073127279.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250414174018.6359-1-ebiggers@kernel.org>
References: <20250414174018.6359-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132810_014877_2E3B304B 
X-CRM114-Status: GOOD (  10.16  )
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

On Mon, 14 Apr 2025 10:40:18 -0700, Eric Biggers wrote:
> The selection of CRC32 by ARM64 was added by commit 7481cddf29ed
> ("arm64/lib: add accelerated crc32 routines") as a workaround for the
> fact that, at the time, the CRC32 library functions used weak symbols to
> allow architecture-specific overrides.  That only worked when CRC32 was
> built-in, and thus ARM64 was made to just force CRC32 to built-in.
> 
> Now that the CRC32 library no longer uses weak symbols, that no longer
> applies.  And the selection does not fulfill a user dependency either;
> those all have their own selections from other options.  Therefore, the
> selection of CRC32 by ARM64 is no longer necessary.  Remove it.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Kconfig: remove unnecessary selection of CRC32
      https://git.kernel.org/arm64/c/e2eaeba0522d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

