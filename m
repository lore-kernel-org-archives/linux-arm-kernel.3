Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015A8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQtVtfjcISAXVaI5AkP35trRWt3Y1MNmZDafxANLqh0=; b=hgg1Mbcg+WOeEbAaxOwZ7tqJFF
	iOfIhEq6FfLscQlAgqrufXzapIwbNBvYVIkQKg0T48tJOga0rXA7UpJUwYI7L2LSDSkVy5113vPtp
	exJ0zDcVGjZzKxbYkpXaDJsqMYIreM/lVrS4Nm/+AQGTMJnI/iKmK+5DUbhBBSB1tPbF0Igpf89PE
	t9gaLuueebcMtliQoBzYpXZRbtik/l99g609b2M0lZedsZgoQxEZLrcBo+2QbH93E7EG8aE2jcKhp
	oY3K2fUWsLHCod1yn7evpi7NkHAmxOHXthxdiKkPL8v2Ww+WxWB9+B/mS5BmlBOAVEneGWL+rbcS7
	6Ib0+aGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eno-0000000BZ2i-4B96;
	Wed, 23 Apr 2025 18:26:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eDL-0000000BPe1-3vK0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Apr 2025 17:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pQtVtfjcISAXVaI5AkP35trRWt3Y1MNmZDafxANLqh0=; b=pS9FeKha6j9tWWFJWtwtRaHXKG
	W9TfqZ5Jh21TVrQv7y105vhJ0aXhhO1q7ZIatyCfGYpG4cjR97TsP1NGLrLgru08b7y2hbCqE0G4s
	gFPJirsY566fL3qSJ35MaBrchvd6i723D5sGCTmnWAjLhvqOoxOIAuhKSWBxBhqiMnH8bRTKJFclf
	c0XiYqXCxUffhym6I4xgLukTd0RcUQIowjZmlCNqA5okxGESBqWU8rqkqYfyRu4scQlKdjIYKX8ik
	jT0l3oOKh/xE0kVHzqoALc/XLWusjFb5XcQZRoev4bJexwlvHlbrppMhHedqUxQNNDHR6dN32Y3z0
	lcP4JAuA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7eDI-0000000BSZO-3tGO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pQtVtfjcISAXVaI5AkP35trRWt3Y1MNmZDafxANLqh0=; b=flczgPhJv9872LkI9et9T6x2/0
	OPgsl+sGZke1RUeQyscDdDs4GZCWisrK1xr6Ywv1u5BG1MsOWYrM/LuT78pfbIJI9AschGQVFUq7Z
	rSBUNfbbyK/d8iZ6ZCflpEVTa7EVx4o1ogXzL77WBvUmdrj7ec4xaE7CVlOfYSKVv/zoJ2kLeXPVy
	IoK9Dz+c0hfOYoCs2+EwPsP7b0N1AbrfT0pRgIw+5nZsvvTFrIGWO7adzV9Kpb0GEEY3vXMJp1PFi
	oDQfH42qZeCPYQ5kBE4HEG+MhocFyF0AoXaVwVpnKRLEb4yHiGQSE839LjU+Hmr+JZdHzyddsp+vw
	9gb86kKQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45988)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7eD6-0006Kz-0U;
	Wed, 23 Apr 2025 18:48:36 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7eD4-0000Dl-0q;
	Wed, 23 Apr 2025 18:48:34 +0100
Date: Wed, 23 Apr 2025 18:48:34 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yury Norov <yury.norov@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, andrew@lunn.ch, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 4/6] arm64: nvhe: Convert the opencoded field modify
Message-ID: <aAkn8lvzoa1grdkt@shell.armlinux.org.uk>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-4-6f7992aafcb7@quicinc.com>
 <86r01rjald.wl-maz@kernel.org>
 <aAJsaNdznnz-1qap@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAJsaNdznnz-1qap@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_184849_123615_883C7B6E 
X-CRM114-Status: GOOD (  22.45  )
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

On Fri, Apr 18, 2025 at 11:14:48AM -0400, Yury Norov wrote:
> On Thu, Apr 17, 2025 at 12:23:10PM +0100, Marc Zyngier wrote:
> > On Thu, 17 Apr 2025 11:47:11 +0100,
> > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > 
> > > Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> > > - reg &= ~MASK;
> > > - reg |= FIELD_PREP(MASK, val);
> > > The semantic patch that makes this change is available
> > > in scripts/coccinelle/misc/field_modify.cocci.
> > > 
> > > More information about semantic patching is available at
> > > https://coccinelle.gitlabpages.inria.fr/website
> > > 
> > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > > ---
> > >  arch/arm64/kvm/hyp/include/nvhe/memory.h | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > index 34233d586060..b2af748964d0 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > @@ -30,8 +30,7 @@ enum pkvm_page_state {
> > >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> > >  						 enum pkvm_page_state state)
> > >  {
> > > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > > +	FIELD_MODIFY(PKVM_PAGE_STATE_PROT_MASK, &prot, state);
> > >  	return prot;
> > >  }
> > 
> > Following up on my suggestion to *not* add anything new, this patch
> > could be written as:
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index 34233d5860607..08cb6ba0e0716 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -30,9 +30,8 @@ enum pkvm_page_state {
> >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> >  						 enum pkvm_page_state state)
> >  {
> > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > -	return prot;
> > +	u64 p = prot;
> > +	return u64_replace_bits(p, state, PKVM_PAGE_STATE_PROT_MASK);
> >  }
> 
> This is a great example where u64_replace_bit() should NOT be used. 

Why not? Explain it. Don't leave people in the dark, because right
now it looks like it's purely a religous fanaticism about what
should and should not be used. Where's the technical reasoning?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

