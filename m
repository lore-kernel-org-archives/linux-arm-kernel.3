Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A635CC98328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 04:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXDScwdKbt28kFhjEDV73RhbSo3l7UPBxj8GidcV6Ck=; b=VrP1uCos6tjGo5e/hZAWswLEWZ
	aB2wWLDXih/uo9fzjdlcZtXlajD5/niwu8ReKkxPpXNyDNlQxVsyVddPy+zAuqjlAfUobZcFUkSSz
	WNZpw/ZFazCspBG+gjy5BfFMU2FIEJBrlNzqR0e3yyaddkrscPK5RCVswUPrdKq6AA3WBtg2xyWpy
	g8wfpLtsBZHI1AvIq9AQ+nxG1bTFXmN0QF35Y8iC1ZMyXZxPmPG+hRrw6aHhaJTaI8/BkkkH+bRdr
	b5jTzXx5hXOPOjHf/5nzgnTQBDPqJECe+tmY77ctc2TrXpu7UV49Q1VnADZRS0kGSM2uxEbxwxo9H
	Gvy0xAAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2jF-0000000HItz-38jL;
	Mon, 28 Sep 2026 04:12:37 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2jC-0000000HItc-26eO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 04:12:35 +0000
Received: by mail-pj2-x0c.google.com with SMTP id d9443c01a7336-2e22e123350so2407455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 21:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790568753; x=1791173553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXDScwdKbt28kFhjEDV73RhbSo3l7UPBxj8GidcV6Ck=;
        b=nQIqua2OO+ivuUNOEyZ5RCAi6rV21b91FjkrvcgbcC6K3Ahw9vyVEHuCd2NhBM2Zwq
         6wfNE2BjC8AYodVHy3wJJx9GQAR+76+rcaS82TQi4c3sHSAo5DSvX/Uk9vqXJqi0I8Ut
         6UovLsHXyp5cHfbDDq7ayfMP7Uocw4+0jrNj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790568753; x=1791173553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXDScwdKbt28kFhjEDV73RhbSo3l7UPBxj8GidcV6Ck=;
        b=0rr2psXQSwxkFyVLcyH3npY5trOlYZpvHyLNgaSgQaKSkQLKd/GuZlRETkf5yr36q4
         6mGrhxD5pvgz7rd7b+Z0QwWH8pPa2FyzvCSiSbCycE9zpyE9qqWRWR0jgw1em7172hfh
         CGgr/7iMe7B6DndXcuyf8SkGNK4ioMuvSMhN2Pn733h6Yq880vSkatNB+oPv9fV8brND
         nnHCfzj3MTK8y57Vc4hWPCrklmaE1pEw97+z/iKPQZX/0odkklCPFnsXKjQTo5WMv1Bv
         TMSHJIaQVm6KuER/OKNEjjpF/AUxvN3K90bjjHOT6Ndv7BecnAUzPLT4GKGQabmT7bYW
         jwZA==
X-Forwarded-Encrypted: i=1; AKwUvBzXDpPYSnZSDUuI7q8xo91IFR3au3hcxgBsq3/bJxsa1h2NECwD21hl1+Xdz/X3zPlXcSr9sU2/mkRqC/h5YqCa@lists.infradead.org
X-Gm-Message-State: AFq9FYJovmcIUs5I8QC/Pi1BL5LLl+MRVzDzx6R9+80KIdKTggg3sH+i
	1Ia3PGa4EHUo0h7Mnp1ol2RjhchvILSjwAEw8/4SbAHIoh6ffRPpVCPN57Fx0EauBA==
X-Gm-Gg: AYBFou3bL2GHa9NKONUdAvltdAcQfB2bW9Bwf+QPZifxCJ2klmnrph0eg2+uFxVC9qD
	aL5ZifGqvmBjyJKm6A8jVzcGLMEXDxJeWIHf+hMMzoOO7dDSKTia/er2NDL+EwIm4AUe/3j6I/D
	GkHkQ25QT0sIvI7lPGLikQ1w0con2tt2Sh4hb2JrDYr1qcNMALCXV1vIZrAe2v/YU7wcqxPj/rY
	WdwTuCmhs+T49Mg/YGQq3tEn4WAECkH9X/PdtbPjq8SxsDVvaH0LLSejKGlSw+WBijaqImw4iJ6
	YDetMtBkOnHrK9J+joaxK9ePwqlM2DS9L0mr/jDHyF5SVnjYw901Pmykybt4Nt8LhgBlJvKX+/e
	/uwlM8EnCgSPdIXFbCXdXojoBhdX2QhCDyQIvkt9GRFMgHlEvxSabyIzy7CU/up9fLmeSS8g385
	PqpqqZ830grHZlWXCZaWqNFO0SNZlt0xAJ/nGRX/hP9GCRih6EpzHCybrAwNBlttzcjQga0Ikp2
	kyZP7pPSs0R35jhk2Uk+n7x/KeknIvMgg8yHEI=
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr10891588a91.59.1790568752817;
        Sun, 27 Sep 2026 21:12:32 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm17381254a91.15.2026.09.27.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:12:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:12:24 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Sungguk <sungguk.na@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 1/9] lib/lz4: import upstream LZ4 sources verbatim
Message-ID: <arnosKlQYVIdmTR7@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_211234_609915_72B3FC35 
X-CRM114-Status: GOOD (  11.28  )
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

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> +#ifndef LZ4_FAST_DEC_LOOP
> +#  if defined __i386__ || defined _M_IX86 || defined __x86_64__ || defined _M_X64
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  elif defined(__aarch64__) && defined(__APPLE__)
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  elif defined(__aarch64__) && !defined(__clang__)
> +     /* On non-Apple aarch64, we disable this optimization for clang because
> +      * on certain mobile chipsets, performance is reduced with clang. For
> +      * more information refer to https://github.com/lz4/lz4/pull/707 */
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  else
> +#    define LZ4_FAST_DEC_LOOP 0
> +#  endif
> +#endif

I just checked https://github.com/lz4/lz4/pull/707 and it seems that
LZ4_FAST_DEC_LOOP is enabled on aarch64 now, but we still disable it.
Am I missing something?

