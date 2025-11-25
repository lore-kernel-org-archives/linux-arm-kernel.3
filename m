Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A98D0EE18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPcBIBqluQ1pnNTSSjoHON3v8EuqYtxtddP68uV/geo=; b=SkBA2DY+j2m+efuFj9cpN8n2kJ
	X1880vfxbPWm2N9Tv3a5wB5CkyDtqXqRfwy0trepktYt98+As1PuMdcV8Y1/SrpjJb5zecW05EOvO
	bAIVcr/kFiSacSHlKlCmM89y7uFYPp3hFqaOmSt8gS2boi5OoyVpsXVmhG62JmaV9tJuv2bWQqwmR
	ugF6F76rO0hwKYxoJNJQf1bAplGrE76cpoSQx+FOJlXcGJJ7uK8G+zexZK48kYWqj3F/z0lJ1KM36
	BVlXs7VSTiHfTN4lAxQbFvfhSaXuyYOAf1cDNjuPVDAyVngIHN5IZ06vQeSnuI5M5xc8bVeIulW/X
	E1K15kQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0XN-0000000DxVN-0Oy6;
	Tue, 25 Nov 2025 21:25:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0XL-0000000DxUx-0tpV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 21:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C71843EFD;
	Tue, 25 Nov 2025 21:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392A0C4CEF1;
	Tue, 25 Nov 2025 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764105921;
	bh=/5/8CnucXexqxcmHU/UtJRHL8WYNxyE9z/az71jfwjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVvzVe4HPqXuvwssOnpPmVG0irI/Jdi1mn5r2geRo5gtQEjRqzhW3TLBTQfOH6paK
	 oZ+qjn2P84b03j1GMfiFz4EOqVcxA/zGHIA06BBPnMm72ZX1pmiDbjDn5HV8IHmsbx
	 kAW5nInjZZFQfcGCA2o1ZiAvZpKT0F1lVj/MBVO3MSTi2rBnAv8mGnKWe9XFfvmKxx
	 ybHh0EE3f2zM1/r4GXCnGbzt2LkbRnHch1Z1JS7zR+9+lALudMAUOAUX7XGiSJ8dEp
	 zQpnB562Lj3o1muXZd/v3SRxOBToVjmC6oUAsqnmvc9+Jt9ldX67/kl7rR8vbuWB5O
	 mrWviyyOjZwjw==
Date: Tue, 25 Nov 2025 13:25:19 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: Add break to default case in
 kvm_pgtable_stage2_pte_prot()
Message-ID: <aSYev0IqSATKAEau@kernel.org>
References: <20251125-arm64-kvm-hyp-pgtable-fix-c23-ext-warn-v1-1-98b506ddefbf@kernel.org>
 <87ecplgapz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecplgapz.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_132523_296016_5F1A9501 
X-CRM114-Status: GOOD (  13.42  )
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

On Tue, Nov 25, 2025 at 07:42:48PM +0000, Marc Zyngier wrote:
> On Tue, 25 Nov 2025 17:59:15 +0000,
> Nathan Chancellor <nathan@kernel.org> wrote:
> > 
> > Clang warns (or errors with CONFIG_WERROR=y / W=e):
> > 
> >   arch/arm64/kvm/hyp/pgtable.c:757:2: error: label at end of compound statement is a C23 extension [-Werror,-Wc23-extensions]
> >     757 |         }
> >         |         ^
> > 
> > With older versions of clang (15 and older) and GCC (at least the minimum
> > supported, 8.1), this is an unconditional hard error:
> > 
> >   arch/arm64/kvm/hyp/pgtable.c: In function 'kvm_pgtable_stage2_pte_prot':
> >   arch/arm64/kvm/hyp/pgtable.c:756:2: error: label at end of compound statement
> >     default:
> >     ^~~~~~~
> > 
> >   arch/arm64/kvm/hyp/pgtable.c:756:10: error: label at end of compound statement: expected statement
> >           default:
> >                   ^
> >                    ;
> > 
> > Add a break statement to this default case to clear up the error/warning.
> > 
> > Fixes: 2608563b466b ("KVM: arm64: Add support for FEAT_XNX stage-2 permissions")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Acked-by: Marc Zyngier <maz@kernel.org>

Thank you both for addressing the pile-up of issues I managed to
introduce :) Online now, will apply in just a moment.

Thanks,
Oliver

