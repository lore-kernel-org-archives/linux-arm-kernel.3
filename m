Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F84CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 05:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aE4CNeMPjoyGqhac0qEjC0MrhT1ea2sjSdxYtuXCv0E=; b=TUlz9xO483MuV2PoVke2lZtMQC
	DalqbdzFgCUcw5AOPaFLWtXAFxxsJqydWnYEYQsdU6X6opI24maB+3hIvmnFIO+98R0YCH8FhQDgS
	Rh65CM9H6G5LaScaqJyQfeKqJml9AY5QrnioxQ13vsNnYT3RCj/tggapQ62aOM6FBGVodRIg5er7G
	/fsY9/jplmMZPuYWRompxOcV3BBAGYqVMtbA7Cx8vOcP+3E/co1JbTcFwdt7YlAGD0qsWKLvg1ID0
	aTL83Rnjh0RnJrzT3mVIxBgaeMREIXzoMh6+QZKq5wou5JjDySjnqExEQSDJbTNrZoDC/34O7cZ42
	Cudi68ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3li-0000000HLxC-1rLu;
	Mon, 28 Sep 2026 05:19:14 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3lg-0000000HLwf-1DZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 05:19:13 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so484004a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 22:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790572751; x=1791177551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aE4CNeMPjoyGqhac0qEjC0MrhT1ea2sjSdxYtuXCv0E=;
        b=m1DVuOqSgdag/Fgk/VOThTX9N8g/YpOUCCumWs8g+uTIaFLT88y5Jc7C3FSYUEivMD
         68IpfkuIV1uwA/bIL0+ujIkbHCroTh9pLejxrCmXNudMJLec2P5LSNkIx3Q2QZQDHPk4
         tC4HIpjiRiA8GHo4lH7ZvbzT9gPJRkzIs8g34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790572751; x=1791177551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aE4CNeMPjoyGqhac0qEjC0MrhT1ea2sjSdxYtuXCv0E=;
        b=fK4+srO/pt5XBETjcJ0CrObVFg1q5Adk8VqWV3NoR9kNpJi1gtF+2+J2mqFWuha3z+
         OSNXmxRRIYNzv4e/NcRZuFiJtDcyBHtLXgNI0PbsVA9qxq8hfHkvQRa4r6V2WoyxjURy
         W2wpvjLY8epaSZtSIs9Spplw/XqjqH+BwL49sU3bH8okk0Vbw212NuXxto9QylQ4UaPP
         4yJ9l4HiC6zeFLA1Wpie+qeJOr5BLQxuPTy/w6DdpZ2ZSc9cYl9uIqd67VOHlQ2ZXI5k
         wLpc3HGHcP+6qTV+YiCqEeg69DswiIAJDvCIYpyFy2l7MwyR18B0KuCTEzPP7K6eFktY
         ZLGA==
X-Forwarded-Encrypted: i=1; AKwUvBwHwFqZ8l9KTPQG07CQF8GhhOyHXbL5oWzE2p0kKdDX+Q49RVUHjKEf2jWkU70FmMi96yU6bzk11wqhf2M9fLMN@lists.infradead.org
X-Gm-Message-State: AFq9FYIKaPnVhDn8GVXYZf+F4TcTuB7+DCC719RYJVvsF0kjc+s9N732
	Ih6TuhfRsc/O2LAWNITrl6ciaxSuIBuH3UsaPlZj5Gkr6iuuFnmZU/o+Hs/AwzrhWw==
X-Gm-Gg: AYBFou14tAjxpGOidJVo4x7quWZ27cjRUq27ksglRT9ZVj9HLTJUf7kRxOm4nnKWIJ8
	dAsMGTOtL4NWxZcrnuaY5LPPWEkKxLt27iv62CFBL/CKz8MY2e6t9zU7E1NfzzwN3HpKKHaP8cm
	oU31jIUr7DGi0n+Nn9UoHsEqyOeDKsY1OXK+2ym1A0qEaAwiXQrlyDymX7GX6jWeRDSO9ZQcOXq
	OVdLJZxAJkja1sggqnaAkZ4rEcyRt21ORNurmoc5tnGfSab4t6I9UFpdCSnyiSdnhgr5gY5m9xe
	f51eAznfDDilseQhqKXoMmAdVfJx9Nle/jMkFUDN45s8b0gXmzRWqjM7/xmsrEV9C85LG60POqo
	ETBdI1vt7UAMIEEOcaCMNjjjxtsl1tSbnRCqUNHAexMvqwEso4UlRAT3CLLvhwE28DyFKl78Bdz
	8z+PiqQ9zreqNvpfz038TrDDZSFdLCIAsCpxaCGdaCah1OG0m5l7UC/x1xFcwo8rALZI7VFtgrk
	xGD8b3sQOmj6+Ye3fImYUrYN29TO7fnETAFxJ0=
X-Received: by 2002:a17:90a:597:b0:3a0:a055:1759 with SMTP id 98e67ed59e1d1-3a0bb60e55amr5032133a91.40.1790572751469;
        Sun, 27 Sep 2026 22:19:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b94936ddsm18408378a91.7.2026.09.27.22.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:19:10 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:19:02 +0900
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
Message-ID: <arn3TC7BgjTXWmdG@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_221912_381344_222F8574 
X-CRM114-Status: GOOD (  10.53  )
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
> +int LZ4_compress_fast_extState(void* state, const char* source, char* dest, int inputSize, int maxOutputSize, int acceleration)
> +{
> +    LZ4_stream_t_internal* const ctx = & LZ4_initStream(state, sizeof(LZ4_stream_t)) -> internal_donotuse;
> +    assert(ctx != NULL);

Probably in some other places as well:

LZ4_initStream() can return NULL, but the code immediately derefs
the pointer.  The assert() check seems to be misplaced, unless I'm
missing something.

I suppose those need to be decoupled.  First LZ4_initStream() call and
NULL check, then stream->internal_donotuse.

