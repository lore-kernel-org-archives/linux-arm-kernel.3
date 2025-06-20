Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DA1C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aP16q+YYya9SKQ9hbbNnoIlxq9x1cgeNkJP1z19gSI=; b=CCdRvJe41s4AWpf9AsIqe9wocu
	ACe9xy3I915Zgc4CWSG9EtjL1N3C2oOXyXcWzg1/rJ2mEqkY80PMGhmloP0JplK1pM1l2LN/D6A0z
	p0qRxDoo4KrWCNVd+Jo+2yJQuuxRML6PXgrUMJFeiuA9XVrGZIC2ZEC9PFESVOE8v5ZHMrGCxyKLB
	1VBiybIEVZZnch2QO3y1W/4uCwVMGkkCJ3AE88NNerSA+DzzSdMlEJ7Q2stRRmTRJEReNnVQ1jMwL
	Xbwphwp6R7ZjtuhMRENAvSx7fEEnABLEgKMquk6mNzyrTMsenLF4f9BDmtTtZk4CLB9WeRTcrr/09
	TvuJY4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSju4-0000000GgPL-0i4e;
	Fri, 20 Jun 2025 22:08:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjIG-0000000GcMN-2Ifv;
	Fri, 20 Jun 2025 21:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9998C6155F;
	Fri, 20 Jun 2025 21:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F16C4CEE3;
	Fri, 20 Jun 2025 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750454943;
	bh=ps9ILEhzF10vdX7dPy5yWB5StkYw8T+IpOw27+HOqYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FC6E1Xcsnro+YOpDn8hTu0nsIFn++h4KBl0QuHYkEldKj/k+d4y6w6M6qTq1srOEb
	 nphAh45+luPlOza9k/LIGiTbnucAbyiaYQKu35fCeF/4UeE6qHizoUNUQ651lcrwy2
	 9B8AsOSU/IbiYESK+VnWwIDmkYyfPuZfhcxVI5jvUSzpyHXAwU3LfPV8cdlkFSPdBF
	 xMjNdQkGjmPO1/cWgdHC1ud81t7SJsdgZ+qBWAEQ83ndAMnkuPMMUOkbXi61DBaRZC
	 OYic/USnxpBjVMFFaIQ2ObMgL4xYVKNxAVGs0qognj4+skHnKSZZYyuLE926HJgkeW
	 3AzWwoBcF1kOA==
Date: Fri, 20 Jun 2025 14:29:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to
 lib/crypto/$(ARCH)/
Message-ID: <20250620212901.GC5460@quark>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
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

On Thu, Jun 19, 2025 at 12:18:59PM -0700, Eric Biggers wrote:
> This series applies on top of
> https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
> and is also available in git at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

But as always, additional reviews and acks would be appreciated.

- Eric

