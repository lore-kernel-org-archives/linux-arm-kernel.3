Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B056CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unZh0G+YZC8++DJ6DAYrs4XDt/mAy9XTGIw28dz5oOc=; b=gKJq2geSAAVlah2CYFmNrRpFqA
	fTjRqdgBJuDYC3tfsgclnk9IH9vYERr3Xv3PrGej2RHVC/mF51qtyBDRMShrvh2mIOACwKPG5aKfb
	NzhUpbH/T6hDr/X7CS6D3PKXBn1DEZ+HdCJX5+WHClyz0xFoW1nDUXLvk/ExCY+vKMnJobrdq+NJF
	vgcnu56IjIW6pBbD0ZHl9Whbneb+XxTxu+ouLYpsRiKpiYvVMoO/LH2B2emRaaDiTa2fUQQbqELs6
	Tqp/MRLDBtyYQ7kRMB7jC3csTCyGykCHRShDLM6OJUlZBHbCg0ql5ut+vNlH/oRvaFp9Wg5SU2JqA
	VRJPI1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tMF-00000007B6p-1m3v;
	Wed, 01 Oct 2025 09:42:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tME-00000007B6h-1lfK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 09:42:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9F6F61757;
	Wed,  1 Oct 2025 09:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB33C4CEF4;
	Wed,  1 Oct 2025 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759311765;
	bh=04DFmLbCUMb/NzDXHOJCQThEWyMLJ5888+Etag6VdOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/G0Ac3bW9MD0joA0ptWQEuAhTel2fNxum1zw45ojN5TzWODrY5JfgjaYIaU5B+NM
	 Xs0uMe8QqC0ujOd5MUbHKu4SRVlFyPXI1qB7CWpKxIJhJt8fpXZUqPrBntHL1fsLq9
	 n1NVvulkKA4zsqHYGY+XVaKn9t+ZFBU7K2ivE8i+c2KKWfG9ERyztd02/xkyl0bybr
	 1jN9atdzIADFce/byyhr7SP0FHvPxidXjSPBfAZNrIfoZE9JxsuyX94hIDOBrrN/C9
	 Qy9eu9CtkvBRqSwcoeag2Py9mJTeog4t8eyEAi1/uwS+skOZSywbjJyJLDJGOwRxcN
	 ItFq6gb4Ztwjw==
Date: Wed, 1 Oct 2025 10:42:40 +0100
From: Will Deacon <will@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, brauner@kernel.org
Subject: Re: [GIT PULL] arm64 updates for 6.18
Message-ID: <aNz3kLEOA60pdRmH@willie-the-truck>
References: <aNbJ0YiL7Us_eicz@willie-the-truck>
 <4016897f-42a5-bb18-4ebb-80de97f99a60@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4016897f-42a5-bb18-4ebb-80de97f99a60@huawei.com>
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

On Sun, Sep 28, 2025 at 07:27:17PM +0800, Zenghui Yu wrote:
> On 2025/9/27 1:13, Will Deacon wrote:
> > ACPI, EFI and PSCI:
> >  - Decouple Arm's "Software Delegated Exception Interface" (SDEI)
> >    support from the ACPI GHES code so that it can be used by platforms
> >    booted with device-tree.
> > 
> >  - Remove unnecessary per-CPU tracking of the FPSIMD state across EFI
> >    runtime calls.
> > 
> >  - Fix a node refcount imbalance in the PSCI device-tree code.
> > 
> > CPU Features:
> >  - Ensure register sanitisation is applied to fields in ID_AA64MMFR4.
> > 
> >  - Expose AIDR_EL1 to userspace via sysfs, primarily so that KVM guests
> >    can reliably query the underlying CPU types from the VMM.
> > 
> >  - Re-enabling of SME support (CONFIG_ARM64_SME) as a result of fixes
> >    to our context-switching, signal handling and ptrace code.
> 
> IIRC they're 6.16 stuff [*].
> 
> [*] https://lore.kernel.org/all/20250528114103.GA27965@willie-the-truck

Well spotted! It's nice to see eagle-eyed review of the tag summary. In
this case, I forgot to drop a couple of sections from the previous tag I
wrote -- we use the same tag name each time ("arm64-upstream"), so it
gets pre-filled with the old contents when we update it and, since
Catalin and I take it in turns, that's why 6.16 showed up here.

The good news is that the actual pull request is fine and Linus has
already pulled it. I now wonder how many quality news sites will report
that arm64 is re-enabling SME in 6.18 ;)

Will

