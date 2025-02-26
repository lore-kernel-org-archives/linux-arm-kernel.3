Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7D9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EH2vdd9rBF6NTskv8UI/h+rssM6E06JyU+31Z1CLv0=; b=D8amhy3pVeTyeNfpexyyxbjGTH
	bWc8FRI/O2FPCkv6vRWmcG91zX/0am/GYlP75BNjWfjQ57nkw5XBNDMmm9OUbLsk77u39OlA/G1vf
	WjS8Q1IMrQobrlFUa47lfScRTZpAMVPGB0slSltdPEkYhaLlX8u3gCKQu3Us6KWfUXQP3JM3n8FJQ
	ylw2OCpLw8M3jHQHXv7jYVnz88PY+PyMh3+LvFxmZMp7vG/OEBDHTw4YQOjNI7nOlL1MGUiEyKHGd
	NLz9vS8k/4W313EYHNQmdNwdg9HORKZmw0P359KL+Xtc8At2cbmM4UyVapHA1XfPKeO4iXA809UOB
	PAutxXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn52S-00000001quR-08Q2;
	Wed, 26 Feb 2025 00:12:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn50x-00000001qrQ-0L8n
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 00:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6EH2vdd9rBF6NTskv8UI/h+rssM6E06JyU+31Z1CLv0=; b=LocdsQlz/idzibqTlnZdLOpBI2
	lTpDWRnJGM3612zsefX+rcXndZzUfia9Wn18gW+/FMWR3jnkWqn0bYJ3FARJzhgAr8W823w0fvyWB
	lJsTDWTFkI8g4dWacwAgjm0oFcA2NvniR/4JiyviAR84M8NKjt6PktrfbdqjX8COrYzhX1V4Rab4P
	cx15FprRgfHp+QWIeqSBVF/JaX+y2/g3Ysujo5NYEKdtOGpbZSXX5euOLxI0StanEPezwstC/aInC
	7D4/MgwC1vwzYexdGB/yLCx0Yx0ay5G1QULxV1smdSRTsPWL98Qphe/nLT8930sTrISiYHSiMkKBY
	+5uy5ZpA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn50t-00000003T98-2cQV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 00:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCC7D5C5438;
	Wed, 26 Feb 2025 00:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1FEC4CEDD;
	Wed, 26 Feb 2025 00:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740528655;
	bh=49SUBzThyd9e7y0nhqcoDUOOKWxbYBsP2XBvQGwPRys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9Nd/W3cOBogxdlzH5W7R2i885MstlkyBA6wyh8ewYrp7QZVdEnI3tmffn9vUY59q
	 NR1ul224yG9Qa2M25MgW46NuxFaLMU+LjAZH8LSzPRxfv+8ojJpHFJJqREpp2sKSbk
	 IkpDI/KU+mtJ5EIH20eJC26M/fvom4a4vI5d4HFjvj2w4l2M2CjAHXqSEO4GuVm47T
	 7JNtkY7CAlJkcGlcAqtr3Zu1J6Wdh4IsJUz/qak5ZagZ0UswA/G+oxihiYI7lp4wnn
	 e8GK6DWfNj3Ohf13DMLC8Dq1+YsjHim8p+Q614mfk8nuC6ynY7Jl3af9pBhtSRcUxK
	 0RRVej2Cefs3g==
Date: Wed, 26 Feb 2025 00:10:50 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Luiz Capitulino <luizcap@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
Message-ID: <20250226001047.GA24197@willie-the-truck>
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_001100_083979_43143C3E 
X-CRM114-Status: GOOD (  26.78  )
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

On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
> Apologies for the breakage, and thanks for the fix.
> 
> I have to admit that I was a bit overzealous here: there is no point
> yet in using the sanitised value, given that we don't actually
> override the PA range in the first place. This is something I've
> prototyped for Android use, so that linear map randomization can be
> force enabled on CPUs with a wide PArange, but right now, mainline
> does not have that capability, and so I'd be inclined to just revert
> the hunk that introduces the call to read_sanitised_ftr_reg() into
> arm64_memblock_init(), especially given the fact that commit
> 62cffa496aac was tagged for stable, and was already pulled into 6.13
> and 6.12
> 
> In any case, it would be good if we could get a fix into Linus's tree asap

Makes sense. So the patch below?

Will

--->8

From b76ddd40dd6fe350727a4b2ec50709fd919d8408 Mon Sep 17 00:00:00 2001
From: Ryan Roberts <ryan.roberts@arm.com>
Date: Tue, 25 Feb 2025 11:46:36 +0000
Subject: [PATCH] arm64/mm: Fix Boot panic on Ampere Altra

When the range of present physical memory is sufficiently small enough
and the reserved address space for the linear map is sufficiently large
enough, The linear map base address is randomized in
arm64_memblock_init().

Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
use it consistently"), we decided if the sizes were suitable with the
help of the raw mmfr0.parange. But the commit changed this to use the
sanitized version instead. But the function runs before the register has
been sanitized so this returns 0, interpreted as a parange of 32 bits.
Some fun wrapping occurs and the logic concludes that there is enough
room to randomize the linear map base address, when really there isn't.
So the top of the linear map ends up outside the reserved address space.

Since the PA range cannot be overridden in the first place, restore the
mmfr0 reading logic to its state prior to 62cffa496aac, where the raw
register value is used.

Reported-by: Luiz Capitulino <luizcap@redhat.com>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Closes: https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
Fixes: 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Link: https://lore.kernel.org/r/20250225114638.2038006-1-ryan.roberts@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/mm/init.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9c0b8d9558fc..ccdef53872a0 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -279,12 +279,7 @@ void __init arm64_memblock_init(void)
 
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
 		extern u16 memstart_offset_seed;
-
-		/*
-		 * Use the sanitised version of id_aa64mmfr0_el1 so that linear
-		 * map randomization can be enabled by shrinking the IPA space.
-		 */
-		u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
+		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
 		int parange = cpuid_feature_extract_unsigned_field(
 					mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
 		s64 range = linear_region_size -
-- 
2.48.1.658.g4767266eb4-goog


