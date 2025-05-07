Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883DCC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+w2rOhMLzWL69p+AYFDRxip1uCkuGuYudeGTRnVE1U=; b=EZLNikqj9GfN4KuPB+XOuLfTZ6
	ZwXiWXbz5M8CekBYHJIlpvprtOeQiZoELsADS2waZJzSxPkUOkmp4QC+snbI4Dg+pIv4nEGI2TLni
	g0HiJFRxmDZfAFHhf76Hnzrkf1rU46umYt5MszZXBLzIFCYdgfSyrt6KUslmkckzx8d8KxmBJkgxI
	SiqQ8rzLYxKZlbkEltM+yldOZbq0BmZmavI35RGpLZylQ5Om823ujnjT2ek/x8jTAYxs/fs9j2QsO
	+Se9PUYXDdUSsilOZ4IlVDqsLBFEsnxnAh0GqsBZ6CPH2zKz8Pn+Htw2Oxo6OnSsfY8QWnwOz/kk3
	hjVyLLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj1d-0000000GPeD-3lL0;
	Wed, 07 May 2025 17:57:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCibN-0000000GLbk-0eu0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5411FA4D9ED;
	Wed,  7 May 2025 17:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E21C4CEE2;
	Wed,  7 May 2025 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746639036;
	bh=BsKdkYXPBa3oS++DBUhi7lIss+ZRPE2J56PmaYOO5JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffCjBDfdf9z5FtMr+Hyge+HWy3FqkoaAxcBn4IRLNzZkyrkqVJTZarduzFYwBqn0p
	 h66sDt16gNL+Ov6FVkJuOTTU2Bk26+RKE2AWNHPdqXg04lx7X3pn0NEp2Ljtp2jRaA
	 hIGuwyvW/FBXt56ZiPbTj5v3Ee3pun8qwOKg9aAQFncsBtAWf88OUT9iXzj93gMN+l
	 mSx+4S7Oh8rA+kd/wA1bjWLGf67n1CdScOpC67LulLtvhP0rWhiK+evnm8cHLldCXj
	 0sxvpndQLYkDl1ZgCaOS4PRzWJzEVvo+xR2z/tCETklVyKVkf6Wxb5zqheEBOYONXn
	 iBFAoRTUz2kOg==
Date: Wed, 7 May 2025 10:30:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-kernel@vger.kernel.or, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: next-20250507: arm64 local label `"3" (instance number 1 of a fb
 label)' is not defined
Message-ID: <20250507173031.GC181648@sol>
References: <CA+G9fYvcXTuxC0ncXBQYh8FZE2BxGSuTi6dvN_sWxBRcOAN8tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvcXTuxC0ncXBQYh8FZE2BxGSuTi6dvN_sWxBRcOAN8tQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_103037_261726_74D03581 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 07, 2025 at 10:58:18PM +0530, Naresh Kamboju wrote:
> Regressions on arm64 lkftconfig failed with gcc-12 on the Linux next-20250507.
> 
> First seen on the next-20250507
>  Good: next-20250506
>  Bad:  next-20250507
> 
> Regressions found on arm64:
>   - build/gcc-12-lkftconfig-graviton4
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
> 
> Build regression: arm64 local label `"3" (instance number 1 of a fb
> label)' is not defined

Fix was already sent:
https://lore.kernel.org/linux-crypto/20250507170901.151548-1-ebiggers@kernel.org

- Eric

