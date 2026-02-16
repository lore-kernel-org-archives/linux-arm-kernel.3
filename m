Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF8E83822
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3OHamKay8QWL84t3DCucztYrvE5l0LMx3JEroPGNFo=; b=4H1zg8lGnzrcjAaFbArAeA6vFf
	DZtH0v15EDhCXUr0U/IGvnYmxbiAlsn+I7jgqepvEkAE6r1cf/JRVNOO9zoD/LiIa/+k5BYO+YSOL
	lGWlXA4tNODnVx6G3tJYz7RVDF+y6x2UpPKhM07YhwFUH+6aPyBHLz+1jiJfQtnAMTHsyEaK7IXSE
	HkWnTTfhjTRb1got8cBxyILtyjWkx8F/d+h3JiWWxApPEvadKxLV/Kxao1Ts7fpLRU+yY2EB4QnLe
	eQ/dYEsAF6LTQG3TDfiQ79qGzFkQK0q2p/jcifuQlHpTG5DEKYiSEKMHHR9hr7dOyOmvTMxUTIAXa
	KoPBIGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs3H9-000000079Oc-44lf;
	Mon, 16 Feb 2026 18:24:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs3H8-000000079OW-2E7m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97E5E60133;
	Mon, 16 Feb 2026 18:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B62C116C6;
	Mon, 16 Feb 2026 18:24:45 +0000 (UTC)
Date: Mon, 16 Feb 2026 18:24:42 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	broonie@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH v12 2/7] arm64: cpufeature: add FEAT_LSUI
Message-ID: <aZNgR6prm0Exzar0@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
 <20260121190622.2218669-3-yeoreum.yun@arm.com>
 <aYY2CyHWtplQ-fuS@arm.com>
 <aYouAv_EjICIN8oA@arm.com>
 <aYsAaaQgBaLbDSsW@e129823.arm.com>
 <aYtZfpWjRJ1r23nw@arm.com>
 <aYtkbezCx9vW8SHz@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYtkbezCx9vW8SHz@e129823.arm.com>
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

On Tue, Feb 10, 2026 at 05:01:33PM +0000, Yeoreum Yun wrote:
> > Why not keep uaccess_enable_privileged() in
> > arch_futex_atomic_op_inuser() and cmpxchg for all cases and make it a
> > no-op if FEAT_LSUI is implemented together with FEAT_PAN?
> 
> This is because I had a assumption FEAT_PAN must be present
> when FEAT_LSUI is presented and this was not considering the virtualisation case.
> and  FEAT_PAN is present uaccess_ttbr0_enable() becomes nop and
> following feedback you gave - https://lore.kernel.org/all/aJ9oIes7LLF3Nsp1@arm.com/
> and the reason you mention last, It doesn't need to call mte_enable_tco().
> 
> That's why I thought it doesn't need to call uaccess_enable_privileged().
> 
> But for a compatibility with SW_PAN, I think we can put only
> uaccess_ttbr0_enable() in arch_futex_atomic_op_inuser() and cmpxchg simply
> instead of adding a new APIs uaccess_enable_futex() and
> by doing this I think has_lsui() can be removed with its WRAN.

Yes, I think you can use uaccess_ttbr0_enable() when we take the
FEAT_LSUI path. What I meant above was for uaccess_enable_privileged()
to avoid PAN disabling if we have FEAT_LSUI as we know all cases would
be executed with user privileges.

Either way, we don't need a new uaccess_enable_futex().

> > BTW, with the removal of uaccess_enable_privileged(), we now get MTE tag
> > checks for the futex operations. I think that's good as it matches the
> > other uaccess ops, though it's a slight ABI change. If we want to
> > preserve the old behaviour, we definitely need
> > uaccess_enable_privileged() that only does mte_enable_tco().
> 
> I think we don't need to preserve the old behaviour. so we can skip
> mte_enable_tco() in case of FEAT_LSUI is presented.

Just spell it out in the commit log that we have a slight ABI change. I
don't think we'll have a problem but it needs at least checking with
some user-space (libc, Android) people.

-- 
Catalin

