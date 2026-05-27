Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739AECD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+a1v3PoCPWgX96Gtuy8dS290FHYVmJD02LKqOIO6Oc=; b=aihXfhxk5+kaKyQXjv7GzgQKMS
	j6pELqL8ZEmqkWjovWMKeiZ8lpX29Qn+aqzkufXt9H54HspYYo4RqyvXjeKd7/tL1TjZO3iv4zc02
	tzaknqv2sEvQO0xlG/hw16sH++J2G/FlYBX2DgmQvTnXNRsPabLGNFTFzbEmA8QOs+Kbmvmk8kW4p
	0lRIFh5AIKVJqnFWP/SqvrWyHV66j/6wBSE9QFn9XL0MHxCH5/R6CeUUBYDSuYO6Ci0aeZf02G3Vl
	XmaphheCAt3rAyFrABKNzEJRJFw1sANKhl7aIJfslPSXF04NBi/yJKi/dkdDSy5etCn9jlU3lDlbq
	kTxfDeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFNI-00000004JDH-49Pq;
	Wed, 27 May 2026 14:36:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFNG-00000004JCQ-25yx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:36:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D6F1400B4;
	Wed, 27 May 2026 14:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0311F000E9;
	Wed, 27 May 2026 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779892605;
	bh=f+a1v3PoCPWgX96Gtuy8dS290FHYVmJD02LKqOIO6Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mzavnswYCA2zVrBfb0QV1Jn7Hj3q1/dgvzNQMbYcUaYjnrS/fMUeVROs2KRU7umE6
	 lj4fvWB+FJcePrAKYwoxrbWGesM7pRlar050C+m2Ek6SNjC4N+ZHLnIf3ZLEGXdkEq
	 BPyYeRjl+UialdWm+9+pC7hQXPhxDG9jg3y5sWPKapo74GPP1YJX+BNnQXXETn9uxY
	 qGQJ8kPqh2LtM2i3baWgk4CT81sOHcQEQNHEy10tm50iTap5E8lCCSUzi75Su1l42j
	 75eUOlFDZC4bQFpYgA/YAUn+CUUS35Rs3AobZ+UY6brXNqTrFsvA3iDiN30zHyoqCV
	 6JSVYC+hpENZg==
Date: Wed, 27 May 2026 15:36:40 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, james.morse@arm.com, oupton@kernel.org,
	tabba@google.com
Subject: Re: [PATCH 00/18] arm64+KVM: FPSIMD/SVE/SME cleanups
Message-ID: <ahcBeMSQXNQ4DcWI@willie-the-truck>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <86se7duvgc.wl-maz@kernel.org>
 <ahbIRe0jR95elM2L@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahbIRe0jR95elM2L@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_073646_560075_61C603F3 
X-CRM114-Status: GOOD (  19.86  )
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

On Wed, May 27, 2026 at 11:32:37AM +0100, Mark Rutland wrote:
> On Wed, May 27, 2026 at 09:07:31AM +0100, Marc Zyngier wrote:
> > On Thu, 21 May 2026 14:25:38 +0100,
> > Mark Rutland <mark.rutland@arm.com> wrote:
> > > This series cleans up low-level FPSIMD/SVE/SME state management code,
> > > making it easier to maintain and extend (e.g. adding SME support to
> > > KVM), and enabling better debugging (e.g. by making SVE/SME save/restore
> > > visible to KASAN and KCSAN).
> > > 
> > > This is purely cleanup, there are NO bugs addressed by this series.
> > 
> > I had a look throughout, and couldn't see anything untoward other than
> > the couple of nits that were already pointed out. Killing the horrible
> > asm macros definitely brings a bit of fresh air to this code base.
> > 
> > Given the sensitivity of the change, I'd like this to simmer in -next
> > for a bit. How do you want this to be merged? I'm happy to take the
> > whole thing in kvmarm, and share the branch with arm64.
> 
> That works for me.
> 
> Catalin, Will, any preference?

I was hoping the first four could go via kvm/arm on a shared branch, but
I notice that some of the later patches also have their fingers in kvm
code. Chatting with Marc offline, I'll take the whole lot onto its own
shared branch in the arm64 tree when you post a v2.

Will

