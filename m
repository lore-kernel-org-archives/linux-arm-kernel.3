Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BCECA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgFmFj2igJGpmbRflOSd7wans++uMlq7r70gUY54Vy0=; b=o9cSQOBWhPwhwYPFa/v99xkwW+
	cxhi/LHdS5VnL/J98JuDYArEMGrChZJW1wY3ekoFuEtFC8dodQ7NE9ODmUowjveVZKkZ9yQQllDGR
	ETCYDkc8nZnK80oU9ECB/jUMhUr2Dsg8Y4KxarVpNMxRQhQ26uRpr0rZ8LEgAkJGcntYtHxfXq/g8
	IDTY2U0fVPB5SoQtLTGnbfnRtCV2bbAuDVRD+/EQEJ1YugK0XxeUBJViJiLS4htJxFL3F8blhusEC
	UDDKWo4x+G1K8dsP/48reTucciyDJ8FEvtkrhr02zAC6MLXNxzHERfU/QKyJbmVDYdY51C7tQYmUy
	4maxfztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnUF-000000056Pe-340k;
	Wed, 30 Sep 2026 06:08:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnUD-000000056PL-2egi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CgFmFj2igJGpmbRflOSd7wans++uMlq7r70gUY54Vy0=; b=mJNBYoncuOsDU7kcEK39xehNXc
	9wyuiFG6eo/4XK/fvewdsgdfWCK0oxfDZO5xwmNr7cKG5dUITkOme1SwzShM1Q1v8VCHYZ+k8dhV8
	+QCZsob4Us6ztz4lWlGAg3MAO56Y7AjK7h4WO4Y8Rc0orEXY3j85YemwZVON9YQVEtQne2exrLqp0
	taI2BegZ5/6MPo8cFdlfFX38CS4pCcxCvw5KcAKkoS97qxmqABexYc0wc/hekjHVKRKJJdmki8MeT
	aOXtr5ijrGm39tmaqgSFPjU9O7GnlVcxWg9r2TGSVgchJ1Rp3mrv+AMJSo5ILX15oX/F+1IOEjmrt
	tTo6jxdA==;
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBnUA-00000003OsS-1GMe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:08:12 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc78d59bb02so1884233a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790748487; x=1791353287; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgFmFj2igJGpmbRflOSd7wans++uMlq7r70gUY54Vy0=;
        b=mSjNbbt2UEA5arOv9JCl18cEtdj6J51i3KrNOaxzaxdgI1Big/tOL+7ycnrVk7Gg06
         suO63578h4eO1WQlY6xHGHgMxQJiX13Hsn4fNHSW1005BMv22WgqSJS8BR1tjr7ZLhRo
         orPwPCAYTHTmJvRGYmA7eYUr5l6oXCBuo4lwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748487; x=1791353287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgFmFj2igJGpmbRflOSd7wans++uMlq7r70gUY54Vy0=;
        b=X9FHG8IWZgXJS7BCEzgN+tYrpzTF5qkbuaimMrMSjrDsTSaos9pns5gqkADha8GyYn
         2jkc9KlllIHFULoR4XipZIg1XSA+hiuLg/N6Sm/V5wRqPaNGaK6EqLW020WKDQsT9+zf
         EvViq4FEepp1SjjS9B9HDclS7MOpDAD2Jy3NdGj7HB3PdyWPy3I6JglB7ucNWQ/frq5m
         58M6UCRiW8sLwXkXJqj22PUTlL2HbQ5cA977Z2WhSTijiSW0gY5Hx3eQpGJrHAOhk+Ux
         gFNekb85lkul2kAQFEkE7yHm+8XHuKiH8K7g2BKzUl1cmSIKo4vGnxHG+2u/KBuU1u0j
         CrAQ==
X-Forwarded-Encrypted: i=1; AKwUvByyQFWn+Zg89WnNlpDzMiy8Ac+C2nw0w2W7VGjKtSL8E9ZFhyBQwQXt7W73/90ryXOgv70aOvEHjSLCRXRJGGdA@lists.infradead.org
X-Gm-Message-State: AFuF++lqg47XUgH7hd6QpD9sHo097ULzNiuW52+d3FVHFLGR+dwbT8hh
	uFvEex4OU4rgsnyC05nwmwDmsbw4cJcJ48j+z25zcEnHX4StHy07mQ3ofo68ViQHGQ==
X-Gm-Gg: AYBFou2LCpkzooC1JNd5ER24dcbVq2F4VUti6sQyT/h6yUcTa/nMq1/EKuI635Rd12w
	5DhXf/sc0O9nSEQfymDiSivLUAhCmm18I3d/ZiDBmZotNOa2UE4DxFT+iyXAePt+dxOuBU+pCYH
	XNsziPtaI9w1tyy5hrpa4ooG5UGXEUb9pKUCmq3mBMjYc+j34600LqQndXYjTBUz0gwv7IE83ZG
	8Bs8eJAqPmrtU1VTh+HYlyPl9XkgpodXVlwyMTnQ9KJHquwv0b2OOj9LhjZqlHBTiE3KkgRLDjX
	xLR+wP9b2fR9tnhK9GI13NouVbwrLHSUsS+8205e6w3IN+h+NWHpL1ZcfIwjJ3FU8pp8vyduxsD
	OQerIjX3gsbVjhvKdqq5WDEWnRyJaphjVyESK1cC08BBn7FacGR89ct5fpQS0U+HacewpwqBBwl
	vdPmE2uKJPJzS1A1+Vwq6/GjkxVD2JY5xUec/ICl+CwnQqooEEqmT8IIVaPocFZcMYuJ/cxST+G
	d+eLHDVnFrZFldTPiSoaoGFkCTeZlKKwfmm7soKkcU894O5kA==
X-Received: by 2002:a05:6a21:492:b0:3de:3bd5:604c with SMTP id adf61e73a8af0-3de9e87f358mr387844637.41.1790748487167;
        Tue, 29 Sep 2026 23:08:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:31b3:f8c3:893a:d0bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d68389sm247895b3a.39.2026.09.29.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:08:06 -0700 (PDT)
Date: Wed, 30 Sep 2026 15:07:56 +0900
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
Message-ID: <aryehUJml8fTy0o-@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_070810_714981_61BBEA37 
X-CRM114-Status: GOOD (  19.36  )
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

> +void LZ4_resetStream_fast(LZ4_stream_t* ctx) {
> +    LZ4_prepareTable(&(ctx->internal_donotuse), 0, byU32);
> +}

[..]

> +void LZ4_attach_dictionary(LZ4_stream_t* workingStream, const LZ4_stream_t* dictionaryStream)
> +{
> +    const LZ4_stream_t_internal* dictCtx = (dictionaryStream == NULL) ? NULL :
> +        &(dictionaryStream->internal_donotuse);
> +
> +    DEBUGLOG(4, "LZ4_attach_dictionary (%p, %p, size %u)",
> +             workingStream, dictionaryStream,
> +             dictCtx != NULL ? dictCtx->dictSize : 0);
> +
> +    if (dictCtx != NULL) {
> +        /* If the current offset is zero, we will never look in the
> +         * external dictionary context, since there is no value a table
> +         * entry can take that indicate a miss. In that case, we need
> +         * to bump the offset to something non-zero.
> +         */
> +        if (workingStream->internal_donotuse.currentOffset == 0) {
> +            workingStream->internal_donotuse.currentOffset = 64 KB;
> +        }
> +
> +        /* Don't actually attach an empty dictionary.
> +         */
> +        if (dictCtx->dictSize == 0) {
> +            dictCtx = NULL;
> +        }
> +    }
> +    workingStream->internal_donotuse.dictCtx = dictCtx;
> +}

Just a side note,
there is a bunch of new helpful API added in this release.  Currently,
we do some memcpy hacks to avoid re-init of lz4 C/D-dict in zram, but
once this series lands I'll be happy to send some trivial EXPORT_SYMBOL
patches so that zram (and other lz4 users) can use standard lz4 dict
API instead of hacks.

