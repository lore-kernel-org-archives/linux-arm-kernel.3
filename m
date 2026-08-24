Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFA7C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Po/EBS3/pNf6ny6UA0CtZDiiSC2hgFFm/KHvckMz5gA=; b=Yw9X8t31befkWOSz3WjZBEOpId
	3a1yW8X1CeMw/2ek0QC0J0JX3ooIubHpYsXr+0JafVuOFTHD/9kwKPUAcCaRRlXOk+mRc7RDUtjbk
	QBEGWPLwHxNKrDuZSX2tpeRCxvDZjdsZlCOjJdG4HeVfkLfKaKE2ugmtd3AfjWpngApSusEq/GDYF
	q7hMgY6025CzENza4VFfxjHjmw+Ay8QMDJxHWHK0uEgygEPD6GNeUc02sfp9OQgX/3n/Z94V6lgcN
	/seal7lZ8mjJsqB/3ZLqarwBdDKw8QIfnPBqA1j24Mm/Mvp2LXBB+B7mpLwAhWRxL9qzQScQ3RDUw
	67ADx6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY44-0000000H6Ji-49D9;
	Mon, 24 Aug 2026 17:02:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY43-0000000H6Ih-24kX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:02:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FF5F601DE;
	Mon, 24 Aug 2026 17:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06E81F00A3A;
	Mon, 24 Aug 2026 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590946;
	bh=Po/EBS3/pNf6ny6UA0CtZDiiSC2hgFFm/KHvckMz5gA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=IAo04CVth6uyxcjPKlt91Qrgesgnkvlji/G0fZ3OCqWiB9lVZITWQSjCMc+mtJnRV
	 pc7/otIbLaaTKlB3uoPXtc3rKm27sdsspaQEr5ExO94i4aAKIKexBR9GIsJ1JoGHI8
	 1UmVnA5mY9Ebw6FUu3dBpMdBhOaFIRmNV73dMF/+9kwXN2e9MRiHTd6Esp6I9hjon6
	 HNgOTfcQpEVsfTaf0nD6rXfdnP4BfWWd0u2I2V39ePN9j98/wnKhet4+lebEaIYbqs
	 T1eN0e3IA93evY/loedm3lnqyszPp51jEJG+63KpYUrZuKtWx7Gim29TuT/2FQaz8u
	 16wrS2TMS7XkA==
Content-Type: multipart/mixed; boundary="===============1021056670152118957=="
MIME-Version: 1.0
Message-Id: <a154e55437095a325d5bd815f88d5ee61b07adcac8ed64e7f153dde1472340fb@mail.kernel.org>
In-Reply-To: <20260824160523.3907021-3-usama.anjum@arm.com>
References: <20260824160523.3907021-3-usama.anjum@arm.com>
Subject: Re: [PATCH 2/7] uaccess: Add scope guard for bare kernel nofault regions
From: bot+bpf-ci@kernel.org
To: usama.anjum@arm.com,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,akpm@linux-foundation.org,david@kernel.org,ljs@kernel.org,liam@infradead.org,vbabka@kernel.org,rppt@kernel.org,surenb@google.com,mhocko@suse.com,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-mm@kvack.org
Cc: usama.anjum@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 24 Aug 2026 17:02:25 +0000 (UTC)
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

--===============1021056670152118957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 7ae185467347..b25e778ddc38 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -653,6 +653,10 @@ do {							\
>  #define __end_kernel_nofault_bare()	do {} while (0)
>  #endif
>
> +DEFINE_LOCK_GUARD_0(__kernel_nofault_bare,
> +		    __begin_kernel_nofault_bare(),
> +		    __end_kernel_nofault_bare())
> +

This isn't a bug, but would an unprefixed guard name such as
kernel_nofault_bare read more consistently at the call sites, alongside
guard(pagefault) a few hundred lines up in the same header?

Every other guard class in the tree uses an unprefixed name, including
the directly comparable one at line 303 in this same file:
DEFINE_LOCK_GUARD_0(pagefault, pagefault_disable(), pagefault_enable()).
The '__' prefix is meaningful on __begin/__end_kernel_nofault_bare()
because those are arch-implementation hooks, but the guard name is the
caller-facing spelling.

>  /**
>   * get_kernel_nofault(): safely attempt to read from a location
>   * @val: read into this variable


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/32751368606
--===============1021056670152118957==--

